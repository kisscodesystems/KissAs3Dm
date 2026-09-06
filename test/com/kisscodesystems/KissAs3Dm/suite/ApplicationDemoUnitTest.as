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
 * ApplicationDemoUnitTest
 * Checks the ApplicationDemo itself: the state this application is started in.
 *
 * MAIN FEATURES:
 * - the three layers of the framework have to stand, and the application has to wear the
 *   size of the stage: the setters of the dimensions of this application do nothing on
 *   purpose, so a stage of any size is the one thing that gives it a size at all
 * - the menu of this application is built as an xml string: that string has to be a well
 *   formed one, it has to hold one leaf per widget of this application, in the very order
 *   the headers of them stand in, and every one of those leaves has to carry an icon
 * - the topics of that menu are displayed, so every one of them is a text key
 * - the language, the orientation and the displaying style this application sets for
 *   itself have to be the ones that are on
 * - this application opens one single widget for itself, the welcome one
 * - a picked menu item opens the widget of it: this application hands that over to the
 *   widget manager of it, and the widget of the item picked here is closed again, so this
 *   suite leaves the application with the very widget it has found open
 */
package com.kisscodesystems.KissAs3Dm.suite
{
  import com.kisscodesystems.KissAs3Dm.BaseUnitTestDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumDisplayingStylesDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumLanguages;
  import com.kisscodesystems.KissAs3Fw.enum.EnumOrientations;
  import com.kisscodesystems.KissAs3Fw.ui.Widget;
  import com.kisscodesystems.KissAs3Ut.UnitTestReport;
  import flash.ui.ContextMenu;
  public class ApplicationDemoUnitTest extends BaseUnitTestDemo
  {
    // the two items this application adds to its own context menu
    private static const CONTEXT_MENU_ITEMS:int = 2;
    /**
     * Constructs the suite.
     * @param applicationRef the main application reference
     * @param reportRef the report every assertion result goes into
     */
    public function ApplicationDemoUnitTest(applicationRef:Application, reportRef:UnitTestReport):void
    {
      super(applicationRef, reportRef);
    }
    /**
     * Returns the name of this suite.
     */
    override public function getName():String
    {
      return "ApplicationDemo";
    }
    /**
     * Runs the assertions of this suite.
     */
    override public function run():void
    {
      runLayerTests();
      runSizeTests();
      runMenuxmlTests();
      runStartingStateTests();
      runContextMenuTests();
      runMenuSelectTests();
    }
    /**
     * The three layers of the framework stand on this application.
     */
    private function runLayerTests():void
    {
      assertNotNull("the background of this application", application.getBackground());
      assertNotNull("the middleground of this application", application.getMiddleground());
      assertNotNull("the foreground of this application", application.getForeground());
      assertNotNull("the widget layer of this application"
        , application.getMiddleground().getWidgets());
    }
    /**
     * This application wears the size of the stage and none of its own setters can change
     * that: every one of those does nothing on purpose.
     */
    private function runSizeTests():void
    {
      assertNotNull("the stage of this application", application.stage);
      assertEquals("the width of this application is the one of the stage"
        , int(Math.max(application.getComponentsConfig().getAppSizeMinWidth()
          , application.stage.stageWidth)), application.getDw());
      assertEquals("the height of this application is the one of the stage"
        , int(Math.max(application.getComponentsConfig().getAppSizeMinHeight()
          , application.stage.stageHeight)), application.getDh());
      const dw:int = application.getDw();
      const dh:int = application.getDh();
      application.setDw(dw + 100);
      assertEquals("the width of this application can not be set", dw, application.getDw());
      application.setDh(dh + 100);
      assertEquals("the height of this application can not be set", dh, application.getDh());
      application.setDwh(dw + 100, dh + 100);
      assertEquals("the width of this application can not be set with the pair of them"
        , dw, application.getDw());
      assertEquals("the height of this application can not be set with the pair of them"
        , dh, application.getDh());
    }
    /**
     * The menu of this application: it holds one leaf per widget of this application, in
     * the order the headers of them stand in, and every leaf of it carries an icon.
     */
    private function runMenuxmlTests():void
    {
      const headers:Array = getEveryWidgetHeader();
      const headersOfTheMenu:Array = new Array();
      var menuXml:XML = null;
      try
      {
        menuXml = new XML(application.getMenuxml());
      }
      catch (e:*)
      {
        report.addFailed("the menu of this application is a well formed xml", "no error", "" + e);
      }
      assertNotNull("the menu of this application is a well formed xml", menuXml);
      if (menuXml == null)
      {
        headers.splice(0);
        return;
      }
      const itemsOfTheMenu:XMLList = menuXml.item;
      assertTrue("the menu of this application holds items", itemsOfTheMenu.length() > 0);
      for (var i:int = 0; i < itemsOfTheMenu.length(); i++)
      {
        const item:XML = itemsOfTheMenu[i];
        const value:String = String(item.@value);
        const itemsOfTheTopic:XMLList = item.item;
        if (itemsOfTheTopic.length() == 0)
        {
          // an item standing under no topic at all opens the widget of it right away
          collectHeaderOfTheMenu(headersOfTheMenu, value, String(item.@icon));
          continue;
        }
        // a topic is displayed, so it is a text key with a label of its own, and it holds
        // the items of the widgets belonging to it
        assertTrue("the topic " + value + " of the menu is a text key"
          , value.indexOf("[") == 0 && value.indexOf("]") == value.length - 1);
        assertTrue("the topic " + value + " of the menu has a label"
          , application.getLabelManager().getLabel(value) != "");
        for (var j:int = 0; j < itemsOfTheTopic.length(); j++)
        {
          const itemOfTheTopic:XML = itemsOfTheTopic[j];
          collectHeaderOfTheMenu(headersOfTheMenu, String(itemOfTheTopic.@value)
            , String(itemOfTheTopic.@icon));
        }
      }
      assertEquals("the menu of this application holds one item per widget of it"
        , headers.length, headersOfTheMenu.length);
      for (i = 0; i < headers.length && i < headersOfTheMenu.length; i++)
      {
        assertEquals("the item of the widget " + String(headers[i]) + " stands in the menu"
          , String(headers[i]), String(headersOfTheMenu[i]));
      }
      headers.splice(0);
      headersOfTheMenu.splice(0);
    }
    /**
     * Collects the header of one leaf of the menu and checks the icon standing in front
     * of it: every widget of this application is displayed with an icon of its own.
     * @param headersOfTheMenu the headers collected so far
     * @param header the header of the widget that leaf opens
     * @param icon the icon standing in front of that leaf
     */
    private function collectHeaderOfTheMenu(headersOfTheMenu:Array, header:String, icon:String):void
    {
      assertTrue("the item of the widget " + header + " carries an icon", icon != "");
      headersOfTheMenu.push(header);
    }
    /**
     * The state this application is started in: the language, the orientation, the
     * displaying style and the one widget it opens for itself.
     */
    private function runStartingStateTests():void
    {
      assertEquals("the language this application is started in", EnumLanguages.EN()
        , application.getLabelManager().getLang());
      assertEquals("the orientation of the widgets of this application"
        , EnumOrientations.ORIENTATION_VERTICAL()
        , application.getDynamicsConfig().getAppOrientation());
      assertEquals("the displaying style this application is started in"
        , EnumDisplayingStylesDemo.DISPLAYING_STYLE_WOOD_LIGHT()
        , application.getDynamicsConfig().getCurrentDisplayingStyle());
      assertTrue("that style carries a background image of its own"
        , application.getDynamicsConfig().getAppBackgroundImage() != "");
      // this application opens one single widget for itself, the welcome one
      assertEquals("the number of the widgets this application is started with", 1
        , application.getMiddleground().getWidgets().getNumOfAllWidgets());
      const widget:Widget = application.getMiddleground().getWidgets().getWidgetByHeader(
        EnumWidgetsDemo.WELCOME());
      assertNotNull("the welcome widget is the one this application is started with", widget);
      if (widget != null)
      {
        // that widget holds no elements at all: the whole description of it is the info
        // text of its header, so it is opened with that text displayed
        assertTrue("the welcome widget is opened with its info text displayed"
          , widget.getInfoContentVisible());
        assertNotNull("the type of the welcome widget", widget.getWidgetType());
      }
    }
    /**
     * The items this application adds to its own context menu stand there.
     */
    private function runContextMenuTests():void
    {
      const contextMenu:ContextMenu = application.contextMenu as ContextMenu;
      assertNotNull("the context menu of this application", contextMenu);
      if (contextMenu != null)
      {
        assertEquals("the number of the items this application adds to its context menu"
          , CONTEXT_MENU_ITEMS, contextMenu.customItems.length);
      }
    }
    /**
     * A picked menu item opens the widget of it: this application hands that over to the
     * widget manager of it. The widget of the item picked here is closed again, so the
     * application is left with the very widget it has been found with.
     */
    private function runMenuSelectTests():void
    {
      const header:String = EnumWidgetsDemo.TEXTLABEL();
      assertNull("the widget of the item to be picked is not open yet"
        , application.getMiddleground().getWidgets().getWidgetByHeader(header));
      application.handleMenuSelect(header);
      const widget:Widget = application.getMiddleground().getWidgets().getWidgetByHeader(header);
      assertNotNull("the widget of the picked menu item is open", widget);
      assertEquals("the number of the widgets after that pick", 2
        , application.getMiddleground().getWidgets().getNumOfAllWidgets());
      // a menu item of a widget that is open already only steps onto that widget
      application.handleMenuSelect(header);
      assertEquals("the very same menu item opens no second widget of it", 2
        , application.getMiddleground().getWidgets().getNumOfAllWidgets());
      assertTrue("the widget of that item is the one that has been open all along"
        , widget == application.getMiddleground().getWidgets().getWidgetByHeader(header));
      // a menu item this application has no widget for opens nothing at all
      application.handleMenuSelect("utUnknownWidgetHeader");
      assertEquals("a menu item of no widget at all opens nothing", 2
        , application.getMiddleground().getWidgets().getNumOfAllWidgets());
      application.closeWidget(widget);
      assertNull("the widget of that item is closed"
        , application.getMiddleground().getWidgets().getWidgetByHeader(header));
      assertEquals("the number of the widgets after that closing", 1
        , application.getMiddleground().getWidgets().getNumOfAllWidgets());
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
