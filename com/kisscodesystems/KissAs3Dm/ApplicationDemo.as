/*
** This class is a part of the KissAs3Dm application.
** See the header comment lines of the
** com . kisscodesystems . KissAs3Dm . ApplicationDemo
** The whole framework is available at:
** https://github.com/kisscodesystems/KissAs3Fw
** Demo applications:
** https://github.com/kisscodesystems/KissAs3Dm
**
** DESCRIPTION:
** ApplicationDemo.
** The desktop or mobile demo class of the KissAs3Fw.
** Every application based on this framework should extend the Application class.
**
** Published       : 2021.09.28
**
** Current version : 1.9
**
** Developed by    : Jozsef Kiss
**                   KissCode Systems Kft
**                   <http://kcsopensource.com>
**
** Changelog       : 1.1 - 06.30.2017
**                   bugfixes and smaller improvements
**                   1.2 - 07.02.2017
**                   displayAsPassword is available in TextInput
**                   the scrolling works in the BaseScroll using the mouse wheel.
**                   1.3 - 07.05.2017
**                   the embedded arial font is in the demo propsDyn from now
**                   the content will be cached as a bitmap during its movement
**                   1.4 - 07.06.2017
**                   small improvements in the content moving
**                   1.5 - 07.09.2017
**                   multiple contents are available in widgets instead of ContentSingle
**                   multiple widget containers are also available (settings panel)
**                   small bugfix of content moving on mobile devices
**                   pixel stealing is improved in Color (mobile devices)
**                   the Checkbox is Switcher from now
**                   "about" tab on the settings panel
**                   1.6 - 07.31.2017
**                   several smaller improvements
**                   ButtonFile class is added to handle file browsing and uploading
**                   This works on desktop, webbrowser and on mobile devices.
**                   1.7 - 08.19.2017
**                   Camera object is added now.
**                   The File and FileReference can be set from outside in ButtonFile.
**                   1.8 - 01.01.2019
**                   Clock, Date, DatePicker, Icon, Image classes are added
**                   menu contains profile image, nickname, fullname, role, login time,
**                   and logout, register buttons
**                   background can display background images loaded from the internet.
**                   several minor improvements
**                   1.9 - 28.sep.2021
**                   Watch is finally developed
**                   This ApplicationDemo objects has been improved, for example
**                   ther is no mobile and desktop mode, it can be set from the Settings
**                   New classes are available to use such as Board or Rater
**                   SoundPlayer is also available to play embedded sound files.
**
** MAIN FEATURES:
** - Shows the UI components of KissAs3Fw and the sample application to be created.
**
** ApplicationDemo is free software: you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** Free Software Foundation, version 3.
**
** ApplicationDemo is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with ApplicationDemo. If not, see <http://www.gnu.org/licenses/>.
*/
package com . kisscodesystems . KissAs3Dm
{
  import com . kisscodesystems . KissAs3Dm . prop . PropsAppDemo ;
  import com . kisscodesystems . KissAs3Dm . prop . PropsDynDemo ;
  import com . kisscodesystems . KissAs3Dm . text . TextStockDemo ;
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Dm . app . WidgetManagerDemo ;
  import com . kisscodesystems . KissAs3Dm . ui . IconManagerDemo ;
  import com . kisscodesystems . KissAs3Dm . ui . SoundManagerDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import flash . events . ContextMenuEvent ;
  import flash . events . Event ;
  public class ApplicationDemo extends Application
  {
    private var widgetManager : WidgetManagerDemo = null ;
    public function ApplicationDemo ( ) : void
    {
      super ( ) ;
      iconManager = new IconManagerDemo ( this ) ;
      soundManager = new SoundManagerDemo ( this ) ;
      widgetManager = new WidgetManagerDemo ( this ) ;
      traceLevel = 0 ;
    }
    public function getWidgetManager ( ) : WidgetManagerDemo
    {
      return widgetManager ;
    }
    override public function handleMenuSelect ( selectedItem : String ) : void
    {
      getWidgetManager ( ) . handleMenuSelect ( selectedItem ) ;
      getSoundManager ( ) . playSound ( "menuitem" ) ;
    }
    override protected function addedToStage ( e : Event ) : void
    {
      super . addedToStage ( e ) ;
      iniprops ( ) ;
      inilayers ( ) ;
      inisetmenu ( ) ;
      iniupdates ( ) ;
      inilangcode ( ) ;
      iniorientation ( ) ;
      inidisplayingstyle ( ) ;
      inisettingofapplicationname ( ) ;
      inicreationofthewholecontent ( ) ;
      inicontextmenuitems ( ) ;
    }
    protected function iniprops ( ) : void
    {
      texts = new TextsDemo ( ) ;
      textStock = new TextStockDemo ( application ) ;
      propsApp = new PropsAppDemo ( ) ;
      propsDyn = new PropsDynDemo ( application ) ;
    }
    protected function inilayers ( ) : void
    {
      createLayers ( ) ;
    }
    protected function inisetmenu ( ) : void
    {
      menuxml = " <?xml version=\"1.0\" encoding=\"UTF-8\"?>"
              + " <items>"
              + "   <item opened=\"0\" icon=\"componentusage\" value=\"" + TextsDemo ( getTexts ( ) ) . MENU_ITEM_COMPONENT_USAGE + "\"/>"
              + "   <item opened=\"0\" icon=\"camera\" value=\"" + TextsDemo ( getTexts ( ) ) . MENU_ITEM_CAMERA + "\"/>"
              + "   <item opened=\"0\" icon=\"texts\" value=\"" + TextsDemo ( getTexts ( ) ) . MENU_ITEM_TEXTS + "\">"
              + "     <item opened=\"0\" icon=\"dummy\" value=\"" + TextsDemo ( getTexts ( ) ) . MENU_ITEM_SINGLE_LINE_TEXTS + "\"/>"
              + "     <item opened=\"0\" icon=\"dummy\" value=\"" + TextsDemo ( getTexts ( ) ) . MENU_ITEM_MULTI_LINE_TEXTS + "\"/>" 
              + "   </item>" 
              + "   <item opened=\"0\" icon=\"buttons\" value=\"" + TextsDemo ( getTexts ( ) ) . MENU_ITEM_BUTTONS + "\"/>"
              + "   <item opened=\"0\" icon=\"pickers\" value=\"" + TextsDemo ( getTexts ( ) ) . MENU_ITEM_PICKERS + "\"/>" 
              + "   <item opened=\"0\" icon=\"board\" value=\"" + TextsDemo ( getTexts ( ) ) . MENU_ITEM_BOARD + "\"/>" 
              + "   <item opened=\"0\" icon=\"others\" value=\"" + TextsDemo ( getTexts ( ) ) . MENU_ITEM_OTHERS + "\"/>" 
              + " </items>" ;
    }
    protected function iniupdates ( ) : void
    {
      getMiddleground ( ) . setElementsOfLangCodesOBJ ( ) ;
      getMiddleground ( ) . setElementsOfDisplayingStylesOBJ ( ) ;
      getMiddleground ( ) . updateMenuxml ( ) ;
    }
    protected function inilangcode ( ) : void
    {
      getMiddleground ( ) . setLangCode ( getTexts ( ) . LANG_EN ) ;
    }
    protected function iniorientation ( ) : void
    {
      application . getPropsDyn ( ) . setAppWidgetsOrientation ( application . getTexts ( ) . ORIENTATION_VERTICAL ) ;
    }
    protected function inidisplayingstyle ( ) : void
    {
      getPropsDyn ( ) . setCurrentDisplayingStyle ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ) ;
      getPropsDyn ( ) . setAppBackgroundImage ( true ) ;
    }
    protected function inisettingofapplicationname ( ) : void
    {
      setApplicationNameWithIcon ( "" ) ;
    }
    protected function inicreationofthewholecontent ( ) : void
    {
      createContent ( ) ;
    }
    private function customContextMenuItemClickHandler ( e : ContextMenuEvent ) : void
    {
      var uniqueString : String = "" + new Date ( ) . time ;
      var messageString : String = e . currentTarget . caption + TextsDemo ( getTexts ( ) ) . HAS_BEEN_CLICKED ;
      var alertOkCustomContextMenu : Function = function ( e : Event ) : void
      {
        getBaseEventDispatcher ( ) . removeEventListener ( e . type , alertOkCustomContextMenu ) ;
        getForeground ( ) . closeAlert ( uniqueString ) ;
        e . stopImmediatePropagation ( ) ;
      }
      getBaseEventDispatcher ( ) . addEventListener ( uniqueString + getTexts ( ) . OC_OK , alertOkCustomContextMenu ) ;
      getForeground ( ) . createAlert ( messageString , uniqueString , true , true ) ;
    }
    protected function createContent ( ) : void
    {
      getWidgetManager ( ) . openComponentUsageWidget ( ) ;
      SoundManagerDemo ( getSoundManager ( ) ) . playSound ( "signal" ) ;
    }
    protected function inicontextmenuitems ( ) : void
    {
      addNewContextMenuItem ( "Go to developer homepage" , "http://kcsopensource.com" , null ) ;
      addNewContextMenuItem ( "Custom Handler also works" , null , customContextMenuItemClickHandler ) ;
    }
  }
}
