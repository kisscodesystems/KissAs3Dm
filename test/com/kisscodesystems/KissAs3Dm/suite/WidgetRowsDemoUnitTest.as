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
 * WidgetRowsDemoUnitTest
 * Checks that the rows of the property widgets follow their example objects.
 *
 * MAIN FEATURES:
 * - the example object of a property widget can be changed by the one using this
 *   application directly, on that very object, and not by a row of the widget: the rows
 *   displaying the properties of it have to follow such a change as well
 * - the changes are made here the way the tools of the example object make them, and the
 *   rows are looked up in the display list of the widget, outside of that object
 * - the example board stands in the width the widget builds it with
 * - every widget opened here is closed again, so this suite leaves the application in the
 *   very state it has found it in
 */
package com.kisscodesystems.KissAs3Dm.suite
{
  import com.kisscodesystems.KissAs3Dm.BaseUnitTestDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Dm.manager.WidgetManagerDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.ui.Board;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.DatePanel;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import com.kisscodesystems.KissAs3Fw.ui.Widget;
  import com.kisscodesystems.KissAs3Ut.UnitTestReport;
  import flash.display.DisplayObjectContainer;
  import flash.events.Event;
  public class WidgetRowsDemoUnitTest extends BaseUnitTestDemo
  {
    // the width the widget of the board builds its example board with
    private static const EXAMPLE_BOARD_DW:int = 500;
    /**
     * Constructs the suite.
     * @param applicationRef the main application reference
     * @param reportRef the report every assertion result goes into
     */
    public function WidgetRowsDemoUnitTest(applicationRef:Application, reportRef:UnitTestReport):void
    {
      super(applicationRef, reportRef);
    }
    /**
     * Returns the name of this suite.
     */
    override public function getName():String
    {
      return "WidgetRowsDemo";
    }
    /**
     * Runs the assertions of this suite.
     */
    override public function run():void
    {
      runBoardWidgetTests();
      runDatePanelWidgetTests();
    }
    /**
     * The thickness of the line and the switch of the drawing stand in the toolbar of the
     * example board, so the one using this application changes them there, and the rows of
     * them have to follow.
     */
    private function runBoardWidgetTests():void
    {
      const widget:Widget = openWidget(EnumWidgetsDemo.BOARD());
      if (widget == null)
      {
        return;
      }
      const board:Board = Board(findElementOfClass(widget, Board));
      assertNotNull("the example board of the widget of the board", board);
      if (board != null)
      {
        assertEquals("the width of the example board", expectedDw(EXAMPLE_BOARD_DW), board.getDw());
        const thickness:int = application.getComponentsConfig().getBoardLineMinThickness()
          + application.getComponentsConfig().getBoardLineIncThickness();
        board.setLineThickness(thickness);
        assertEquals("the thickness of the example board has been taken", thickness, board.getLineThickness());
        assertTrue("the row of the thickness follows the toolbar of the example board"
          , hasPotmeterOfValueOutside(widget, board, thickness));
        const switchersOffBefore:int = countSwitchersOffOutside(widget, board);
        board.setDraw(false);
        assertEquals("the row of the drawing follows the toolbar of the example board"
          , switchersOffBefore + 1, countSwitchersOffOutside(widget, board));
        board.setDraw(true);
        assertEquals("the row of the drawing follows the toolbar of the example board back"
          , switchersOffBefore, countSwitchersOffOutside(widget, board));
      }
      application.closeWidget(widget);
    }
    /**
     * The four arrows and the link of the current date of the example panel move the
     * selected date, and the row of that date has to follow every one of them.
     */
    private function runDatePanelWidgetTests():void
    {
      const widget:Widget = openWidget(EnumWidgetsDemo.DATEPANEL());
      if (widget == null)
      {
        return;
      }
      const datePanel:DatePanel = DatePanel(findElementOfClass(widget, DatePanel));
      assertNotNull("the example panel of the widget of the date panel", datePanel);
      if (datePanel != null)
      {
        const buttonLinks:Array = findElementsOfClass(datePanel, ButtonLink);
        for (var i:int = 0; i < buttonLinks.length; i++)
        {
          ButtonLink(buttonLinks[i]).getBaseEventDispatcher().dispatchEvent(new Event(EnumEvents.EVENT_CLICK()));
          assertTrue("the row of the selected date follows the link " + i + " of the example panel"
            , hasTextLabelOfLabelOutside(widget, datePanel, datePanel.getSelectedDate()));
        }
        buttonLinks.splice(0);
      }
      application.closeWidget(widget);
    }
    /**
     * Opens the widget of the given header and returns it, a null one when it could not
     * be opened.
     * @param header the header of the widget
     */
    private function openWidget(header:String):Widget
    {
      WidgetManagerDemo(application.getWidgetManager()).openWidget(header);
      const widget:Widget = application.getMiddleground().getWidgets().getWidgetByHeader(header);
      assertNotNull("the widget of the header " + header + " is open", widget);
      return widget;
    }
    /**
     * Tells whether a potmeter of the given value stands in the given widget, outside of
     * its example object.
     * @param widget the widget the potmeter is searched in
     * @param example the example object of that widget
     * @param value the value of the potmeter
     */
    private function hasPotmeterOfValueOutside(widget:Widget, example:DisplayObjectContainer, value:Number):Boolean
    {
      const potmeters:Array = findElementsOfClass(widget, Potmeter);
      var found:Boolean = false;
      for (var i:int = 0; i < potmeters.length; i++)
      {
        var potmeter:Potmeter = Potmeter(potmeters[i]);
        if (!example.contains(potmeter) && potmeter.getCurValue() == value)
        {
          found = true;
        }
      }
      potmeters.splice(0);
      return found;
    }
    /**
     * Returns the number of the switchers standing off in the given widget, outside of its
     * example object.
     * @param widget the widget the switchers are counted in
     * @param example the example object of that widget
     */
    private function countSwitchersOffOutside(widget:Widget, example:DisplayObjectContainer):int
    {
      const switchers:Array = findElementsOfClass(widget, Switcher);
      var count:int = 0;
      for (var i:int = 0; i < switchers.length; i++)
      {
        var switcher:Switcher = Switcher(switchers[i]);
        if (!example.contains(switcher) && !switcher.getOn())
        {
          count++;
        }
      }
      switchers.splice(0);
      return count;
    }
    /**
     * Tells whether a label of the given text stands in the given widget, outside of its
     * example object.
     * @param widget the widget the label is searched in
     * @param example the example object of that widget
     * @param label the text of the label
     */
    private function hasTextLabelOfLabelOutside(widget:Widget, example:DisplayObjectContainer, label:String):Boolean
    {
      const textLabels:Array = findElementsOfClass(widget, TextLabel);
      var found:Boolean = false;
      for (var i:int = 0; i < textLabels.length; i++)
      {
        var textLabel:TextLabel = TextLabel(textLabels[i]);
        if (!example.contains(textLabel) && textLabel.getLabel() == label)
        {
          found = true;
        }
      }
      textLabels.splice(0);
      return found;
    }
  }
}
