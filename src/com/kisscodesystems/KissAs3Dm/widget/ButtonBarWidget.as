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
 * ButtonBarWidget.
 * The widget of the ButtonBar component of the framework.
 *
 * MAIN FEATURES:
 * - a row of buttons of which one is the active one
 * - the example bar stands at the top of the content of this widget and every property of
 *   it can be changed right under it
 * - the rows of the buttons themselves and of the one single button of an index are built
 *   here, every other one comes from the PropertyWidget base class
 * - the dimensions of that bar come from its own buttons, so it has no row of a width and
 *   no row of a height at all
 * - the row of the index is the one every call of one single button works on: the icon,
 *   the visibility and the activation below it all belong to the button of that index
 * - the buttons are added from the store of the example: the row of them takes the first
 *   one that is not standing on that bar yet, so every label of it stays a unique one
 * - such a bar answers neither the labels nor the icons of its buttons, so the code of
 *   the current state is written from the stores of them
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonBar;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class ButtonBarWidget extends PropertyWidget
  {
    // the labels and the icons of the buttons of the example, in the order they are added
    // to the example bar in
    private var buttonLABELS:Array = null;
    private var buttonICONS:Array = null;
    // the range of the row of the index every call of one single button works on: the
    // greatest index that can be asked for is the one of the last button of the example
    private var indexMIN:int = 0;
    private var indexMAX:int = 0;
    private var indexINC:int = 1;
    // the range of the row of the maximum width of that bar and the width the example
    // starts with. That starting width is narrower than the whole row of the buttons on
    // purpose: a bar that is kept inside it is scrolled horizontally, so the example
    // shows that scrolling, and every button of it stays reachable inside this widget,
    // which holds no scrolling of its own the cut off part could be reached by.
    private var maxWidthMIN:int = 0;
    private var maxWidthMAX:int = 700;
    private var maxWidthINC:int = 20;
    private var maxWidthINI:int = 520;
    // the example bar: the very object the rows of this widget work on
    private var exampleButtonBar:ButtonBar = null;
    // the labels and the icons of the buttons standing on that bar at the moment: such a
    // bar answers neither of them, so the code of the current state is written from these
    // very stores
    private var labelsARR:Array = null;
    private var iconsARR:Array = null;
    // the elements changing the properties of that bar
    private var addButtonOBJ:ButtonLink = null;
    private var removeButtonOBJ:ButtonLink = null;
    private var removeAllButtonsOBJ:ButtonLink = null;
    private var indexOBJ:Potmeter = null;
    private var activateOBJ:ButtonLink = null;
    private var labelToFindOBJ:ListPicker = null;
    private var buttonIconOBJ:ListPicker = null;
    private var iconIfNotActiveOBJ:ButtonLink = null;
    private var buttonVisibleOBJ:Switcher = null;
    private var maxWidthOBJ:Potmeter = null;
    // the labels of the third column: the values the getters of that bar answer
    private var buttonsVAL:TextLabel = null;
    private var activeIndexVAL:TextLabel = null;
    private var activeLabelVAL:TextLabel = null;
    private var indexByLabelVAL:TextLabel = null;
    private var buttonIconVAL:TextLabel = null;
    private var buttonVisibleVAL:TextLabel = null;
    private var maxWidthVAL:TextLabel = null;
    /**
     * Constructs the widget of the ButtonBar component.
     * @param applicationRef the main application reference
     */
    public function ButtonBarWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ButtonBarWidget> called.", 4);
      application.trace("<" + this + " ButtonBarWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.BUTTONBAR();
      headerIcon = EnumIconsDemo.buttonbar();
      infoCode = EnumTextKeysDemo.WIDGETINFO_BUTTONBAR();
      codeVarName = "buttonBar";
      iniSizeWidth = 820;
      iniSizeHeight = 720;
      buttonLABELS = [EnumTextKeysDemo.BUTTON_BAR_0(), EnumTextKeysDemo.BUTTON_BAR_1()
        , EnumTextKeysDemo.BUTTON_BAR_2(), EnumTextKeysDemo.BUTTON_BAR_3()
        , EnumTextKeysDemo.BUTTON_BAR_4(), EnumTextKeysDemo.BUTTON_BAR_5()];
      buttonICONS = [EnumIcons.list(), EnumIcons.folder(), EnumIcons.file()
        , EnumIcons.starblank(), EnumIcons.watch(), EnumIcons.settings()];
      indexMAX = buttonLABELS.length - 1;
      labelsARR = new Array();
      iconsARR = new Array();
      application.trace("<" + this + " ButtonBarWidget> constructed.", 4);
    }
    /**
     * Builds the example bar of this widget: the one holding every button of the example,
     * with the first one of them standing as the active one. The height of it is left alone
     * on purpose, that one comes from its own buttons, and the width it is kept inside is
     * narrower than the whole row of those buttons: the bar is scrolled horizontally then,
     * so it displays that scrolling and it never reaches out of this widget.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " ButtonBarWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleButtonBar = new ButtonBar(application);
      setExampleElement(exampleButtonBar);
      for (var i:int = 0; i < buttonLABELS.length; i++)
      {
        addNextButton();
      }
      exampleButtonBar.setActiveIndex(0, false);
      exampleButtonBar.setMaxWidth(maxWidthINI);
    }
    /**
     * Builds every row of this widget: the ones of the buttons of the example bar, the
     * ones of the one single button of the index and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " ButtonBarWidget createRows> called.", 4);
      super.createRows();
      createButtonsRows();
      createOneButtonRows();
      createWidthRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * bar as well: that bar dispatches its changed event every time another button of it
     * becomes the active one, and a click of the one using this application is exactly
     * such a change.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " ButtonBarWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleButtonBar.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleButtonBarChanged);
      addButtonOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), addButtonClick);
      removeButtonOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), removeButtonClick);
      removeAllButtonsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), removeAllButtonsClick);
      indexOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), indexChanged);
      activateOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), activateClick);
      labelToFindOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelToFindChanged);
      buttonIconOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), buttonIconChanged);
      iconIfNotActiveOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), iconIfNotActiveClick);
      buttonVisibleOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), buttonVisibleChanged);
      maxWidthOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), maxWidthChanged);
    }
    /**
     * Displays the current value of every property of the example bar. The rows of the one
     * single button all belong to the index standing in the row of it, so the icon and the
     * visibility of them answer for another button as soon as that index is changed.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " ButtonBarWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      const index:int = int(indexOBJ.getCurValue());
      buttonsVAL.setLabel(getTextOrNone(labelsARR.join(", ")));
      activeIndexVAL.setLabel("" + exampleButtonBar.getActiveIndex());
      activeLabelVAL.setLabel(getTextOrNone(exampleButtonBar.getActiveLabel()));
      indexByLabelVAL.setLabel("" + exampleButtonBar.getIndexByLabel(labelToFindOBJ.getSelectedValue()));
      buttonIconVAL.setLabel(index < iconsARR.length
        ? getTextOrNone(iconsARR[index]) : EnumTextKeysDemo.WIDGET_VALUE_NONE());
      buttonVisibleVAL.setLabel(getYesNoKey(exampleButtonBar.getButtonVisible(index)));
      buttonVisibleOBJ.setOn(exampleButtonBar.getButtonVisible(index), false);
      maxWidthVAL.setLabel("" + exampleButtonBar.getMaxWidth());
      maxWidthOBJ.setCurValue(exampleButtonBar.getMaxWidth(), false);
    }
    /**
     * Returns the code writing the example bar the way it stands at the moment: the import
     * lines it needs, an empty line, and the lines of the properties that are not the ones
     * of a brand new bar. The properties that have no getter at all are read back from the
     * stores of them, and every class the code below names is collected into the imports
     * while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " ButtonBarWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("ButtonBar", imports);
      code += getButtonsCode(imports);
      if (exampleButtonBar.getMaxWidth() > 0)
      {
        code += codeVarName + ".setMaxWidth(" + exampleButtonBar.getMaxWidth() + ");\n";
      }
      if (exampleButtonBar.getActiveIndex() > -1)
      {
        code += codeVarName + ".setActiveIndex(" + exampleButtonBar.getActiveIndex() + ", false);\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the buttons of the example bar: the three links adding one,
     * dropping the one of the index and dropping every one of them, and the index every
     * call of one single button below works on.
     */
    private function createButtonsRows():void
    {
      application.trace("<" + this + " ButtonBarWidget createButtonsRows> called.", 4);
      // the three links share one cell, so they stand next to each other
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_BUTTONS());
      addButtonOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_ADD_BUTTON());
      removeButtonOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REMOVE_BUTTON());
      removeAllButtonsOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REMOVE_ALL_BUTTONS());
      buttonsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_BUTTON_INDEX());
      indexOBJ = createPotmeter(cellIndex + 1, indexMIN, indexMAX, indexINC);
    }
    /**
     * Builds the rows of the one single button of the index: the activation of it, the
     * index and the label of the active one, the index a picked label is found at, the
     * icon of the button of that index, the icon it takes only when it is not the active
     * one, and the visibility of it.
     */
    private function createOneButtonRows():void
    {
      application.trace("<" + this + " ButtonBarWidget createOneButtonRows> called.", 4);
      const noneKey:String = EnumTextKeysDemo.WIDGET_VALUE_NONE();
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_ACTIVE_INDEX());
      activateOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_ACTIVATE());
      activeIndexVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ACTIVE_LABEL());
      activeLabelVAL = createValueLabel(cellIndex + 2);
      // the labels of these buttons are text keys, and a text input would answer with
      // the label such a key stands for and not with the key itself, so the label of the
      // search is picked instead of being typed: a picker answers with the very value it
      // has been given, and the item of it displays that label all the same
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_INDEX_BY_LABEL());
      labelToFindOBJ = createListPicker(cellIndex + 1, buttonLABELS.slice(), buttonLABELS.slice());
      labelToFindOBJ.setSelectedIndex(0, false);
      indexByLabelVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_BUTTON_ICON());
      buttonIconOBJ = createListPicker(cellIndex + 1
          , [noneKey, EnumIcons.ok(), EnumIcons.warning(), EnumIcons.info()
            , EnumIcons.lightning(), EnumIcons.starfull()]
          , ["", EnumIcons.ok(), EnumIcons.warning(), EnumIcons.info()
            , EnumIcons.lightning(), EnumIcons.starfull()]
          , [null, EnumIcons.ok(), EnumIcons.warning(), EnumIcons.info()
            , EnumIcons.lightning(), EnumIcons.starfull()]);
      buttonIconOBJ.setSelectedIndex(1, false);
      buttonIconVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON_IF_NOT_ACTIVE());
      iconIfNotActiveOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_ICON_IF_NOT_ACTIVE());
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_BUTTON_VISIBLE());
      buttonVisibleOBJ = createSwitcher(cellIndex + 1, true);
      buttonVisibleVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the width the example bar is kept inside. A bar holding more
     * buttons than that width can take is scrolled horizontally, and a zero takes that
     * limit away: the bar is as wide as its buttons are then.
     */
    private function createWidthRows():void
    {
      application.trace("<" + this + " ButtonBarWidget createWidthRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_MAX_WIDTH());
      maxWidthOBJ = createPotmeter(cellIndex + 1, maxWidthMIN, maxWidthMAX, maxWidthINC);
      maxWidthVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Puts the first button of the example that is not standing on the example bar yet
     * onto the end of that bar. Every label of that bar stays a unique one this way, so
     * the row searching a button by its label always finds one single button.
     */
    private function addNextButton():void
    {
      application.trace("<" + this + " ButtonBarWidget addNextButton> called.", 4);
      for (var i:int = 0; i < buttonLABELS.length; i++)
      {
        if (labelsARR.indexOf(buttonLABELS[i]) == -1)
        {
          exampleButtonBar.addButton("" + buttonLABELS[i], "" + buttonICONS[i]);
          labelsARR.push(buttonLABELS[i]);
          iconsARR.push(buttonICONS[i]);
          return;
        }
      }
      application.trace("<" + this + " ButtonBarWidget addNextButton> every button of the example stands on that bar already.", 3);
    }
    /**
     * Returns the code putting every button of the example bar onto it, one line per
     * button, and the lines hiding the ones that are not shown on it at the moment.
     * @param imports the names of the classes collected so far
     */
    private function getButtonsCode(imports:Array):String
    {
      application.trace("<" + this + " ButtonBarWidget getButtonsCode> called.", 4);
      application.trace("<" + this + " ButtonBarWidget getButtonsCode> imports: " + imports, 3);
      var code:String = "";
      var i:int = 0;
      for (i = 0; i < labelsARR.length; i++)
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        code += codeVarName + ".addButton(EnumTextKeysDemo." + getTextKeyName("" + labelsARR[i]) + "()";
        if (iconsARR[i] != "")
        {
          pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumIcons");
          code += ", EnumIcons." + iconsARR[i] + "()";
        }
        code += ");\n";
      }
      for (i = 0; i < labelsARR.length; i++)
      {
        if (!exampleButtonBar.getButtonVisible(i))
        {
          code += codeVarName + ".setButtonVisible(" + i + ", false);\n";
        }
      }
      return code;
    }
    /**
     * Displays every value again after another button of the example bar has become the
     * active one: a click of the one using this application is such a change as well.
     * @param e the changed event of that bar
     */
    private function exampleButtonBarChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget exampleButtonBarChanged> called.", 4);
      application.trace("<" + this + " ButtonBarWidget exampleButtonBarChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Puts the next button of the example onto the example bar.
     * @param e the click event of that link
     */
    private function addButtonClick(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget addButtonClick> called.", 4);
      application.trace("<" + this + " ButtonBarWidget addButtonClick> e: " + e, 3);
      addNextButton();
      displayEveryCurrentValue();
    }
    /**
     * Drops the button of the index from the example bar. The buttons standing behind that
     * one step into its place, so every index of them changes, and the label and the icon
     * of it are dropped from the stores of this widget the very same way.
     * @param e the click event of that link
     */
    private function removeButtonClick(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget removeButtonClick> called.", 4);
      application.trace("<" + this + " ButtonBarWidget removeButtonClick> e: " + e, 3);
      const index:int = int(indexOBJ.getCurValue());
      if (index < labelsARR.length)
      {
        exampleButtonBar.removeButton(index);
        labelsARR.splice(index, 1);
        iconsARR.splice(index, 1);
      }
      else
      {
        application.trace("<" + this + " ButtonBarWidget removeButtonClick> there is no button of the index: " + index, 3);
      }
      displayEveryCurrentValue();
    }
    /**
     * Drops every button of the example bar. Such a bar takes no room at all, so the rows
     * of this widget grow into the height it leaves.
     * @param e the click event of that link
     */
    private function removeAllButtonsClick(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget removeAllButtonsClick> called.", 4);
      application.trace("<" + this + " ButtonBarWidget removeAllButtonsClick> e: " + e, 3);
      exampleButtonBar.removeAllButtons();
      labelsARR.splice(0);
      iconsARR.splice(0);
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the index has been changed: every row of the one
     * single button answers for the button of that very index.
     * @param e the changed event of the potmeter of the index
     */
    private function indexChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget indexChanged> called.", 4);
      application.trace("<" + this + " ButtonBarWidget indexChanged> e: " + e, 3);
      displayEveryCurrentValue();
    }
    /**
     * Makes the button of the index the active one of the example bar.
     * @param e the click event of that link
     */
    private function activateClick(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget activateClick> called.", 4);
      application.trace("<" + this + " ButtonBarWidget activateClick> e: " + e, 3);
      exampleButtonBar.setActiveIndex(int(indexOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the label of the search has been picked: the row of
     * that label tells the index of the button carrying it, and a label of a button that
     * has been dropped from that bar is answered by the index of nothing.
     * @param e the changed event of the picker of that label
     */
    private function labelToFindChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget labelToFindChanged> called.", 4);
      application.trace("<" + this + " ButtonBarWidget labelToFindChanged> e: " + e, 3);
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked icon to the button of the index, or frees the leading slot of that
     * button up when the empty item has been picked.
     * @param e the changed event of the picker of the icons
     */
    private function buttonIconChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget buttonIconChanged> called.", 4);
      application.trace("<" + this + " ButtonBarWidget buttonIconChanged> e: " + e, 3);
      const index:int = int(indexOBJ.getCurValue());
      if (index < labelsARR.length)
      {
        const iconType:String = buttonIconOBJ.getSelectedValue();
        if (iconType == "")
        {
          exampleButtonBar.destIcon(index);
        }
        else
        {
          exampleButtonBar.setIcon(index, iconType);
        }
        iconsARR[index] = iconType;
      }
      else
      {
        application.trace("<" + this + " ButtonBarWidget buttonIconChanged> there is no button of the index: " + index, 3);
      }
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked icon to the button of the index, but only when that button is not
     * the active one: this is the call a mark of something new is placed by onto the items
     * that are not being read.
     * @param e the click event of that link
     */
    private function iconIfNotActiveClick(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget iconIfNotActiveClick> called.", 4);
      application.trace("<" + this + " ButtonBarWidget iconIfNotActiveClick> e: " + e, 3);
      const index:int = int(indexOBJ.getCurValue());
      if (index < labelsARR.length && index != exampleButtonBar.getActiveIndex())
      {
        exampleButtonBar.setIconIfNotActive(index, buttonIconOBJ.getSelectedValue());
        iconsARR[index] = buttonIconOBJ.getSelectedValue();
      }
      else
      {
        application.trace("<" + this + " ButtonBarWidget iconIfNotActiveClick> the button of this index is the active one or there is none of it: " + index, 3);
      }
      displayEveryCurrentValue();
    }
    /**
     * Shows or hides the button of the index. A hidden button keeps its index, its label
     * and its place in the order of the buttons, but it is left out of the row and it can
     * not be clicked at all.
     * @param e the changed event of the switcher of that visibility
     */
    private function buttonVisibleChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget buttonVisibleChanged> called.", 4);
      application.trace("<" + this + " ButtonBarWidget buttonVisibleChanged> e: " + e, 3);
      exampleButtonBar.setButtonVisible(int(indexOBJ.getCurValue()), buttonVisibleOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Gives the new maximum width to the example bar.
     * @param e the changed event of the potmeter of that width
     */
    private function maxWidthChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonBarWidget maxWidthChanged> called.", 4);
      application.trace("<" + this + " ButtonBarWidget maxWidthChanged> e: " + e, 3);
      exampleButtonBar.setMaxWidth(int(maxWidthOBJ.getCurValue()));
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
      application.trace("<" + this + " ButtonBarWidget destroy> called.", 4);
      application.trace("<" + this + " ButtonBarWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " ButtonBarWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      buttonLABELS.splice(0);
      buttonICONS.splice(0);
      labelsARR.splice(0);
      iconsARR.splice(0);
      application.trace("<" + this + " ButtonBarWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " ButtonBarWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      buttonLABELS = null;
      buttonICONS = null;
      indexMIN = 0;
      indexMAX = 0;
      indexINC = 0;
      maxWidthMIN = 0;
      maxWidthMAX = 0;
      maxWidthINC = 0;
      exampleButtonBar = null;
      labelsARR = null;
      iconsARR = null;
      addButtonOBJ = null;
      removeButtonOBJ = null;
      removeAllButtonsOBJ = null;
      indexOBJ = null;
      activateOBJ = null;
      labelToFindOBJ = null;
      buttonIconOBJ = null;
      iconIfNotActiveOBJ = null;
      buttonVisibleOBJ = null;
      maxWidthOBJ = null;
      buttonsVAL = null;
      activeIndexVAL = null;
      activeLabelVAL = null;
      indexByLabelVAL = null;
      buttonIconVAL = null;
      buttonVisibleVAL = null;
      maxWidthVAL = null;
    }
  }
}
