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
 * RaterWidget.
 * The widget of the Rater component of the framework.
 *
 * MAIN FEATURES:
 * - a row of stars to rate something with, half stars included
 * - the example rater stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the rate, of the readonly state and of the number of the stars are built
 *   here, every other one comes from the PropertyWidget base class
 * - the dimensions of that rater come from the number and from the size of its own stars,
 *   so it has no row of a width and no row of a height at all
 * - the potmeter of the rate steps by halves, because a half star is a half rate, and it
 *   follows every rate the one using this application clicks onto that rater
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Rater;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class RaterWidget extends PropertyWidget
  {
    // the rate the example rater is built with
    private var rateINI:Number = 3.5;
    // The range of the row of the rate. The greatest rate is the number of the stars of
    // the application, the step is a half star and one decimal is enough for that half.
    private var rateMIN:Number = 0;
    private var rateMAX:Number = 0;
    private var rateINC:Number = 0.5;
    private var ratePRECISION:int = 1;
    // the example rater: the very object the rows of this widget work on
    private var exampleRater:Rater = null;
    // the elements changing the properties of that rater
    private var rateOBJ:Potmeter = null;
    private var readonlyOBJ:Switcher = null;
    // the labels of the third column: the values the getters of that rater answer
    private var rateVAL:TextLabel = null;
    private var readonlyVAL:TextLabel = null;
    private var numOfStarsVAL:TextLabel = null;
    /**
     * Constructs the widget of the Rater component.
     * @param applicationRef the main application reference
     */
    public function RaterWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " RaterWidget> called.", 4);
      application.trace("<" + this + " RaterWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.RATER();
      headerIcon = EnumIcons.starfull();
      infoCode = EnumTextKeysDemo.WIDGETINFO_RATER();
      codeVarName = "rater";
      iniSizeWidth = 770;
      iniSizeHeight = 680;
      rateMAX = application.getComponentsConfig().getRaterNumOfStars();
      application.trace("<" + this + " RaterWidget> constructed.", 4);
    }
    /**
     * Builds the example rater of this widget: the one standing with the rate of the
     * example and taking a rate of its own as well. A brand new rater is a readonly one, so
     * that state is taken away here: this widget demonstrates the clicking too. The
     * dimensions of it are left alone on purpose: such a rater takes them from the number
     * and from the size of its own stars.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " RaterWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleRater = new Rater(application);
      setExampleElement(exampleRater);
      exampleRater.setReadonly(false);
      exampleRater.setRate(rateINI);
    }
    /**
     * Builds every row of this widget: the ones of the Rater component itself and the ones
     * the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " RaterWidget createRows> called.", 4);
      super.createRows();
      createRateRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * rater as well: that rater dispatches its changed event every time a rate has been
     * clicked onto it, so a click of the one using this application and a turn of the
     * potmeter of the rate arrive here the very same way.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " RaterWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleRater.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleRaterChanged);
      rateOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), rateChanged);
      readonlyOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), readonlyChanged);
    }
    /**
     * Displays the current value of every property of the example rater. The potmeter of
     * the rate is turned silently onto the rate of that rater: it follows every click that
     * happens on it, and an event of that turn would be taken as a change made by the one
     * using this application.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " RaterWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      rateOBJ.setCurValue(exampleRater.getRate(), false);
      rateVAL.setLabel("" + exampleRater.getRate());
      readonlyOBJ.setOn(exampleRater.getReadonly(), false);
      readonlyVAL.setLabel(getYesNoKey(exampleRater.getReadonly()));
      numOfStarsVAL.setLabel("" + application.getComponentsConfig().getRaterNumOfStars());
    }
    /**
     * Returns the code writing the example rater the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new rater. A brand new rater is a readonly one standing on a rate
     * of zero, and every class the code below names is collected into the imports while
     * those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " RaterWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("Rater", imports);
      if (!exampleRater.getReadonly())
      {
        code += codeVarName + ".setReadonly(false);\n";
      }
      if (exampleRater.getRate() != 0)
      {
        code += codeVarName + ".setRate(" + exampleRater.getRate() + ");\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the properties the Rater component brings of its own: the rate it
     * displays, the readonly state it can be locked with and the number of the stars it is
     * drawn of. That number comes from the components config of the application and it is
     * one and the same for every rater of it, so the row of it has nothing to change it
     * with.
     */
    private function createRateRows():void
    {
      application.trace("<" + this + " RaterWidget createRateRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_RATE());
      rateOBJ = createPotmeter(cellIndex + 1, rateMIN, rateMAX, rateINC, ratePRECISION);
      rateVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_READONLY());
      readonlyOBJ = createSwitcher(cellIndex + 1, false);
      readonlyVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_NUM_OF_STARS());
      numOfStarsVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Displays every value again after a rate has been clicked onto the example rater.
     * @param e the changed event of that rater
     */
    private function exampleRaterChanged(e:Event):void
    {
      application.trace("<" + this + " RaterWidget exampleRaterChanged> called.", 4);
      application.trace("<" + this + " RaterWidget exampleRaterChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the turned rate to the example rater.
     * @param e the changed event of the potmeter of the rate
     */
    private function rateChanged(e:Event):void
    {
      application.trace("<" + this + " RaterWidget rateChanged> called.", 4);
      application.trace("<" + this + " RaterWidget rateChanged> e: " + e, 3);
      exampleRater.setRate(rateOBJ.getCurValue());
      displayEveryCurrentValue();
    }
    /**
     * Locks the example rater onto the rate it displays, or lets it take a new one again.
     * @param e the changed event of the switcher of the readonly state
     */
    private function readonlyChanged(e:Event):void
    {
      application.trace("<" + this + " RaterWidget readonlyChanged> called.", 4);
      application.trace("<" + this + " RaterWidget readonlyChanged> e: " + e, 3);
      exampleRater.setReadonly(readonlyOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Destroys this object and frees up everything. Every element of this widget stands
     * in the content of it, and that content is destroyed by the super destroy below, so
     * the references of them are only cleared here. The listeners registered above are
     * the ones of those very elements, so they are freed up together with them.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " RaterWidget destroy> called.", 4);
      application.trace("<" + this + " RaterWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " RaterWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " RaterWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " RaterWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      rateINI = 0;
      rateMIN = 0;
      rateMAX = 0;
      rateINC = 0;
      ratePRECISION = 0;
      exampleRater = null;
      rateOBJ = null;
      readonlyOBJ = null;
      rateVAL = null;
      readonlyVAL = null;
      numOfStarsVAL = null;
    }
  }
}
