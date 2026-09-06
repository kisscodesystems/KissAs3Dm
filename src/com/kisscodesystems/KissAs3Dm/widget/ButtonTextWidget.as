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
 * ButtonTextWidget.
 * The widget of the ButtonText component of the framework.
 *
 * MAIN FEATURES:
 * - a button with a text and with an icon in front of that text
 * - the example button stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the text and of the working button are built here, every other one comes
 *   from the PropertyWidget base class
 * - the dimensions of that button come from its own label, so it has no row of a width
 *   and no row of a height at all, and the row of the dimensions of the base class
 *   demonstrates a call doing nothing there
 * - a click on that button disables it, so the row of the enabled state is the one giving
 *   it back, the very way the one answering such a click does it in an application
 * - the icon, the custom event and the visibility of the working button have no getter at
 *   all, so the code of the current state reads them back from their own rows
 * - the leading slot of that button can not be freed up any more once an icon has been
 *   put into it, so the picker of the icons offers no empty item
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonText;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class ButtonTextWidget extends PropertyWidget
  {
    // The name of the custom event the example button is built with. It is dispatched on
    // the dispatcher of the whole application, so it is a name of its own and not a text
    // that is read by anybody: it is no label of any language.
    private var customEventNAME:String = "customEventOfTheDemo";
    // the example button: the very object the rows of this widget work on
    private var exampleButtonText:ButtonText = null;
    // the elements changing the properties of that button
    private var labelOBJ:TextInput = null;
    private var iconOBJ:ListPicker = null;
    private var customEventOBJ:TextInput = null;
    private var buttonVisibleOBJ:Switcher = null;
    private var rollOutOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that button answer
    private var labelVAL:TextLabel = null;
    private var contentSpriteVAL:TextLabel = null;
    // The icon of that button and the name of the custom event it dispatches at the
    // moment. Neither of these is answered by that button, so the code of the current
    // state is written from these very stores, and that name is the one this widget is
    // listening to on the dispatcher of the application as well.
    private var iconType:String = "";
    private var customEventName:String = "";
    /**
     * Constructs the widget of the ButtonText component.
     * @param applicationRef the main application reference
     */
    public function ButtonTextWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ButtonTextWidget> called.", 4);
      application.trace("<" + this + " ButtonTextWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.BUTTONTEXT();
      headerIcon = EnumIconsDemo.buttontext();
      infoCode = EnumTextKeysDemo.WIDGETINFO_BUTTONTEXT();
      codeVarName = "buttonText";
      iniSizeWidth = 770;
      iniSizeHeight = 700;
      application.trace("<" + this + " ButtonTextWidget> constructed.", 4);
    }
    /**
     * Builds the example button of this widget: the one carrying the text of the example
     * and the first icon of the picker of the icons, so the leading slot of it is seen
     * from the very first moment. Its dimensions are left alone on purpose: such a button
     * takes them from its own label and from the padding of the application.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " ButtonTextWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleButtonText = new ButtonText(application);
      setExampleElement(exampleButtonText);
      exampleButtonText.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT());
      iconType = EnumIcons.ok();
      exampleButtonText.setIcon(iconType);
      applyCustomEvent(customEventNAME);
    }
    /**
     * Builds every row of this widget: the ones of the text, the ones of the working
     * button underneath and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " ButtonTextWidget createRows> called.", 4);
      super.createRows();
      createTextRows();
      createButtonRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * button as well: that button dispatches its click event on every click it takes, so
     * the row of the last event tells that it has been pressed, and the row of the enabled
     * state tells that it has switched itself off for the time of the work of that click.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " ButtonTextWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleButtonText.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), exampleButtonTextClick);
      labelOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelChanged);
      iconOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), iconChanged);
      customEventOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), customEventChanged);
      buttonVisibleOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), buttonVisibleChanged);
      rollOutOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), rollOutClick);
    }
    /**
     * Displays the current value of every property of the example button.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " ButtonTextWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      labelVAL.setLabel(getTextOrNone(exampleButtonText.getLabel()));
      contentSpriteVAL.setLabel(exampleButtonText.getContentSprite().getDw()
        + " x " + exampleButtonText.getContentSprite().getDh());
    }
    /**
     * Returns the code writing the example button the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new button. The properties that have no getter at all are read
     * back from the elements changing them, and every class the code below names is
     * collected into the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " ButtonTextWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("ButtonText", imports);
      if (exampleButtonText.getLabel() != "")
      {
        code += codeVarName + ".setLabel(" + getLabelCode(imports) + ");\n";
      }
      if (iconType != "")
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumIcons");
        code += codeVarName + ".setIcon(EnumIcons." + iconType + "());\n";
      }
      if (customEventName != "")
      {
        code += codeVarName + ".setCustomEventString(\"" + customEventName + "\");\n";
      }
      code += getSpritePropertiesCode(imports);
      if (!buttonVisibleOBJ.getOn())
      {
        code += codeVarName + ".setBaseWorkingButtonVisible(false);\n";
      }
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the label of the example button: the text of it and the icon
     * standing in front of that text. That icon has no getter at all, so the row of it
     * displays nothing.
     */
    private function createTextRows():void
    {
      application.trace("<" + this + " ButtonTextWidget createTextRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL());
      labelOBJ = createTextInput(cellIndex + 1);
      labelVAL = createValueLabel(cellIndex + 2);
      // the leading slot of such a button can not be freed up from the outside, so this
      // picker offers the icons themselves only, without an empty item in front of them
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON());
      iconOBJ = createListPicker(cellIndex + 1
          , [EnumIcons.ok(), EnumIcons.settings(), EnumIcons.file()
            , EnumIcons.starfull(), EnumIcons.warning(), EnumIcons.refresharrow()]
          , [EnumIcons.ok(), EnumIcons.settings(), EnumIcons.file()
            , EnumIcons.starfull(), EnumIcons.warning(), EnumIcons.refresharrow()]
          , [EnumIcons.ok(), EnumIcons.settings(), EnumIcons.file()
            , EnumIcons.starfull(), EnumIcons.warning(), EnumIcons.refresharrow()]);
      iconOBJ.setSelectedIndex(0, false);
    }
    /**
     * Builds the rows of the properties the example button takes from the working button
     * it is built of: the custom event it dispatches, the visibility of its three layers,
     * the roll out that can be asked for from the outside and the sprite the content of
     * it stands in. Only that last one is answered by such a button, so the three rows
     * standing above it display nothing.
     */
    private function createButtonRows():void
    {
      application.trace("<" + this + " ButtonTextWidget createButtonRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_CUSTOM_EVENT());
      customEventOBJ = createTextInput(cellIndex + 1);
      customEventOBJ.setLabel(customEventName);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_BUTTON_VISIBLE());
      buttonVisibleOBJ = createSwitcher(cellIndex + 1, true);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ROLL_OUT());
      rollOutOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_ROLL_OUT());
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CONTENT_SPRITE());
      contentSpriteVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the code of the text of the example button: the text key of the example text
     * when that one is displayed, and the text itself in quotation marks otherwise.
     * @param imports the names of the classes collected so far
     */
    private function getLabelCode(imports:Array):String
    {
      application.trace("<" + this + " ButtonTextWidget getLabelCode> called.", 4);
      application.trace("<" + this + " ButtonTextWidget getLabelCode> imports: " + imports, 3);
      if (exampleButtonText.getLabel() == EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        return "EnumTextKeysDemo." + getTextKeyName(exampleButtonText.getLabel()) + "()";
      }
      return "\"" + exampleButtonText.getLabel() + "\"";
    }
    /**
     * Gives the given name to the example button as its custom event and starts to listen
     * to that very event on the dispatcher of the application: the button dispatches it
     * there, so an object that has never heard of that button can answer its click. An
     * empty name takes the custom event away as a whole, and the listener of the previous
     * name is dropped either way.
     * @param name the name of the new custom event, an empty string for none of them
     */
    private function applyCustomEvent(name:String):void
    {
      application.trace("<" + this + " ButtonTextWidget applyCustomEvent> called.", 4);
      application.trace("<" + this + " ButtonTextWidget applyCustomEvent> name: " + name, 3);
      if (customEventName != "")
      {
        application.getBaseEventDispatcher().removeEventListener(customEventName, customEventArrived);
      }
      customEventName = name;
      exampleButtonText.setCustomEventString(customEventName == "" ? null : customEventName);
      if (customEventName != "")
      {
        application.getBaseEventDispatcher().addEventListener(customEventName, customEventArrived);
      }
    }
    /**
     * Displays every value again after the example button has been clicked: that click has
     * switched the button off for the time of the work it starts, so the row of the
     * enabled state is the one telling that it has to be given back.
     * @param e the click event of that button
     */
    private function exampleButtonTextClick(e:Event):void
    {
      application.trace("<" + this + " ButtonTextWidget exampleButtonTextClick> called.", 4);
      application.trace("<" + this + " ButtonTextWidget exampleButtonTextClick> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Displays every value again after the custom event of the example button has arrived
     * on the dispatcher of the application: the row of the last event is the one telling
     * that it has been dispatched there.
     * @param e the custom event of that button
     */
    private function customEventArrived(e:Event):void
    {
      application.trace("<" + this + " ButtonTextWidget customEventArrived> called.", 4);
      application.trace("<" + this + " ButtonTextWidget customEventArrived> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the text of the input of the label row to the example button.
     * @param e the changed event of that input
     */
    private function labelChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonTextWidget labelChanged> called.", 4);
      application.trace("<" + this + " ButtonTextWidget labelChanged> e: " + e, 3);
      exampleButtonText.setLabel(labelOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked icon to the example button.
     * @param e the changed event of the picker of the icons
     */
    private function iconChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonTextWidget iconChanged> called.", 4);
      application.trace("<" + this + " ButtonTextWidget iconChanged> e: " + e, 3);
      iconType = iconOBJ.getSelectedValue();
      exampleButtonText.setIcon(iconType);
      displayEveryCurrentValue();
    }
    /**
     * Gives the typed name to the example button as its custom event, or takes that event
     * away as a whole when the row of it has been emptied.
     * @param e the changed event of the input of the name
     */
    private function customEventChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonTextWidget customEventChanged> called.", 4);
      application.trace("<" + this + " ButtonTextWidget customEventChanged> e: " + e, 3);
      applyCustomEvent(customEventOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Shows or hides the three layers the example button is built of. It keeps every
     * dimension of its own while it is hidden this way, so the rows of them stand where
     * they stood, and that is what this call is told from the visibility of a sprite by.
     * @param e the changed event of the switcher of that visibility
     */
    private function buttonVisibleChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonTextWidget buttonVisibleChanged> called.", 4);
      application.trace("<" + this + " ButtonTextWidget buttonVisibleChanged> e: " + e, 3);
      exampleButtonText.setBaseWorkingButtonVisible(buttonVisibleOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Displays the example button as one the mouse has just been moved away from. This is
     * the call the press of such a button is given up by when a scroll has taken that
     * press over and it has been dragged instead.
     * @param e the click event of that link
     */
    private function rollOutClick(e:Event):void
    {
      application.trace("<" + this + " ButtonTextWidget rollOutClick> called.", 4);
      application.trace("<" + this + " ButtonTextWidget rollOutClick> e: " + e, 3);
      exampleButtonText.onRollOut();
      displayEveryCurrentValue();
    }
    /**
     * Destroys this object and frees up everything. Every element of this widget stands
     * in the content of it, and that content is destroyed by the super destroy below, so
     * the references of them are only cleared here. The listeners registered above are
     * the ones of those very elements, so they are freed up together with them, and the
     * one of the custom event is the only one standing on a dispatcher of its own.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " ButtonTextWidget destroy> called.", 4);
      application.trace("<" + this + " ButtonTextWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      if (customEventName != "")
      {
        application.getBaseEventDispatcher().removeEventListener(customEventName, customEventArrived);
      }
      application.trace("<" + this + " ButtonTextWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " ButtonTextWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " ButtonTextWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      customEventNAME = null;
      exampleButtonText = null;
      labelOBJ = null;
      iconOBJ = null;
      customEventOBJ = null;
      buttonVisibleOBJ = null;
      rollOutOBJ = null;
      labelVAL = null;
      contentSpriteVAL = null;
      iconType = null;
      customEventName = null;
    }
  }
}
