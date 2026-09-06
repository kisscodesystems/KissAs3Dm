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
 * WidgetsDemoUnitTest
 * Checks the widget manager and every widget of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - every header of EnumWidgetsDemo has to open a widget of this application: the widget
 *   manager holds the class of every one of them by that very header, so a header with no
 *   class behind it is a menu item that opens nothing at all
 * - every one of those widgets is really built here, with every element of it, so this
 *   suite is the one telling whether this application can be used at all: the elements
 *   demonstrate the components of the framework, and one of them throwing an error while
 *   it is built is reported as a failure of this run
 * - a widget is built once only: the menu item of an open widget steps onto it
 * - the widgets are opened one by one and every one of them is closed right away, so this
 *   application never holds more of them at a time than it does while it is used, and the
 *   destroy of every widget is run as well
 * - the welcome widget is the one this application opens for itself, so it is left open:
 *   this suite leaves the application in the very state it has found it in
 * - the rtmp connection the widget of the net connections opens is closed at the end: a
 *   connection left open keeps this application from closing itself
 */
package com.kisscodesystems.KissAs3Dm.suite
{
  import com.kisscodesystems.KissAs3Dm.BaseUnitTestDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Dm.manager.NetConnectionManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.WidgetManagerDemo;
  import com.kisscodesystems.KissAs3Dm.widget.DemoWidget;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.ui.Widget;
  import com.kisscodesystems.KissAs3Ut.UnitTestReport;
  public class WidgetsDemoUnitTest extends BaseUnitTestDemo
  {
    /**
     * Constructs the suite.
     * @param applicationRef the main application reference
     * @param reportRef the report every assertion result goes into
     */
    public function WidgetsDemoUnitTest(applicationRef:Application, reportRef:UnitTestReport):void
    {
      super(applicationRef, reportRef);
    }
    /**
     * Returns the name of this suite.
     */
    override public function getName():String
    {
      return "WidgetsDemo";
    }
    /**
     * Runs the assertions of this suite.
     */
    override public function run():void
    {
      runWidgetTests();
      runUnknownWidgetTests();
      closeConnectionsOfTheWidgets();
    }
    /**
     * Opens the widget of every header of this application, checks it and closes it. The
     * welcome widget is the one this application opens for itself, so that one is checked
     * where it stands and it is left open.
     */
    private function runWidgetTests():void
    {
      const headers:Array = getEveryWidgetHeader();
      const numOfWidgetsAtTheStart:int = getNumOfAllWidgets();
      for (var i:int = 0; i < headers.length; i++)
      {
        const header:String = String(headers[i]);
        const openedByTheApplication:Boolean = header == EnumWidgetsDemo.WELCOME();
        if (!openedByTheApplication)
        {
          assertNull("the widget of the header " + header + " is not open yet"
            , getWidgetByHeader(header));
        }
        WidgetManagerDemo(application.getWidgetManager()).openWidget(header);
        const widget:Widget = getWidgetByHeader(header);
        assertNotNull("the widget of the header " + header + " is open", widget);
        if (widget == null)
        {
          continue;
        }
        assertTrue("the widget of the header " + header + " is a widget of this application"
          , widget is DemoWidget);
        assertEquals("the header of the widget of the header " + header, header
          , widget.getWidgetHeader());
        assertNotNull("the type of the widget of the header " + header, widget.getWidgetType());
        assertTrue("the widget of the header " + header + " has a width", widget.getDw() > 0);
        assertTrue("the widget of the header " + header + " has a height", widget.getDh() > 0);
        assertTrue("the widget of the header " + header + " displays a content of its own"
          , widget.getActiveIndex() > -1);
        assertTrue("the widget of the header " + header + " stands on a widget container"
          , widget.getContentId() > -1);
        assertTrue("the widget of the header " + header + " has an identifier of its own"
          , widget.getWidgetId() > -1);
        // a widget that is open already is only stepped onto, it is never built twice
        WidgetManagerDemo(application.getWidgetManager()).openWidget(header);
        assertTrue("the widget of the header " + header + " has been built once only"
          , widget == getWidgetByHeader(header));
        if (openedByTheApplication)
        {
          continue;
        }
        application.closeWidget(widget);
        assertNull("the widget of the header " + header + " is closed"
          , getWidgetByHeader(header));
      }
      assertEquals("this application holds the very widgets it has been started with"
        , numOfWidgetsAtTheStart, getNumOfAllWidgets());
      headers.splice(0);
    }
    /**
     * A header this application has no widget for opens nothing at all.
     */
    private function runUnknownWidgetTests():void
    {
      const numOfWidgets:int = getNumOfAllWidgets();
      WidgetManagerDemo(application.getWidgetManager()).openWidget("utUnknownWidgetHeader");
      assertEquals("a header of no widget at all opens nothing", numOfWidgets, getNumOfAllWidgets());
      assertNull("and no widget of that header is found either"
        , getWidgetByHeader("utUnknownWidgetHeader"));
    }
    /**
     * Closes every connection the widgets above have opened. The widget of the net
     * connections opens one to the server of this application as soon as it is built, and
     * a connection left open keeps this application from closing itself.
     */
    private function closeConnectionsOfTheWidgets():void
    {
      assertTrue("the connections of the widgets are closed"
        , application.getNetConnectionManager().closeAllConnections());
      assertFalse("no rtmp connection of this application is left open"
        , application.getNetConnectionManager().isConnectionGroupConnected(
          NetConnectionManagerDemo.CONNECTION_GROUP_KEY));
    }
    /**
     * Returns the widget of the given header, or null when this application holds no open
     * widget of that header.
     * @param header the header the widget is searched by
     */
    private function getWidgetByHeader(header:String):Widget
    {
      return application.getMiddleground().getWidgets().getWidgetByHeader(header);
    }
    /**
     * Returns the number of the widgets standing open on this application.
     */
    private function getNumOfAllWidgets():int
    {
      return application.getMiddleground().getWidgets().getNumOfAllWidgets();
    }
    /**
     * Frees everything this suite holds.
     */
    override public function destroy():void
    {
      // 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher()
      // 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.
      // 3: call the super destroy.
      super.destroy();
      // 4: every reference and value should be reset to null, 0 or false.
    }
  }
}
