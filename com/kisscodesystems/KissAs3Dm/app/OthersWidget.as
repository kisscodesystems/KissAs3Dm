package com . kisscodesystems . KissAs3Dm . app
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . Potmeter ;
  import com . kisscodesystems . KissAs3Fw . ui . Rater ;
  import com . kisscodesystems . KissAs3Fw . ui . SoundPlayer ;
  import com . kisscodesystems . KissAs3Fw . ui . Switcher ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  public class OthersWidget extends Widget
  {
    private var switcherEnabled : Switcher = null ;
    private var switcherDisabled : Switcher = null ;
    private var potmeterEnabled : Potmeter = null ;
    private var potmeterDisabled : Potmeter = null ;
    private var rater : Rater = null ;
    private var soundPlayer : SoundPlayer = null ;
    private var indexBasic : int = - 1 ;
    private var listMaxElements : int = 5 ;
    public function OthersWidget ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      iniSizeWidth = 480 ;
      iniSizeHeight = 340 ;
    }
    override protected function onCreate ( ) : void
    {
      if ( ! loaded )
      {
        loaded = true ;
        setWidgetType ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_OTHERS ) ;
        setWidgetHeaderCode ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_OTHERS ) ;
        setButtonBarVisible ( false ) ;
        indexBasic = addContent ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TAB_BASIC ) ;
        setElementsFix ( indexBasic , 1 ) ;
        setActiveContent ( indexBasic ) ;
        setInfoContent ( TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_OTHERS ) ;
        switcherEnabled = new Switcher ( application ) ;
        addToContent ( indexBasic , switcherEnabled , true , 0 ) ;
        switcherEnabled . setTextCodes ( TextsDemo ( application . getTexts ( ) ) . SWITCHER_UP , TextsDemo ( application . getTexts ( ) ) . SWITCHER_DOWN ) ;
        switcherEnabled . setUp ( false ) ;
        switcherDisabled = new Switcher ( application ) ;
        addToContent ( indexBasic , switcherDisabled , true , 1 ) ;
        switcherDisabled . setTextCodes ( TextsDemo ( application . getTexts ( ) ) . SWITCHER_UP , TextsDemo ( application . getTexts ( ) ) . SWITCHER_DOWN ) ;
        switcherDisabled . setUp ( true ) ;
        switcherDisabled . setEnabled ( false ) ;
        potmeterEnabled = new Potmeter ( application ) ;
        addToContent ( indexBasic , potmeterEnabled , true , 2 ) ;
        potmeterEnabled . setMinMaxIncValues ( 30 , 100 , 2 ) ;
        potmeterEnabled . setCurValue ( 42 ) ;
        potmeterDisabled = new Potmeter ( application ) ;
        addToContent ( indexBasic , potmeterDisabled , true , 2 ) ;
        potmeterDisabled . setMinMaxIncValues ( 30 , 100 , 2 ) ;
        potmeterDisabled . setCurValue ( 42 ) ;
        potmeterDisabled . setEnabled ( false ) ;
        rater = new Rater ( application ) ;
        addToContent ( indexBasic , rater , true , 3 ) ;
        rater . setRate ( 3.5 ) ;
        rater . setReadonly ( false ) ;
        soundPlayer = new SoundPlayer ( application ) ;
        addToContent ( indexBasic , soundPlayer , true , 4 ) ;
        soundPlayer . setSoundTypeAndName ( "sample" , "Sample melody" ) ;
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
      if ( application . getPropsDyn ( ) . weAreInDesktopMode ( ) )
      {
        if ( soundPlayer != null )
        {
          soundPlayer . setsw ( getContentsw ( ) / 2 ) ;
        }
      }
      else
      {
        if ( soundPlayer != null )
        {
          soundPlayer . setsw ( getContentsw ( ) - 2 * application . getPropsDyn ( ) . getAppMargin ( ) ) ;
        }
      }
    }
    override public function destroy ( ) : void
    {
      super . destroy ( ) ;
      switcherEnabled = null ;
      switcherDisabled = null ;
      potmeterEnabled = null ;
      potmeterDisabled = null ;
    }
  }
}
