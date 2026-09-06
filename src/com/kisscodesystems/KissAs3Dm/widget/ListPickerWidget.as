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
 * ListPickerWidget.
 * The widget of the ListPicker component of the framework.
 *
 * MAIN FEATURES:
 * - a button displaying the selected item of a list that opens under it
 * - the example picker stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the items, of the selection and of the open state are built here, every
 *   other one comes from the PropertyWidget base class
 * - the width of that picker comes from the outside and its height from its own label, so
 *   it has a row of a width and no row of a height at all
 * - the two links of the row of the items put the next item of the example onto the end of
 *   the list and drop the item that is picked at the moment, and both of them hand the
 *   whole dataset over again: that is the one call such a picker takes its items in
 * - such a picker drops its selection every time it is given its items again, so the
 *   selection is handed back right after every one of those calls
 * - the number of the displayed elements and the event without a change have no getter at
 *   all, so the code of the current state reads both of them back from their own rows
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
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class ListPickerWidget extends PropertyWidget
  {
    // the labels, the values and the icons of every item of the example: the row of the
    // items takes the next one of them that is not standing on the example picker yet
    private var itemLABELS:Array = null;
    private var itemVALUES:Array = null;
    private var itemICONS:Array = null;
    // The labels, the values and the icons of the items standing on that picker at the
    // moment. Such a picker answers neither the icons of its items nor the number of them
    // that has been asked for, so the code of the current state is written from these very
    // stores, and they are the ones the whole dataset is handed over from.
    private var labelsARR:Array = null;
    private var valuesARR:Array = null;
    private var iconsARR:Array = null;
    // the number of the items the example picker is built with
    private var itemsINI:int = 5;
    // the range of the row of the selected index: the greatest index that can be asked for
    // is the one of the last item of the example
    private var indexMIN:int = 0;
    private var indexMAX:int = 0;
    private var indexINC:int = 1;
    // the number of the elements the list of the example picker displays at the same time,
    // and the range of the row of it
    private var elementsINI:int = 5;
    private var elementsMIN:int = 1;
    private var elementsMAX:int = 0;
    private var elementsINC:int = 1;
    // the width the example picker is built with, and the range of the row of it
    private var exampleDw:int = 260;
    private var widthMIN:int = 140;
    private var widthMAX:int = 520;
    private var widthINC:int = 20;
    // the example picker: the very object the rows of this widget work on
    private var exampleListPicker:ListPicker = null;
    // the elements changing the properties of that picker
    private var addItemOBJ:ButtonLink = null;
    private var removeItemOBJ:ButtonLink = null;
    private var selectedIndexOBJ:Potmeter = null;
    private var clearSelectionOBJ:ButtonLink = null;
    private var numOfElementsOBJ:Potmeter = null;
    private var alwaysDispatchOBJ:Switcher = null;
    private var openOBJ:ButtonLink = null;
    private var closeOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that picker answer
    private var itemsVAL:TextLabel = null;
    private var itemValuesVAL:TextLabel = null;
    private var selectedIndexVAL:TextLabel = null;
    private var selectedValueVAL:TextLabel = null;
    private var textVAL:TextLabel = null;
    private var textTypeVAL:TextLabel = null;
    private var openedVAL:TextLabel = null;
    /**
     * Constructs the widget of the ListPicker component.
     * @param applicationRef the main application reference
     */
    public function ListPickerWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ListPickerWidget> called.", 4);
      application.trace("<" + this + " ListPickerWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.LISTPICKER();
      headerIcon = EnumIcons.list();
      infoCode = EnumTextKeysDemo.WIDGETINFO_LISTPICKER();
      codeVarName = "listPicker";
      iniSizeWidth = 770;
      iniSizeHeight = 780;
      itemLABELS = [EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_0(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_1()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_2(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_3()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_4(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_5()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_6(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_7()];
      // These are the very strings the application works with, the ones travelling to a
      // server, so they are no labels of any language.
      itemVALUES = ["documents", "pictures", "holiday", "family"
        , "music", "favourites", "downloads", "archive"];
      itemICONS = [EnumIcons.folder(), EnumIcons.file(), EnumIcons.watch(), EnumIcons.info()
        , EnumIcons.playing(), EnumIcons.starfull(), EnumIcons.downarrow(), EnumIcons.drawer()];
      labelsARR = new Array();
      valuesARR = new Array();
      iconsARR = new Array();
      indexMAX = itemLABELS.length - 1;
      elementsMAX = itemLABELS.length;
      application.trace("<" + this + " ListPickerWidget> constructed.", 4);
    }
    /**
     * Builds the example picker of this widget: the one holding the first items of the
     * example, in the width of the example and with its first item picked. Its height is
     * left alone on purpose: such a picker takes it from its own label while its list is
     * closed and from that list while it is open.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " ListPickerWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleListPicker = new ListPicker(application);
      setExampleElement(exampleListPicker);
      exampleListPicker.setDw(exampleDw);
      exampleListPicker.setNumOfElements(elementsINI);
      for (var i:int = 0; i < itemsINI; i++)
      {
        addNextItem();
      }
      applyItems(0);
    }
    /**
     * Builds every row of this widget: the ones of the items, of the selection, of the list
     * and of the open state of the example picker, and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " ListPickerWidget createRows> called.", 4);
      super.createRows();
      createItemRows();
      createSelectionRows();
      createListRows();
      createOpenRows();
      createWidthRow(widthMIN, widthMAX, widthINC);
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * picker as well: that picker dispatches its changed event every time an item of its
     * list is clicked, and its opened and closed events when that list is opened and
     * closed.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " ListPickerWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleListPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleListPickerChanged);
      exampleListPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), exampleListPickerChanged);
      exampleListPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), exampleListPickerChanged);
      addItemOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), addItemClick);
      removeItemOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), removeItemClick);
      selectedIndexOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), selectedIndexChanged);
      clearSelectionOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), clearSelectionClick);
      numOfElementsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), numOfElementsChanged);
      alwaysDispatchOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), alwaysDispatchChanged);
      openOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), openClick);
      closeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), closeClick);
    }
    /**
     * Displays the current value of every property of the example picker. An item of that
     * picker can be clicked as well, so the potmeter of the row of the selected index
     * follows the index it stands on instead of telling what it has last been asked for.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " ListPickerWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      itemsVAL.setLabel(getShortTextOrNone(exampleListPicker.getArrayLabels().join(", ")));
      itemValuesVAL.setLabel(getShortTextOrNone(exampleListPicker.getArrayValues().join(", ")));
      selectedIndexOBJ.setCurValue(exampleListPicker.getSelectedIndex(), false);
      selectedIndexVAL.setLabel("" + exampleListPicker.getSelectedIndex());
      selectedValueVAL.setLabel(getTextOrNone(exampleListPicker.getSelectedValue()));
      textVAL.setLabel(getTextOrNone(exampleListPicker.getText()));
      textTypeVAL.setLabel(exampleListPicker.getTextType());
      openedVAL.setLabel(getYesNoKey(exampleListPicker.isOpened()));
    }
    /**
     * Returns the code writing the example picker the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new picker. The properties that have no getter at all are read
     * back from the stores and from the elements of them, and every class the code below
     * names is collected into the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " ListPickerWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("ListPicker", imports);
      code += codeVarName + ".setNumOfElements(" + int(numOfElementsOBJ.getCurValue()) + ");\n";
      code += getItemsCode(imports);
      if (alwaysDispatchOBJ.getOn())
      {
        code += codeVarName + ".setAlwaysDispatchSelectedEvent(true);\n";
      }
      code += getSpritePropertiesCode(imports);
      // the selection closes this code: an item can only be picked after the items of that
      // picker have been given to it
      if (exampleListPicker.getSelectedIndex() > -1)
      {
        code += codeVarName + ".setSelectedIndex(" + exampleListPicker.getSelectedIndex() + ", false);\n";
      }
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the items of the example picker: the two links putting the next
     * item of the example onto the end of the list and dropping the item that is picked at
     * the moment, the labels of the items standing on that picker and the values of those
     * very items. Every item is a label, a value and an icon of one and the same index, and
     * the icons have no getter on such a picker at all, so the row of the labels is the one
     * telling how many items it holds.
     */
    private function createItemRows():void
    {
      application.trace("<" + this + " ListPickerWidget createItemRows> called.", 4);
      // the two links share one cell, so they stand next to each other
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_ITEMS());
      addItemOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_ADD_ITEM());
      removeItemOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REMOVE_ITEM());
      itemsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ITEM_VALUES());
      itemValuesVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the selection of the example picker: the index of the picked item,
     * the value of that very item and the link dropping the whole selection. A picker
     * without any selection stands with an empty button, and it takes an item again as soon
     * as the potmeter of the index is moved.
     */
    private function createSelectionRows():void
    {
      application.trace("<" + this + " ListPickerWidget createSelectionRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_SELECTED_INDEX());
      selectedIndexOBJ = createPotmeter(cellIndex + 1, indexMIN, indexMAX, indexINC);
      selectedIndexVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SELECTED_VALUE());
      selectedValueVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SELECTION());
      clearSelectionOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLEAR_SELECTION());
    }
    /**
     * Builds the rows of the list of the example picker: the text it displays, the text type
     * that text is painted with, the number of the items that list shows at the same time
     * and the event it dispatches without a change. The last two of these have no getter at
     * all, so those two rows display nothing.
     */
    private function createListRows():void
    {
      application.trace("<" + this + " ListPickerWidget createListRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT());
      textVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT_TYPE());
      textTypeVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_NUM_OF_ELEMENTS());
      numOfElementsOBJ = createPotmeter(cellIndex + 1, elementsMIN, elementsMAX, elementsINC);
      numOfElementsOBJ.setCurValue(elementsINI, false);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ALWAYS_DISPATCH());
      alwaysDispatchOBJ = createSwitcher(cellIndex + 1, false);
    }
    /**
     * Builds the row of the open state of the example picker: the two links opening and
     * closing the list of it, and the state that list stands in.
     */
    private function createOpenRows():void
    {
      application.trace("<" + this + " ListPickerWidget createOpenRows> called.", 4);
      // the two links share one cell, so they stand next to each other
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_OPENED());
      openOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_OPEN_PICKER());
      closeOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLOSE_PICKER());
      openedVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Puts the first item of the example that is not standing on the example picker yet
     * into the stores of the items. Every label of that picker stays a unique one this way,
     * so the list of it never displays one and the same item twice.
     */
    private function addNextItem():void
    {
      application.trace("<" + this + " ListPickerWidget addNextItem> called.", 4);
      for (var i:int = 0; i < itemLABELS.length; i++)
      {
        if (labelsARR.indexOf(itemLABELS[i]) == -1)
        {
          labelsARR.push(itemLABELS[i]);
          valuesARR.push(itemVALUES[i]);
          iconsARR.push(itemICONS[i]);
          return;
        }
      }
      application.trace("<" + this + " ListPickerWidget addNextItem> every item of the example stands on that picker already.", 3);
    }
    /**
     * Gives the items of the stores to the example picker and picks the item of the given
     * index afterwards. Such a picker drops its selection on every one of these calls, so
     * that selection is handed back right here: the button of it would stand with the label
     * of an item that is not the picked one otherwise. The arrays are copied on purpose: a
     * list keeps the very arrays it is given, so the stores of this widget stay the ones of
     * this widget alone.
     * @param indexToSelect the index of the item to be picked, the first one when it is
     *                      standing behind the last item of that picker
     */
    private function applyItems(indexToSelect:int):void
    {
      application.trace("<" + this + " ListPickerWidget applyItems> called.", 4);
      application.trace("<" + this + " ListPickerWidget applyItems> indexToSelect: " + indexToSelect, 3);
      exampleListPicker.setArrays(labelsARR.slice(), valuesARR.slice(), iconsARR.slice());
      if (labelsARR.length > 0)
      {
        exampleListPicker.setSelectedIndex(Math.max(0, Math.min(indexToSelect, labelsARR.length - 1)), false);
      }
    }
    /**
     * Returns the code giving the items of the example picker to it: the labels, the values
     * and the icons of them, in three arrays of one and the same length.
     * @param imports the names of the classes collected so far
     */
    private function getItemsCode(imports:Array):String
    {
      application.trace("<" + this + " ListPickerWidget getItemsCode> called.", 4);
      application.trace("<" + this + " ListPickerWidget getItemsCode> imports: " + imports, 3);
      pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
      pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumIcons");
      const labels:Array = new Array();
      const values:Array = new Array();
      const icons:Array = new Array();
      for (var i:int = 0; i < labelsARR.length; i++)
      {
        labels.push("EnumTextKeysDemo." + getTextKeyName("" + labelsARR[i]) + "()");
        values.push("\"" + valuesARR[i] + "\"");
        icons.push("EnumIcons." + iconsARR[i] + "()");
      }
      return codeVarName + ".setArrays([" + labels.join(", ") + "]\n"
        + "  , [" + values.join(", ") + "]\n"
        + "  , [" + icons.join(", ") + "]);\n";
    }
    /**
     * Displays every value again after the example picker has reported something: an item
     * that has been clicked in its list, and the opening and the closing of that list.
     * @param e the changed, opened or closed event of that picker
     */
    private function exampleListPickerChanged(e:Event):void
    {
      application.trace("<" + this + " ListPickerWidget exampleListPickerChanged> called.", 4);
      application.trace("<" + this + " ListPickerWidget exampleListPickerChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Puts the next item of the example onto the end of the list of the example picker. The
     * item that is picked at the moment stays the picked one: the new item stands behind it.
     * @param e the click event of that link
     */
    private function addItemClick(e:Event):void
    {
      application.trace("<" + this + " ListPickerWidget addItemClick> called.", 4);
      application.trace("<" + this + " ListPickerWidget addItemClick> e: " + e, 3);
      const selectedIndex:int = exampleListPicker.getSelectedIndex();
      addNextItem();
      applyItems(selectedIndex);
      displayEveryCurrentValue();
    }
    /**
     * Drops the item that is picked on the example picker at the moment. The items standing
     * behind that one step into its place, so the very same index is picked again: that is
     * the item stepping into the place of the dropped one, or the last item of the list when
     * the dropped one has been standing at the end of it. The list of such a picker can not
     * be left empty, so the last item of it stays where it is.
     * @param e the click event of that link
     */
    private function removeItemClick(e:Event):void
    {
      application.trace("<" + this + " ListPickerWidget removeItemClick> called.", 4);
      application.trace("<" + this + " ListPickerWidget removeItemClick> e: " + e, 3);
      const selectedIndex:int = exampleListPicker.getSelectedIndex();
      if (labelsARR.length < 2)
      {
        application.trace("<" + this + " ListPickerWidget removeItemClick> the list of that picker can not be left empty.", 3);
      }
      else if (selectedIndex < 0)
      {
        application.trace("<" + this + " ListPickerWidget removeItemClick> there is no picked item to be dropped.", 3);
      }
      else
      {
        labelsARR.splice(selectedIndex, 1);
        valuesARR.splice(selectedIndex, 1);
        iconsARR.splice(selectedIndex, 1);
        applyItems(selectedIndex);
      }
      displayEveryCurrentValue();
    }
    /**
     * Picks the item of the index of that row on the example picker, and lets its changed
     * event be dispatched: an item that is picked this way is answered by the application
     * the very same way a click on that item is. An index no item belongs to is dropped
     * here: such a picker would stand with an empty selection instead.
     * @param e the changed event of the potmeter of the index
     */
    private function selectedIndexChanged(e:Event):void
    {
      application.trace("<" + this + " ListPickerWidget selectedIndexChanged> called.", 4);
      application.trace("<" + this + " ListPickerWidget selectedIndexChanged> e: " + e, 3);
      const index:int = int(selectedIndexOBJ.getCurValue());
      if (index < labelsARR.length)
      {
        exampleListPicker.setSelectedIndex(index);
      }
      else
      {
        application.trace("<" + this + " ListPickerWidget selectedIndexChanged> there is no item of the index: " + index, 3);
      }
      displayEveryCurrentValue();
    }
    /**
     * Drops the selection of the example picker: the button of it stands empty afterwards.
     * @param e the click event of that link
     */
    private function clearSelectionClick(e:Event):void
    {
      application.trace("<" + this + " ListPickerWidget clearSelectionClick> called.", 4);
      application.trace("<" + this + " ListPickerWidget clearSelectionClick> e: " + e, 3);
      exampleListPicker.clearSelectedIndex();
      displayEveryCurrentValue();
    }
    /**
     * Gives the new number of the displayed elements to the list of the example picker.
     * That list is never built of more elements than the number of the items it holds, so
     * an open one does not grow any taller than its own last item.
     * @param e the changed event of the potmeter of that number
     */
    private function numOfElementsChanged(e:Event):void
    {
      application.trace("<" + this + " ListPickerWidget numOfElementsChanged> called.", 4);
      application.trace("<" + this + " ListPickerWidget numOfElementsChanged> e: " + e, 3);
      exampleListPicker.setNumOfElements(int(numOfElementsOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Tells the example picker whether it has to dispatch its changed event on every click
     * or only when the picked item really changes.
     * @param e the changed event of the switcher of that rule
     */
    private function alwaysDispatchChanged(e:Event):void
    {
      application.trace("<" + this + " ListPickerWidget alwaysDispatchChanged> called.", 4);
      application.trace("<" + this + " ListPickerWidget alwaysDispatchChanged> e: " + e, 3);
      exampleListPicker.setAlwaysDispatchSelectedEvent(alwaysDispatchOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Opens the list of the example picker, scrolled to the item that is picked on it.
     * @param e the click event of that link
     */
    private function openClick(e:Event):void
    {
      application.trace("<" + this + " ListPickerWidget openClick> called.", 4);
      application.trace("<" + this + " ListPickerWidget openClick> e: " + e, 3);
      exampleListPicker.open();
      displayEveryCurrentValue();
    }
    /**
     * Closes the list of the example picker.
     * @param e the click event of that link
     */
    private function closeClick(e:Event):void
    {
      application.trace("<" + this + " ListPickerWidget closeClick> called.", 4);
      application.trace("<" + this + " ListPickerWidget closeClick> e: " + e, 3);
      exampleListPicker.close();
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
      application.trace("<" + this + " ListPickerWidget destroy> called.", 4);
      application.trace("<" + this + " ListPickerWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " ListPickerWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      itemLABELS.splice(0);
      itemVALUES.splice(0);
      itemICONS.splice(0);
      labelsARR.splice(0);
      valuesARR.splice(0);
      iconsARR.splice(0);
      application.trace("<" + this + " ListPickerWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " ListPickerWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      itemLABELS = null;
      itemVALUES = null;
      itemICONS = null;
      labelsARR = null;
      valuesARR = null;
      iconsARR = null;
      itemsINI = 0;
      indexMIN = 0;
      indexMAX = 0;
      indexINC = 0;
      elementsINI = 0;
      elementsMIN = 0;
      elementsMAX = 0;
      elementsINC = 0;
      exampleDw = 0;
      widthMIN = 0;
      widthMAX = 0;
      widthINC = 0;
      exampleListPicker = null;
      addItemOBJ = null;
      removeItemOBJ = null;
      selectedIndexOBJ = null;
      clearSelectionOBJ = null;
      numOfElementsOBJ = null;
      alwaysDispatchOBJ = null;
      openOBJ = null;
      closeOBJ = null;
      itemsVAL = null;
      itemValuesVAL = null;
      selectedIndexVAL = null;
      selectedValueVAL = null;
      textVAL = null;
      textTypeVAL = null;
      openedVAL = null;
    }
  }
}
