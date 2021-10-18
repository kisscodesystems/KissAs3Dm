package com . kisscodesystems . KissAs3Dm . app
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . TextArea ;
  import com . kisscodesystems . KissAs3Fw . ui . TextBox ;
  import com . kisscodesystems . KissAs3Fw . ui . TextLabel ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  import flash . events . Event ;
  public class MultiLineTextsWidget extends Widget
  {
    private var textLabelTextBox : TextLabel = null ;
    private var textBox : TextBox = null ;
    private var textLabelTextAreaEnabled : TextLabel = null ;
    private var textAreaEnabled : TextArea = null ;
    private var textLabelTextAreaDisabled : TextLabel = null ;
    private var textAreaDisabled : TextArea = null ;
    private var indexBasic : int = - 1 ;
    public function MultiLineTextsWidget ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      iniSizeWidth = 650 ;
      iniSizeHeight = 600 ;
    }
    override protected function onCreate ( ) : void
    {
      if ( ! loaded )
      {
        loaded = true ;
        setWidgetType ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_MULTI_LINE_TEXTS ) ;
        setWidgetHeaderCode ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_MULTI_LINE_TEXTS ) ;
        setButtonBarVisible ( false ) ;
        indexBasic = addContent ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TAB_BASIC ) ;
        setElementsFix ( indexBasic , 1 ) ;
        setActiveContent ( indexBasic ) ;
        setInfoContent ( TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_MULTI_LINE_TEXTS ) ;
        textLabelTextBox = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelTextBox , false , 0 ) ;
        textLabelTextBox . setTextCode ( TextsDemo ( application . getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_BOX ) ;
        textBox = new TextBox ( application ) ;
        addToContent ( indexBasic , textBox , true , 1 ) ;
        textBox . setTextCode ( TextsDemo ( application . getTexts ( ) ) . TEXT_BOX ) ;
        textLabelTextAreaEnabled = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelTextAreaEnabled , false , 2 ) ;
        textLabelTextAreaEnabled . setTextCode ( TextsDemo ( application . getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_AREA_ENABLED ) ;
        textAreaEnabled = new TextArea ( application ) ;
        addToContent ( indexBasic , textAreaEnabled , true , 3 ) ;
        textAreaEnabled . setTextCode ( TextsDemo ( application . getTexts ( ) ) . TEXT_AREA_ENABLED ) ;
        textLabelTextAreaDisabled = new TextLabel ( application ) ;
        addToContent ( indexBasic , textLabelTextAreaDisabled , false , 4 ) ;
        textLabelTextAreaDisabled . setTextCode ( TextsDemo ( application . getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_AREA_DISABLED ) ;
        textAreaDisabled = new TextArea ( application ) ;
        addToContent ( indexBasic , textAreaDisabled , true , 5 ) ;
        textAreaDisabled . setTextCode ( TextsDemo ( application . getTexts ( ) ) . TEXT_AREA_DISABLED ) ;
        textAreaDisabled . setEnabled ( false ) ;
        application . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_MARGIN_CHANGED , marginChanged ) ;
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
    private function marginChanged ( e : Event ) : void
    {
      doSizeChanged ( ) ;
    }
    override protected function doSizeChanged ( ) : void
    {
      super . doSizeChanged ( ) ;
      if ( application . getPropsDyn ( ) . weAreInDesktopMode ( ) )
      {
        var maxw : int = 0 ;
        if ( textLabelTextBox != null && textLabelTextBox . getsw ( ) > maxw )
        {
          maxw = textLabelTextBox . getsw ( ) ;
        }
        if ( textLabelTextAreaEnabled != null && textLabelTextAreaEnabled . getsw ( ) > maxw )
        {
          maxw = textLabelTextAreaEnabled . getsw ( ) ;
        }
        if ( textLabelTextAreaDisabled != null && textLabelTextAreaDisabled . getsw ( ) > maxw )
        {
          maxw = textLabelTextAreaDisabled . getsw ( ) ;
        }
        maxw = getContentsw ( ) - maxw - 3 * application . getPropsDyn ( ) . getAppMargin ( ) ;
        var maxh : int = ( getContentsh ( ) - 4 * application . getPropsDyn ( ) . getAppMargin ( ) ) / 3 ;
        if ( textBox != null )
        {
          textBox . setswh ( maxw , maxh ) ;
        }
        if ( textAreaEnabled != null )
        {
          textAreaEnabled . setswh ( maxw , maxh ) ;
        }
        if ( textAreaDisabled != null )
        {
          textAreaDisabled . setswh ( maxw , maxh ) ;
        }
      }
      else
      {
        if ( textBox != null )
        {
          textBox . setswh ( getContentsw ( ) - 2 * application . getPropsDyn ( ) . getAppMargin ( ) , getContentsh ( ) / 4 ) ;
        }
        if ( textAreaEnabled != null )
        {
          textAreaEnabled . setswh ( getContentsw ( ) - 2 * application . getPropsDyn ( ) . getAppMargin ( ) , getContentsh ( ) / 4 ) ;
        }
        if ( textAreaDisabled != null )
        {
          textAreaDisabled . setswh ( getContentsw ( ) - 2 * application . getPropsDyn ( ) . getAppMargin ( ) , getContentsh ( ) / 4 ) ;
        }
      }
    }
    override public function destroy ( ) : void
    {
      application . getBaseEventDispatcher ( ) . removeEventListener ( application . EVENT_MARGIN_CHANGED , marginChanged ) ;
      super . destroy ( ) ;
      textLabelTextBox = null ;
      textBox = null ;
      textLabelTextAreaEnabled = null ;
      textAreaEnabled = null ;
      textLabelTextAreaDisabled = null ;
      textAreaDisabled = null ;
    }
  }
}
