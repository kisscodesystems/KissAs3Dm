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
 * ColorPickerWidget.
 * The widget of the ColorPicker component of the framework.
 *
 * MAIN FEATURES:
 * - a button displaying one single color, with a color panel opening under it
 * - the example picker stands at the top of the content of this widget and every
 *   property of it can be changed right under it
 * - the rows of the color and of the open state are built here, every other one comes
 *   from the PropertyWidget base class
 * - the dimensions of that picker come from its own button and from its open panel, so
 *   it has no row of a width and no row of a height at all
 * - the row of the dimensions of the base class demonstrates a call doing nothing there:
 *   such a picker drops every size it is given
 * - the row of the last event tells what that picker has last reported: the color that
 *   has been committed, the opening, the closing and the two ends of a pixel stealing
 * - the input of the color takes six hexadecimal characters at most, the way the rgb input
 *   of the panel of such a picker does
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ColorPicker;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class ColorPickerWidget extends PropertyWidget
  {
    // The color the example picker is built with, as the six character rgb string every
    // color of such a picker is given and answered in. This is a color and no text that
    // is read by anybody, so it is no label of any language.
    private var exampleRGBCOLOR:String = "3366cc";
    // the example picker: the very object the rows of this widget work on
    private var exampleColorPicker:ColorPicker = null;
    // the elements changing the properties of that picker
    private var rgbColorOBJ:TextInput = null;
    private var openOBJ:ButtonLink = null;
    private var closeOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that picker answer
    private var rgbColorVAL:TextLabel = null;
    private var textTypeVAL:TextLabel = null;
    private var openedVAL:TextLabel = null;
    /**
     * Constructs the widget of the ColorPicker component.
     * @param applicationRef the main application reference
     */
    public function ColorPickerWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ColorPickerWidget> called.", 4);
      application.trace("<" + this + " ColorPickerWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.COLORPICKER();
      headerIcon = EnumIconsDemo.colorpicker();
      infoCode = EnumTextKeysDemo.WIDGETINFO_COLORPICKER();
      codeVarName = "colorPicker";
      iniSizeWidth = 780;
      iniSizeHeight = 800;
      application.trace("<" + this + " ColorPickerWidget> constructed.", 4);
    }
    /**
     * Builds the example picker of this widget: the one standing with the color of the
     * example. That color is committed silently on purpose: this widget is the code of the
     * application here, so the changed event of it would report an action that nobody has
     * taken. The dimensions of that picker are left alone as well: such a picker takes them
     * from the text height of the appearance of the application and from its open panel.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " ColorPickerWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleColorPicker = new ColorPicker(application);
      setExampleElement(exampleColorPicker);
      exampleColorPicker.setRGBColor(exampleRGBCOLOR, false);
    }
    /**
     * Builds every row of this widget: the ones of the color and of the open state of the
     * example picker, and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " ColorPickerWidget createRows> called.", 4);
      super.createRows();
      createColorRows();
      createOpenRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * picker as well: that picker dispatches its changed event when a color has been
     * committed in its panel and on a click on the color it displays, its opened and its
     * closed events when its panel is opened and closed, and the two events of a pixel
     * stealing while that stealing lasts.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " ColorPickerWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleColorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleColorPickerChanged);
      exampleColorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), exampleColorPickerChanged);
      exampleColorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), exampleColorPickerChanged);
      exampleColorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_COLOR_STEAL_FROM_STAGE_START(), exampleColorPickerChanged);
      exampleColorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_COLOR_STEAL_FROM_STAGE_STOP(), exampleColorPickerChanged);
      rgbColorOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), rgbColorChanged);
      openOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), openClick);
      closeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), closeClick);
    }
    /**
     * Displays the current value of every property of the example picker.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " ColorPickerWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      rgbColorVAL.setLabel(exampleColorPicker.getRGBColor());
      textTypeVAL.setLabel(exampleColorPicker.getTextType());
      openedVAL.setLabel(getYesNoKey(exampleColorPicker.isOpened()));
    }
    /**
     * Returns the code writing the example picker the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new picker. Every class the code below names is collected into
     * the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " ColorPickerWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("ColorPicker", imports);
      if (exampleColorPicker.getRGBColor() != application.getComponentsConfig().getColorRgbInputZeros())
      {
        code += codeVarName + ".setRGBColor(\"" + exampleColorPicker.getRGBColor() + "\", false);\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the color of the example picker: the committed color itself and
     * the text type the size of that picker is measured by. That type is answered only, so
     * the second row has nothing to change it with. The input of the color takes the six
     * hexadecimal characters of an rgb string and nothing else, the very same way the input
     * standing in the panel of such a picker does: both of those limits come from the
     * components config, so the two inputs can not drift apart.
     */
    private function createColorRows():void
    {
      application.trace("<" + this + " ColorPickerWidget createColorRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_RGB_COLOR());
      rgbColorOBJ = createTextInput(cellIndex + 1);
      rgbColorOBJ.setMaxChars(application.getComponentsConfig().getColorMaxCharsRgbInput());
      rgbColorOBJ.setRestrict(application.getComponentsConfig().getTextEnabledCharsHex());
      rgbColorOBJ.setLabel(exampleRGBCOLOR);
      rgbColorVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT_TYPE());
      textTypeVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the open state of the example picker: the two links opening and
     * closing the panel of it, and the state that panel stands in.
     */
    private function createOpenRows():void
    {
      application.trace("<" + this + " ColorPickerWidget createOpenRows> called.", 4);
      // the two links share one cell, so they stand next to each other
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_OPENED());
      openOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_OPEN_PICKER());
      closeOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLOSE_PICKER());
      openedVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Displays every value again after the example picker has reported something: a color
     * that has been committed in its panel or clicked on its button, the opening and the
     * closing of that panel, and the two ends of a pixel stealing.
     * @param e the changed, opened, closed or color steal event of that picker
     */
    private function exampleColorPickerChanged(e:Event):void
    {
      application.trace("<" + this + " ColorPickerWidget exampleColorPickerChanged> called.", 4);
      application.trace("<" + this + " ColorPickerWidget exampleColorPickerChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the typed color to the example picker. It is committed silently: a color that
     * is set by the code of the application is one the caller knows already, and an event
     * of it would be taken as an action of the one using this application. Every text
     * arriving here is taken as a color: the ones that are no six character rgb strings
     * are turned into a color the very same way that picker turns them.
     * @param e the changed event of the input of the color
     */
    private function rgbColorChanged(e:Event):void
    {
      application.trace("<" + this + " ColorPickerWidget rgbColorChanged> called.", 4);
      application.trace("<" + this + " ColorPickerWidget rgbColorChanged> e: " + e, 3);
      exampleColorPicker.setRGBColor(rgbColorOBJ.getText(), false);
      displayEveryCurrentValue();
    }
    /**
     * Opens the panel of the example picker.
     * @param e the click event of that link
     */
    private function openClick(e:Event):void
    {
      application.trace("<" + this + " ColorPickerWidget openClick> called.", 4);
      application.trace("<" + this + " ColorPickerWidget openClick> e: " + e, 3);
      exampleColorPicker.open();
      displayEveryCurrentValue();
    }
    /**
     * Closes the panel of the example picker.
     * @param e the click event of that link
     */
    private function closeClick(e:Event):void
    {
      application.trace("<" + this + " ColorPickerWidget closeClick> called.", 4);
      application.trace("<" + this + " ColorPickerWidget closeClick> e: " + e, 3);
      exampleColorPicker.close();
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
      application.trace("<" + this + " ColorPickerWidget destroy> called.", 4);
      application.trace("<" + this + " ColorPickerWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " ColorPickerWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " ColorPickerWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " ColorPickerWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      exampleRGBCOLOR = null;
      exampleColorPicker = null;
      rgbColorOBJ = null;
      openOBJ = null;
      closeOBJ = null;
      rgbColorVAL = null;
      textTypeVAL = null;
      openedVAL = null;
    }
  }
}
