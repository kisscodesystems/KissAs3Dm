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
 * ColorPanelWidget.
 * The widget of the ColorPanel component of the framework.
 *
 * MAIN FEATURES:
 * - the panel of the color picking: the color squares, the rgb input, the gradient
 *   strips and the stealing of a pixel of the whole stage
 * - the example panel stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the row of the color is built here, every other one comes from the PropertyWidget
 *   base class
 * - the dimensions of that panel come from the size of its own squares, so it has no row
 *   of a width and no row of a height at all
 * - the row of the dimensions of the base class demonstrates a call doing nothing there:
 *   such a panel drops every size it is given
 * - the value object of such a panel is the store of its own color, so the row of that
 *   value displays the very rgb string it stands on
 * - the input of the color takes six hexadecimal characters at most, the way the rgb input
 *   standing in that panel does
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.ui.ColorPanel;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class ColorPanelWidget extends PropertyWidget
  {
    // The color the example panel is built with, as the six character rgb string every
    // color of such a panel is given and answered in. This is a color and no text that
    // is read by anybody, so it is no label of any language.
    private var exampleRGBCOLOR:String = "cc6633";
    // the example panel: the very object the rows of this widget work on
    private var exampleColorPanel:ColorPanel = null;
    // the element changing the properties of that panel
    private var rgbColorOBJ:TextInput = null;
    // the label of the third column: the value the getter of that panel answers
    private var rgbColorVAL:TextLabel = null;
    /**
     * Constructs the widget of the ColorPanel component.
     * @param applicationRef the main application reference
     */
    public function ColorPanelWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ColorPanelWidget> called.", 4);
      application.trace("<" + this + " ColorPanelWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.COLORPANEL();
      headerIcon = EnumIconsDemo.colorpanel();
      infoCode = EnumTextKeysDemo.WIDGETINFO_COLORPANEL();
      codeVarName = "colorPanel";
      iniSizeWidth = 780;
      iniSizeHeight = 820;
      application.trace("<" + this + " ColorPanelWidget> constructed.", 4);
    }
    /**
     * Builds the example panel of this widget: the one standing with the color of the
     * example. That color is committed silently on purpose: this widget is the code of the
     * application here, so the changed event of it would report an action that nobody has
     * taken. The dimensions of that panel are left alone as well: such a panel takes them
     * from the size of its own squares.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " ColorPanelWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleColorPanel = new ColorPanel(application);
      setExampleElement(exampleColorPanel);
      exampleColorPanel.setRGBColor(exampleRGBCOLOR, false);
    }
    /**
     * Builds every row of this widget: the one of the color of the example panel and the
     * ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " ColorPanelWidget createRows> called.", 4);
      super.createRows();
      createColorRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * panel as well: that panel dispatches its changed event when a color has been
     * committed in it, and the two events of a pixel stealing while that stealing lasts.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " ColorPanelWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleColorPanel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleColorPanelChanged);
      exampleColorPanel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_COLOR_STEAL_FROM_STAGE_START(), exampleColorPanelChanged);
      exampleColorPanel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_COLOR_STEAL_FROM_STAGE_STOP(), exampleColorPanelChanged);
      rgbColorOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), rgbColorChanged);
    }
    /**
     * Displays the current value of every property of the example panel.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " ColorPanelWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      rgbColorVAL.setLabel(exampleColorPanel.getRGBColor());
    }
    /**
     * Returns the code writing the example panel the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new panel. Every class the code below names is collected into
     * the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " ColorPanelWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("ColorPanel", imports);
      if (exampleColorPanel.getRGBColor() != application.getComponentsConfig().getColorRgbInputZeros())
      {
        code += codeVarName + ".setRGBColor(\"" + exampleColorPanel.getRGBColor() + "\", false);\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Tells that the value object of the example panel is not written into the code of the
     * current state: such a panel stores the color of its own in that object, so a value
     * handed over from the outside would rewrite that very store.
     */
    override protected function getValueCodeNeeded():Boolean
    {
      return false;
    }
    /**
     * Builds the row of the color of the example panel: the committed color of it, the very
     * one the default square of that panel displays. The actual color that is being chosen
     * in it has no getter at all, so this row answers with the committed one only. The input
     * of this row takes the six hexadecimal characters of an rgb string and nothing else,
     * the very same way the rgb input standing in that panel does: both of those limits come
     * from the components config, so the two inputs can not drift apart.
     */
    private function createColorRows():void
    {
      application.trace("<" + this + " ColorPanelWidget createColorRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_RGB_COLOR());
      rgbColorOBJ = createTextInput(cellIndex + 1);
      rgbColorOBJ.setMaxChars(application.getComponentsConfig().getColorMaxCharsRgbInput());
      rgbColorOBJ.setRestrict(application.getComponentsConfig().getTextEnabledCharsHex());
      rgbColorOBJ.setLabel(exampleRGBCOLOR);
      rgbColorVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Displays every value again after the example panel has reported something: a color
     * that has been committed in it, or one of the two ends of a pixel stealing.
     * @param e the changed or color steal event of that panel
     */
    private function exampleColorPanelChanged(e:Event):void
    {
      application.trace("<" + this + " ColorPanelWidget exampleColorPanelChanged> called.", 4);
      application.trace("<" + this + " ColorPanelWidget exampleColorPanelChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the typed color to the example panel. It is committed silently: a color that is
     * set by the code of the application is one the caller knows already, and an event of it
     * would be taken as an action of the one using this application. Every text arriving
     * here is taken as a color: the ones that are no six character rgb strings are turned
     * into a color the very same way that panel turns them.
     * @param e the changed event of the input of the color
     */
    private function rgbColorChanged(e:Event):void
    {
      application.trace("<" + this + " ColorPanelWidget rgbColorChanged> called.", 4);
      application.trace("<" + this + " ColorPanelWidget rgbColorChanged> e: " + e, 3);
      exampleColorPanel.setRGBColor(rgbColorOBJ.getText(), false);
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
      application.trace("<" + this + " ColorPanelWidget destroy> called.", 4);
      application.trace("<" + this + " ColorPanelWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " ColorPanelWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " ColorPanelWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " ColorPanelWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      exampleRGBCOLOR = null;
      exampleColorPanel = null;
      rgbColorOBJ = null;
      rgbColorVAL = null;
    }
  }
}
