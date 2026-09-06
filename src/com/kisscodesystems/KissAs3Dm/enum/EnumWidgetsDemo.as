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
 * EnumWidgetsDemo.
 * Contains the header of every widget of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - one header belongs to one widget, and one widget demonstrates one component
 * - these headers are the values of the items of the menu as well, so the widget
 *   manager finds the widget of a picked menu item by the very same string
 * - a header is the name of the component the widget belongs to, and the name of a
 *   class is the same in every language, so these are not text keys but plain texts
 * - the one exception is the welcome widget: it belongs to no component at all, so the
 *   header of it is a text key and it is displayed in the language that is on
 */
package com.kisscodesystems.KissAs3Dm.enum
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  public class EnumWidgetsDemo
  {
    /**
     * Returns the header of the widget this application is opened with. That one belongs
     * to no component at all: it tells what can be read in this application, so it is
     * the very first item of the menu and it is a text key instead of a class name.
     */
    public static function WELCOME():String
    {
      return EnumTextKeysDemo.WIDGET_WELCOME();
    }
    /**
     * Returns the header of the widget of the TextLabel component.
     */
    public static function TEXTLABEL():String
    {
      return "TextLabel";
    }
    /**
     * Returns the header of the widget of the TextBox component.
     */
    public static function TEXTBOX():String
    {
      return "TextBox";
    }
    /**
     * Returns the header of the widget of the TextArea component.
     */
    public static function TEXTAREA():String
    {
      return "TextArea";
    }
    /**
     * Returns the header of the widget of the TextInput component.
     */
    public static function TEXTINPUT():String
    {
      return "TextInput";
    }
    /**
     * Returns the header of the widget of the ButtonText component.
     */
    public static function BUTTONTEXT():String
    {
      return "ButtonText";
    }
    /**
     * Returns the header of the widget of the ButtonLink component.
     */
    public static function BUTTONLINK():String
    {
      return "ButtonLink";
    }
    /**
     * Returns the header of the widget of the ButtonBar component.
     */
    public static function BUTTONBAR():String
    {
      return "ButtonBar";
    }
    /**
     * Returns the header of the widget of the Switcher component.
     */
    public static function SWITCHER():String
    {
      return "Switcher";
    }
    /**
     * Returns the header of the widget of the ColorPicker component.
     */
    public static function COLORPICKER():String
    {
      return "ColorPicker";
    }
    /**
     * Returns the header of the widget of the ColorPanel component.
     */
    public static function COLORPANEL():String
    {
      return "ColorPanel";
    }
    /**
     * Returns the header of the widget of the DatePicker component.
     */
    public static function DATEPICKER():String
    {
      return "DatePicker";
    }
    /**
     * Returns the header of the widget of the DatePanel component.
     */
    public static function DATEPANEL():String
    {
      return "DatePanel";
    }
    /**
     * Returns the header of the widget of the ListPicker component.
     */
    public static function LISTPICKER():String
    {
      return "ListPicker";
    }
    /**
     * Returns the header of the widget of the ListPanel component.
     */
    public static function LISTPANEL():String
    {
      return "ListPanel";
    }
    /**
     * Returns the header of the widget of the ContentSingle component.
     */
    public static function CONTENTSINGLE():String
    {
      return "ContentSingle";
    }
    /**
     * Returns the header of the widget of the ContentMultiple component.
     */
    public static function CONTENTMULTIPLE():String
    {
      return "ContentMultiple";
    }
    /**
     * Returns the header of the widget of the More component.
     */
    public static function MORE():String
    {
      return "More";
    }
    /**
     * Returns the header of the widget of the Widget component itself. That component is
     * the one every widget of this application is built of, so this one demonstrates the
     * only object of the ui package that is standing here in more than one copy already.
     */
    public static function WIDGET():String
    {
      return "Widget";
    }
    /**
     * Returns the header of the widget of the application itself. That one is not a
     * component of the ui package: it holds the information about the whole application
     * that every other widget of it is standing in.
     */
    public static function APPLICATION():String
    {
      return "Application";
    }
    /**
     * Returns the header of the widget of the Icon component.
     */
    public static function ICON():String
    {
      return "Icon";
    }
    /**
     * Returns the header of the widget of the Image component.
     */
    public static function IMAGE():String
    {
      return "Image";
    }
    /**
     * Returns the header of the widget of the SoundPlayer component.
     */
    public static function SOUNDPLAYER():String
    {
      return "SoundPlayer";
    }
    /**
     * Returns the header of the widget of the Camera component.
     */
    public static function CAMERA():String
    {
      return "Camera";
    }
    /**
     * Returns the header of the widget of the VideoPlayer component.
     */
    public static function VIDEOPLAYER():String
    {
      return "VideoPlayer";
    }
    /**
     * Returns the header of the widget of the Board component.
     */
    public static function BOARD():String
    {
      return "Board";
    }
    /**
     * Returns the header of the widget of the Watch component.
     */
    public static function WATCH():String
    {
      return "Watch";
    }
    /**
     * Returns the header of the widget of the Rater component.
     */
    public static function RATER():String
    {
      return "Rater";
    }
    /**
     * Returns the header of the widget of the Potmeter component.
     */
    public static function POTMETER():String
    {
      return "Potmeter";
    }
    /**
     * Returns the header of the widget of the XmlLister component.
     */
    public static function XMLLISTER():String
    {
      return "XmlLister";
    }
    /**
     * Returns the header of the widget of the UrlRequest manager.
     */
    public static function URLREQUEST():String
    {
      return "UrlRequest";
    }
    /**
     * Returns the header of the widget of the NetConnection manager.
     */
    public static function NETCONNECTION():String
    {
      return "NetConnection";
    }
  }
}
