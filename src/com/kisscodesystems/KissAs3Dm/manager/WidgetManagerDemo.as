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
 * WidgetManagerDemo.
 * The widget manager of the KissAs3Dm application: it opens the widget of the menu
 * item that has been picked, one widget of every component of the framework.
 *
 * MAIN FEATURES:
 * - it holds the class of every widget of this application by the header of it, and
 *   the items of the menu carry exactly those headers as their values
 * - so a picked menu item needs no branching at all: the widget of it is built of
 *   the class standing by that header
 * - a widget is built only once: a menu item of an open widget only steps onto it
 */
package com.kisscodesystems.KissAs3Dm.manager
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Dm.widget.ApplicationWidget;
  import com.kisscodesystems.KissAs3Dm.widget.BoardWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ButtonBarWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ButtonLinkWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ButtonTextWidget;
  import com.kisscodesystems.KissAs3Dm.widget.CameraWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ColorPanelWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ColorPickerWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ContentMultipleWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ContentSingleWidget;
  import com.kisscodesystems.KissAs3Dm.widget.DatePanelWidget;
  import com.kisscodesystems.KissAs3Dm.widget.DatePickerWidget;
  import com.kisscodesystems.KissAs3Dm.widget.IconWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ImageWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ListPanelWidget;
  import com.kisscodesystems.KissAs3Dm.widget.ListPickerWidget;
  import com.kisscodesystems.KissAs3Dm.widget.MoreWidget;
  import com.kisscodesystems.KissAs3Dm.widget.NetConnectionWidget;
  import com.kisscodesystems.KissAs3Dm.widget.PotmeterWidget;
  import com.kisscodesystems.KissAs3Dm.widget.RaterWidget;
  import com.kisscodesystems.KissAs3Dm.widget.SoundPlayerWidget;
  import com.kisscodesystems.KissAs3Dm.widget.SwitcherWidget;
  import com.kisscodesystems.KissAs3Dm.widget.TextAreaWidget;
  import com.kisscodesystems.KissAs3Dm.widget.TextBoxWidget;
  import com.kisscodesystems.KissAs3Dm.widget.TextInputWidget;
  import com.kisscodesystems.KissAs3Dm.widget.TextLabelWidget;
  import com.kisscodesystems.KissAs3Dm.widget.UrlRequestWidget;
  import com.kisscodesystems.KissAs3Dm.widget.VideoPlayerWidget;
  import com.kisscodesystems.KissAs3Dm.widget.WatchWidget;
  import com.kisscodesystems.KissAs3Dm.widget.WelcomeWidget;
  import com.kisscodesystems.KissAs3Dm.widget.WidgetWidget;
  import com.kisscodesystems.KissAs3Dm.widget.XmlListerWidget;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.manager.WidgetManager;
  import com.kisscodesystems.KissAs3Fw.ui.Widget;
  public class WidgetManagerDemo extends WidgetManager
  {
    // the class of every widget of this application, by the header of that widget
    private var widgetClasses:Object = null;
    /**
     * Constructs the widget manager of the KissAs3Dm application.
     * @param applicationRef the main application reference
     */
    public function WidgetManagerDemo(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<WidgetManagerDemo> called.", 4);
      application.trace("<WidgetManagerDemo> applicationRef: " + applicationRef, 3);
      collectWidgetClasses();
      application.trace("<WidgetManagerDemo> constructed.", 4);
    }
    /**
     * Opens the widget of the menu item that has been picked and closes the panel of
     * the menu. The super call does the closing of that panel.
     * @param selectedItem the menu item that has been picked, the header of a widget
     */
    override public function handleMenuSelect(selectedItem:String):void
    {
      application.trace("<WidgetManagerDemo handleMenuSelect> called.", 4);
      application.trace("<WidgetManagerDemo handleMenuSelect> selectedItem: " + selectedItem, 3);
      openWidget(selectedItem);
      super.handleMenuSelect(selectedItem);
    }
    /**
     * Opens the widget of the given header and steps onto it. A widget of that header
     * that is already open is only stepped onto, it is never built twice.
     * @param header the header of the widget to be opened, an EnumWidgetsDemo value
     */
    public function openWidget(header:String):void
    {
      application.trace("<WidgetManagerDemo openWidget> called.", 4);
      application.trace("<WidgetManagerDemo openWidget> header: " + header, 3);
      if (application.getMiddleground() == null)
      {
        application.trace("<WidgetManagerDemo openWidget> there is no middleground to open a widget on!", 6);
        return;
      }
      var widget:Widget = application.getMiddleground().getWidgets().getWidgetByHeader(header);
      if (widget == null)
      {
        widget = createWidget(header);
        if (widget == null)
        {
          application.trace("<WidgetManagerDemo openWidget> there is no widget of the header " + header + "!", 6);
          return;
        }
        application.addWidget(application.getMiddleground().getActiveWidgetContainer(), widget);
      }
      application.getMiddleground().getWidgets().goToTheWidget(widget);
    }
    /**
     * Builds the widget of the given header, or returns null when there is no widget
     * of that header in this application at all.
     * @param header the header of the widget to be built, an EnumWidgetsDemo value
     */
    private function createWidget(header:String):Widget
    {
      application.trace("<WidgetManagerDemo createWidget> called.", 4);
      application.trace("<WidgetManagerDemo createWidget> header: " + header, 3);
      if (widgetClasses == null || widgetClasses[header] == undefined)
      {
        return null;
      }
      const widgetClass:Class = widgetClasses[header] as Class;
      return new widgetClass(application) as Widget;
    }
    /**
     * Collects the class of every widget of this application by the header of it.
     */
    private function collectWidgetClasses():void
    {
      application.trace("<WidgetManagerDemo collectWidgetClasses> called.", 4);
      widgetClasses = new Object();
      widgetClasses[EnumWidgetsDemo.WELCOME()] = WelcomeWidget;
      widgetClasses[EnumWidgetsDemo.TEXTLABEL()] = TextLabelWidget;
      widgetClasses[EnumWidgetsDemo.TEXTBOX()] = TextBoxWidget;
      widgetClasses[EnumWidgetsDemo.TEXTAREA()] = TextAreaWidget;
      widgetClasses[EnumWidgetsDemo.TEXTINPUT()] = TextInputWidget;
      widgetClasses[EnumWidgetsDemo.BUTTONTEXT()] = ButtonTextWidget;
      widgetClasses[EnumWidgetsDemo.BUTTONLINK()] = ButtonLinkWidget;
      widgetClasses[EnumWidgetsDemo.BUTTONBAR()] = ButtonBarWidget;
      widgetClasses[EnumWidgetsDemo.SWITCHER()] = SwitcherWidget;
      widgetClasses[EnumWidgetsDemo.COLORPICKER()] = ColorPickerWidget;
      widgetClasses[EnumWidgetsDemo.COLORPANEL()] = ColorPanelWidget;
      widgetClasses[EnumWidgetsDemo.DATEPICKER()] = DatePickerWidget;
      widgetClasses[EnumWidgetsDemo.DATEPANEL()] = DatePanelWidget;
      widgetClasses[EnumWidgetsDemo.LISTPICKER()] = ListPickerWidget;
      widgetClasses[EnumWidgetsDemo.LISTPANEL()] = ListPanelWidget;
      widgetClasses[EnumWidgetsDemo.CONTENTSINGLE()] = ContentSingleWidget;
      widgetClasses[EnumWidgetsDemo.CONTENTMULTIPLE()] = ContentMultipleWidget;
      widgetClasses[EnumWidgetsDemo.MORE()] = MoreWidget;
      widgetClasses[EnumWidgetsDemo.WIDGET()] = WidgetWidget;
      widgetClasses[EnumWidgetsDemo.APPLICATION()] = ApplicationWidget;
      widgetClasses[EnumWidgetsDemo.ICON()] = IconWidget;
      widgetClasses[EnumWidgetsDemo.IMAGE()] = ImageWidget;
      widgetClasses[EnumWidgetsDemo.SOUNDPLAYER()] = SoundPlayerWidget;
      widgetClasses[EnumWidgetsDemo.CAMERA()] = CameraWidget;
      widgetClasses[EnumWidgetsDemo.VIDEOPLAYER()] = VideoPlayerWidget;
      widgetClasses[EnumWidgetsDemo.BOARD()] = BoardWidget;
      widgetClasses[EnumWidgetsDemo.WATCH()] = WatchWidget;
      widgetClasses[EnumWidgetsDemo.RATER()] = RaterWidget;
      widgetClasses[EnumWidgetsDemo.POTMETER()] = PotmeterWidget;
      widgetClasses[EnumWidgetsDemo.XMLLISTER()] = XmlListerWidget;
      widgetClasses[EnumWidgetsDemo.URLREQUEST()] = UrlRequestWidget;
      widgetClasses[EnumWidgetsDemo.NETCONNECTION()] = NetConnectionWidget;
    }
    /**
     * Frees up everything and destroys this object.
     */
    override public function destroy():void
    {
      application.trace("<WidgetManagerDemo destroy> called.", 4);
      application.trace("<WidgetManagerDemo destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<WidgetManagerDemo destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      // the widgets themselves are held and destroyed by the widget layer, this object
      // only knows the class every one of them is built of
      if (widgetClasses != null)
      {
        for (var header:String in widgetClasses)
        {
          delete widgetClasses[header];
        }
      }
      application.trace("<WidgetManagerDemo destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<WidgetManagerDemo destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      widgetClasses = null;
    }
  }
}
