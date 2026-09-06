#!/bin/bash

# $ ./generate_classes_DEMO.sh

# Run this if the followings have been changed:
# - icons added or removed
# - sounds added or removed
# - emojis added or removed
# - label xml has changed
# This will regenerate the classes:
# - manager/EmojiManager.as
# - manager/IconManager.as
# - manager/SoundManager.as
# - enum/EnumEmojis.as
# - enum/EnumIcons.as
# - enum/EnumSounds.as
# - enum/EnumTextKeys.as

function generate_header()
{

  HTARGET=$1
  HCLASSNAME=$2
  HCLASSDESC=$3

  echo "/**" > $HTARGET
  echo " * This class is a part of the KissAs3Dm application." >> $HTARGET
  echo " * See the header comment lines of the" >> $HTARGET
  echo " * com.kisscodesystems.KissAs3Fw.Application" >> $HTARGET
  echo " * The whole framework is available at:" >> $HTARGET
  echo " * https://github.com/kisscodesystems/KissAs3Fw" >> $HTARGET
  echo " * Demo applications:" >> $HTARGET
  echo " * https://github.com/kisscodesystems/KissAs3Dm" >> $HTARGET
  echo " *" >> $HTARGET
  echo " * DESCRIPTION:" >> $HTARGET
  echo " * $HCLASSNAME." >> $HTARGET
  echo " * $HCLASSDESC." >> $HTARGET
  echo " * This class is generated so can be overwritten from outside." >> $HTARGET
  echo " */" >> $HTARGET

}

# The macos differences against generate_classes_DEMO_linux.sh, everything else is the same:
#
# 1. BSD find keeps the start path exactly as it is given, so a base folder with a
#    trailing slash comes back as emoji//food/x.svg. The sed below folds those
#    doubled slashes, without it every emoji would land in a category named "".
# 2. sort orders by the collation table of the current locale, and the table of macos
#    is not the one of linux. sort_paths sorts the way the classes in the repository
#    were generated: the punctuation of a path is only a tie breaker, so circlefull
#    comes before circle. It gives the same order on every machine and in every locale.
#    Like sort_by_name of the linux script, it cuts the extension off the sort key, so
#    the order of the generated members does not depend on that extension either.
function sort_paths()
{
  awk '{ k = $0; sub(/\.[^.\/]*$/, "", k); gsub(/[_.]/, "", k); gsub("/", "", k);
         print k "\t" $0 }' | LC_ALL=C sort | cut -f 2-
}

function generate_textkeys()
{

  CLASSNAME2='EnumTextKeys'
  CLASSDESC='Contains text keys already having in xml file'

  TARGET="../enum/${CLASSNAME2}Demo.as"

  LISTCOMMAND='grep "key=" label/KissAs3DmLabels.xml | sed "s/.*key=\"//" | sed "s/\">//"'

  generate_header "$TARGET" "${CLASSNAME2}Demo" "$CLASSDESC"

  echo 'package com.kisscodesystems.KissAs3Dm.enum' >> $TARGET
  echo '{' >> $TARGET
  echo "  import com.kisscodesystems.KissAs3Fw.enum.${CLASSNAME2};" >> $TARGET

  echo "  public class ${CLASSNAME2}Demo extends ${CLASSNAME2}" >> $TARGET
  echo '  {' >> $TARGET

  for i in `eval "$LISTCOMMAND"`
  do
    echo "    /**" >> $TARGET
    echo "     * Returns the text key of the ${i} label." >> $TARGET
    echo "     */" >> $TARGET
    echo "    public static function ${i}():String" >> $TARGET
    echo "    {" >> $TARGET
    echo "      return \"[${i}]\";" >> $TARGET
    echo "    }" >> $TARGET
  done

  echo "  }" >> $TARGET
  echo "}" >> $TARGET

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
function generate_destroy()
{

  echo "    /**" >> $TARGET
  echo "     * Destroys this object: it frees up the resources embedded into this application" >> $TARGET
  echo "     * and lets the framework free up the ones of its own." >> $TARGET
  echo "     */" >> $TARGET
  echo "    override public function destroy():void" >> $TARGET
  echo "    {" >> $TARGET
  echo "      application.trace(\"<$CLASSNAME_DEMO destroy> called.\", 4);" >> $TARGET

  if [[ $ASCLASS == "Bitmap" ]]
  then
    for i in `eval "$LISTCOMMAND"`
    do
      i=${i/$BASE/}
      i=$(echo "$i" | sed "s/.*\///g")
      i=$(echo "$i" | sed "s/\.$FILEEXT//g")
      echo "      disposeBitmap(${i}$ASCLASS);" >> $TARGET
    done
  fi

  if [[ $BLOB != "" ]]
  then
    echo "      if ($BLOBFIELD != null)" >> $TARGET
    echo "      {" >> $TARGET
    echo "        $BLOBFIELD.destroy();" >> $TARGET
    echo "      }" >> $TARGET
  fi

  echo "      super.destroy();" >> $TARGET

  if [[ $BLOB != "" ]]
  then
    echo "      $BLOBFIELD = null;" >> $TARGET
  else
    for i in `eval "$LISTCOMMAND"`
    do
      i=${i/$BASE/}
      i=$(echo "$i" | sed "s/.*\///g")
      i=$(echo "$i" | sed "s/\.$FILEEXT//g")
      echo "      ${i}$ASCLASS = null;" >> $TARGET
    done
  fi

  echo "      files = null;" >> $TARGET
  echo "    }" >> $TARGET

}

function generate_class()
{

  FOLDERNAME=$1
  CLASSNAME=''
  CLASSDESC=''
  ASCLASS=''
  FILEEXT=''
  BLOB=''
  BLOBFIELD=''

  if [[ $FOLDERNAME == "icon" ]]
  then
    CLASSNAME='IconManager'
    CLASSNAME2='Icons'
    CLASSNAME_DEMO='IconManagerDemo'
    CLASSNAME2_DEMO='IconsDemo'
    CLASSDESC2='Contains the icon names that can be used'
    CLASSDESC='Handles icons that can be used on labels'
    ASCLASS='Bitmap'
    FILEEXT='png'
  elif [[ $FOLDERNAME == "emoji" ]]
  then
    CLASSNAME='EmojiManager'
    CLASSNAME2='Emojis'
    CLASSNAME_DEMO='EmojiManagerDemo'
    CLASSNAME2_DEMO='EmojisDemo'
    CLASSDESC2='Contains the emoji names that can be used'
    CLASSDESC='Handles emojis that can be used on objects when available'
    ASCLASS='VectorDrawings'
    FILEEXT='svg'
    BLOB='emojis'
    BLOBFIELD='drawingsDemo'
  elif [[ $FOLDERNAME == "sound" ]]
  then
    CLASSNAME='SoundManager'
    CLASSNAME2='Sounds'
    CLASSNAME_DEMO='SoundManagerDemo'
    CLASSNAME2_DEMO='SoundsDemo'
    CLASSDESC2='Contains the sound names that can be used'
    CLASSDESC='Handles embedded sounds'
    ASCLASS='Sound'
    FILEEXT='mp3'
  else
    echo "icon or emoji or sound can be used as parameter!"
    exit 1
  fi

  BASE="${FOLDERNAME}/"
  FOLDERDELTA="../resource/$FOLDERNAME"
  # The extension is cut off the sort key, so the order of the generated members
  # does not depend on which extension the resources of a folder happen to have.
  LISTCOMMAND='find "$BASE" -name "*.$FILEEXT" | sed "s|//*|/|g" | sort_paths'
  LIST2COMMAND='find "$BASE" -type d | sed "s|//*|/|g" | sort_paths'
  TARGET="../manager/${CLASSNAME_DEMO}.as"
  TARGET2="../enum/Enum${CLASSNAME2_DEMO}.as"

  # The emojis are vector drawings and ActionScript can display neither an SVG nor
  # an FXG, so every one of them is flattened into one blob of the drawing commands
  # the runtime does understand, before the manager embedding that blob is written.
  # The converter belongs to the framework, this application only calls it.
  if [[ $BLOB != "" ]]
  then
    python3 ../../KissAs3Fw/resource/svg_to_kvg.py "$BASE" "${BASE}${BLOB}.kvg" || exit 1
  fi

  generate_header "$TARGET" "$CLASSNAME_DEMO" "$CLASSDESC"

  echo 'package com.kisscodesystems.KissAs3Dm.manager' >> $TARGET
  echo '{' >> $TARGET
  echo "  import com.kisscodesystems.KissAs3Fw.Application;" >> $TARGET
  echo "  import com.kisscodesystems.KissAs3Fw.manager.${CLASSNAME};" >> $TARGET
  generate_header "$TARGET2" "Enum${CLASSNAME2_DEMO}" "$CLASSDESC2"
  echo 'package com.kisscodesystems.KissAs3Dm.enum' >> $TARGET2
  echo '{' >> $TARGET2
  echo "  import com.kisscodesystems.KissAs3Fw.enum.Enum${CLASSNAME2};" >> $TARGET2

  if [[ $FOLDERNAME == "icon" ]]
  then
    echo '  import flash.display.Bitmap;' >> $TARGET
    echo '  import flash.display.BitmapData;' >> $TARGET
  elif [[ $FOLDERNAME == "emoji" ]]
  then
    echo '  import com.kisscodesystems.KissAs3Fw.util.VectorDrawings;' >> $TARGET
    echo '  import flash.utils.ByteArray;' >> $TARGET
  elif [[ $FOLDERNAME == "sound" ]]
  then
    echo '  import flash.media.Sound;' >> $TARGET
    echo '  import flash.media.SoundChannel;' >> $TARGET
    echo '  import flash.media.SoundTransform;' >> $TARGET
  fi

  echo "  public class $CLASSNAME_DEMO extends $CLASSNAME" >> $TARGET
  echo '  {' >> $TARGET
  echo "  public class Enum${CLASSNAME2_DEMO} extends Enum${CLASSNAME2}" >> $TARGET2
  echo '  {' >> $TARGET2

  for i in `eval "$LISTCOMMAND"`
  do
    i=${i/$BASE/}
    i=$(echo "$i" | sed "s/.*\///g")
    i=$(echo "$i" | sed "s/\.$FILEEXT//g")
    if [[ $BLOB == "" ]]
    then
      echo "    private var ${i}$ASCLASS:$ASCLASS;" >> $TARGET
    fi
    echo "    /**" >> $TARGET2
    echo "     * Returns the name of the ${i} resource." >> $TARGET2
    echo "     */" >> $TARGET2
    echo "    public static function ${i}():String" >> $TARGET2
    echo "    {" >> $TARGET2
    echo "      return \"${i}\";" >> $TARGET2
    echo "    }" >> $TARGET2
  done

  if [[ $BLOB != "" ]]
  then
    echo "    private var $BLOBFIELD:$ASCLASS = null;" >> $TARGET
  fi

  echo "    private var files:${CLASSNAME_DEMO}Files = new ${CLASSNAME_DEMO}Files();" >> $TARGET
  
  echo "    /**" >> $TARGET
  echo "     * Constructs this manager and loads every resource embedded into it." >> $TARGET
  echo "     * @param applicationRef the main application reference" >> $TARGET
  echo "     */" >> $TARGET
  echo "    public function $CLASSNAME_DEMO(applicationRef:Application):void" >> $TARGET
  echo "    {" >> $TARGET
  echo "      super(applicationRef);" >> $TARGET

  if [[ $FOLDERNAME == "emoji" ]]
  then
    for i in `eval "$LIST2COMMAND"`
    do
      i=${i/$BASE/}
      category_name=$(echo "$i" | sed "s/\/.*//g")
      if [[ $category_name != "" ]]
      then
        echo "      emojiNames[\"$category_name\"] = new Array();" >> $TARGET
      fi
    done
  fi

  if [[ $BLOB != "" ]]
  then
    echo "      $BLOBFIELD = new $ASCLASS(application, new files.${BLOB}Class() as ByteArray);" >> $TARGET
  else
    for i in `eval "$LISTCOMMAND"`
    do
      i=${i/$BASE/}
      i=$(echo "$i" | sed "s/\.$FILEEXT//g")
      i=$(echo "$i" | sed "s/.*\///g")
      echo "      ${i}$ASCLASS = new files.${i}Class() as $ASCLASS;" >> $TARGET
    done
  fi

  if [[ $FOLDERNAME == "emoji" ]]
  then
    echo "      pushEmojiNames();" >> $TARGET
    echo "      markEmojiDrawings();" >> $TARGET
  fi

  echo "      application.trace(\"<$CLASSNAME_DEMO> constructed.\", 4);" >> $TARGET
  echo "    }" >> $TARGET

  if [[ $FOLDERNAME == "emoji" ]]
  then
    echo "    /**" >> $TARGET
    echo "     * Puts the name of every embedded emoji into the category of it." >> $TARGET
    echo "     */" >> $TARGET
    echo "    private function pushEmojiNames():void" >> $TARGET
    echo "    {" >> $TARGET
    for i in `eval "$LISTCOMMAND"`
    do
      i=${i/$BASE/}
      i=$(echo "$i" | sed "s/\.$FILEEXT//g")
      j=$i
      i=$(echo "$i" | sed "s/.*\///g")
      category_name=$(echo "$j" | sed "s/\/.*//g")
      emoji_name=$i
      echo "      emojiNames[\"$category_name\"].push(\"$emoji_name\");" >> $TARGET
    done
    echo "    }" >> $TARGET
    echo "    /**" >> $TARGET
    echo "     * Binds the drawings of this application to the name of every emoji of it." >> $TARGET
    echo "     */" >> $TARGET
    echo "    private function markEmojiDrawings():void" >> $TARGET
    echo "    {" >> $TARGET
    for i in `eval "$LISTCOMMAND"`
    do
      i=${i/$BASE/}
      i=$(echo "$i" | sed "s/\.$FILEEXT//g")
      j=$i
      i=$(echo "$i" | sed "s/.*\///g")
      category_name=$(echo "$j" | sed "s/\/.*//g")
      emoji_name=$i
      echo "      emojiDrawings[\"$emoji_name\"] = $BLOBFIELD;" >> $TARGET
    done
    echo "    }" >> $TARGET
  fi

  if [[ $FOLDERNAME == "icon" ]] 
  then

    echo "    /**" >> $TARGET
    echo "     * Returns the bitmap data of an icon of this application, or the one the framework" >> $TARGET
    echo "     * answers when this application has no icon of that name at all." >> $TARGET
    echo "     * @param iconType the name of the icon" >> $TARGET
    echo "     * @param textType the text type the color of the icon is taken from" >> $TARGET
    echo "     * @param iconSize the size of the icon" >> $TARGET
    echo "     */" >> $TARGET
    echo "    override public function getNewBitmapData(iconType:String, textType:String, iconSize:int):BitmapData" >> $TARGET
    echo "    {" >> $TARGET
    echo -n "      " >> $TARGET 
    for i in `eval "$LISTCOMMAND"`
    do
      i=${i/$BASE/}
      i=$(echo "$i" | sed "s/.*\///g")
      i=$(echo "$i" | sed "s/\.$FILEEXT//g")
      echo "if (iconType == \"${i}\") return transformBitmapData(${i}Bitmap, textType, iconSize);" >> $TARGET
      echo -n "      else " >> $TARGET
    done
    echo "return super.getNewBitmapData(iconType, textType, iconSize);" >> $TARGET
    echo "    }" >> $TARGET

  elif [[ $FOLDERNAME == "sound" ]]
  then
    echo "    /**" >> $TARGET
    echo "     * Plays a sound of this application, or the one the framework answers when this" >> $TARGET
    echo "     * application has no sound of that name at all." >> $TARGET
    echo "     * @param soundType the name of the sound" >> $TARGET
    echo "     * @param startTime the position the playing is started at" >> $TARGET
    echo "     */" >> $TARGET
    echo "    override public function playSound(soundType:String, startTime:Number = 0):SoundChannel" >> $TARGET
    echo "    {" >> $TARGET
    echo "      var soundChannel:SoundChannel = null;" >> $TARGET
    echo "      if (application.getDynamicsConfig().getAppSoundPlaying())" >> $TARGET
    echo "      {" >> $TARGET
    echo "        var soundTransform:SoundTransform = new SoundTransform();" >> $TARGET
    echo "        soundTransform.volume = application.getDynamicsConfig().getAppSoundVolume() / 100;" >> $TARGET
    echo -n "        " >> $TARGET 
    for i in `eval "$LISTCOMMAND"`
    do
      i=${i/$BASE/}
      i=$(echo "$i" | sed "s/.*\///g")
      i=$(echo "$i" | sed "s/\.$FILEEXT//g")
      echo "if (soundType == \"${i}\") soundChannel = ${i}Sound.play(startTime);" >> $TARGET
      echo -n "        else " >> $TARGET
    done
    echo "soundChannel = super.playSound(soundType, startTime);" >> $TARGET
    echo "        if (soundChannel != null)" >> $TARGET
    echo "        {" >> $TARGET
    echo "          soundChannel.soundTransform = soundTransform;" >> $TARGET
    echo "        }" >> $TARGET
    echo "      }" >> $TARGET
    echo "      return soundChannel;" >> $TARGET
    echo "    }" >> $TARGET
    echo "    /**" >> $TARGET
    echo "     * Returns a sound of this application, or the one the framework answers when this" >> $TARGET
    echo "     * application has no sound of that name at all." >> $TARGET
    echo "     * @param soundType the name of the sound" >> $TARGET
    echo "     */" >> $TARGET
    echo "    override public function getSound(soundType:String):Sound" >> $TARGET
    echo "    {" >> $TARGET
    echo -n "      " >> $TARGET 
    for i in `eval "$LISTCOMMAND"`
    do
      i=${i/$BASE/}
      i=$(echo "$i" | sed "s/.*\///g")
      i=$(echo "$i" | sed "s/\.$FILEEXT//g")
      echo "if (soundType == \"${i}\") return ${i}Sound;" >> $TARGET
      echo -n "      else " >> $TARGET
    done
    echo "return super.getSound(soundType);" >> $TARGET
    echo "    }" >> $TARGET
  fi

  generate_destroy

  echo "  }" >> $TARGET
  echo "}" >> $TARGET
  echo "  }" >> $TARGET2
  echo "}" >> $TARGET2
  echo "class ${CLASSNAME_DEMO}Files" >> $TARGET
  echo '{' >> $TARGET

  if [[ $BLOB != "" ]]
  then
    echo "  [Embed(source = \"$FOLDERDELTA/${BLOB}.kvg\", mimeType = \"application/octet-stream\")]" >> $TARGET
    echo "  public var ${BLOB}Class:Class;" >> $TARGET
  else
    for i in `eval "$LISTCOMMAND"`
    do
      i=${i/$BASE/}
      echo "  [Embed(source = \"$FOLDERDELTA/$i\")]" >> $TARGET
      i=$(echo "$i" | sed "s/.*\///g")
      i=$(echo "$i" | sed "s/\.$FILEEXT//g")
      echo "  public var ${i}Class:Class;" >> $TARGET
    done
  fi
  echo "  /**" >> $TARGET
  echo "   * Constructs the embedded resource holder of this manager." >> $TARGET
  echo "   */" >> $TARGET
  echo "  public function ${CLASSNAME_DEMO}Files():void" >> $TARGET
  echo "  {" >> $TARGET
  echo "  }" >> $TARGET
  echo '}' >> $TARGET

}

generate_class icon
generate_class sound
generate_class emoji

generate_textkeys
