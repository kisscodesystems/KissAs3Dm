package com . kisscodesystems . KissAs3Dm . app
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  import flash . events . Event ;
  import flash . system . System ;
  public class WidgetManagerDemo
  {
    protected var application : Application = null ;
    public function WidgetManagerDemo ( applicationRef : Application ) : void
    {
      super ( ) ;
      if ( applicationRef != null )
      {
        application = applicationRef ;
      }
      else
      {
        System . exit ( 1 ) ;
      }
    }
    public function openComponentUsageWidget ( ) : void
    {
      var targetWidget : Widget = application . getMiddleground ( ) . getWidgets ( ) . getWidgetByHeader ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_COMPONENT_USAGE ) ;
      if ( targetWidget == null )
      {
        targetWidget = new ComponentUsageWidget ( application ) ;
        application . addWidget ( application . getMiddleground ( ) . getActiveWidgetContainer ( ) , targetWidget ) ;
      }
      application . getMiddleground ( ) . getWidgets ( ) . goToTheWidget ( targetWidget ) ;
    }
    public function openCameraWidget ( ) : void
    {
      var targetWidget : Widget = application . getMiddleground ( ) . getWidgets ( ) . getWidgetByHeader ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_CAMERA ) ;
      if ( targetWidget == null )
      {
        targetWidget = new CameraWidget ( application ) ;
        application . addWidget ( application . getMiddleground ( ) . getActiveWidgetContainer ( ) , targetWidget ) ;
      }
      application . getMiddleground ( ) . getWidgets ( ) . goToTheWidget ( targetWidget ) ;
    }
    public function openSingleLineTextsWidget ( ) : void
    {
      var targetWidget : Widget = application . getMiddleground ( ) . getWidgets ( ) . getWidgetByHeader ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_SINGLE_LINE_TEXTS ) ;
      if ( targetWidget == null )
      {
        targetWidget = new SingleLineTextsWidget ( application ) ;
        application . addWidget ( application . getMiddleground ( ) . getActiveWidgetContainer ( ) , targetWidget ) ;
      }
      application . getMiddleground ( ) . getWidgets ( ) . goToTheWidget ( targetWidget ) ;
    }
    public function openMultiLineTextsWidget ( ) : void
    {
      var targetWidget : Widget = application . getMiddleground ( ) . getWidgets ( ) . getWidgetByHeader ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_MULTI_LINE_TEXTS ) ;
      if ( targetWidget == null )
      {
        targetWidget = new MultiLineTextsWidget ( application ) ;
        application . addWidget ( application . getMiddleground ( ) . getActiveWidgetContainer ( ) , targetWidget ) ;
      }
      application . getMiddleground ( ) . getWidgets ( ) . goToTheWidget ( targetWidget ) ;
    }
    public function openButtonsWidget ( ) : void
    {
      var targetWidget : Widget = application . getMiddleground ( ) . getWidgets ( ) . getWidgetByHeader ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_BUTTONS ) ;
      if ( targetWidget == null )
      {
        targetWidget = new ButtonsWidget ( application ) ;
        application . addWidget ( application . getMiddleground ( ) . getActiveWidgetContainer ( ) , targetWidget ) ;
      }
      application . getMiddleground ( ) . getWidgets ( ) . goToTheWidget ( targetWidget ) ;
    }
    public function openPickersWidget ( ) : void
    {
      var targetWidget : Widget = application . getMiddleground ( ) . getWidgets ( ) . getWidgetByHeader ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_PICKERS ) ;
      if ( targetWidget == null )
      {
        targetWidget = new PickersWidget ( application ) ;
        application . addWidget ( application . getMiddleground ( ) . getActiveWidgetContainer ( ) , targetWidget ) ;
      }
      application . getMiddleground ( ) . getWidgets ( ) . goToTheWidget ( targetWidget ) ;
    }
    public function openBoardWidget ( ) : void
    {
      var targetWidget : Widget = application . getMiddleground ( ) . getWidgets ( ) . getWidgetByHeader ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_BOARD ) ;
      if ( targetWidget == null )
      {
        targetWidget = new BoardWidget ( application ) ;
        application . addWidget ( application . getMiddleground ( ) . getActiveWidgetContainer ( ) , targetWidget ) ;
      }
      application . getMiddleground ( ) . getWidgets ( ) . goToTheWidget ( targetWidget ) ;
    }
    public function openOthersWidget ( ) : void
    {
      var targetWidget : Widget = application . getMiddleground ( ) . getWidgets ( ) . getWidgetByHeader ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_OTHERS ) ;
      if ( targetWidget == null )
      {
        targetWidget = new OthersWidget ( application ) ;
        application . addWidget ( application . getMiddleground ( ) . getActiveWidgetContainer ( ) , targetWidget ) ;
      }
      application . getMiddleground ( ) . getWidgets ( ) . goToTheWidget ( targetWidget ) ;
    }
    public function handleMenuSelect ( selectedItem : String ) : void
    {
      if ( selectedItem == TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_COMPONENT_USAGE )
      {
        openComponentUsageWidget ( ) ;
      }
      else if ( selectedItem == TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_CAMERA )
      {
        openCameraWidget ( ) ;
      }
      else if ( selectedItem == TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_SINGLE_LINE_TEXTS )
      {
        openSingleLineTextsWidget ( ) ;
      }
      else if ( selectedItem == TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_MULTI_LINE_TEXTS )
      {
        openMultiLineTextsWidget ( ) ;
      }
      else if ( selectedItem == TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_BUTTONS )
      {
        openButtonsWidget ( ) ;
      }
      else if ( selectedItem == TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_PICKERS )
      {
        openPickersWidget ( ) ;
      }
      else if ( selectedItem == TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_BOARD )
      {
        openBoardWidget ( ) ;
      }
      else if ( selectedItem == TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_OTHERS )
      {
        openOthersWidget ( ) ;
      }
      application . getMiddleground ( ) . closePanelMenu ( ) ;
    }
  }
}
