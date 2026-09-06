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
 * PotmeterWidget.
 * The widget of the Potmeter component of the framework.
 *
 * MAIN FEATURES:
 * - a slider of a value standing between a minimum and a maximum one
 * - the example potmeter stands at the top of the content of this widget and every
 *   property of it can be changed right under it
 * - the rows of the range, of the decimal precision and of the current value are built
 *   here, every other one comes from the PropertyWidget base class
 * - the dimensions of that potmeter come from its own label and from the padding, so it
 *   has no row of a width and no row of a height at all
 * - the three numbers of the range are asked for by three potmeters of their own, and the
 *   third column of those three rows displays the ones that have really been taken: a
 *   range that can not be stepped through is dropped as a whole by such a potmeter, and
 *   these three rows are the place that dropping is seen at
 * - the row of the value walks the very range that has been taken, so it can ask for
 *   nothing that potmeter would drop
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class PotmeterWidget extends PropertyWidget
  {
    // the range, the decimal precision and the value the example potmeter is built with
    private var exampleMIN:Number = 0;
    private var exampleMAX:Number = 100;
    private var exampleINC:Number = 5;
    private var examplePRECISION:int = 0;
    private var exampleVALUE:Number = 40;
    // the range of the row of the smallest value of the example potmeter
    private var minMIN:Number = -100;
    private var minMAX:Number = 100;
    private var minINC:Number = 10;
    // the range of the row of the greatest value of that potmeter
    private var maxMIN:Number = 0;
    private var maxMAX:Number = 1000;
    private var maxINC:Number = 10;
    // the range of the row of the step of that potmeter
    private var incMIN:Number = 1;
    private var incMAX:Number = 51;
    private var incINC:Number = 1;
    // the range of the row of the decimal precision of that potmeter, the very numbers of
    // decimals such a potmeter takes at all
    private var precisionMIN:Number = 0;
    private var precisionMAX:Number = 10;
    private var precisionINC:Number = 1;
    // the example potmeter: the very object the rows of this widget work on
    private var examplePotmeter:Potmeter = null;
    // the elements changing the properties of that potmeter
    private var minOBJ:Potmeter = null;
    private var maxOBJ:Potmeter = null;
    private var incOBJ:Potmeter = null;
    private var precisionOBJ:Potmeter = null;
    private var curValueOBJ:Potmeter = null;
    // the labels of the third column: the values the getters of that potmeter answer
    private var minVAL:TextLabel = null;
    private var maxVAL:TextLabel = null;
    private var incVAL:TextLabel = null;
    private var precisionVAL:TextLabel = null;
    private var curValueVAL:TextLabel = null;
    /**
     * Constructs the widget of the Potmeter component.
     * @param applicationRef the main application reference
     */
    public function PotmeterWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " PotmeterWidget> called.", 4);
      application.trace("<" + this + " PotmeterWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.POTMETER();
      headerIcon = EnumIcons.potmeter();
      infoCode = EnumTextKeysDemo.WIDGETINFO_POTMETER();
      codeVarName = "potmeter";
      iniSizeWidth = 770;
      iniSizeHeight = 700;
      application.trace("<" + this + " PotmeterWidget> constructed.", 4);
    }
    /**
     * Builds the example potmeter of this widget: the one standing on the range, on the
     * decimal precision and on the value of the example. That value is set silently on
     * purpose: this widget is the code of the application here, so the changed event of it
     * would report an action that nobody has taken. The dimensions of it are left alone as
     * well: such a potmeter takes them from its own label and from the padding.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " PotmeterWidget createExampleElement> called.", 4);
      super.createExampleElement();
      examplePotmeter = new Potmeter(application);
      setExampleElement(examplePotmeter);
      examplePotmeter.setDecimalPrecision(examplePRECISION);
      examplePotmeter.setMinMaxIncValues(exampleMIN, exampleMAX, exampleINC);
      examplePotmeter.setCurValue(exampleVALUE, false);
    }
    /**
     * Builds every row of this widget: the ones of the Potmeter component itself and the
     * ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " PotmeterWidget createRows> called.", 4);
      super.createRows();
      createRangeRows();
      createValueRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * potmeter as well: that potmeter dispatches its changed event every time a new value
     * has been dragged on it, so a dragging of the one using this application and a turn of
     * the row of the value arrive here the very same way.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " PotmeterWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      examplePotmeter.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), examplePotmeterChanged);
      minOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), rangeChanged);
      maxOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), rangeChanged);
      incOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), rangeChanged);
      precisionOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), precisionChanged);
      curValueOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), curValueChanged);
    }
    /**
     * Displays the current value of every property of the example potmeter, the three
     * numbers of the range it has really taken included. The potmeter of the precision and
     * the one of the value are turned silently onto the state of that potmeter: a value can
     * be dragged on it by hand as well, and an event of that turn would be taken as a
     * change made by the one using this application. The three potmeters of the range are
     * left where they stand on purpose: those are the ones asking for a range, and a range
     * that has been dropped stays readable next to the one that is in force.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " PotmeterWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      minVAL.setLabel("" + examplePotmeter.getMinValue());
      maxVAL.setLabel("" + examplePotmeter.getMaxValue());
      incVAL.setLabel("" + examplePotmeter.getIncValue());
      precisionOBJ.setCurValue(examplePotmeter.getDecimalPrecision(), false);
      precisionVAL.setLabel("" + examplePotmeter.getDecimalPrecision());
      curValueOBJ.setCurValue(examplePotmeter.getCurValue(), false);
      curValueVAL.setLabel("" + examplePotmeter.getCurValue());
    }
    /**
     * Returns the code writing the example potmeter the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new potmeter. A brand new potmeter stands on an empty range and
     * on two decimals, so the range and the precision are always written, and the range is
     * the one that has really been taken and not the one the rows of it ask for. Every
     * class the code below names is collected into the imports while those lines are
     * written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " PotmeterWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("Potmeter", imports);
      code += codeVarName + ".setDecimalPrecision(" + examplePotmeter.getDecimalPrecision() + ");\n";
      code += codeVarName + ".setMinMaxIncValues(" + examplePotmeter.getMinValue()
        + ", " + examplePotmeter.getMaxValue() + ", " + examplePotmeter.getIncValue() + ");\n";
      if (examplePotmeter.getCurValue() != 0)
      {
        code += codeVarName + ".setCurValue(" + examplePotmeter.getCurValue() + ", false);\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the range of the example potmeter: the smallest value it can take,
     * the greatest one and the step of it. Every turn of any one of them hands the whole
     * range over again, because that is the one call the three of them are taken in, and
     * the third column of every one of them displays the number that has really been
     * taken: a range that can not be stepped through leaves all three of them where they
     * were.
     */
    private function createRangeRows():void
    {
      application.trace("<" + this + " PotmeterWidget createRangeRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_MIN_VALUE());
      minOBJ = createPotmeter(cellIndex + 1, minMIN, minMAX, minINC);
      minOBJ.setCurValue(exampleMIN, false);
      minVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MAX_VALUE());
      maxOBJ = createPotmeter(cellIndex + 1, maxMIN, maxMAX, maxINC);
      maxOBJ.setCurValue(exampleMAX, false);
      maxVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_INC_VALUE());
      incOBJ = createPotmeter(cellIndex + 1, incMIN, incMAX, incINC);
      incOBJ.setCurValue(exampleINC, false);
      incVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the value of the example potmeter: the number of the decimals it
     * is displayed and rounded with, and the value itself. The row of that value walks the
     * very range the example potmeter stands on, so it can ask for nothing that potmeter
     * would drop.
     */
    private function createValueRows():void
    {
      application.trace("<" + this + " PotmeterWidget createValueRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_DECIMAL_PRECISION());
      precisionOBJ = createPotmeter(cellIndex + 1, precisionMIN, precisionMAX, precisionINC);
      precisionOBJ.setCurValue(examplePRECISION, false);
      precisionVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CUR_VALUE());
      curValueOBJ = createPotmeter(cellIndex + 1, exampleMIN, exampleMAX, exampleINC, examplePRECISION);
      curValueOBJ.setCurValue(exampleVALUE, false);
      curValueVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Gives the three numbers of the rows of the range to the example potmeter and takes
     * the range that potmeter really stands on afterwards. Such a potmeter drops a range it
     * could not step through as a whole, so the row of the value is given the answered
     * range and not the asked one: a range that has been dropped leaves that row exactly
     * where it was.
     */
    private function applyRange():void
    {
      application.trace("<" + this + " PotmeterWidget applyRange> called.", 4);
      examplePotmeter.setMinMaxIncValues(minOBJ.getCurValue(), maxOBJ.getCurValue()
        , incOBJ.getCurValue());
      curValueOBJ.setMinMaxIncValues(examplePotmeter.getMinValue()
        , examplePotmeter.getMaxValue(), examplePotmeter.getIncValue());
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after a new value has been dragged onto the example
     * potmeter.
     * @param e the changed event of that potmeter
     */
    private function examplePotmeterChanged(e:Event):void
    {
      application.trace("<" + this + " PotmeterWidget examplePotmeterChanged> called.", 4);
      application.trace("<" + this + " PotmeterWidget examplePotmeterChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the new range to the example potmeter.
     * @param e the changed event of one of the three potmeters of the range
     */
    private function rangeChanged(e:Event):void
    {
      application.trace("<" + this + " PotmeterWidget rangeChanged> called.", 4);
      application.trace("<" + this + " PotmeterWidget rangeChanged> e: " + e, 3);
      applyRange();
    }
    /**
     * Gives the new decimal precision to the example potmeter and to the row of the value
     * as well: both of them work on one and the same number, so both of them have to round
     * it the very same way.
     * @param e the changed event of the potmeter of the decimal precision
     */
    private function precisionChanged(e:Event):void
    {
      application.trace("<" + this + " PotmeterWidget precisionChanged> called.", 4);
      application.trace("<" + this + " PotmeterWidget precisionChanged> e: " + e, 3);
      const precision:int = int(precisionOBJ.getCurValue());
      examplePotmeter.setDecimalPrecision(precision);
      curValueOBJ.setDecimalPrecision(precision);
      displayEveryCurrentValue();
    }
    /**
     * Gives the turned value to the example potmeter. It is set silently: a value that is
     * set by the code of the application is one the caller knows already, and an event of
     * it would be taken as an action of the one using this application.
     * @param e the changed event of the potmeter of the value
     */
    private function curValueChanged(e:Event):void
    {
      application.trace("<" + this + " PotmeterWidget curValueChanged> called.", 4);
      application.trace("<" + this + " PotmeterWidget curValueChanged> e: " + e, 3);
      examplePotmeter.setCurValue(curValueOBJ.getCurValue(), false);
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
      application.trace("<" + this + " PotmeterWidget destroy> called.", 4);
      application.trace("<" + this + " PotmeterWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " PotmeterWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " PotmeterWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " PotmeterWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      exampleMIN = 0;
      exampleMAX = 0;
      exampleINC = 0;
      examplePRECISION = 0;
      exampleVALUE = 0;
      minMIN = 0;
      minMAX = 0;
      minINC = 0;
      maxMIN = 0;
      maxMAX = 0;
      maxINC = 0;
      incMIN = 0;
      incMAX = 0;
      incINC = 0;
      precisionMIN = 0;
      precisionMAX = 0;
      precisionINC = 0;
      examplePotmeter = null;
      minOBJ = null;
      maxOBJ = null;
      incOBJ = null;
      precisionOBJ = null;
      curValueOBJ = null;
      minVAL = null;
      maxVAL = null;
      incVAL = null;
      precisionVAL = null;
      curValueVAL = null;
    }
  }
}
