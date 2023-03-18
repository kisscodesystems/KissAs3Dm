package com . kisscodesystems . KissAs3Dm . app
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . ButtonBar ;
  import com . kisscodesystems . KissAs3Fw . ui . ButtonFile ;
  import com . kisscodesystems . KissAs3Fw . ui . ButtonLink ;
  import com . kisscodesystems . KissAs3Fw . ui . ButtonText ;
  import com . kisscodesystems . KissAs3Fw . ui . TextLabel ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  import flash . events . Event ;
  public class ButtonsWidget extends Widget
  {
    private var textLabelButtonBar : TextLabel = null ;
    private var buttonBarEnabled : ButtonBar = null ;
    private var buttonBarEnabledw : int = 500 ;
    private var buttonBarDisabled : ButtonBar = null ;
    private var buttonBarDisabledw : int = 400 ;
    private var textLabelButtonFile : TextLabel = null ;
    private var buttonFile : ButtonFile = null ;
    private var textLabelButtonLink : TextLabel = null ;
    private var buttonLinkEnabled : ButtonLink = null ;
    private var buttonLinkDisabled : ButtonLink = null ;
    private var textLabelButtonText : TextLabel = null ;
    private var buttonTextEnabled : ButtonText = null ;
    private var buttonTextDisabled : ButtonText = null ;
    private var indexBasic : int = - 1 ;
    public function ButtonsWidget ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      iniSizeWidth = 660 ;
      iniSizeHeight = 590 ;
    }
    override protected function onCreate ( ) : void
    {
      if ( ! loaded )
      {
        loaded = true ;
        setWidgetType ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_BUTTONS ) ;
        setWidgetHeaderCode ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_BUTTONS ) ;
        setButtonBarVisible ( false ) ;
        indexBasic = addContent ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TAB_BASIC ) ;
        setElementsFix ( indexBasic , 1 ) ;
        setActiveContent ( indexBasic ) ;
        setInfoContent ( TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_BUTTONS ) ;
        textLabelButtonBar = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelButtonBar , 0 ) ;
        textLabelButtonBar . setTextCode ( TextsDemo ( application . getTexts ( ) ) . BUTTON_BARS ) ;
        buttonBarEnabled = new ButtonBar ( application ) ;
        addToContent ( indexBasic , buttonBarEnabled , 1 ) ;
        buttonBarEnabled . setMaxWidth ( buttonBarEnabledw ) ;
        buttonBarEnabled . addButton ( application . getTexts ( ) . OC_OK ) ;
        buttonBarEnabled . addButton ( application . getTexts ( ) . OC_CANCEL ) ;
        buttonBarEnabled . addButton ( application . getTexts ( ) . YN_YES ) ;
        buttonBarEnabled . addButton ( application . getTexts ( ) . YN_NO ) ;
        buttonBarEnabled . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_CHANGED , buttonBarEnabledChanged ) ;
        buttonBarDisabled = new ButtonBar ( application ) ;
        addToContent ( indexBasic , buttonBarDisabled , 3 ) ;
        buttonBarDisabled . setMaxWidth ( buttonBarDisabledw ) ;
        buttonBarDisabled . addButton ( application . getTexts ( ) . OC_OK ) ;
        buttonBarDisabled . addButton ( application . getTexts ( ) . OC_CANCEL ) ;
        buttonBarDisabled . addButton ( application . getTexts ( ) . YN_YES ) ;
        buttonBarDisabled . addButton ( application . getTexts ( ) . YN_NO ) ;
        buttonBarDisabled . setEnabled ( false ) ;
        textLabelButtonFile = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelButtonFile , 4 ) ;
        textLabelButtonFile . setTextCode ( TextsDemo ( application . getTexts ( ) ) . BUTTON_FILE ) ;
        buttonFile = new ButtonFile ( application ) ;
        addToContent ( indexBasic , buttonFile , 5 ) ;
        buttonFile . setFileFilters ( [ buttonFile . fileFilterImgs , buttonFile . fileFilterTxts ] ) ;
        textLabelButtonLink = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelButtonLink , 6 ) ;
        textLabelButtonLink . setTextCode ( TextsDemo ( application . getTexts ( ) ) . BUTTON_LINKS ) ;
        buttonLinkEnabled = new ButtonLink ( application ) ;
        addToContent ( indexBasic , buttonLinkEnabled , 7 ) ;
        buttonLinkEnabled . setTextCode ( application . getTexts ( ) . YN_YES ) ;
        buttonLinkDisabled = new ButtonLink ( application ) ;
        addToContent ( indexBasic , buttonLinkDisabled , 7 ) ;
        buttonLinkDisabled . setTextCode ( application . getTexts ( ) . YN_NO ) ;
        buttonLinkDisabled . setEnabled ( false ) ;
        textLabelButtonText = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelButtonText , 8 ) ;
        textLabelButtonText . setTextCode ( TextsDemo ( application . getTexts ( ) ) . BUTTON_TEXTS ) ;
        buttonTextEnabled = new ButtonText ( application ) ;
        addToContent ( indexBasic , buttonTextEnabled , 9 ) ;
        buttonTextEnabled . setTextCode ( application . getTexts ( ) . OC_OK ) ;
        buttonTextEnabled . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_CLICK , buttonTextEnabledClick ) ;
        buttonTextDisabled = new ButtonText ( application ) ;
        addToContent ( indexBasic , buttonTextDisabled , 9 ) ;
        buttonTextDisabled . setTextCode ( application . getTexts ( ) . OC_CANCEL ) ;
        buttonTextDisabled . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_CLICK , buttonTextDisabledClick ) ;
        buttonTextDisabled . setEnabled ( false ) ;
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
    private function buttonBarEnabledChanged ( e : Event ) : void
    {
      if ( buttonBarEnabled . getActiveIndex ( ) != - 1 )
      {
        var uniqueString : String = "" + new Date ( ) . time ;
        var messageString : String = TextsDemo ( application . getTexts ( ) ) . CLICKED_LINK + buttonBarEnabled . getActiveTextCode ( ) ;
        var alertOkButtonBar : Function = function ( e : Event ) : void
        {
          application . getBaseEventDispatcher ( ) . removeEventListener ( e . type , alertOkButtonBar ) ;
          application . getForeground ( ) . closeAlert ( uniqueString ) ;
          buttonBarEnabled . setActiveIndex ( - 1 ) ;
          e . stopImmediatePropagation ( ) ;
        }
        application . getBaseEventDispatcher ( ) . addEventListener ( uniqueString + application . getTexts ( ) . OC_OK , alertOkButtonBar ) ;
        application . getForeground ( ) . createAlert ( messageString , uniqueString , true , false ) ;
      }
    }
    private function buttonTextEnabledClick ( e : Event ) : void
    {
      buttonTextDisabled . setEnabled ( true ) ;
    }
    private function buttonTextDisabledClick ( e : Event ) : void
    {
      buttonTextEnabled . setEnabled ( true ) ;
    }
    override public function destroy ( ) : void
    {
      super . destroy ( ) ;
      textLabelButtonBar = null ;
      buttonBarEnabled = null ;
      buttonBarEnabledw = 0 ;
      buttonBarDisabled = null ;
      buttonBarDisabledw = 0 ;
      textLabelButtonFile = null ;
      buttonFile = null ;
      textLabelButtonLink = null ;
      buttonLinkEnabled = null ;
      buttonLinkDisabled = null ;
      textLabelButtonText = null ;
      buttonTextEnabled = null ;
      buttonTextDisabled = null ;
    }
  }
}
