package com . kisscodesystems . KissAs3Dm . app
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . TextBox ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  import flash . events . Event ;
  public class ComponentUsageWidget extends Widget
  {
    private var textBoxComponentUsage : TextBox = null ;
    private var indexBasic : int = - 1 ;
    public function ComponentUsageWidget ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      iniSizeWidth = 680 ;
      iniSizeHeight = 420 ;
    }
    override protected function onCreate ( ) : void
    {
      if ( ! loaded )
      {
        loaded = true ;
        setWidgetType ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_COMPONENT_USAGE ) ;
        setWidgetHeaderCode ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_COMPONENT_USAGE ) ;
        setButtonBarVisible ( false ) ;
        indexBasic = addContent ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TAB_BASIC ) ;
        setElementsFix ( indexBasic , 1 ) ;
        setActiveContent ( indexBasic ) ;
        setInfoContent ( TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_COMPONENT_USAGE ) ;
        textBoxComponentUsage = new TextBox ( application ) ;
        addToContent ( indexBasic , textBoxComponentUsage , 0 ) ;
        textBoxComponentUsage . setHtml ( true ) ;
        textBoxComponentUsage . setWordWrap ( true ) ;
        textBoxComponentUsage . setTextCode ( TextsDemo ( application . getTexts ( ) ) . COMPONENTS_USAGE ) ;
        application . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_MARGIN_CHANGED , marginChanged ) ;
      }
      doSizeChanged ( ) ;
    }
    private function marginChanged ( e : Event ) : void
    {
      doSizeChanged ( ) ;
    }
    override protected function doSizeChanged ( ) : void
    {
      super . doSizeChanged ( ) ;
      if ( textBoxComponentUsage != null && application != null )
      {
        textBoxComponentUsage . setswh ( getContentsw ( ) - 2 * application . getPropsDyn ( ) . getAppMargin ( ) , getContentsh ( ) - 2 * application . getPropsDyn ( ) . getAppMargin ( ) ) ;
      }
    }
    override public function setDesktopSizes ( ) : void
    {
      super . setDesktopSizes ( ) ;
      if ( widgetMode != application . getTexts ( ) . WIDGET_MODE_DESKTOP )
      {
        setElementsFix ( indexBasic , 0 ) ;
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
    override public function destroy ( ) : void
    {
      application . getBaseEventDispatcher ( ) . removeEventListener ( application . EVENT_MARGIN_CHANGED , marginChanged ) ;
      super . destroy ( ) ;
      textBoxComponentUsage = null ;
    }
  }
}
