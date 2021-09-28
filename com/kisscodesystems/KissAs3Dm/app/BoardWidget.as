package com . kisscodesystems . KissAs3Dm . app
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . Board ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  import flash . events . Event ;
  public class BoardWidget extends Widget
  {
    private var board : Board = null ;
    public function BoardWidget ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      iniSizeWidth = 620 ;
      iniSizeHeight = 420 ;
    }
    override protected function onCreate ( ) : void
    {
      if ( ! loaded )
      {
        loaded = true ;
        setWidgetType ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_BOARD ) ;
        setWidgetHeaderCode ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_BOARD ) ;
        setButtonBarVisible ( false ) ;
        setDefaultContent ( ) ;
        setElementsFix ( 0 , 0 ) ;
        setActiveContent ( 0 ) ;
        setInfoContent ( TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_BOARD ) ;
        board = new Board ( application ) ;
        addToContent ( 0 , board , true , 0 ) ;
        application . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_MARGIN_CHANGED , marginChanged ) ;
        doSizeChanged ( ) ;
      }
    }
    override public function setDesktopSizes ( ) : void
    {
      super . setDesktopSizes ( ) ;
      if ( widgetMode != application . getTexts ( ) . WIDGET_MODE_DESKTOP )
      {
        setElementsFix ( 0 , 0 ) ;
        doSizeChanged ( ) ;
      }
    }
    override public function setMobileSizes ( ) : void
    {
      super . setMobileSizes ( ) ;
      if ( widgetMode != application . getTexts ( ) . WIDGET_MODE_MOBILE )
      {
        setElementsFix ( 0 , 0 ) ;
        doSizeChanged ( ) ;
      }
    }
    private function marginChanged ( e : Event ) : void
    {
      doSizeChanged ( ) ;
    }
    override protected function doSizeChanged ( ) : void
    {
      super . doSizeChanged ( ) ;
      if ( board != null && application != null )
      {
        board . setswh ( getContentsw ( ) - 2 * application . getPropsDyn ( ) . getAppMargin ( ) , getContentsh ( ) / 2 ) ;
      }
    }
    override public function destroy ( ) : void
    {
      application . getBaseEventDispatcher ( ) . removeEventListener ( application . EVENT_MARGIN_CHANGED , marginChanged ) ;
      super . destroy ( ) ;
      board = null ;
    }
  }
}
