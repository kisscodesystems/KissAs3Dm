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
 * SwitcherWidget.
 * The widget of the Switcher component of the framework.
 *
 * MAIN FEATURES:
 * - a switch of two states with a label and an icon of both of them
 * - the example switcher stands at the top of the content of this widget and every
 *   property of it can be changed right under it
 * - the rows of the state and of the two sides of it are built here, every other one
 *   comes from the PropertyWidget base class
 * - the dimensions of that switcher come from its own label, so it has no row of a width
 *   and no row of a height at all
 * - the label, the icon and the web address of the button link underneath are driven by
 *   the state, so the row of those setters demonstrates four calls doing nothing: the
 *   value of that row is the label the state itself has put there
 * - the two states, their icons and their labels have no getter at all, so the code of
 *   the current state reads every one of them back from its own row
 * - the shape type of the button link is demonstrated by the widget of that very
 *   component and not here
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class SwitcherWidget extends PropertyWidget
  {
    // The names the two states of the example switcher are built with, and the ones a
    // brand new switcher stands with: the code of the current state is written by the
    // second pair, because a switcher carrying those very names has never been renamed.
    // These are names the application thinks in and no texts that are read by anybody,
    // so they are no labels of any language.
    private var stateOnNAME:String = "soundon";
    private var stateOffNAME:String = "soundoff";
    private var stateOnDEFAULT:String = "on";
    private var stateOffDEFAULT:String = "off";
    // the web address the row of the driven setters tries to give to that switcher
    private var urlDRIVEN:String = "https://github.com/kisscodesystems/KissAs3Fw";
    // the range of the maximum width of the label of that switcher
    private var maxWidthMIN:int = 0;
    private var maxWidthMAX:int = 400;
    private var maxWidthINC:int = 20;
    // the example switcher: the very object the rows of this widget work on
    private var exampleSwitcher:Switcher = null;
    // the elements changing the properties of that switcher
    private var onOBJ:Switcher = null;
    private var objectStateOBJ:TextInput = null;
    private var stateOnOBJ:TextInput = null;
    private var stateOffOBJ:TextInput = null;
    private var iconOnOBJ:ListPicker = null;
    private var iconOffOBJ:ListPicker = null;
    private var labelOnOBJ:TextInput = null;
    private var labelOffOBJ:TextInput = null;
    private var drivenSettersOBJ:ButtonLink = null;
    private var maxWidthOBJ:Potmeter = null;
    private var multilineOBJ:Switcher = null;
    // the labels of the third column: the values the getters of that switcher answer
    private var onVAL:TextLabel = null;
    private var objectStateVAL:TextLabel = null;
    private var labelVAL:TextLabel = null;
    // The icons and the labels of the two states of that switcher. None of these is
    // answered by it, so the code of the current state is written from these very stores.
    private var iconOnType:String = "";
    private var iconOffType:String = "";
    private var labelOnText:String = "";
    private var labelOffText:String = "";
    /**
     * Constructs the widget of the Switcher component.
     * @param applicationRef the main application reference
     */
    public function SwitcherWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " SwitcherWidget> called.", 4);
      application.trace("<" + this + " SwitcherWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.SWITCHER();
      headerIcon = EnumIcons.switchon();
      infoCode = EnumTextKeysDemo.WIDGETINFO_SWITCHER();
      codeVarName = "switcher";
      iniSizeWidth = 770;
      iniSizeHeight = 750;
      application.trace("<" + this + " SwitcherWidget> constructed.", 4);
    }
    /**
     * Builds the example switcher of this widget: the one standing in the off state of a
     * sound, with a name, an icon and a label of both of its states. Its dimensions are
     * left alone on purpose: such a switcher takes them from the label of the state it
     * stands in and from the padding of the application.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " SwitcherWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleSwitcher = new Switcher(application);
      setExampleElement(exampleSwitcher);
      exampleSwitcher.setStates(stateOnNAME, stateOffNAME);
      iconOnType = EnumIcons.playing();
      iconOffType = EnumIcons.paused();
      exampleSwitcher.setIcons(iconOnType, iconOffType);
      labelOnText = EnumTextKeysDemo.WIDGET_EXAMPLE_STATE_ON();
      labelOffText = EnumTextKeysDemo.WIDGET_EXAMPLE_STATE_OFF();
      exampleSwitcher.setLabels(labelOnText, labelOffText);
    }
    /**
     * Builds every row of this widget: the ones of the state itself, the ones of the two
     * sides of that state and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " SwitcherWidget createRows> called.", 4);
      super.createRows();
      createStateRows();
      createSideRows();
      createLabelRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * switcher as well: that switcher dispatches its changed event on every switch, so a
     * click of the one using this application arrives here the very same way a state set
     * by the row of it does.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " SwitcherWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleSwitcher.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleSwitcherChanged);
      onOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), onChanged);
      objectStateOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), objectStateChanged);
      stateOnOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), stateNameChanged);
      stateOffOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), stateNameChanged);
      iconOnOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), iconChanged);
      iconOffOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), iconChanged);
      labelOnOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelChanged);
      labelOffOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelChanged);
      drivenSettersOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), drivenSettersClick);
      maxWidthOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), maxWidthChanged);
      multilineOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), multilineChanged);
    }
    /**
     * Displays the current value of every property of the example switcher. That switcher
     * can be clicked as well, so the switcher of the row of the on state follows the state
     * it stands in instead of telling what it has last been asked for.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " SwitcherWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      onOBJ.setOn(exampleSwitcher.getOn(), false);
      onVAL.setLabel(getYesNoKey(exampleSwitcher.getOn()));
      objectStateVAL.setLabel(getTextOrNone(exampleSwitcher.getObjectState()));
      labelVAL.setLabel(getTextOrNone(exampleSwitcher.getLabel()));
    }
    /**
     * Returns the code writing the example switcher the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new switcher. The properties that have no getter at all are read
     * back from the elements changing them, and every class the code below names is
     * collected into the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " SwitcherWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("Switcher", imports);
      if (stateOnOBJ.getText() != stateOnDEFAULT || stateOffOBJ.getText() != stateOffDEFAULT)
      {
        code += codeVarName + ".setStates(\"" + stateOnOBJ.getText()
          + "\", \"" + stateOffOBJ.getText() + "\");\n";
      }
      if (iconOnType != EnumIcons.switchon() || iconOffType != EnumIcons.switchoff())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumIcons");
        code += codeVarName + ".setIcons(EnumIcons." + iconOnType
          + "(), EnumIcons." + iconOffType + "());\n";
      }
      if (labelOnText != "" || labelOffText != "")
      {
        code += codeVarName + ".setLabels(" + getLabelCode(labelOnText, imports)
          + ", " + getLabelCode(labelOffText, imports) + ");\n";
      }
      const maxWidth:int = int(maxWidthOBJ.getCurValue());
      if (maxWidth > 0)
      {
        code += codeVarName + ".setMaxWidth(" + maxWidth + ", " + multilineOBJ.getOn() + ");\n";
      }
      code += getSpritePropertiesCode(imports);
      // the state closes this code: a switcher is switched over after it has been given
      // the names, the icons and the labels of the two states it stands between
      if (exampleSwitcher.getOn())
      {
        code += codeVarName + ".setOn(true, false);\n";
      }
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the state of the example switcher: the on state of it and the
     * name of the state it stands in. That name can be typed as well, and every name
     * other than the one of the off state takes such a switcher to its on state.
     */
    private function createStateRows():void
    {
      application.trace("<" + this + " SwitcherWidget createStateRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_ON());
      onOBJ = createSwitcher(cellIndex + 1, false);
      onVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_OBJECT_STATE());
      objectStateOBJ = createTextInput(cellIndex + 1);
      objectStateOBJ.setLabel(stateOffNAME);
      objectStateVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the two sides of that state: the name and the icon of both of
     * them. The names are the two parameters of one single setter and so are the icons, so
     * a change of any of these four rows hands both sides of it over at once, and none of
     * them has a getter at all, so these four rows display nothing.
     */
    private function createSideRows():void
    {
      application.trace("<" + this + " SwitcherWidget createSideRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_STATE_ON());
      stateOnOBJ = createTextInput(cellIndex + 1);
      stateOnOBJ.setLabel(stateOnNAME);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_STATE_OFF());
      stateOffOBJ = createTextInput(cellIndex + 1);
      stateOffOBJ.setLabel(stateOffNAME);
      // the leading slot of such a switcher can not be freed up at all, so these two
      // pickers offer the icons themselves only, without an empty item in front of them
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON_ON());
      iconOnOBJ = createListPicker(cellIndex + 1, getIconTypes(), getIconTypes(), getIconTypes());
      iconOnOBJ.setSelectedIndex(0, false);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON_OFF());
      iconOffOBJ = createListPicker(cellIndex + 1, getIconTypes(), getIconTypes(), getIconTypes());
      iconOffOBJ.setSelectedIndex(1, false);
    }
    /**
     * Builds the rows of the two labels of the example switcher, the row of the setters
     * that are driven by the state of it and the row of the width those labels are kept
     * inside. That driven row calls the label, the icon and the address setters of the
     * button link underneath, and the value of it tells what came of those calls: the
     * label of the state, the very one that stood there before them.
     */
    private function createLabelRows():void
    {
      application.trace("<" + this + " SwitcherWidget createLabelRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL_ON());
      labelOnOBJ = createTextInput(cellIndex + 1);
      labelOnOBJ.setLabel(labelOnText);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL_OFF());
      labelOffOBJ = createTextInput(cellIndex + 1);
      labelOffOBJ.setLabel(labelOffText);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_DRIVEN_SETTERS());
      drivenSettersOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CALL_THEM());
      labelVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MAX_WIDTH());
      maxWidthOBJ = createPotmeter(cellIndex + 1, maxWidthMIN, maxWidthMAX, maxWidthINC);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MULTILINE());
      multilineOBJ = createSwitcher(cellIndex + 1, false);
    }
    /**
     * Returns the icon types the two pickers of the icons offer, the switch icons of the
     * framework among them: those are the ones a brand new switcher stands with, so it
     * can be taken back to them.
     */
    private function getIconTypes():Array
    {
      return [EnumIcons.playing(), EnumIcons.paused(), EnumIcons.switchon()
        , EnumIcons.switchoff(), EnumIcons.ok(), EnumIcons.cancel()];
    }
    /**
     * Returns the code of the given label of a state: the text key of an example label
     * when that one is displayed, and the label itself in quotation marks otherwise.
     * @param labelText the label of that state
     * @param imports the names of the classes collected so far
     */
    private function getLabelCode(labelText:String, imports:Array):String
    {
      application.trace("<" + this + " SwitcherWidget getLabelCode> called.", 4);
      application.trace("<" + this + " SwitcherWidget getLabelCode> labelText: " + labelText, 3);
      application.trace("<" + this + " SwitcherWidget getLabelCode> imports: " + imports, 3);
      if (labelText == EnumTextKeysDemo.WIDGET_EXAMPLE_STATE_ON()
       || labelText == EnumTextKeysDemo.WIDGET_EXAMPLE_STATE_OFF())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        return "EnumTextKeysDemo." + getTextKeyName(labelText) + "()";
      }
      return "\"" + labelText + "\"";
    }
    /**
     * Gives the maximum width and the multiline flag of the two rows of them to the label
     * of the example switcher. The setter of that label drops every call that does not
     * change the width, so a multiline change of one and the same width would be lost: the
     * width is taken back to zero first to let that call through.
     */
    private function applyMaxWidth():void
    {
      application.trace("<" + this + " SwitcherWidget applyMaxWidth> called.", 4);
      const multiline:Boolean = multilineOBJ.getOn();
      exampleSwitcher.setMaxWidth(0, multiline);
      exampleSwitcher.setMaxWidth(int(maxWidthOBJ.getCurValue()), multiline);
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the example switcher has been switched over: the
     * one using this application can click it, and every row of it can set it as well.
     * @param e the changed event of that switcher
     */
    private function exampleSwitcherChanged(e:Event):void
    {
      application.trace("<" + this + " SwitcherWidget exampleSwitcherChanged> called.", 4);
      application.trace("<" + this + " SwitcherWidget exampleSwitcherChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Switches the example switcher over to its on or off state, and lets its changed
     * event be dispatched: a state that is set this way is answered by the application the
     * very same way a click on that switcher is.
     * @param e the changed event of the switcher of the on state
     */
    private function onChanged(e:Event):void
    {
      application.trace("<" + this + " SwitcherWidget onChanged> called.", 4);
      application.trace("<" + this + " SwitcherWidget onChanged> e: " + e, 3);
      exampleSwitcher.setOn(onOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Takes the example switcher to the state of the typed name. Only the name of the off
     * state takes it to that off state: every other name, an empty one as well, is the
     * name of the on state for such a switcher.
     * @param e the changed event of the input of the name
     */
    private function objectStateChanged(e:Event):void
    {
      application.trace("<" + this + " SwitcherWidget objectStateChanged> called.", 4);
      application.trace("<" + this + " SwitcherWidget objectStateChanged> e: " + e, 3);
      exampleSwitcher.setObjectState(objectStateOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Gives the two typed names to the example switcher as the names of its two states.
     * The state it stands in is kept, it takes its new name, and an empty name is dropped:
     * a state without a name of its own could not be told from the other one any more.
     * @param e the changed event of one of the two inputs of those names
     */
    private function stateNameChanged(e:Event):void
    {
      application.trace("<" + this + " SwitcherWidget stateNameChanged> called.", 4);
      application.trace("<" + this + " SwitcherWidget stateNameChanged> e: " + e, 3);
      if (stateOnOBJ.getText() == "" || stateOffOBJ.getText() == "")
      {
        application.trace("<" + this + " SwitcherWidget stateNameChanged> a state of this switcher would be left without a name!", 3);
      }
      else
      {
        exampleSwitcher.setStates(stateOnOBJ.getText(), stateOffOBJ.getText());
      }
      displayEveryCurrentValue();
    }
    /**
     * Gives the two picked icons to the example switcher as the icons of its two states.
     * The one of the state it stands in is displayed right away.
     * @param e the changed event of one of the two pickers of those icons
     */
    private function iconChanged(e:Event):void
    {
      application.trace("<" + this + " SwitcherWidget iconChanged> called.", 4);
      application.trace("<" + this + " SwitcherWidget iconChanged> e: " + e, 3);
      iconOnType = iconOnOBJ.getSelectedValue();
      iconOffType = iconOffOBJ.getSelectedValue();
      exampleSwitcher.setIcons(iconOnType, iconOffType);
      displayEveryCurrentValue();
    }
    /**
     * Gives the two typed texts to the example switcher as the labels of its two states.
     * The one of the state it stands in is displayed right away, and an empty one leaves
     * that state with an icon and without any text at all.
     * @param e the changed event of one of the two inputs of those labels
     */
    private function labelChanged(e:Event):void
    {
      application.trace("<" + this + " SwitcherWidget labelChanged> called.", 4);
      application.trace("<" + this + " SwitcherWidget labelChanged> e: " + e, 3);
      labelOnText = labelOnOBJ.getText();
      labelOffText = labelOffOBJ.getText();
      exampleSwitcher.setLabels(labelOnText, labelOffText);
      displayEveryCurrentValue();
    }
    /**
     * Calls the setters of the example switcher that are driven by the state of it: the
     * label, the icon, the freeing up of the leading slot and the web address. Every one
     * of these does nothing at all, so the value of this row stands where it stood: the
     * setter of the post data is the fifth one of the very same kind.
     * @param e the click event of that link
     */
    private function drivenSettersClick(e:Event):void
    {
      application.trace("<" + this + " SwitcherWidget drivenSettersClick> called.", 4);
      application.trace("<" + this + " SwitcherWidget drivenSettersClick> e: " + e, 3);
      exampleSwitcher.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT());
      exampleSwitcher.setIcon(EnumIcons.warning());
      exampleSwitcher.destIcon();
      exampleSwitcher.setUrl(urlDRIVEN);
      displayEveryCurrentValue();
    }
    /**
     * Gives the new maximum width to the label of the example switcher.
     * @param e the changed event of the potmeter of the maximum width
     */
    private function maxWidthChanged(e:Event):void
    {
      application.trace("<" + this + " SwitcherWidget maxWidthChanged> called.", 4);
      application.trace("<" + this + " SwitcherWidget maxWidthChanged> e: " + e, 3);
      applyMaxWidth();
    }
    /**
     * Gives the new multiline flag to the label of the example switcher.
     * @param e the changed event of the switcher of the multiline flag
     */
    private function multilineChanged(e:Event):void
    {
      application.trace("<" + this + " SwitcherWidget multilineChanged> called.", 4);
      application.trace("<" + this + " SwitcherWidget multilineChanged> e: " + e, 3);
      applyMaxWidth();
    }
    /**
     * Destroys this object and frees up everything. Every element of this widget stands
     * in the content of it, and that content is destroyed by the super destroy below, so
     * the references of them are only cleared here. The listeners registered above are
     * the ones of those very elements, so they are freed up together with them.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " SwitcherWidget destroy> called.", 4);
      application.trace("<" + this + " SwitcherWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " SwitcherWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " SwitcherWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " SwitcherWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      stateOnNAME = null;
      stateOffNAME = null;
      stateOnDEFAULT = null;
      stateOffDEFAULT = null;
      urlDRIVEN = null;
      maxWidthMIN = 0;
      maxWidthMAX = 0;
      maxWidthINC = 0;
      exampleSwitcher = null;
      onOBJ = null;
      objectStateOBJ = null;
      stateOnOBJ = null;
      stateOffOBJ = null;
      iconOnOBJ = null;
      iconOffOBJ = null;
      labelOnOBJ = null;
      labelOffOBJ = null;
      drivenSettersOBJ = null;
      maxWidthOBJ = null;
      multilineOBJ = null;
      onVAL = null;
      objectStateVAL = null;
      labelVAL = null;
      iconOnType = null;
      iconOffType = null;
      labelOnText = null;
      labelOffText = null;
    }
  }
}
