/**
 * This class is a part of the KissAs3Dm application.
 * See the header comment lines of the
 * com.kisscodesystems.KissAs3Fw.Application
 * The whole framework is available at:
 * https://github.com/kisscodesystems/KissAs3Fw
 * Demo applications:
 * https://github.com/kisscodesystems/KissAs3Dm
 *
 * DESCRIPTION:
 * IconManagerDemo.
 * Handles icons that can be used on labels.
 * This class is generated so can be overwritten from outside.
 */
package com.kisscodesystems.KissAs3Dm.manager
{
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.manager.IconManager;
  import flash.display.Bitmap;
  import flash.display.BitmapData;
  public class IconManagerDemo extends IconManager
  {
    private var applicationBitmap:Bitmap;
    private var boardBitmap:Bitmap;
    private var buttonbarBitmap:Bitmap;
    private var buttonlinkBitmap:Bitmap;
    private var buttonsBitmap:Bitmap;
    private var buttontextBitmap:Bitmap;
    private var cameraBitmap:Bitmap;
    private var colorpanelBitmap:Bitmap;
    private var colorpickerBitmap:Bitmap;
    private var componentusageBitmap:Bitmap;
    private var contentmultipleBitmap:Bitmap;
    private var contentsingleBitmap:Bitmap;
    private var othersBitmap:Bitmap;
    private var pickersBitmap:Bitmap;
    private var textareaBitmap:Bitmap;
    private var textboxBitmap:Bitmap;
    private var textinputBitmap:Bitmap;
    private var textlabelBitmap:Bitmap;
    private var textmultiBitmap:Bitmap;
    private var textsingleBitmap:Bitmap;
    private var widgetBitmap:Bitmap;
    private var xmllisterBitmap:Bitmap;
    private var files:IconManagerDemoFiles = new IconManagerDemoFiles();
    /**
     * Constructs this manager and loads every resource embedded into it.
     * @param applicationRef the main application reference
     */
    public function IconManagerDemo(applicationRef:Application):void
    {
      super(applicationRef);
      applicationBitmap = new files.applicationClass() as Bitmap;
      boardBitmap = new files.boardClass() as Bitmap;
      buttonbarBitmap = new files.buttonbarClass() as Bitmap;
      buttonlinkBitmap = new files.buttonlinkClass() as Bitmap;
      buttonsBitmap = new files.buttonsClass() as Bitmap;
      buttontextBitmap = new files.buttontextClass() as Bitmap;
      cameraBitmap = new files.cameraClass() as Bitmap;
      colorpanelBitmap = new files.colorpanelClass() as Bitmap;
      colorpickerBitmap = new files.colorpickerClass() as Bitmap;
      componentusageBitmap = new files.componentusageClass() as Bitmap;
      contentmultipleBitmap = new files.contentmultipleClass() as Bitmap;
      contentsingleBitmap = new files.contentsingleClass() as Bitmap;
      othersBitmap = new files.othersClass() as Bitmap;
      pickersBitmap = new files.pickersClass() as Bitmap;
      textareaBitmap = new files.textareaClass() as Bitmap;
      textboxBitmap = new files.textboxClass() as Bitmap;
      textinputBitmap = new files.textinputClass() as Bitmap;
      textlabelBitmap = new files.textlabelClass() as Bitmap;
      textmultiBitmap = new files.textmultiClass() as Bitmap;
      textsingleBitmap = new files.textsingleClass() as Bitmap;
      widgetBitmap = new files.widgetClass() as Bitmap;
      xmllisterBitmap = new files.xmllisterClass() as Bitmap;
      application.trace("<IconManagerDemo> constructed.", 4);
    }
    /**
     * Returns the bitmap data of an icon of this application, or the one the framework
     * answers when this application has no icon of that name at all.
     * @param iconType the name of the icon
     * @param textType the text type the color of the icon is taken from
     * @param iconSize the size of the icon
     */
    override public function getNewBitmapData(iconType:String, textType:String, iconSize:int):BitmapData
    {
      if (iconType == "application") return transformBitmapData(applicationBitmap, textType, iconSize);
      else if (iconType == "board") return transformBitmapData(boardBitmap, textType, iconSize);
      else if (iconType == "buttonbar") return transformBitmapData(buttonbarBitmap, textType, iconSize);
      else if (iconType == "buttonlink") return transformBitmapData(buttonlinkBitmap, textType, iconSize);
      else if (iconType == "buttons") return transformBitmapData(buttonsBitmap, textType, iconSize);
      else if (iconType == "buttontext") return transformBitmapData(buttontextBitmap, textType, iconSize);
      else if (iconType == "camera") return transformBitmapData(cameraBitmap, textType, iconSize);
      else if (iconType == "colorpanel") return transformBitmapData(colorpanelBitmap, textType, iconSize);
      else if (iconType == "colorpicker") return transformBitmapData(colorpickerBitmap, textType, iconSize);
      else if (iconType == "componentusage") return transformBitmapData(componentusageBitmap, textType, iconSize);
      else if (iconType == "contentmultiple") return transformBitmapData(contentmultipleBitmap, textType, iconSize);
      else if (iconType == "contentsingle") return transformBitmapData(contentsingleBitmap, textType, iconSize);
      else if (iconType == "others") return transformBitmapData(othersBitmap, textType, iconSize);
      else if (iconType == "pickers") return transformBitmapData(pickersBitmap, textType, iconSize);
      else if (iconType == "textarea") return transformBitmapData(textareaBitmap, textType, iconSize);
      else if (iconType == "textbox") return transformBitmapData(textboxBitmap, textType, iconSize);
      else if (iconType == "textinput") return transformBitmapData(textinputBitmap, textType, iconSize);
      else if (iconType == "textlabel") return transformBitmapData(textlabelBitmap, textType, iconSize);
      else if (iconType == "textmulti") return transformBitmapData(textmultiBitmap, textType, iconSize);
      else if (iconType == "textsingle") return transformBitmapData(textsingleBitmap, textType, iconSize);
      else if (iconType == "widget") return transformBitmapData(widgetBitmap, textType, iconSize);
      else if (iconType == "xmllister") return transformBitmapData(xmllisterBitmap, textType, iconSize);
      else return super.getNewBitmapData(iconType, textType, iconSize);
    }
    /**
     * Destroys this object: it frees up the resources embedded into this application
     * and lets the framework free up the ones of its own.
     */
    override public function destroy():void
    {
      application.trace("<IconManagerDemo destroy> called.", 4);
      disposeBitmap(applicationBitmap);
      disposeBitmap(boardBitmap);
      disposeBitmap(buttonbarBitmap);
      disposeBitmap(buttonlinkBitmap);
      disposeBitmap(buttonsBitmap);
      disposeBitmap(buttontextBitmap);
      disposeBitmap(cameraBitmap);
      disposeBitmap(colorpanelBitmap);
      disposeBitmap(colorpickerBitmap);
      disposeBitmap(componentusageBitmap);
      disposeBitmap(contentmultipleBitmap);
      disposeBitmap(contentsingleBitmap);
      disposeBitmap(othersBitmap);
      disposeBitmap(pickersBitmap);
      disposeBitmap(textareaBitmap);
      disposeBitmap(textboxBitmap);
      disposeBitmap(textinputBitmap);
      disposeBitmap(textlabelBitmap);
      disposeBitmap(textmultiBitmap);
      disposeBitmap(textsingleBitmap);
      disposeBitmap(widgetBitmap);
      disposeBitmap(xmllisterBitmap);
      super.destroy();
      applicationBitmap = null;
      boardBitmap = null;
      buttonbarBitmap = null;
      buttonlinkBitmap = null;
      buttonsBitmap = null;
      buttontextBitmap = null;
      cameraBitmap = null;
      colorpanelBitmap = null;
      colorpickerBitmap = null;
      componentusageBitmap = null;
      contentmultipleBitmap = null;
      contentsingleBitmap = null;
      othersBitmap = null;
      pickersBitmap = null;
      textareaBitmap = null;
      textboxBitmap = null;
      textinputBitmap = null;
      textlabelBitmap = null;
      textmultiBitmap = null;
      textsingleBitmap = null;
      widgetBitmap = null;
      xmllisterBitmap = null;
      files = null;
    }
  }
}
class IconManagerDemoFiles
{
  [Embed(source = "../resource/icon/application.png")]
  public var applicationClass:Class;
  [Embed(source = "../resource/icon/board.png")]
  public var boardClass:Class;
  [Embed(source = "../resource/icon/buttonbar.png")]
  public var buttonbarClass:Class;
  [Embed(source = "../resource/icon/buttonlink.png")]
  public var buttonlinkClass:Class;
  [Embed(source = "../resource/icon/buttons.png")]
  public var buttonsClass:Class;
  [Embed(source = "../resource/icon/buttontext.png")]
  public var buttontextClass:Class;
  [Embed(source = "../resource/icon/camera.png")]
  public var cameraClass:Class;
  [Embed(source = "../resource/icon/colorpanel.png")]
  public var colorpanelClass:Class;
  [Embed(source = "../resource/icon/colorpicker.png")]
  public var colorpickerClass:Class;
  [Embed(source = "../resource/icon/componentusage.png")]
  public var componentusageClass:Class;
  [Embed(source = "../resource/icon/contentmultiple.png")]
  public var contentmultipleClass:Class;
  [Embed(source = "../resource/icon/contentsingle.png")]
  public var contentsingleClass:Class;
  [Embed(source = "../resource/icon/others.png")]
  public var othersClass:Class;
  [Embed(source = "../resource/icon/pickers.png")]
  public var pickersClass:Class;
  [Embed(source = "../resource/icon/textarea.png")]
  public var textareaClass:Class;
  [Embed(source = "../resource/icon/textbox.png")]
  public var textboxClass:Class;
  [Embed(source = "../resource/icon/textinput.png")]
  public var textinputClass:Class;
  [Embed(source = "../resource/icon/textlabel.png")]
  public var textlabelClass:Class;
  [Embed(source = "../resource/icon/textmulti.png")]
  public var textmultiClass:Class;
  [Embed(source = "../resource/icon/textsingle.png")]
  public var textsingleClass:Class;
  [Embed(source = "../resource/icon/widget.png")]
  public var widgetClass:Class;
  [Embed(source = "../resource/icon/xmllister.png")]
  public var xmllisterClass:Class;
  /**
   * Constructs the embedded resource holder of this manager.
   */
  public function IconManagerDemoFiles():void
  {
  }
}
