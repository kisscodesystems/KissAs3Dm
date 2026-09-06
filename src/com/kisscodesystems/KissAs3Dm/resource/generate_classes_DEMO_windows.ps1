# The windows version of generate_classes_DEMO.sh, it writes exactly the same classes.
#
# > powershell -ExecutionPolicy Bypass -File .\generate_classes_DEMO.ps1
#
# Run this if the followings have been changed:
# - icons added or removed
# - sounds added or removed
# - emojis added or removed
# - label xml has changed
# This will regenerate the classes:
# - manager/EmojiManagerDemo.as
# - manager/IconManagerDemo.as
# - manager/SoundManagerDemo.as
# - enum/EnumEmojisDemo.as
# - enum/EnumIconsDemo.as
# - enum/EnumSoundsDemo.as
# - enum/EnumTextKeysDemo.as

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

# The files are collected into memory and written out at the very end, so that
# every line ends with a single \n and no byte order mark is put in front of them.
# Set-Target is the > of the shell, Add-Target is the >> and Add-TargetPart is the echo -n.
$script:targets = @{}

function Set-Target([string] $path, [string] $text)
{
  $script:targets[$path] = [System.Text.StringBuilder]::new()
  [void]$script:targets[$path].Append($text).Append("`n")
}

function Add-Target([string] $path, [string] $text)
{
  [void]$script:targets[$path].Append($text).Append("`n")
}

function Add-TargetPart([string] $path, [string] $text)
{
  [void]$script:targets[$path].Append($text)
}

function Save-Targets()
{
  $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
  foreach ($path in $script:targets.Keys)
  {
    $full = [System.IO.Path]::GetFullPath((Join-Path (Get-Location).Path $path))
    [System.IO.File]::WriteAllText($full, $script:targets[$path].ToString(), $utf8NoBom)
  }
}

# The sort of the shell runs under a utf-8 locale, where the punctuation of a name is
# only a tie breaker and not a character of its own. This reproduces the very same
# order on every machine.
#
# The extension is cut off the sort key as well, the way the shell scripts do it, so the
# order of the generated members does not depend on which extension the resources of a
# folder happen to have.
function Sort-LikeTheShell([string[]] $items)
{
  $list = [System.Collections.Generic.List[string]]::new()
  foreach ($item in $items)
  {
    [void]$list.Add($item)
  }
  $list.Sort([System.Comparison[string]] {
    param([string] $a, [string] $b)
    $keyA = ($a -replace '\.[^./]*$', '') -replace '[_./]', ''
    $keyB = ($b -replace '\.[^./]*$', '') -replace '[_./]', ''
    $result = [string]::CompareOrdinal($keyA, $keyB)
    if ($result -eq 0)
    {
      $result = [string]::CompareOrdinal($a, $b)
    }
    return $result
  })
  return $list.ToArray()
}

# The list the shell gets from: find "$BASE" -name "*.$FILEEXT" | sort
# with the base folder already cut off the front of every path.
function Get-ResourceFiles([string] $folderName, [string] $fileExt)
{
  $root = (Get-Item -LiteralPath $folderName).FullName
  $items = @()
  foreach ($file in (Get-ChildItem -LiteralPath $folderName -Recurse -File))
  {
    if ($file.Name.EndsWith("." + $fileExt))
    {
      $items += ($file.FullName.Substring($root.Length + 1) -replace '\\', '/')
    }
  }
  return (Sort-LikeTheShell $items)
}

# The list the shell gets from: find "$BASE" -type d | sort
# The base folder itself becomes an empty name there and is skipped, so it is left out here.
function Get-ResourceDirectories([string] $folderName)
{
  $root = (Get-Item -LiteralPath $folderName).FullName
  $items = @()
  foreach ($directory in (Get-ChildItem -LiteralPath $folderName -Recurse -Directory))
  {
    $items += ($directory.FullName.Substring($root.Length + 1) -replace '\\', '/')
  }
  return (Sort-LikeTheShell $items)
}

# The basename of a resource path without its extension: the sed pipe of the shell.
function Get-ResourceName([string] $relativePath, [string] $fileExt)
{
  return (($relativePath -replace '.*/', '') -replace ('\.' + $fileExt), '')
}

# Runs the SVG to KVG1 converter of the framework over a resource folder. The interpreter
# is called python3 on some machines and python on others, so both names are tried.
function Invoke-SvgToKvg([string] $sourceFolder, [string] $targetFile)
{
  $python = Get-Command python3 -ErrorAction SilentlyContinue
  if ($null -eq $python)
  {
    $python = Get-Command python -ErrorAction SilentlyContinue
  }
  if ($null -eq $python)
  {
    Write-Output "python3 is needed to build the emoji blob!"
    exit 1
  }
  & $python.Path "../../KissAs3Fw/resource/svg_to_kvg.py" $sourceFolder $targetFile
  if ($LASTEXITCODE -ne 0)
  {
    exit 1
  }
}

# The first folder of a resource path: the category of an emoji.
function Get-CategoryName([string] $relativePath)
{
  return ($relativePath -replace '/.*', '')
}

# The header comment block every generated class starts with.
function Write-Header([string] $path, [string] $className, [string] $classDesc)
{
  Set-Target $path "/**"
  Add-Target $path " * This class is a part of the KissAs3Dm application."
  Add-Target $path " * See the header comment lines of the"
  Add-Target $path " * com.kisscodesystems.KissAs3Fw.Application"
  Add-Target $path " * The whole framework is available at:"
  Add-Target $path " * https://github.com/kisscodesystems/KissAs3Fw"
  Add-Target $path " * Demo applications:"
  Add-Target $path " * https://github.com/kisscodesystems/KissAs3Dm"
  Add-Target $path " *"
  Add-Target $path " * DESCRIPTION:"
  Add-Target $path " * $className."
  Add-Target $path " * $classDesc."
  Add-Target $path " * This class is generated so can be overwritten from outside."
  Add-Target $path " */"
}

function Invoke-GenerateTextkeys()
{
  $className2 = 'EnumTextKeys'
  $classDesc = 'Contains text keys already having in xml file'

  $target = "../enum/${className2}Demo.as"

  $keys = @()
  foreach ($line in (Get-Content -LiteralPath 'label/KissAs3DmLabels.xml'))
  {
    if ($line -match 'key=')
    {
      $key = $line -replace '.*key="', ''
      $key = [regex]::new('">').Replace($key, '', 1)
      foreach ($token in ($key -split '\s+'))
      {
        if ($token -ne '')
        {
          $keys += $token
        }
      }
    }
  }

  Write-Header $target "${className2}Demo" $classDesc

  Add-Target $target 'package com.kisscodesystems.KissAs3Dm.enum'
  Add-Target $target '{'
  Add-Target $target "  import com.kisscodesystems.KissAs3Fw.enum.${className2};"

  Add-Target $target "  public class ${className2}Demo extends ${className2}"
  Add-Target $target '  {'

  foreach ($i in $keys)
  {
    Add-Target $target "    /**"
    Add-Target $target "     * Returns the text key of the ${i} label."
    Add-Target $target "     */"
    Add-Target $target "    public static function ${i}():String"
    Add-Target $target "    {"
    Add-Target $target "      return `"[${i}]`";"
    Add-Target $target "    }"
  }

  Add-Target $target "  }"
  Add-Target $target "}"
}

# Writes the destroy method of the manager class being generated. That class extends the one
# of the framework, so it frees up the resources embedded into this application only and then
# lets the super destroy free up the ones of the framework. It has to be called as the last
# one of the generators of the methods: the destroy method closes the class in the coding
# standards.
#
# An icon and a sound is instantiated into a field of its own, so every one of them has to
# be released one by one. The bitmap data of a bitmap is disposed by the helper of the
# framework class. A sound holds no such resource and close() throws an error on an embedded
# one, so those fields are only dropped. The emojis are one embedded blob instead, and the
# object reading it frees up what it built. The two emoji arrays are not touched here: those
# belong to the framework class and the destroy of it clears them.
function Write-Destroy([string] $target, [string] $classNameDemo, [string] $asClass, [string[]] $list, [string] $fileExt, [string] $blob, [string] $blobField)
{
  Add-Target $target "    /**"
  Add-Target $target "     * Destroys this object: it frees up the resources embedded into this application"
  Add-Target $target "     * and lets the framework free up the ones of its own."
  Add-Target $target "     */"
  Add-Target $target "    override public function destroy():void"
  Add-Target $target "    {"
  Add-Target $target "      application.trace(`"<$classNameDemo destroy> called.`", 4);"

  if ($asClass -eq "Bitmap")
  {
    foreach ($path in $list)
    {
      $i = Get-ResourceName $path $fileExt
      Add-Target $target "      disposeBitmap(${i}$asClass);"
    }
  }

  if ($blob -ne "")
  {
    Add-Target $target "      if ($blobField != null)"
    Add-Target $target "      {"
    Add-Target $target "        $blobField.destroy();"
    Add-Target $target "      }"
  }

  Add-Target $target "      super.destroy();"

  if ($blob -ne "")
  {
    Add-Target $target "      $blobField = null;"
  }
  else
  {
    foreach ($path in $list)
    {
      $i = Get-ResourceName $path $fileExt
      Add-Target $target "      ${i}$asClass = null;"
    }
  }

  Add-Target $target "      files = null;"
  Add-Target $target "    }"
}

function Invoke-GenerateClass([string] $folderName)
{
  $className = ''
  $className2 = ''
  $classNameDemo = ''
  $className2Demo = ''
  $classDesc = ''
  $asClass = ''
  $fileExt = ''
  $blob = ''
  $blobField = ''

  if ($folderName -eq "icon")
  {
    $className = 'IconManager'
    $className2 = 'Icons'
    $classNameDemo = 'IconManagerDemo'
    $className2Demo = 'IconsDemo'
    $classDesc2 = 'Contains the icon names that can be used'
    $classDesc = 'Handles icons that can be used on labels'
    $asClass = 'Bitmap'
    $fileExt = 'png'
  }
  elseif ($folderName -eq "emoji")
  {
    $className = 'EmojiManager'
    $className2 = 'Emojis'
    $classNameDemo = 'EmojiManagerDemo'
    $className2Demo = 'EmojisDemo'
    $classDesc2 = 'Contains the emoji names that can be used'
    $classDesc = 'Handles emojis that can be used on objects when available'
    $asClass = 'VectorDrawings'
    $fileExt = 'svg'
    $blob = 'emojis'
    $blobField = 'drawingsDemo'
  }
  elseif ($folderName -eq "sound")
  {
    $className = 'SoundManager'
    $className2 = 'Sounds'
    $classNameDemo = 'SoundManagerDemo'
    $className2Demo = 'SoundsDemo'
    $classDesc2 = 'Contains the sound names that can be used'
    $classDesc = 'Handles embedded sounds'
    $asClass = 'Sound'
    $fileExt = 'mp3'
  }
  else
  {
    Write-Output "icon or emoji or sound can be used as parameter!"
    exit 1
  }

  $folderDelta = "../resource/$folderName"

  # The emojis are vector drawings and ActionScript can display neither an SVG nor an
  # FXG, so every one of them is flattened into one blob of the drawing commands the
  # runtime does understand, before the manager embedding that blob is written.
  # The converter belongs to the framework, this application only calls it.
  if ($blob -ne "")
  {
    Invoke-SvgToKvg $folderName "$folderName/$blob.kvg"
  }

  $list = Get-ResourceFiles $folderName $fileExt
  $list2 = Get-ResourceDirectories $folderName
  $target = "../manager/${classNameDemo}.as"
  $target2 = "../enum/Enum${className2Demo}.as"

  Write-Header $target $classNameDemo $classDesc

  Add-Target $target 'package com.kisscodesystems.KissAs3Dm.manager'
  Add-Target $target '{'
  Add-Target $target "  import com.kisscodesystems.KissAs3Fw.Application;"
  Add-Target $target "  import com.kisscodesystems.KissAs3Fw.manager.${className};"
  Write-Header $target2 "Enum${className2Demo}" $classDesc2
  Add-Target $target2 'package com.kisscodesystems.KissAs3Dm.enum'
  Add-Target $target2 '{'
  Add-Target $target2 "  import com.kisscodesystems.KissAs3Fw.enum.Enum${className2};"

  if ($folderName -eq "icon")
  {
    Add-Target $target '  import flash.display.Bitmap;'
    Add-Target $target '  import flash.display.BitmapData;'
  }
  elseif ($folderName -eq "emoji")
  {
    Add-Target $target '  import com.kisscodesystems.KissAs3Fw.util.VectorDrawings;'
    Add-Target $target '  import flash.utils.ByteArray;'
  }
  elseif ($folderName -eq "sound")
  {
    Add-Target $target '  import flash.media.Sound;'
    Add-Target $target '  import flash.media.SoundChannel;'
    Add-Target $target '  import flash.media.SoundTransform;'
  }

  Add-Target $target "  public class $classNameDemo extends $className"
  Add-Target $target '  {'
  Add-Target $target2 "  public class Enum${className2Demo} extends Enum${className2}"
  Add-Target $target2 '  {'

  foreach ($path in $list)
  {
    $i = Get-ResourceName $path $fileExt
    if ($blob -eq "")
    {
      Add-Target $target "    private var ${i}${asClass}:$asClass;"
    }
    Add-Target $target2 "    /**"
    Add-Target $target2 "     * Returns the name of the ${i} resource."
    Add-Target $target2 "     */"
    Add-Target $target2 "    public static function ${i}():String"
    Add-Target $target2 "    {"
    Add-Target $target2 "      return `"${i}`";"
    Add-Target $target2 "    }"
  }

  if ($blob -ne "")
  {
    Add-Target $target "    private var ${blobField}:$asClass = null;"
  }

  Add-Target $target "    private var files:${classNameDemo}Files = new ${classNameDemo}Files();"

  Add-Target $target "    /**"
  Add-Target $target "     * Constructs this manager and loads every resource embedded into it."
  Add-Target $target "     * @param applicationRef the main application reference"
  Add-Target $target "     */"
  Add-Target $target "    public function $classNameDemo(applicationRef:Application):void"
  Add-Target $target "    {"
  Add-Target $target "      super(applicationRef);"

  if ($folderName -eq "emoji")
  {
    foreach ($path in $list2)
    {
      $categoryName = Get-CategoryName $path
      if ($categoryName -ne "")
      {
        Add-Target $target "      emojiNames[`"$categoryName`"] = new Array();"
      }
    }
  }

  if ($blob -ne "")
  {
    Add-Target $target "      $blobField = new $asClass(application, new files.${blob}Class() as ByteArray);"
  }
  else
  {
    foreach ($path in $list)
    {
      $i = Get-ResourceName $path $fileExt
      Add-Target $target "      ${i}$asClass = new files.${i}Class() as $asClass;"
    }
  }

  if ($folderName -eq "emoji")
  {
    Add-Target $target "      pushEmojiNames();"
    Add-Target $target "      markEmojiDrawings();"
  }

  Add-Target $target "      application.trace(`"<$classNameDemo> constructed.`", 4);"
  Add-Target $target "    }"

  if ($folderName -eq "emoji")
  {
    Add-Target $target "    /**"
    Add-Target $target "     * Puts the name of every embedded emoji into the category of it."
    Add-Target $target "     */"
    Add-Target $target "    private function pushEmojiNames():void"
    Add-Target $target "    {"
    foreach ($path in $list)
    {
      $emojiName = Get-ResourceName $path $fileExt
      $categoryName = Get-CategoryName $path
      Add-Target $target "      emojiNames[`"$categoryName`"].push(`"$emojiName`");"
    }
    Add-Target $target "    }"
    Add-Target $target "    /**"
    Add-Target $target "     * Binds the drawings of this application to the name of every emoji of it."
    Add-Target $target "     */"
    Add-Target $target "    private function markEmojiDrawings():void"
    Add-Target $target "    {"
    foreach ($path in $list)
    {
      $emojiName = Get-ResourceName $path $fileExt
      Add-Target $target "      emojiDrawings[`"$emojiName`"] = $blobField;"
    }
    Add-Target $target "    }"
  }

  if ($folderName -eq "icon")
  {
    Add-Target $target "    /**"
    Add-Target $target "     * Returns the bitmap data of an icon of this application, or the one the framework"
    Add-Target $target "     * answers when this application has no icon of that name at all."
    Add-Target $target "     * @param iconType the name of the icon"
    Add-Target $target "     * @param textType the text type the color of the icon is taken from"
    Add-Target $target "     * @param iconSize the size of the icon"
    Add-Target $target "     */"
    Add-Target $target "    override public function getNewBitmapData(iconType:String, textType:String, iconSize:int):BitmapData"
    Add-Target $target "    {"
    Add-TargetPart $target "      "
    foreach ($path in $list)
    {
      $i = Get-ResourceName $path $fileExt
      Add-Target $target "if (iconType == `"${i}`") return transformBitmapData(${i}Bitmap, textType, iconSize);"
      Add-TargetPart $target "      else "
    }
    Add-Target $target "return super.getNewBitmapData(iconType, textType, iconSize);"
    Add-Target $target "    }"
  }
  elseif ($folderName -eq "sound")
  {
    Add-Target $target "    /**"
    Add-Target $target "     * Plays a sound of this application, or the one the framework answers when this"
    Add-Target $target "     * application has no sound of that name at all."
    Add-Target $target "     * @param soundType the name of the sound"
    Add-Target $target "     * @param startTime the position the playing is started at"
    Add-Target $target "     */"
    Add-Target $target "    override public function playSound(soundType:String, startTime:Number = 0):SoundChannel"
    Add-Target $target "    {"
    Add-Target $target "      var soundChannel:SoundChannel = null;"
    Add-Target $target "      if (application.getDynamicsConfig().getAppSoundPlaying())"
    Add-Target $target "      {"
    Add-Target $target "        var soundTransform:SoundTransform = new SoundTransform();"
    Add-Target $target "        soundTransform.volume = application.getDynamicsConfig().getAppSoundVolume() / 100;"
    Add-TargetPart $target "        "
    foreach ($path in $list)
    {
      $i = Get-ResourceName $path $fileExt
      Add-Target $target "if (soundType == `"${i}`") soundChannel = ${i}Sound.play(startTime);"
      Add-TargetPart $target "        else "
    }
    Add-Target $target "soundChannel = super.playSound(soundType, startTime);"
    Add-Target $target "        if (soundChannel != null)"
    Add-Target $target "        {"
    Add-Target $target "          soundChannel.soundTransform = soundTransform;"
    Add-Target $target "        }"
    Add-Target $target "      }"
    Add-Target $target "      return soundChannel;"
    Add-Target $target "    }"
    Add-Target $target "    /**"
    Add-Target $target "     * Returns a sound of this application, or the one the framework answers when this"
    Add-Target $target "     * application has no sound of that name at all."
    Add-Target $target "     * @param soundType the name of the sound"
    Add-Target $target "     */"
    Add-Target $target "    override public function getSound(soundType:String):Sound"
    Add-Target $target "    {"
    Add-TargetPart $target "      "
    foreach ($path in $list)
    {
      $i = Get-ResourceName $path $fileExt
      Add-Target $target "if (soundType == `"${i}`") return ${i}Sound;"
      Add-TargetPart $target "      else "
    }
    Add-Target $target "return super.getSound(soundType);"
    Add-Target $target "    }"
  }

  Write-Destroy $target $classNameDemo $asClass $list $fileExt $blob $blobField

  Add-Target $target "  }"
  Add-Target $target "}"
  Add-Target $target2 "  }"
  Add-Target $target2 "}"
  Add-Target $target "class ${classNameDemo}Files"
  Add-Target $target '{'

  if ($blob -ne "")
  {
    Add-Target $target "  [Embed(source = `"$folderDelta/$blob.kvg`", mimeType = `"application/octet-stream`")]"
    Add-Target $target "  public var ${blob}Class:Class;"
  }
  else
  {
    foreach ($path in $list)
    {
      Add-Target $target "  [Embed(source = `"$folderDelta/$path`")]"
      $i = Get-ResourceName $path $fileExt
      Add-Target $target "  public var ${i}Class:Class;"
    }
  }
  Add-Target $target "  /**"
  Add-Target $target "   * Constructs the embedded resource holder of this manager."
  Add-Target $target "   */"
  Add-Target $target "  public function ${classNameDemo}Files():void"
  Add-Target $target "  {"
  Add-Target $target "  }"
  Add-Target $target '}'
}

Invoke-GenerateClass icon
Invoke-GenerateClass sound
Invoke-GenerateClass emoji

Invoke-GenerateTextkeys

Save-Targets
