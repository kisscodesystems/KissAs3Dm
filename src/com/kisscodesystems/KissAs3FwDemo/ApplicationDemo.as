/*
** This class is a part of the KissAs3FwDemo application.
** See the header comment lines of the
** com . kisscodesystems . KissAs3FwDemo . ApplicationDemo
** The whole framework is available at:
** https://github.com/kisscodesystems/KissAs3Fw
** Demo applications:
** https://github.com/kisscodesystems/KissAs3FwDemos
**
** DESCRIPTION:
** ApplicationDemo.
** The desktop demo class of the KissAs3Fw.
** Every application based on this framework should extend the Application class.
**
** Published       : 06.21.2017
**
** Current version : 1.3
**
** Developed by    : Jozsef Kiss
**                   KissCode Systems Kft
**                   <https://openso.kisscodesystems.com>
**
** Changelog       : 1.1 - 06.30.2017
**                   the layers of the middleground have to be created
**                   right after the replacement of propsApp and propsDyn
**                   1.2 - 07.02.2017
**                   scrolling is enabled by mouse wheel
**                   password input field example in the widget of input fields
**                   1.3 - 07.05.2017
**                   the initialization of the demo app will be done in separated methods
**                   new classes of each demo application
**                   the embedded arial font is in the demo propsDyn class from now
**
** MAIN FEATURES:
** - Shows the UI components of KissAs3Fw.
**
** Adding new background images:
** 0: embedding the resource as seen in the object variables of ApplicationDemo (bg2.jpg)
** 1: creating the new objects of the new bitmaps as seen in the doFirstIni of ApplicationDemo
** 2: Add the new codes of the background as in the TextsDemo, BACKGROUND_IMAGE_BG2
** 3: Push these codes into the end of the textCodesBgImagePics (TextStockDemo, constructor)
** 4: Add the names of these backgrounds in all of the languages as in the textIni2 of TextStockDemo
**    (texts [ textCodesBgImagePics [ 1 ] ] = ... )
** 5: Override the setBackgroundBitmapData and setAppBackgroundImage to contain all of the background images.
** 6: getBackground ( ) . setElementsOfBackgroundImageOBJ ( ) ; calling to get the new items into the listpicker.
**
** Adding new fonts:
** 0: embedding the resource as seen in the object variables of ApplicationDemo (Palatino Linotype)
** 1: add the new font code as can be seen here: FONT_PALATINO_LINOTYPE
**
** Adding new text codes:
** 0: Define the new text codes as in the TextsDemo
**    (for example as GTEXT_BASIC_SCROLL is added into)
** 1: Define the new texts in all of the available languages as in the textStockDemo
**    (for example as the array containing the texts of the GTEXT_BASIC_SCROLL text code)
**
** Adding new languages:
** 0: Add your new language code to the new Texts class (TextsDemo, LANG_HU is added)
** 1: Push this lang code into the end of the langCodes (TextStockDemo, constructor)
** 2: Add the new names of all of the languages into the texts (TextStockDemo, textIni2, first line)
** 3: Push the texts in the new language into the end of all of the existing texts (TextStockDemo, textIni2, other lines)
**    (the array of texts of the NEW text codes have to be completely defined with all of the elements and not be pushed)
**
** Adding new displaying styles:
** 0: Define your displaying style with all of the displaying attributes
**    in createAppDisplayingStyles like DISPLAYING_STYLE_BALATON
** 1: Declare the style key into textsDemo.
** 2: insert this new key into textCodesDisplayingStyles in textStockDemo
** 3: insert the new texts as done in the textIni2 in textStockDemo
**
** Copyright (C) 2017 KissCode Systems Kft
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
package com . kisscodesystems . KissAs3FwDemo
{
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . ButtonBar ;
  import com . kisscodesystems . KissAs3Fw . ui . ButtonDraw ;
  import com . kisscodesystems . KissAs3Fw . ui . ButtonLink ;
  import com . kisscodesystems . KissAs3Fw . ui . ButtonText ;
  import com . kisscodesystems . KissAs3Fw . ui . Checkbox ;
  import com . kisscodesystems . KissAs3Fw . ui . Color ;
  import com . kisscodesystems . KissAs3Fw . ui . ColorPicker ;
  import com . kisscodesystems . KissAs3Fw . ui . List ;
  import com . kisscodesystems . KissAs3Fw . ui . ListPicker ;
  import com . kisscodesystems . KissAs3Fw . ui . Potmet ;
  import com . kisscodesystems . KissAs3Fw . ui . TextArea ;
  import com . kisscodesystems . KissAs3Fw . ui . TextBox ;
  import com . kisscodesystems . KissAs3Fw . ui . TextInput ;
  import com . kisscodesystems . KissAs3Fw . ui . TextLabel ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  import com . kisscodesystems . KissAs3Fw . ui . XmlLister ;
  import com . kisscodesystems . KissAs3FwDemo . prop . PropsAppDemo ;
  import com . kisscodesystems . KissAs3FwDemo . prop . PropsDynDemo ;
  import com . kisscodesystems . KissAs3FwDemo . text . TextStockDemo ;
  import com . kisscodesystems . KissAs3FwDemo . text . TextsDemo ;
  import flash . events . ContextMenuEvent ;
  import flash . events . Event ;
  public class ApplicationDemo extends Application
  {
// THE DISPLAYABLE COMPONENTS ARE HERE:
// For the hints how to use the components.
    private var widgetComponentUsage : Widget = null ;
    private var widgetComponentUsagesw : int = 500 ;
    private var widgetComponentUsagesh : int = 300 ;
    private var textBoxComponentUsage : TextBox = null ;
// For the single lined elements.
    private var widgetSingleLineTexts : Widget = null ;
    private var widgetSingleLineTextssw : int = 500 ;
    private var widgetSingleLineTextssh : int = 200 ;
    private var textLabelBright : TextLabel = null ;
    private var textLabelMid : TextLabel = null ;
    private var textLabelDark : TextLabel = null ;
    private var textLabelDark2 : TextLabel = null ;
    private var textInputEnabled : TextInput = null ;
    private var textInputDisabled : TextInput = null ;
    private var textInputPassword : TextInput = null ;
// For the multi lined elements.
    private var widgetMultipleLineTexts : Widget = null ;
    private var widgetMultipleLineTextssw : int = 500 ;
    private var widgetMultipleLineTextssh : int = 400 ;
    private var textLabelTextBox : TextLabel = null ;
    private var textBox : TextBox = null ;
    private var textLabelTextAreaEnabled : TextLabel = null ;
    private var textAreaEnabled : TextArea = null ;
    private var textLabelTextAreaDisabled : TextLabel = null ;
    private var textAreaDisabled : TextArea = null ;
// For buttons.
    private var widgetButtons : Widget = null ;
    private var widgetButtonssw : int = 450 ;
    private var widgetButtonssh : int = 300 ;
    private var textLabelButtonBar : TextLabel = null ;
    private var buttonBarEnabled : ButtonBar = null ;
    private var buttonBarEnabledw : int = 300 ;
    private var buttonBarDisabled : ButtonBar = null ;
    private var buttonBarDisabledw : int = 150 ;
    private var textLabelButtonDraw : TextLabel = null ;
    private var buttonDrawEnabled : ButtonDraw = null ;
    private var buttonDrawDisabled : ButtonDraw = null ;
    private var textLabelButtonLink : TextLabel = null ;
    private var buttonLinkEnabled : ButtonLink = null ;
    private var buttonLinkDisabled : ButtonLink = null ;
    private var textLabelButtonText : TextLabel = null ;
    private var buttonTextEnabled : ButtonText = null ;
    private var buttonTextDisabled : ButtonText = null ;
// For pickers.
    private var widgetPickers : Widget = null ;
    private var widgetPickerssw : int = 550 ;
    private var widgetPickerssh : int = 330 ;
    private var textLabelColor : TextLabel = null ;
    private var colorEnabled : Color = null ;
    private var colorDisabled : Color = null ;
    private var textLabelColorPicker : TextLabel = null ;
    private var colorPickerEnabled : ColorPicker = null ;
    private var colorPickerDisabled : ColorPicker = null ;
    private var textLabelList : TextLabel = null ;
    private var listEnabled : List = null ;
    private var listDisabled : List = null ;
    private var textLabelListPicker : TextLabel = null ;
    private var listPickerEnabled : ListPicker = null ;
    private var listPickerDisabled : ListPicker = null ;
    private var listMaxElements : int = 5 ;
// For other elements that have specific values.
    private var widgetOthers : Widget = null ;
    private var widgetOtherssw : int = 350 ;
    private var widgetOtherssh : int = 310 ;
    private var checkboxEnabled : Checkbox = null ;
    private var checkboxDisabled : Checkbox = null ;
    private var potmetEnabled : Potmet = null ;
    private var potmetDisabled : Potmet = null ;
    private var textLabelPotmet : TextLabel = null ;
    private var textLabelXmlLister : TextLabel = null ;
    private var xmlLister : XmlLister = null ;
/*
** Nothing special just constructs the new application.
*/
    public function ApplicationDemo ( ) : void
    {
// Super.
      super ( ) ;
    }
/*
** The correct way is the override of this method to initialize the app.
** This is the basic example of how to build an application extending the functionality of Application.
*/
    override protected function addedToStage ( e : Event ) : void
    {
// Calling the super . addedToStage ( e ) ; in the first line!
      super . addedToStage ( e ) ;
// Initializing the application.
      ini00props ( ) ;
      ini01layers ( ) ;
      ini02setmenu ( ) ;
      ini03updates ( ) ;
      ini04langcode ( ) ;
      ini05orientation ( ) ;
      ini06displayingstyle ( ) ;
      ini07contextmenuitems ( ) ;
      ini08settingtosmartphone ( ) ;
      ini09settingofapplicationname ( ) ;
      ini10creationofthewholecontent ( ) ;
    }
/*
** Initializing methods!
*/
    protected function ini00props ( ) : void
    {
// WE HAVE TO OVERRIDE THIS METHOD!
    }
    protected function ini01layers ( ) : void
    {
// Now the layers should be created!
      createLayers ( ) ;
    }
    protected function ini02setmenu ( ) : void
    {
// The menu of this application:
      menuxml = " <?xml version=\"1.0\" encoding=\"UTF-8\"?>" + " <items>" + "   <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE0 + "\"/>" + "   <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE1 + "\"/>" + "   <item opened=\"1\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE2 + "\">" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE20 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE21 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE22 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE23 + "\"/>" + "     <item opened=\"1\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE24 + "\">" + "       <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE240 + "\"/>" + "       <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE241 + "\"/>" + "       <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE242 + "\"/>" + "       <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE243 + "\"/>" + "       <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE244 + "\"/>" + "       <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE245 + "\"/>" + "       <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE246 + "\"/>" + "       <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE247 + "\"/>" + "     </item>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE25 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE26 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE27 + "\"/>" + "   </item>" + "   <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE3 + "\"/>" + "   <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE4 + "\"/>" + "   <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE5 + "\"/>" + "   <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE6 + "\"/>" + "   <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE7 + "\"/>" + "   <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE8 + "\"/>" + "   <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE9 + "\">" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE90 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE91 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE92 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE93 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE94 + "\"/>" + "     <item opened=\"0\" value=\"" + TextsDemo ( getTexts ( ) ) . VALUE95 + "\"/>" + "   </item>" + " </items>" ;
    }
    protected function ini03updates ( ) : void
    {
// New elements may be added so it is necessary to update the lists.
      getMiddleground ( ) . setElementsOfBackgroundImageOBJ ( ) ;
      getMiddleground ( ) . setElementsOfLangCodesOBJ ( ) ;
      getMiddleground ( ) . setElementsOfDisplayingStylesOBJ ( ) ;
      getMiddleground ( ) . updateMenuxml ( ) ;
    }
    protected function ini04langcode ( ) : void
    {
// Setting the language code of the app at the first steps.
      getMiddleground ( ) . setLangCode ( getTexts ( ) . LANG_EN ) ;
    }
    protected function ini05orientation ( ) : void
    {
// Let's set the widget orientation!
      getMiddleground ( ) . setWidgetsOrientation ( getTexts ( ) . ORIENTATION_VERTICAL ) ;
    }
    protected function ini06displayingstyle ( ) : void
    {
// Let's set the displaying style!
      getMiddleground ( ) . setDisplayingStyle ( TextsDemo ( getTexts ( ) ) . DISPLAYING_STYLE_BALATON ) ;
    }
    protected function ini07contextmenuitems ( ) : void
    {
// Adding new elements to the context menu. (works only with desktop)
      addNewContextMenuItem ( "Go to developer homepage" , "https://developer.homepage.com" , null ) ;
      addNewContextMenuItem ( "Custom Handler also works" , null , customContextMenuItemClickHandler ) ;
    }
    protected function ini08settingtosmartphone ( ) : void
    {
// If the smartphone mode is expected then this is the place to go, comment it back.
      toSmartphone ( ) ;
    }
    protected function ini09settingofapplicationname ( ) : void
    {
// Sets the name of the application to the header. The variable holding this is in the propsApp
      setApplicationName ( ) ;
    }
    protected function ini10creationofthewholecontent ( ) : void
    {
// After this initializing, the real content can be created.
      createContent ( ) ;
    }
/*
** The creation of the real content.
*/
    protected function createContent ( ) : void
    {
// ELEMENTS OF THE APPLICATION.
// The creation of the first two widgets will be commented.
// For further information, please read the comment lines of the specific class.
// For the hints how to use the components.
// The creation of the widget.
      widgetComponentUsage = new Widget ( application ) ;
// This has to be added into the widgets.
      addWidget ( widgetComponentUsage ) ;
// The widget type and header have to be specified.
      widgetComponentUsage . setWidgetType ( getTexts ( ) . WIDGET_TYPE_GENERAL ) ;
      widgetComponentUsage . setWidgetHeaderCode ( TextsDemo ( getTexts ( ) ) . WIDGET_HEADER_DEMO_COMPONENT_USAGE ) ;
// It can be set to follow the size of the stage or not. ( basically this can be the % declaration of the size.)
      widgetComponentUsage . setFollowStageWidth ( true ) ;
      widgetComponentUsage . setFollowStageHeight ( true ) ;
// Widget is done, the components are the following. This is just a text box, let's create it.
      textBoxComponentUsage = new TextBox ( application ) ;
// It should be added into the content of the widget.
// 1: the object reference
// 2: active or inactive
// 3: the place of the display object. (zero based cell index)
      widgetComponentUsage . addToContent ( textBoxComponentUsage , true , 0 ) ;
// Other customization of the box.
      textBoxComponentUsage . setHtml ( true ) ;
      textBoxComponentUsage . setWordWrap ( true ) ;
// What is the content of this textbox?
      textBoxComponentUsage . setTextCode ( getTexts ( ) . COMPONENTS_USAGE ) ;
// Adding event listeners: if the widget resizes then the textbox will follow the size of the widget.
      widgetComponentUsage . getContentBaseEventDispatcher ( ) . addEventListener ( EVENT_SIZES_CHANGED , widgetComponentUsageContentResized ) ;
// NOW the initial resizing of the widget to resize the textbox too.
      widgetComponentUsage . setswh ( widgetComponentUsagesw , widgetComponentUsagesh ) ;
// For the single lined elements.
      widgetSingleLineTexts = new Widget ( application ) ;
      addWidget ( widgetSingleLineTexts ) ;
      widgetSingleLineTexts . setWidgetType ( getTexts ( ) . WIDGET_TYPE_GENERAL ) ;
      widgetSingleLineTexts . setWidgetHeaderCode ( TextsDemo ( getTexts ( ) ) . WIDGET_HEADER_DEMO_SINGLE_LINE_TEXTS ) ;
      widgetSingleLineTexts . setFollowStageWidth ( true ) ;
      widgetSingleLineTexts . setFollowStageHeight ( true ) ;
// This is the maximum index of the columns.1 means two columns (ORIENTATION_VERTICAL, or two rows in case of ORIENTATION_HORIZONTAL)
      widgetSingleLineTexts . setElementsFix ( 1 ) ;
// Now creating and adding the elements into the widget.
      textLabelBright = new TextLabel ( application ) ;
      widgetSingleLineTexts . addToContent ( textLabelBright , false , 0 ) ;
      textLabelBright . setTextCode ( TextsDemo ( getTexts ( ) ) . SINGLE_LINE_LABEL_BRIGHT ) ;
      textLabelBright . setTextType ( getTexts ( ) . TEXT_TYPE_BRIGHT ) ;
      textLabelMid = new TextLabel ( application ) ;
      widgetSingleLineTexts . addToContent ( textLabelMid , false , 2 ) ;
      textLabelMid . setTextCode ( TextsDemo ( getTexts ( ) ) . SINGLE_LINE_LABEL_MID_ENABLED_INPUT ) ;
      textLabelMid . setTextType ( getTexts ( ) . TEXT_TYPE_MID ) ;
      textInputEnabled = new TextInput ( application ) ;
      widgetSingleLineTexts . addToContent ( textInputEnabled , true , 3 ) ;
      textInputEnabled . setTextCode ( TextsDemo ( getTexts ( ) ) . ENABLED_TEXT_INPUT ) ;
      textLabelDark = new TextLabel ( application ) ;
      widgetSingleLineTexts . addToContent ( textLabelDark , false , 4 ) ;
      textLabelDark . setTextCode ( TextsDemo ( getTexts ( ) ) . SINGLE_LINE_LABEL_DARK_ENABLED_INPUT ) ;
      textLabelDark . setTextType ( getTexts ( ) . TEXT_TYPE_DARK ) ;
      textInputDisabled = new TextInput ( application ) ;
      widgetSingleLineTexts . addToContent ( textInputDisabled , true , 5 ) ;
      textInputDisabled . setTextCode ( TextsDemo ( getTexts ( ) ) . DISABLED_TEXT_INPUT ) ;
      textInputDisabled . setEnabled ( false ) ;
      textLabelDark2 = new TextLabel ( application ) ;
      widgetSingleLineTexts . addToContent ( textLabelDark2 , false , 6 ) ;
      textLabelDark2 . setTextCode ( TextsDemo ( getTexts ( ) ) . SINGLE_LINE_LABEL_DARK_PASSWORD_INPUT ) ;
      textLabelDark2 . setTextType ( getTexts ( ) . TEXT_TYPE_DARK ) ;
      textInputPassword = new TextInput ( application ) ;
      widgetSingleLineTexts . addToContent ( textInputPassword , true , 7 ) ;
      textInputPassword . setTextCode ( "Password" ) ;
      textInputPassword . setDisplayAsPassword ( true ) ;
// Here are an event listener too: the input fields has to follow the size of the widget. (not necessary, we want that.)
      widgetSingleLineTexts . getContentBaseEventDispatcher ( ) . addEventListener ( EVENT_SIZES_CHANGED , widgetSingleLineTextsContentResized ) ;
      widgetSingleLineTexts . setswh ( widgetSingleLineTextssw , widgetSingleLineTextssh ) ;
// For the multi lined elements.
      widgetMultipleLineTexts = new Widget ( application ) ;
      addWidget ( widgetMultipleLineTexts ) ;
      widgetMultipleLineTexts . setWidgetType ( getTexts ( ) . WIDGET_TYPE_GENERAL ) ;
      widgetMultipleLineTexts . setWidgetHeaderCode ( TextsDemo ( getTexts ( ) ) . WIDGET_HEADER_DEMO_MULTIPLE_LINE_TEXTS ) ;
      widgetMultipleLineTexts . setFollowStageWidth ( true ) ;
      widgetMultipleLineTexts . setFollowStageHeight ( true ) ;
      widgetMultipleLineTexts . setElementsFix ( 1 ) ;
      textLabelTextBox = new TextLabel ( application ) ;
      widgetMultipleLineTexts . addToContent ( textLabelTextBox , false , 0 ) ;
      textLabelTextBox . setTextCode ( TextsDemo ( getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_BOX ) ;
      textBox = new TextBox ( application ) ;
      widgetMultipleLineTexts . addToContent ( textBox , true , 1 ) ;
      textBox . setTextCode ( TextsDemo ( getTexts ( ) ) . TEXT_BOX ) ;
      textLabelTextAreaEnabled = new TextLabel ( application ) ;
      widgetMultipleLineTexts . addToContent ( textLabelTextAreaEnabled , false , 2 ) ;
      textLabelTextAreaEnabled . setTextCode ( TextsDemo ( getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_AREA_ENABLED ) ;
      textAreaEnabled = new TextArea ( application ) ;
      widgetMultipleLineTexts . addToContent ( textAreaEnabled , true , 3 ) ;
      textAreaEnabled . setTextCode ( TextsDemo ( getTexts ( ) ) . TEXT_AREA_ENABLED ) ;
      textLabelTextAreaDisabled = new TextLabel ( application ) ;
      widgetMultipleLineTexts . addToContent ( textLabelTextAreaDisabled , false , 4 ) ;
      textLabelTextAreaDisabled . setTextCode ( TextsDemo ( getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_AREA_DISABLED ) ;
      textAreaDisabled = new TextArea ( application ) ;
      widgetMultipleLineTexts . addToContent ( textAreaDisabled , true , 5 ) ;
      textAreaDisabled . setTextCode ( TextsDemo ( getTexts ( ) ) . TEXT_AREA_DISABLED ) ;
      textAreaDisabled . setEnabled ( false ) ;
      widgetMultipleLineTexts . getContentBaseEventDispatcher ( ) . addEventListener ( EVENT_SIZES_CHANGED , widgetMultipleLineTextsContentResized ) ;
      widgetMultipleLineTexts . setswh ( widgetMultipleLineTextssw , widgetMultipleLineTextssh ) ;
// For buttons.
      widgetButtons = new Widget ( application ) ;
      addWidget ( widgetButtons ) ;
      widgetButtons . setWidgetType ( getTexts ( ) . WIDGET_TYPE_GENERAL ) ;
      widgetButtons . setWidgetHeaderCode ( TextsDemo ( getTexts ( ) ) . WIDGET_HEADER_DEMO_BUTTONS ) ;
      widgetButtons . setFollowStageWidth ( false ) ;
      widgetButtons . setFollowStageHeight ( false ) ;
      widgetButtons . setElementsFix ( 2 ) ;
      textLabelButtonBar = new TextLabel ( application ) ;
      widgetButtons . addToContent ( textLabelButtonBar , false , 0 ) ;
      textLabelButtonBar . setTextCode ( TextsDemo ( getTexts ( ) ) . BUTTON_BARS ) ;
      buttonBarEnabled = new ButtonBar ( application ) ;
      widgetButtons . addToContent ( buttonBarEnabled , true , 2 ) ;
      buttonBarEnabled . setMaxWidth ( buttonBarEnabledw ) ;
      buttonBarEnabled . addButton ( getTexts ( ) . OC_OK ) ;
      buttonBarEnabled . addButton ( getTexts ( ) . OC_CANCEL ) ;
      buttonBarEnabled . addButton ( getTexts ( ) . YN_YES ) ;
      buttonBarEnabled . addButton ( getTexts ( ) . YN_NO ) ;
      buttonBarEnabled . getBaseEventDispatcher ( ) . addEventListener ( EVENT_CHANGED , buttonBarEnabledChanged ) ;
      buttonBarDisabled = new ButtonBar ( application ) ;
      widgetButtons . addToContent ( buttonBarDisabled , true , 5 ) ;
      buttonBarDisabled . setMaxWidth ( buttonBarDisabledw ) ;
      buttonBarDisabled . addButton ( getTexts ( ) . OC_OK ) ;
      buttonBarDisabled . addButton ( getTexts ( ) . OC_CANCEL ) ;
      buttonBarDisabled . addButton ( getTexts ( ) . YN_YES ) ;
      buttonBarDisabled . addButton ( getTexts ( ) . YN_NO ) ;
      buttonBarDisabled . setEnabled ( false ) ;
      textLabelButtonDraw = new TextLabel ( application ) ;
      widgetButtons . addToContent ( textLabelButtonDraw , false , 6 ) ;
      textLabelButtonDraw . setTextCode ( TextsDemo ( getTexts ( ) ) . BUTTON_DRAWS ) ;
      buttonDrawEnabled = new ButtonDraw ( application ) ;
      widgetButtons . addToContent ( buttonDrawEnabled , true , 7 ) ;
      buttonDrawEnabled . setButtonType ( DRAW_BUTTON_TYPE_SETTINGS ) ;
      buttonDrawEnabled . getBaseEventDispatcher ( ) . addEventListener ( EVENT_CLICK , buttonDrawEnabledClick ) ;
      buttonDrawDisabled = new ButtonDraw ( application ) ;
      widgetButtons . addToContent ( buttonDrawDisabled , true , 8 ) ;
      buttonDrawDisabled . setButtonType ( DRAW_BUTTON_TYPE_MENU ) ;
      buttonDrawDisabled . setEnabled ( false ) ;
      textLabelButtonLink = new TextLabel ( application ) ;
      widgetButtons . addToContent ( textLabelButtonLink , false , 9 ) ;
      textLabelButtonLink . setTextCode ( TextsDemo ( getTexts ( ) ) . BUTTON_LINKS ) ;
      buttonLinkEnabled = new ButtonLink ( application ) ;
      widgetButtons . addToContent ( buttonLinkEnabled , true , 10 ) ;
      buttonLinkEnabled . setTextCode ( getTexts ( ) . YN_YES ) ;
      buttonLinkEnabled . getBaseEventDispatcher ( ) . addEventListener ( EVENT_CLICK , buttonLinkEnabledClick ) ;
      buttonLinkDisabled = new ButtonLink ( application ) ;
      widgetButtons . addToContent ( buttonLinkDisabled , true , 11 ) ;
      buttonLinkDisabled . setTextCode ( getTexts ( ) . YN_NO ) ;
      buttonLinkDisabled . setEnabled ( false ) ;
      textLabelButtonText = new TextLabel ( application ) ;
      widgetButtons . addToContent ( textLabelButtonText , false , 12 ) ;
      textLabelButtonText . setTextCode ( TextsDemo ( getTexts ( ) ) . BUTTON_TEXTS ) ;
      buttonTextEnabled = new ButtonText ( application ) ;
      widgetButtons . addToContent ( buttonTextEnabled , true , 13 ) ;
      buttonTextEnabled . setTextCode ( getTexts ( ) . OC_OK ) ;
      buttonTextEnabled . getBaseEventDispatcher ( ) . addEventListener ( EVENT_CLICK , buttonTextEnabledClick ) ;
      buttonTextDisabled = new ButtonText ( application ) ;
      widgetButtons . addToContent ( buttonTextDisabled , true , 14 ) ;
      buttonTextDisabled . setTextCode ( getTexts ( ) . OC_CANCEL ) ;
      buttonTextDisabled . getBaseEventDispatcher ( ) . addEventListener ( EVENT_CLICK , buttonTextDisabledClick ) ;
      buttonTextDisabled . setEnabled ( false ) ;
      widgetButtons . setswh ( widgetButtonssw , widgetButtonssh ) ;
// For pickers.
      widgetPickers = new Widget ( application ) ;
      addWidget ( widgetPickers ) ;
      widgetPickers . setWidgetType ( getTexts ( ) . WIDGET_TYPE_GENERAL ) ;
      widgetPickers . setWidgetHeaderCode ( TextsDemo ( getTexts ( ) ) . WIDGET_HEADER_DEMO_PICKERS ) ;
      widgetPickers . setFollowStageWidth ( false ) ;
      widgetPickers . setFollowStageHeight ( true ) ;
      widgetPickers . setElementsFix ( 2 ) ;
      textLabelColor = new TextLabel ( application ) ;
      widgetPickers . addToContent ( textLabelColor , false , 0 ) ;
      textLabelColor . setTextCode ( TextsDemo ( getTexts ( ) ) . COLORS ) ;
      colorEnabled = new Color ( application ) ;
      widgetPickers . addToContent ( colorEnabled , true , 2 ) ;
      colorEnabled . setRGBColor ( getPropsDyn ( ) . getAppBackgroundFgColor ( ) . toString ( 16 ) ) ;
      colorDisabled = new Color ( application ) ;
      widgetPickers . addToContent ( colorDisabled , true , 5 ) ;
      colorDisabled . setRGBColor ( getPropsDyn ( ) . getAppBackgroundFgColor ( ) . toString ( 16 ) ) ;
      colorDisabled . setEnabled ( false ) ;
      textLabelColorPicker = new TextLabel ( application ) ;
      widgetPickers . addToContent ( textLabelColorPicker , false , 6 ) ;
      textLabelColorPicker . setTextCode ( TextsDemo ( getTexts ( ) ) . COLOR_PICKERS ) ;
      colorPickerEnabled = new ColorPicker ( application ) ;
      widgetPickers . addToContent ( colorPickerEnabled , true , 7 ) ;
      colorPickerEnabled . setRGBColor ( getPropsDyn ( ) . getAppBackgroundBgColor ( ) . toString ( 16 ) ) ;
      colorPickerDisabled = new ColorPicker ( application ) ;
      widgetPickers . addToContent ( colorPickerDisabled , true , 8 ) ;
      colorPickerDisabled . setRGBColor ( getPropsDyn ( ) . getAppBackgroundFgColor ( ) . toString ( 16 ) ) ;
      colorPickerDisabled . setEnabled ( false ) ;
      textLabelList = new TextLabel ( application ) ;
      widgetPickers . addToContent ( textLabelList , false , 9 ) ;
      textLabelList . setTextCode ( TextsDemo ( getTexts ( ) ) . LISTS ) ;
      listEnabled = new List ( application ) ;
      widgetPickers . addToContent ( listEnabled , true , 10 ) ;
      listEnabled . setArrays ( [ TextsDemo ( getTexts ( ) ) . ELEMENT0 , TextsDemo ( getTexts ( ) ) . ELEMENT1 , TextsDemo ( getTexts ( ) ) . ELEMENT2 , TextsDemo ( getTexts ( ) ) . ELEMENT3 , TextsDemo ( getTexts ( ) ) . ELEMENT4 , TextsDemo ( getTexts ( ) ) . ELEMENT5 , TextsDemo ( getTexts ( ) ) . ELEMENT6 , TextsDemo ( getTexts ( ) ) . ELEMENT7 , TextsDemo ( getTexts ( ) ) . ELEMENT8 , TextsDemo ( getTexts ( ) ) . ELEMENT9 ] , [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 ] ) ;
      listEnabled . setNumOfElements ( listMaxElements ) ;
      listEnabled . setMultiple ( true ) ;
      listEnabled . setSelectedIndexes ( [ 0 , 2 , 3 ] ) ;
      listEnabled . setStartIndex ( 2 ) ;
      listEnabled . getBaseEventDispatcher ( ) . addEventListener ( EVENT_CHANGED , listEnabledChanged ) ;
      listDisabled = new List ( application ) ;
      widgetPickers . addToContent ( listDisabled , true , 11 ) ;
      listDisabled . setArrays ( [ TextsDemo ( getTexts ( ) ) . ELEMENT0 , TextsDemo ( getTexts ( ) ) . ELEMENT1 , TextsDemo ( getTexts ( ) ) . ELEMENT2 , TextsDemo ( getTexts ( ) ) . ELEMENT3 , TextsDemo ( getTexts ( ) ) . ELEMENT4 , TextsDemo ( getTexts ( ) ) . ELEMENT5 , TextsDemo ( getTexts ( ) ) . ELEMENT6 , TextsDemo ( getTexts ( ) ) . ELEMENT7 , TextsDemo ( getTexts ( ) ) . ELEMENT8 , TextsDemo ( getTexts ( ) ) . ELEMENT9 ] , [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 ] ) ;
      listDisabled . setNumOfElements ( listMaxElements ) ;
      listDisabled . setMultiple ( true ) ;
      listDisabled . setSelectedIndexes ( [ 1 , 3 , 5 ] ) ;
      listDisabled . setStartIndex ( 4 ) ;
      listDisabled . setEnabled ( false ) ;
      textLabelListPicker = new TextLabel ( application ) ;
      widgetPickers . addToContent ( textLabelListPicker , false , 12 ) ;
      textLabelListPicker . setTextCode ( TextsDemo ( getTexts ( ) ) . LIST_PICKERS ) ;
      listPickerEnabled = new ListPicker ( application ) ;
      widgetPickers . addToContent ( listPickerEnabled , true , 13 ) ;
      listPickerEnabled . setNumOfElements ( listMaxElements ) ;
      listPickerEnabled . setArrays ( [ TextsDemo ( getTexts ( ) ) . ELEMENT0 , TextsDemo ( getTexts ( ) ) . ELEMENT1 , TextsDemo ( getTexts ( ) ) . ELEMENT2 , TextsDemo ( getTexts ( ) ) . ELEMENT3 , TextsDemo ( getTexts ( ) ) . ELEMENT4 , TextsDemo ( getTexts ( ) ) . ELEMENT5 , TextsDemo ( getTexts ( ) ) . ELEMENT6 , TextsDemo ( getTexts ( ) ) . ELEMENT7 , TextsDemo ( getTexts ( ) ) . ELEMENT8 , TextsDemo ( getTexts ( ) ) . ELEMENT9 , TextsDemo ( getTexts ( ) ) . ELEMENT10 , TextsDemo ( getTexts ( ) ) . ELEMENT11 , TextsDemo ( getTexts ( ) ) . ELEMENT12 , TextsDemo ( getTexts ( ) ) . ELEMENT13 , TextsDemo ( getTexts ( ) ) . ELEMENT14 , TextsDemo ( getTexts ( ) ) . ELEMENT15 , TextsDemo ( getTexts ( ) ) . ELEMENT16 , TextsDemo ( getTexts ( ) ) . ELEMENT17 , TextsDemo ( getTexts ( ) ) . ELEMENT18 , TextsDemo ( getTexts ( ) ) . ELEMENT19 ] , [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 ] ) ;
      listPickerEnabled . setSelectedIndex ( 2 ) ;
      listPickerDisabled = new ListPicker ( application ) ;
      widgetPickers . addToContent ( listPickerDisabled , true , 14 ) ;
      listPickerDisabled . setNumOfElements ( listMaxElements ) ;
      listPickerDisabled . setArrays ( [ TextsDemo ( getTexts ( ) ) . ELEMENT0 , TextsDemo ( getTexts ( ) ) . ELEMENT1 , TextsDemo ( getTexts ( ) ) . ELEMENT2 , TextsDemo ( getTexts ( ) ) . ELEMENT3 , TextsDemo ( getTexts ( ) ) . ELEMENT4 , TextsDemo ( getTexts ( ) ) . ELEMENT5 , TextsDemo ( getTexts ( ) ) . ELEMENT6 , TextsDemo ( getTexts ( ) ) . ELEMENT7 , TextsDemo ( getTexts ( ) ) . ELEMENT8 , TextsDemo ( getTexts ( ) ) . ELEMENT9 , TextsDemo ( getTexts ( ) ) . ELEMENT10 , TextsDemo ( getTexts ( ) ) . ELEMENT11 , TextsDemo ( getTexts ( ) ) . ELEMENT12 , TextsDemo ( getTexts ( ) ) . ELEMENT13 , TextsDemo ( getTexts ( ) ) . ELEMENT14 , TextsDemo ( getTexts ( ) ) . ELEMENT15 , TextsDemo ( getTexts ( ) ) . ELEMENT16 , TextsDemo ( getTexts ( ) ) . ELEMENT17 , TextsDemo ( getTexts ( ) ) . ELEMENT18 , TextsDemo ( getTexts ( ) ) . ELEMENT19 ] , [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 ] ) ;
      listPickerDisabled . setSelectedIndex ( 3 ) ;
      listPickerDisabled . setEnabled ( false ) ;
      widgetPickers . getContentBaseEventDispatcher ( ) . addEventListener ( EVENT_SIZES_CHANGED , widgetPickersContentResized ) ;
      widgetPickers . setswh ( widgetPickerssw , widgetPickerssh ) ;
// For other elements that have specific values.
      widgetOthers = new Widget ( application ) ;
      addWidget ( widgetOthers ) ;
      widgetOthers . setWidgetType ( getTexts ( ) . WIDGET_TYPE_GENERAL ) ;
      widgetOthers . setWidgetHeaderCode ( TextsDemo ( getTexts ( ) ) . WIDGET_HEADER_DEMO_OTHERS ) ;
      widgetOthers . setFollowStageWidth ( true ) ;
      widgetOthers . setFollowStageHeight ( false ) ;
      widgetOthers . setElementsFix ( 2 ) ;
      checkboxEnabled = new Checkbox ( application ) ;
      widgetOthers . addToContent ( checkboxEnabled , true , 2 ) ;
      checkboxEnabled . setTextCodes ( TextsDemo ( getTexts ( ) ) . CHECKBOX_CHECKED , TextsDemo ( getTexts ( ) ) . CHECKBOX_UNCHECKED ) ;
      checkboxEnabled . setChecked ( false ) ;
      checkboxDisabled = new Checkbox ( application ) ;
      widgetOthers . addToContent ( checkboxDisabled , true , 5 ) ;
      checkboxDisabled . setTextCodes ( TextsDemo ( getTexts ( ) ) . CHECKBOX_CHECKED , TextsDemo ( getTexts ( ) ) . CHECKBOX_UNCHECKED ) ;
      checkboxDisabled . setChecked ( true ) ;
      checkboxDisabled . setEnabled ( false ) ;
      potmetEnabled = new Potmet ( application ) ;
      widgetOthers . addToContent ( potmetEnabled , true , 6 ) ;
      potmetEnabled . setMinMaxIncValues ( 30 , 100 , 2 ) ;
      potmetEnabled . setCurValue ( 42 ) ;
      potmetDisabled = new Potmet ( application ) ;
      widgetOthers . addToContent ( potmetDisabled , true , 7 ) ;
      potmetDisabled . setMinMaxIncValues ( 30 , 100 , 2 ) ;
      potmetDisabled . setCurValue ( 42 ) ;
      potmetDisabled . setEnabled ( false ) ;
      textLabelPotmet = new TextLabel ( application ) ;
      widgetOthers . addToContent ( textLabelPotmet , false , 8 ) ;
      textLabelPotmet . setTextCode ( TextsDemo ( getTexts ( ) ) . POTMETS ) ;
      textLabelXmlLister = new TextLabel ( application ) ;
      widgetOthers . addToContent ( textLabelXmlLister , false , 9 ) ;
      textLabelXmlLister . setTextCode ( TextsDemo ( getTexts ( ) ) . XMLLISTER ) ;
      xmlLister = new XmlLister ( application ) ;
      widgetOthers . addToContent ( xmlLister , true , 11 ) ;
      xmlLister . setNumOfElements ( listMaxElements ) ;
      xmlLister . setXmlAsString ( menuxml ) ;
      widgetOthers . getContentBaseEventDispatcher ( ) . addEventListener ( EVENT_SIZES_CHANGED , widgetOthersContentResized ) ;
      widgetOthers . setswh ( widgetOtherssw , widgetOtherssh ) ;
    }
/*
** The functions used to operate this demo object.
*/
    private function widgetComponentUsageContentResized ( e : Event ) : void
    {
      if ( textBoxComponentUsage != null && widgetComponentUsage != null )
      {
        textBoxComponentUsage . setswh ( widgetComponentUsage . getContentsw ( ) , widgetComponentUsage . getContentsh ( ) ) ;
      }
    }
    private function widgetSingleLineTextsContentResized ( e : Event ) : void
    {
      if ( textInputEnabled != null )
      {
        textInputEnabled . setsw ( widgetSingleLineTexts . getContentsw ( ) / 2 ) ;
      }
      if ( textInputDisabled != null )
      {
        textInputDisabled . setsw ( widgetSingleLineTexts . getContentsw ( ) / 3 ) ;
      }
      if ( textInputPassword != null )
      {
        textInputPassword . setsw ( textInputEnabled . getsw ( ) / 2 ) ;
      }
    }
    private function widgetMultipleLineTextsContentResized ( e : Event ) : void
    {
      if ( textBox != null )
      {
        textBox . setswh ( widgetMultipleLineTexts . getContentsw ( ) / 2 , widgetMultipleLineTexts . getContentsh ( ) / 3 ) ;
      }
      if ( textAreaEnabled != null )
      {
        textAreaEnabled . setswh ( widgetMultipleLineTexts . getContentsw ( ) / 2 , widgetMultipleLineTexts . getContentsh ( ) / 3 ) ;
      }
      if ( textAreaDisabled != null )
      {
        textAreaDisabled . setswh ( widgetMultipleLineTexts . getContentsw ( ) / 2 , widgetMultipleLineTexts . getContentsh ( ) / 3 ) ;
      }
    }
    private function widgetPickersContentResized ( e : Event ) : void
    {
      if ( listEnabled != null )
      {
        listEnabled . setsw ( widgetPickers . getContentsw ( ) / 4 ) ;
      }
      if ( listDisabled != null )
      {
        listDisabled . setsw ( widgetPickers . getContentsw ( ) / 3 ) ;
      }
      if ( listPickerEnabled != null )
      {
        listPickerEnabled . setsw ( widgetPickers . getContentsw ( ) / 3 ) ;
      }
      if ( listPickerDisabled != null )
      {
        listPickerDisabled . setsw ( widgetPickers . getContentsw ( ) / 4 ) ;
      }
    }
    private function widgetOthersContentResized ( e : Event ) : void
    {
      if ( xmlLister != null )
      {
        xmlLister . setsw ( widgetPickers . getContentsw ( ) / 3 ) ;
      }
    }
    private function buttonBarEnabledChanged ( e : Event ) : void
    {
      if ( buttonBarEnabled . getActiveIndex ( ) != - 1 )
      {
        var messageString : String = TextsDemo ( getTexts ( ) ) . CLICKED_LINK + buttonBarEnabled . getActiveTextCode ( ) ;
        var alertOkButtonBar : Function = function ( e : Event ) : void
        {
          getBaseEventDispatcher ( ) . removeEventListener ( e . type , alertOkButtonBar ) ;
          getForeground ( ) . closeAlert ( e . type . substr ( 0 , e . type . length - getTexts ( ) . OC_OK . length ) ) ;
          buttonBarEnabled . setActiveIndex ( - 1 ) ;
          e . stopImmediatePropagation ( ) ;
        }
        getBaseEventDispatcher ( ) . addEventListener ( messageString + getTexts ( ) . OC_OK , alertOkButtonBar ) ;
        getForeground ( ) . createAlert ( messageString , true , false ) ;
      }
    }
    private function buttonDrawEnabledClick ( e : Event ) : void
    {
      getMiddleground ( ) . openPanelSettings ( ) ;
      buttonDrawEnabled . setEnabled ( true ) ;
    }
    private function buttonLinkEnabledClick ( e : Event ) : void
    {
      widgetButtons . setHidden ( true ) ;
    }
    private function buttonTextEnabledClick ( e : Event ) : void
    {
      buttonTextDisabled . setEnabled ( true ) ;
    }
    private function buttonTextDisabledClick ( e : Event ) : void
    {
      buttonTextEnabled . setEnabled ( true ) ;
    }
    private function listEnabledChanged ( e : Event ) : void
    {
      var messageString : String = TextsDemo ( getTexts ( ) ) . SELECTED_INDEXES + listEnabled . getSelectedIndexes ( ) ;
      var alertOkListEnabled : Function = function ( e : Event ) : void
      {
        getBaseEventDispatcher ( ) . removeEventListener ( e . type , alertOkListEnabled ) ;
        getForeground ( ) . closeAlert ( e . type . substr ( 0 , e . type . length - getTexts ( ) . OC_OK . length ) ) ;
        e . stopImmediatePropagation ( ) ;
      }
      getBaseEventDispatcher ( ) . addEventListener ( messageString + getTexts ( ) . OC_OK , alertOkListEnabled ) ;
      getForeground ( ) . createAlert ( messageString , true , false ) ;
    }
/*
** This is just for fun and demonstrate the usage of the custom event handlers on the custom context menu items.
*/
    private function customContextMenuItemClickHandler ( e : ContextMenuEvent ) : void
    {
// Basically, we are gonna create an alert to display the text of the menu item instead of opening a browser.
      var messageString : String = e . currentTarget . caption + TextsDemo ( getTexts ( ) ) . HAS_BEEN_CLICKED ;
      var alertOkCustomContextMenu : Function = function ( e : Event ) : void
      {
        getBaseEventDispatcher ( ) . removeEventListener ( e . type , alertOkCustomContextMenu ) ;
        getForeground ( ) . closeAlert ( e . type . substr ( 0 , e . type . length - getTexts ( ) . OC_OK . length ) ) ;
        e . stopImmediatePropagation ( ) ;
      }
      getBaseEventDispatcher ( ) . addEventListener ( messageString + getTexts ( ) . OC_OK , alertOkCustomContextMenu ) ;
      getForeground ( ) . createAlert ( messageString , true , true ) ;
    }
/*
** Destroying this application.
*/
    override public function destroy ( ) : void
    {
// 1: unregister every event listeners added to different than local_var . getBaseEventDispatcher ( )
// 2: stopimmediatepropagation, bitmapdata dispose, array splice ( 0 ), etc.
// 3: calling the super destroy.
      super . destroy ( ) ;
// 4: every reference and value should be resetted to null, 0 or false.
      widgetComponentUsage = null ;
      widgetComponentUsagesw = 0 ;
      widgetComponentUsagesh = 0 ;
      textBoxComponentUsage = null ;
      widgetSingleLineTexts = null ;
      widgetSingleLineTextssw = 0 ;
      widgetSingleLineTextssh = 0 ;
      textLabelBright = null ;
      textLabelMid = null ;
      textLabelDark = null ;
      textLabelDark2 = null ;
      textInputEnabled = null ;
      textInputDisabled = null ;
      textInputPassword = null ;
      widgetMultipleLineTexts = null ;
      widgetMultipleLineTextssw = 0 ;
      widgetMultipleLineTextssh = 0 ;
      textLabelTextBox = null ;
      textBox = null ;
      textLabelTextAreaEnabled = null ;
      textAreaEnabled = null ;
      textLabelTextAreaDisabled = null ;
      textAreaDisabled = null ;
      widgetButtons = null ;
      widgetButtonssw = 0 ;
      widgetButtonssh = 0 ;
      textLabelButtonBar = null ;
      buttonBarEnabled = null ;
      buttonBarEnabledw = 0 ;
      buttonBarDisabled = null ;
      buttonBarDisabledw = 0 ;
      textLabelButtonDraw = null ;
      buttonDrawEnabled = null ;
      buttonDrawDisabled = null ;
      textLabelButtonLink = null ;
      buttonLinkEnabled = null ;
      buttonLinkDisabled = null ;
      textLabelButtonText = null ;
      buttonTextEnabled = null ;
      buttonTextDisabled = null ;
      widgetPickers = null ;
      widgetPickerssw = 0 ;
      widgetPickerssh = 0 ;
      textLabelColor = null ;
      colorEnabled = null ;
      colorDisabled = null ;
      textLabelColorPicker = null ;
      colorPickerEnabled = null ;
      colorPickerDisabled = null ;
      textLabelList = null ;
      listEnabled = null ;
      listDisabled = null ;
      textLabelListPicker = null ;
      listPickerEnabled = null ;
      listPickerDisabled = null ;
      listMaxElements = 0 ;
      widgetOthers = null ;
      widgetOtherssw = 0 ;
      widgetOtherssh = 0 ;
      checkboxEnabled = null ;
      checkboxDisabled = null ;
      potmetEnabled = null ;
      potmetDisabled = null ;
      textLabelPotmet = null ;
      textLabelXmlLister = null ;
      xmlLister = null ;
    }
  }
}