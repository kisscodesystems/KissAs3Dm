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
 * WatchWidget.
 * The widget of the Watch component of the framework.
 *
 * MAIN FEATURES:
 * - a clock of four kinds of displaying: basic, digital, analog and binary
 * - the example watch stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the kind of the watch, of the seconds and of the left edge of it are built
 *   here, every other one comes from the PropertyWidget base class
 * - the dimensions of that watch come from its own elements, so it has no row of a width
 *   and no row of a height at all
 * - a watch dispatches its two events onto its own dispatcher and onto the one of the
 *   application as well, and this widget listens to the example watch itself: those two
 *   events report the state and the dimensions of one single watch, and the application
 *   of this widget holds one more of them in its own header
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextKeys;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import com.kisscodesystems.KissAs3Fw.ui.Watch;
  import flash.events.Event;
  public class WatchWidget extends PropertyWidget
  {
    // The text keys of the four kinds of a watch, in the order that watch displays them.
    // The label manager answers a copy of them on every call, so this widget asks for one
    // of its own: the row of the kind steps onto the kind of the example watch every time
    // a value is displayed, and that is a lookup in this very array.
    private var watchTypeKEYS:Array = null;
    // the example watch: the very object the rows of this widget work on
    private var exampleWatch:Watch = null;
    // the elements changing the properties of that watch
    private var watchTypeOBJ:ListPicker = null;
    private var watchSecsOBJ:Switcher = null;
    // the labels of the third column: the values the getters of that watch answer
    private var watchTypeVAL:TextLabel = null;
    private var watchSecsVAL:TextLabel = null;
    private var frameXVAL:TextLabel = null;
    /**
     * Constructs the widget of the Watch component.
     * @param applicationRef the main application reference
     */
    public function WatchWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " WatchWidget> called.", 4);
      application.trace("<" + this + " WatchWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.WATCH();
      headerIcon = EnumIcons.watch();
      infoCode = EnumTextKeysDemo.WIDGETINFO_WATCH();
      codeVarName = "watch";
      iniSizeWidth = 770;
      iniSizeHeight = 790;
      watchTypeKEYS = application.getLabelManager().getKeysWatchTypes();
      application.trace("<" + this + " WatchWidget> constructed.", 4);
    }
    /**
     * Builds the example watch of this widget: a brand new one, the way it stands when it
     * is put onto a screen. Its dimensions are left alone on purpose: such a watch takes
     * them from its own elements, from the kind of the displaying and from the font size
     * of the application.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " WatchWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleWatch = new Watch(application);
      setExampleElement(exampleWatch);
    }
    /**
     * Builds every row of this widget: the ones of the Watch component itself and the ones
     * the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " WatchWidget createRows> called.", 4);
      super.createRows();
      createWatchRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * watch as well: that watch reports every change of its state and every new dimension
     * of it, and the panel of it is the one changing both of those, so the kind of the
     * watch and the seconds can be picked right there instead of the two rows of them.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " WatchWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleWatch.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_WATCH_CHANGED(), exampleWatchChanged);
      exampleWatch.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_WATCH_REPOSITIONED(), exampleWatchChanged);
      watchTypeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), watchTypeChanged);
      watchSecsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), watchSecsChanged);
    }
    /**
     * Displays the current value of every property of the example watch. The picker of the
     * kind and the switcher of the seconds are set silently onto the state of that watch:
     * both of those can be changed in the panel of it as well, and an event of that setting
     * would be taken as a change made by the one using this application.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " WatchWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      watchTypeOBJ.setSelectedIndex(watchTypeKEYS.indexOf(exampleWatch.getWatchType()), false);
      watchTypeVAL.setLabel(exampleWatch.getWatchType());
      watchSecsOBJ.setOn(exampleWatch.getWatchSecs(), false);
      watchSecsVAL.setLabel(getYesNoKey(exampleWatch.getWatchSecs()));
      frameXVAL.setLabel("" + exampleWatch.getShapeFgFrameX());
    }
    /**
     * Returns the code writing the example watch the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new watch. A brand new watch is a basic one displaying the
     * seconds, and every class the code below names is collected into the imports while
     * those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " WatchWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("Watch", imports);
      if (exampleWatch.getWatchType() != EnumTextKeys.WATCH_TYPE_BASIC())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumTextKeys");
        code += codeVarName + ".setWatchType(EnumTextKeys."
          + getTextKeyName(exampleWatch.getWatchType()) + "());\n";
      }
      if (!exampleWatch.getWatchSecs())
      {
        code += codeVarName + ".setWatchSecs(false);\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the properties the Watch component brings of its own: the kind of
     * the displaying, the seconds and the left edge of the watch itself. That edge is the x
     * coordinate the frame of the watch stands at inside the whole object, so the elements
     * standing next to a watch can be lined up to the watch and not to the room around it.
     * It is a measure of that object and no property at all, so the row of it has nothing
     * to change it with.
     */
    private function createWatchRows():void
    {
      application.trace("<" + this + " WatchWidget createWatchRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_WATCH_TYPE());
      watchTypeOBJ = createListPicker(cellIndex + 1
          , application.getLabelManager().getKeysWatchTypes()
          , application.getLabelManager().getKeysWatchTypes());
      // this picker starts on the kind a brand new watch stands with
      watchTypeOBJ.setSelectedIndex(0, false);
      watchTypeVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_WATCH_SECS());
      watchSecsOBJ = createSwitcher(cellIndex + 1, true);
      watchSecsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_WATCH_FRAME_X());
      frameXVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Gives the picked kind of the displaying to the example watch.
     * @param e the changed event of the picker of the kinds
     */
    private function watchTypeChanged(e:Event):void
    {
      application.trace("<" + this + " WatchWidget watchTypeChanged> called.", 4);
      application.trace("<" + this + " WatchWidget watchTypeChanged> e: " + e, 3);
      exampleWatch.setWatchType(watchTypeOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Switches the seconds of the example watch on or off.
     * @param e the changed event of the switcher of the seconds
     */
    private function watchSecsChanged(e:Event):void
    {
      application.trace("<" + this + " WatchWidget watchSecsChanged> called.", 4);
      application.trace("<" + this + " WatchWidget watchSecsChanged> e: " + e, 3);
      exampleWatch.setWatchSecs(watchSecsOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the example watch has reported a new state or new
     * dimensions: the kind of it and the seconds of it can be picked in the panel of that
     * watch as well, and both of those give it another size.
     * @param e the watch changed or watch repositioned event of that watch
     */
    private function exampleWatchChanged(e:Event):void
    {
      application.trace("<" + this + " WatchWidget exampleWatchChanged> called.", 4);
      application.trace("<" + this + " WatchWidget exampleWatchChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Destroys this object and frees up everything. Every element of this widget stands
     * in the content of it, and that content is destroyed by the super destroy below, so
     * the references of them are only cleared here. The listeners registered above are
     * the ones of those very elements, so they are freed up together with them.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " WatchWidget destroy> called.", 4);
      application.trace("<" + this + " WatchWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " WatchWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      watchTypeKEYS.splice(0);
      application.trace("<" + this + " WatchWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " WatchWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      watchTypeKEYS = null;
      exampleWatch = null;
      watchTypeOBJ = null;
      watchSecsOBJ = null;
      watchTypeVAL = null;
      watchSecsVAL = null;
      frameXVAL = null;
    }
  }
}
