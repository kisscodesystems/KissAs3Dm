package com . kisscodesystems . KissAs3Dm . app
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . TextInput ;
  import com . kisscodesystems . KissAs3Fw . ui . TextLabel ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  public class SingleLineTextsWidget extends Widget
  {
    private var textLabelBright : TextLabel = null ;
    private var textLabelMid : TextLabel = null ;
    private var textLabelDark : TextLabel = null ;
    private var textLabelDark2 : TextLabel = null ;
    private var textInputEnabled : TextInput = null ;
    private var textInputDisabled : TextInput = null ;
    private var textInputPassword : TextInput = null ;
    private var indexBasic : int = - 1 ;
    public function SingleLineTextsWidget ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      iniSizeWidth = 780 ;
      iniSizeHeight = 290 ;
    }
    override protected function onCreate ( ) : void
    {
      if ( ! loaded )
      {
        loaded = true ;
        setWidgetType ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_SINGLE_LINE_TEXTS ) ;
        setWidgetHeaderCode ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_SINGLE_LINE_TEXTS ) ;
        setButtonBarVisible ( false ) ;
        indexBasic = addContent ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TAB_BASIC ) ;
        setElementsFix ( indexBasic , 1 ) ;
        setActiveContent ( indexBasic ) ;
        setInfoContent ( TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_SINGLE_LINE_TEXTS ) ;
        textLabelBright = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelBright , false , 0 ) ;
        textLabelBright . setTextCode ( TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_BRIGHT ) ;
        textLabelBright . setTextType ( application . getTexts ( ) . TEXT_TYPE_BRIGHT ) ;
        textLabelMid = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelMid , false , 2 ) ;
        textLabelMid . setTextCode ( TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_MID_ENABLED_INPUT ) ;
        textLabelMid . setTextType ( application . getTexts ( ) . TEXT_TYPE_MID ) ;
        textInputEnabled = new TextInput ( application ) ;
        addToContent ( indexBasic , textInputEnabled , true , 3 ) ;
        textInputEnabled . setTextCode ( TextsDemo ( application . getTexts ( ) ) . ENABLED_TEXT_INPUT ) ;
        textLabelDark = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelDark , false , 4 ) ;
        textLabelDark . setTextCode ( TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_DARK_ENABLED_INPUT ) ;
        textLabelDark . setTextType ( application . getTexts ( ) . TEXT_TYPE_DARK ) ;
        textInputDisabled = new TextInput ( application ) ;
        addToContent ( indexBasic , textInputDisabled , true , 5 ) ;
        textInputDisabled . setTextCode ( TextsDemo ( application . getTexts ( ) ) . DISABLED_TEXT_INPUT ) ;
        textInputDisabled . setEnabled ( false ) ;
        textLabelDark2 = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelDark2 , false , 6 ) ;
        textLabelDark2 . setTextCode ( TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_DARK_PASSWORD_INPUT ) ;
        textLabelDark2 . setTextType ( application . getTexts ( ) . TEXT_TYPE_DARK ) ;
        textInputPassword = new TextInput ( application ) ;
        addToContent ( indexBasic , textInputPassword , true , 7 ) ;
        textInputPassword . setTextCode ( "Password" ) ;
        textInputPassword . setDisplayAsPassword ( true ) ;
        doSizeChanged ( ) ;
      }
    }
    override public function setDesktopSizes ( ) : void
    {
      super . setDesktopSizes ( ) ;
      if ( widgetMode != application . getTexts ( ) . WIDGET_MODE_DESKTOP )
      {
        setElementsFix ( indexBasic , 1 ) ;
        doSizeChanged ( ) ;
      }
    }
    override public function setMobileSizes ( ) : void
    {
      super . setMobileSizes ( ) ;
      if ( widgetMode != application . getTexts ( ) . WIDGET_MODE_MOBILE )
      {
        setElementsFix ( indexBasic , 0 ) ;
        doSizeChanged ( ) ;
      }
    }
    override protected function doSizeChanged ( ) : void
    {
      super . doSizeChanged ( ) ;
      if ( textInputEnabled != null )
      {
        textInputEnabled . setsw ( getContentsw ( ) / 2 ) ;
      }
      if ( textInputDisabled != null )
      {
        textInputDisabled . setsw ( getContentsw ( ) / 3 ) ;
      }
      if ( textInputPassword != null )
      {
        textInputPassword . setsw ( textInputEnabled . getsw ( ) / 2 ) ;
      }
    }
    override public function destroy ( ) : void
    {
      super . destroy ( ) ;
      textLabelBright = null ;
      textLabelMid = null ;
      textLabelDark = null ;
      textLabelDark2 = null ;
      textInputEnabled = null ;
      textInputDisabled = null ;
      textInputPassword = null ;
    }
  }
}
