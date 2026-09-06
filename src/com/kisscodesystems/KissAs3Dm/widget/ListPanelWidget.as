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
 * ListPanelWidget.
 * The widget of the ListPanel component of the framework.
 *
 * MAIN FEATURES:
 * - a scrollable list of selectable items, with the icons and the indentations of them
 * - the example panel stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the items, of the selection and of the rules of that selection are built
 *   here, every other one comes from the PropertyWidget base class
 * - the width of that panel comes from the outside and its height from the number of the
 *   elements it displays, so it has a row of a width and no row of a height at all
 * - the row of the index of one item is the one every call of one single item works with:
 *   the dropping, the refreshing, the selecting, the deselecting and the scrolling
 * - that row follows the item that has just been selected on the panel, so a click on an
 *   item and one of those calls right after it work on one and the same item
 * - the three links of the row of the items put the next item of the example onto the end
 *   of the list, drop the item of that index and drop every one of them, and all three of
 *   them hand the whole dataset over again: that is the one call such a panel takes its
 *   items in, and the selection surviving it is handed back right after it
 * - the panel builds at most as many elements as the number of the items it holds, so the
 *   row of the displayed elements can answer with a smaller number than it has been asked
 *   for, and the number that has been asked for is read back from that very row
 * - a panel that is not allowed to stand empty keeps one item selected, so the row of the
 *   deselecting can not empty it: only the clearing of the selection takes it back to the
 *   empty state it has been built in
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPanel;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class ListPanelWidget extends PropertyWidget
  {
    // the labels, the values, the icons and the indentations of every item of the example:
    // the row of the items takes the next one of them that is not on the panel yet
    private var itemLABELS:Array = null;
    private var itemVALUES:Array = null;
    private var itemICONS:Array = null;
    private var itemTABCNTS:Array = null;
    // The labels, the values, the icons and the indentations of the items standing on the
    // example panel at the moment. Such a panel answers every one of these, but the whole
    // dataset has to be handed over again on every change of it, so these four stores are
    // the ones it is handed over from, and a refreshed item is written into them as well.
    private var labelsARR:Array = null;
    private var valuesARR:Array = null;
    private var iconsARR:Array = null;
    private var tabcntsARR:Array = null;
    // the number of the items the example panel is built with
    private var itemsINI:int = 6;
    // The indexes that were selected on the example panel when this widget displayed its
    // values the last time. The row of the index of one item steps onto every index that
    // arrives into that selection, and this store is the one telling which of them is a
    // newly arrived one.
    private var selectedARR:Array = null;
    // the indentation and the icon the refreshing of one single item gives to that item
    private var refreshTABCNT:int = 1;
    private var refreshICON:String = "";
    // the range of the row of the index every call of one single item works on: the
    // greatest index that can be asked for is the one of the last item of the example
    private var indexMIN:int = 0;
    private var indexMAX:int = 0;
    private var indexINC:int = 1;
    // the number of the elements the example panel displays at the same time, and the range
    // of the row of it
    private var elementsINI:int = 4;
    private var elementsMIN:int = 1;
    private var elementsMAX:int = 0;
    private var elementsINC:int = 1;
    // the width the example panel is built with, and the range of the row of it
    private var exampleDw:int = 320;
    private var widthMIN:int = 160;
    private var widthMAX:int = 620;
    private var widthINC:int = 20;
    // the example panel: the very object the rows of this widget work on
    private var exampleListPanel:ListPanel = null;
    // the elements changing the properties of that panel
    private var addItemOBJ:ButtonLink = null;
    private var removeItemOBJ:ButtonLink = null;
    private var removeAllItemsOBJ:ButtonLink = null;
    private var itemIndexOBJ:Potmeter = null;
    private var refreshItemOBJ:ButtonLink = null;
    private var selectOBJ:ButtonLink = null;
    private var deselectOBJ:ButtonLink = null;
    private var clearSelectionOBJ:ButtonLink = null;
    private var startIndexOBJ:ButtonLink = null;
    private var multipleOBJ:Switcher = null;
    private var canBeEmptyOBJ:Switcher = null;
    private var alwaysDispatchOBJ:Switcher = null;
    private var numOfElementsOBJ:Potmeter = null;
    // the labels of the third column: the values the getters of that panel answer
    private var itemsVAL:TextLabel = null;
    private var itemValuesVAL:TextLabel = null;
    private var itemIconsVAL:TextLabel = null;
    private var itemTabcntsVAL:TextLabel = null;
    private var selectionVAL:TextLabel = null;
    private var multipleVAL:TextLabel = null;
    private var canBeEmptyVAL:TextLabel = null;
    private var alwaysDispatchVAL:TextLabel = null;
    private var numOfElementsVAL:TextLabel = null;
    private var textTypeVAL:TextLabel = null;
    /**
     * Constructs the widget of the ListPanel component.
     * @param applicationRef the main application reference
     */
    public function ListPanelWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ListPanelWidget> called.", 4);
      application.trace("<" + this + " ListPanelWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.LISTPANEL();
      headerIcon = EnumIcons.listing();
      infoCode = EnumTextKeysDemo.WIDGETINFO_LISTPANEL();
      codeVarName = "listPanel";
      iniSizeWidth = 770;
      iniSizeHeight = 800;
      itemLABELS = [EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_0(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_1()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_2(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_3()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_4(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_5()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_6(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_7()];
      // These are the very strings the application works with, the ones travelling to a
      // server, so they are no labels of any language.
      itemVALUES = ["documents", "pictures", "holiday", "family"
        , "music", "favourites", "downloads", "archive"];
      itemICONS = [EnumIcons.folder(), EnumIcons.folder(), EnumIcons.file(), EnumIcons.file()
        , EnumIcons.folder(), EnumIcons.starfull(), EnumIcons.downarrow(), EnumIcons.drawer()];
      // the items of an indentation of one stand under the item above them, so these
      // numbers are the ones drawing a tree of the items of the example
      itemTABCNTS = [0, 1, 1, 1, 0, 1, 0, 1];
      labelsARR = new Array();
      valuesARR = new Array();
      iconsARR = new Array();
      tabcntsARR = new Array();
      selectedARR = new Array();
      refreshICON = EnumIcons.ok();
      indexMAX = itemLABELS.length - 1;
      elementsMAX = itemLABELS.length;
      application.trace("<" + this + " ListPanelWidget> constructed.", 4);
    }
    /**
     * Builds the example panel of this widget: the one holding the first items of the
     * example, in the width of the example and with its first item selected. Its height is
     * left alone on purpose: such a panel takes it from the number of the elements it
     * displays at the same time.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " ListPanelWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleListPanel = new ListPanel(application);
      setExampleElement(exampleListPanel);
      exampleListPanel.setDw(exampleDw);
      exampleListPanel.setNumOfElements(elementsINI);
      for (var i:int = 0; i < itemsINI; i++)
      {
        addNextItem();
      }
      applyItems([0]);
    }
    /**
     * Builds every row of this widget: the ones of the items, of the one single item of the
     * index, of the selection and of the rules of it, and the ones the base class holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " ListPanelWidget createRows> called.", 4);
      super.createRows();
      createItemRows();
      createOneItemRows();
      createSelectionRows();
      createRuleRows();
      createWidthRow(widthMIN, widthMAX, widthINC);
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * panel as well: that panel dispatches its changed event every time its selection
     * changes, and the clicks of the one using this application arrive here the very same
     * way the selections of the rows below do.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " ListPanelWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleListPanel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleListPanelChanged);
      addItemOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), addItemClick);
      removeItemOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), removeItemClick);
      removeAllItemsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), removeAllItemsClick);
      refreshItemOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), refreshItemClick);
      selectOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), selectClick);
      deselectOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), deselectClick);
      clearSelectionOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), clearSelectionClick);
      startIndexOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), startIndexClick);
      multipleOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), multipleChanged);
      canBeEmptyOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), canBeEmptyChanged);
      alwaysDispatchOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), alwaysDispatchChanged);
      numOfElementsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), numOfElementsChanged);
    }
    /**
     * Displays the current value of every property of the example panel. The two switchers
     * of the multiple selection and of the empty one follow the state that panel stands in:
     * neither of those rules is always taken the way it is asked for, and the row of the
     * index of one item follows the item that has just been selected.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " ListPanelWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      itemsVAL.setLabel(getShortTextOrNone(exampleListPanel.getArrayLabels().join(", ")));
      itemValuesVAL.setLabel(getShortTextOrNone(exampleListPanel.getArrayValues().join(", ")));
      itemIconsVAL.setLabel(getShortTextOrNone(exampleListPanel.getArrayIcons().join(", ")));
      itemTabcntsVAL.setLabel(getShortTextOrNone(exampleListPanel.getArrayTabcnts().join(", ")));
      selectionVAL.setLabel(getSelectedIndexesText());
      followTheSelectedItem();
      multipleOBJ.setOn(exampleListPanel.getMultiple(), false);
      multipleVAL.setLabel(getYesNoKey(exampleListPanel.getMultiple()));
      canBeEmptyOBJ.setOn(exampleListPanel.getCanBeEmpty(), false);
      canBeEmptyVAL.setLabel(getYesNoKey(exampleListPanel.getCanBeEmpty()));
      alwaysDispatchVAL.setLabel(getYesNoKey(exampleListPanel.getAlwaysDispatchSelectedEvent()));
      numOfElementsVAL.setLabel("" + exampleListPanel.getNumOfElements());
      textTypeVAL.setLabel(exampleListPanel.getTextType());
    }
    /**
     * Returns the code writing the example panel the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new panel. The number of the displayed elements is read back from
     * the element of its own row, because the getter of it answers with the number of the
     * elements that have really been built, and every class the code below names is
     * collected into the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " ListPanelWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("ListPanel", imports);
      code += codeVarName + ".setNumOfElements(" + int(numOfElementsOBJ.getCurValue()) + ");\n";
      code += getItemsCode(imports);
      if (exampleListPanel.getMultiple())
      {
        code += codeVarName + ".setMultiple(true);\n";
      }
      if (exampleListPanel.getCanBeEmpty())
      {
        code += codeVarName + ".setCanBeEmpty(true);\n";
      }
      if (exampleListPanel.getAlwaysDispatchSelectedEvent())
      {
        code += codeVarName + ".setAlwaysDispatchSelectedEvent(true);\n";
      }
      code += getSpritePropertiesCode(imports);
      // the selection closes this code: the items of such a panel have to stand in it
      // already before any one of them can be selected
      code += getSelectionCode();
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the items of the example panel: the three links putting the next
     * item of the example onto the end of the list, dropping the item of the index of the
     * row below and dropping every one of them, and the labels, the values, the icons and
     * the indentations of the items standing on that panel. Every item is a label, a value,
     * an icon and an indentation of one and the same index, so these four rows are read next
     * to each other.
     */
    private function createItemRows():void
    {
      application.trace("<" + this + " ListPanelWidget createItemRows> called.", 4);
      // the three links share one cell, so they stand next to each other
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_ITEMS());
      addItemOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_ADD_ITEM());
      removeItemOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REMOVE_ITEM());
      removeAllItemsOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REMOVE_ALL_ITEMS());
      itemsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ITEM_VALUES());
      itemValuesVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ITEM_ICONS());
      itemIconsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ITEM_TABCNTS());
      itemTabcntsVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the one single item of the index: that index itself, the item it
     * belongs to and the first displayed item. That index can be turned by hand, and it
     * follows the item that has just been selected on the example panel as well, so a click
     * on an item and every call of these rows meet on one and the same item. The refreshing
     * gives that item the label of the example text, an icon and an indentation, and it
     * leaves the value of it alone: a label and a value of nothing at all are the ones such
     * a panel does not touch, while an icon is always taken as it is given.
     */
    private function createOneItemRows():void
    {
      application.trace("<" + this + " ListPanelWidget createOneItemRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_ITEM_INDEX());
      itemIndexOBJ = createPotmeter(cellIndex + 1, indexMIN, indexMAX, indexINC);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_START_INDEX());
      startIndexOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_START_INDEX());
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ITEM_OF_INDEX());
      refreshItemOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REFRESH_ITEM());
    }
    /**
     * Builds the row of the selection of the example panel: the three links selecting the
     * item of the index, taking that item out of the selection and dropping the whole
     * selection, and the indexes that are selected at the moment. A panel that has nothing
     * selected answers with one single minus one, and that is what this row displays then.
     */
    private function createSelectionRows():void
    {
      application.trace("<" + this + " ListPanelWidget createSelectionRows> called.", 4);
      // the three links share one cell, so they stand next to each other
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_SELECTION());
      selectOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SELECT());
      deselectOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_DESELECT());
      clearSelectionOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLEAR_SELECTION());
      selectionVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the rules of the selection of the example panel: the multiple
     * selection, the empty one, the event without a change, the number of the displayed
     * elements and the text type of the items. That text type is answered only, so the last
     * of these rows has nothing to change it with.
     */
    private function createRuleRows():void
    {
      application.trace("<" + this + " ListPanelWidget createRuleRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_MULTIPLE());
      multipleOBJ = createSwitcher(cellIndex + 1, false);
      multipleVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAN_BE_EMPTY());
      canBeEmptyOBJ = createSwitcher(cellIndex + 1, false);
      canBeEmptyVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ALWAYS_DISPATCH());
      alwaysDispatchOBJ = createSwitcher(cellIndex + 1, false);
      alwaysDispatchVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_NUM_OF_ELEMENTS());
      numOfElementsOBJ = createPotmeter(cellIndex + 1, elementsMIN, elementsMAX, elementsINC);
      numOfElementsOBJ.setCurValue(elementsINI, false);
      numOfElementsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT_TYPE());
      textTypeVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Puts the first item of the example that is not standing on the example panel yet into
     * the stores of the items. Every label of that panel stays a unique one this way, so the
     * list of it never displays one and the same item twice.
     */
    private function addNextItem():void
    {
      application.trace("<" + this + " ListPanelWidget addNextItem> called.", 4);
      for (var i:int = 0; i < itemLABELS.length; i++)
      {
        if (labelsARR.indexOf(itemLABELS[i]) == -1)
        {
          labelsARR.push(itemLABELS[i]);
          valuesARR.push(itemVALUES[i]);
          iconsARR.push(itemICONS[i]);
          tabcntsARR.push(itemTABCNTS[i]);
          return;
        }
      }
      application.trace("<" + this + " ListPanelWidget addNextItem> every item of the example stands on that panel already.", 3);
    }
    /**
     * Gives the items of the stores to the example panel and selects the items of the given
     * indexes afterwards. Such a panel drops its selection on every one of these calls, so
     * the selection that has survived is handed back right here, silently. The arrays are
     * copied on purpose: a panel keeps the very arrays it is given, so the stores of this
     * widget stay the ones of this widget alone.
     * @param indexesToSelect the indexes of the items to be selected, none of them when it
     *                        is empty
     */
    private function applyItems(indexesToSelect:Array):void
    {
      application.trace("<" + this + " ListPanelWidget applyItems> called.", 4);
      application.trace("<" + this + " ListPanelWidget applyItems> indexesToSelect: " + indexesToSelect, 3);
      exampleListPanel.setArrays(labelsARR.slice(), valuesARR.slice()
        , iconsARR.slice(), tabcntsARR.slice());
      if (indexesToSelect.length > 0)
      {
        exampleListPanel.setSelectedIndexes(indexesToSelect, false);
      }
    }
    /**
     * Returns the indexes that are selected on the example panel, or the one single minus
     * one that panel answers with while nothing at all is selected.
     */
    private function getSelectedIndexesText():String
    {
      application.trace("<" + this + " ListPanelWidget getSelectedIndexesText> called.", 4);
      const indexes:Array = exampleListPanel.getSelectedIndexes();
      const text:String = indexes.join(", ");
      indexes.splice(0);
      return text;
    }
    /**
     * Returns the indexes that are really selected on the example panel: the minus one of
     * the empty selection is taken out, so the caller can add an index to this array and
     * hand the whole selection back. The array belongs to the caller: the panel answers
     * with a copy of the selection of its own.
     */
    private function getSelectedIndexes():Array
    {
      application.trace("<" + this + " ListPanelWidget getSelectedIndexes> called.", 4);
      const indexes:Array = exampleListPanel.getSelectedIndexes();
      const emptyIndex:int = indexes.indexOf(-1);
      if (emptyIndex > -1)
      {
        indexes.splice(emptyIndex, 1);
      }
      return indexes;
    }
    /**
     * Steps the row of the index of one item onto the item that has just been selected on the
     * example panel: the one using this application clicks an item, and every call of one
     * single item works on that very item afterwards. Only an index that was not standing in
     * the selection of the last displaying is followed, so a deselection and a selection made
     * by the rows themselves leave that row exactly where it stands.
     */
    private function followTheSelectedItem():void
    {
      application.trace("<" + this + " ListPanelWidget followTheSelectedItem> called.", 4);
      const indexes:Array = getSelectedIndexes();
      var i:int = 0;
      for (i = 0; i < indexes.length; i++)
      {
        if (selectedARR.indexOf(indexes[i]) == -1)
        {
          itemIndexOBJ.setCurValue(int(indexes[i]), false);
          break;
        }
      }
      selectedARR.splice(0);
      for (i = 0; i < indexes.length; i++)
      {
        selectedARR.push(indexes[i]);
      }
      indexes.splice(0);
    }
    /**
     * Returns the selection of the example panel the way it stands after the item of the
     * given index has been dropped: that item is taken out of it and every index standing
     * behind it steps one place forward, because the items behind a dropped one do exactly
     * that.
     * @param index the index of the item that is being dropped
     */
    private function getSelectedIndexesWithoutItem(index:int):Array
    {
      application.trace("<" + this + " ListPanelWidget getSelectedIndexesWithoutItem> called.", 4);
      application.trace("<" + this + " ListPanelWidget getSelectedIndexesWithoutItem> index: " + index, 3);
      const indexes:Array = getSelectedIndexes();
      const kept:Array = new Array();
      var selected:int = 0;
      for (var i:int = 0; i < indexes.length; i++)
      {
        selected = int(indexes[i]);
        if (selected < index)
        {
          kept.push(selected);
        }
        else if (selected > index)
        {
          kept.push(selected - 1);
        }
      }
      indexes.splice(0);
      return kept;
    }
    /**
     * Returns the code giving the items of the example panel to it: the labels, the values,
     * the icons and the indentations of them, in four arrays of one and the same length.
     * Every one of those arrays is read back from that panel, so an item that has been
     * refreshed is written the way it stands after that refreshing.
     * @param imports the names of the classes collected so far
     */
    private function getItemsCode(imports:Array):String
    {
      application.trace("<" + this + " ListPanelWidget getItemsCode> called.", 4);
      application.trace("<" + this + " ListPanelWidget getItemsCode> imports: " + imports, 3);
      const labels:Array = exampleListPanel.getArrayLabels();
      const values:Array = exampleListPanel.getArrayValues();
      const icons:Array = exampleListPanel.getArrayIcons();
      const tabcnts:Array = exampleListPanel.getArrayTabcnts();
      const labelCodes:Array = new Array();
      const valueCodes:Array = new Array();
      const iconCodes:Array = new Array();
      for (var i:int = 0; i < labels.length; i++)
      {
        labelCodes.push(getTextCode("" + labels[i], imports));
        valueCodes.push("\"" + values[i] + "\"");
        iconCodes.push(getIconCode(icons[i], imports));
      }
      return codeVarName + ".setArrays([" + labelCodes.join(", ") + "]\n"
        + "  , [" + valueCodes.join(", ") + "]\n"
        + "  , [" + iconCodes.join(", ") + "]\n"
        + "  , [" + tabcnts.join(", ") + "]);\n";
    }
    /**
     * Returns the code of the given text: the text key it stands for when it is one of the
     * labels of this application, and the text itself in quotation marks otherwise.
     * @param text the text of one item
     * @param imports the names of the classes collected so far
     */
    private function getTextCode(text:String, imports:Array):String
    {
      application.trace("<" + this + " ListPanelWidget getTextCode> called.", 4);
      application.trace("<" + this + " ListPanelWidget getTextCode> text: " + text, 3);
      application.trace("<" + this + " ListPanelWidget getTextCode> imports: " + imports, 3);
      if (text.charAt(0) == "[" && text.charAt(text.length - 1) == "]")
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        return "EnumTextKeysDemo." + getTextKeyName(text) + "()";
      }
      return "\"" + text + "\"";
    }
    /**
     * Returns the code of the icon of one item, or the empty object of an item that carries
     * no icon at all.
     * @param iconType the icon type of that item
     * @param imports the names of the classes collected so far
     */
    private function getIconCode(iconType:Object, imports:Array):String
    {
      application.trace("<" + this + " ListPanelWidget getIconCode> called.", 4);
      application.trace("<" + this + " ListPanelWidget getIconCode> iconType: " + iconType, 3);
      application.trace("<" + this + " ListPanelWidget getIconCode> imports: " + imports, 3);
      if (iconType == null || iconType == "")
      {
        return "null";
      }
      pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumIcons");
      return "EnumIcons." + iconType + "()";
    }
    /**
     * Returns the code selecting the items of the example panel, or nothing at all when
     * that panel stands with an empty selection. It is a silent selection: the code of an
     * application knows what it has just selected.
     */
    private function getSelectionCode():String
    {
      application.trace("<" + this + " ListPanelWidget getSelectionCode> called.", 4);
      const indexes:Array = getSelectedIndexes();
      var code:String = "";
      if (indexes.length > 0)
      {
        code = codeVarName + ".setSelectedIndexes([" + indexes.join(", ") + "], false);\n";
      }
      indexes.splice(0);
      return code;
    }
    /**
     * Displays every value again after the selection of the example panel has changed: the
     * one using this application can click its items, and every row of it can select them
     * as well.
     * @param e the changed event of that panel
     */
    private function exampleListPanelChanged(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget exampleListPanelChanged> called.", 4);
      application.trace("<" + this + " ListPanelWidget exampleListPanelChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Puts the next item of the example onto the end of the list of the example panel. The
     * selection stays where it is: the new item stands behind every selected one.
     * @param e the click event of that link
     */
    private function addItemClick(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget addItemClick> called.", 4);
      application.trace("<" + this + " ListPanelWidget addItemClick> e: " + e, 3);
      const indexes:Array = getSelectedIndexes();
      addNextItem();
      applyItems(indexes);
      indexes.splice(0);
      displayEveryCurrentValue();
    }
    /**
     * Drops the item of the index of the row of it from the example panel. That item is
     * taken out of the selection as well, and the items standing behind it step one place
     * forward, so every selected index of them is handed back one smaller.
     * @param e the click event of that link
     */
    private function removeItemClick(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget removeItemClick> called.", 4);
      application.trace("<" + this + " ListPanelWidget removeItemClick> e: " + e, 3);
      const index:int = int(itemIndexOBJ.getCurValue());
      if (index < labelsARR.length)
      {
        const indexes:Array = getSelectedIndexesWithoutItem(index);
        labelsARR.splice(index, 1);
        valuesARR.splice(index, 1);
        iconsARR.splice(index, 1);
        tabcntsARR.splice(index, 1);
        applyItems(indexes);
        indexes.splice(0);
      }
      else
      {
        application.trace("<" + this + " ListPanelWidget removeItemClick> there is no item of the index: " + index, 3);
      }
      displayEveryCurrentValue();
    }
    /**
     * Empties the example panel: it is given four arrays of no item at all. Such a panel is
     * as tall as the number of the elements it has really built, so an empty one takes no
     * room besides its own frame.
     * @param e the click event of that link
     */
    private function removeAllItemsClick(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget removeAllItemsClick> called.", 4);
      application.trace("<" + this + " ListPanelWidget removeAllItemsClick> e: " + e, 3);
      labelsARR.splice(0);
      valuesARR.splice(0);
      iconsARR.splice(0);
      tabcntsARR.splice(0);
      applyItems(new Array());
      displayEveryCurrentValue();
    }
    /**
     * Refreshes the item of the index of the row of it: that item is given the label of the
     * example text, the icon and the indentation of the refreshing, and no value at all, so
     * the value it carries stays where it is. The stores of this widget are refreshed the
     * very same way, so the next dataset it hands over carries that item as it stands now.
     * @param e the click event of that link
     */
    private function refreshItemClick(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget refreshItemClick> called.", 4);
      application.trace("<" + this + " ListPanelWidget refreshItemClick> e: " + e, 3);
      const index:int = int(itemIndexOBJ.getCurValue());
      if (index < labelsARR.length)
      {
        labelsARR[index] = EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT();
        iconsARR[index] = refreshICON;
        tabcntsARR[index] = refreshTABCNT;
        exampleListPanel.refreshItem(index, EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT()
          , null, refreshICON, refreshTABCNT);
      }
      else
      {
        application.trace("<" + this + " ListPanelWidget refreshItemClick> there is no item of the index: " + index, 3);
      }
      displayEveryCurrentValue();
    }
    /**
     * Selects the item of the index of the row of it on the example panel, next to the ones
     * that are selected already, and lets its changed event be dispatched: an item that is
     * selected this way is answered by the application the very same way a clicked one is.
     * A panel that holds one single selection keeps the first index of the ones it is given.
     * @param e the click event of that link
     */
    private function selectClick(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget selectClick> called.", 4);
      application.trace("<" + this + " ListPanelWidget selectClick> e: " + e, 3);
      const index:int = int(itemIndexOBJ.getCurValue());
      if (index < labelsARR.length)
      {
        const indexes:Array = getSelectedIndexes();
        if (indexes.indexOf(index) == -1)
        {
          indexes.push(index);
          indexes.sort(Array.NUMERIC);
        }
        exampleListPanel.setSelectedIndexes(indexes);
        indexes.splice(0);
      }
      else
      {
        application.trace("<" + this + " ListPanelWidget selectClick> there is no item of the index: " + index, 3);
      }
      displayEveryCurrentValue();
    }
    /**
     * Takes the item of the index of the row of it out of the selection of the example panel
     * and hands the rest of that selection back. A panel that is not allowed to stand empty
     * keeps its very first item selected instead of standing with no selection at all.
     * @param e the click event of that link
     */
    private function deselectClick(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget deselectClick> called.", 4);
      application.trace("<" + this + " ListPanelWidget deselectClick> e: " + e, 3);
      const indexes:Array = getSelectedIndexes();
      const index:int = indexes.indexOf(int(itemIndexOBJ.getCurValue()));
      if (index > -1)
      {
        indexes.splice(index, 1);
      }
      exampleListPanel.setSelectedIndexes(indexes);
      indexes.splice(0);
      displayEveryCurrentValue();
    }
    /**
     * Drops the whole selection of the example panel. That is a silent call, and it is the
     * one emptying the selection of a panel that is not allowed to stand empty as well: it
     * takes such a panel back to the very state it has been built in.
     * @param e the click event of that link
     */
    private function clearSelectionClick(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget clearSelectionClick> called.", 4);
      application.trace("<" + this + " ListPanelWidget clearSelectionClick> e: " + e, 3);
      exampleListPanel.clearSelectedIndexes();
      displayEveryCurrentValue();
    }
    /**
     * Scrolls the example panel to the item of the index of the row of it: that item becomes
     * the first displayed one. An index that would leave that panel half empty is taken
     * back to the last one it can start at.
     * @param e the click event of that link
     */
    private function startIndexClick(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget startIndexClick> called.", 4);
      application.trace("<" + this + " ListPanelWidget startIndexClick> e: " + e, 3);
      exampleListPanel.setStartIndex(int(itemIndexOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Allows or forbids the selection of more than one item on the example panel. Going back
     * to the single selection keeps the first selected item only, and that panel reports
     * that very change.
     * @param e the changed event of the switcher of that rule
     */
    private function multipleChanged(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget multipleChanged> called.", 4);
      application.trace("<" + this + " ListPanelWidget multipleChanged> e: " + e, 3);
      exampleListPanel.setMultiple(multipleOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Allows or forbids the empty selection on the example panel. Forbidding it while
     * nothing is selected selects the very first item of that panel right away.
     * @param e the changed event of the switcher of that rule
     */
    private function canBeEmptyChanged(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget canBeEmptyChanged> called.", 4);
      application.trace("<" + this + " ListPanelWidget canBeEmptyChanged> e: " + e, 3);
      exampleListPanel.setCanBeEmpty(canBeEmptyOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Tells the example panel whether it has to dispatch its changed event on every click
     * or only when its selection really changes.
     * @param e the changed event of the switcher of that rule
     */
    private function alwaysDispatchChanged(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget alwaysDispatchChanged> called.", 4);
      application.trace("<" + this + " ListPanelWidget alwaysDispatchChanged> e: " + e, 3);
      exampleListPanel.setAlwaysDispatchSelectedEvent(alwaysDispatchOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Gives the new number of the displayed elements to the example panel. That panel never
     * builds more elements than the number of the items it holds, so the value of this row
     * can stay smaller than the number it has just been asked for.
     * @param e the changed event of the potmeter of that number
     */
    private function numOfElementsChanged(e:Event):void
    {
      application.trace("<" + this + " ListPanelWidget numOfElementsChanged> called.", 4);
      application.trace("<" + this + " ListPanelWidget numOfElementsChanged> e: " + e, 3);
      exampleListPanel.setNumOfElements(int(numOfElementsOBJ.getCurValue()));
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
      application.trace("<" + this + " ListPanelWidget destroy> called.", 4);
      application.trace("<" + this + " ListPanelWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " ListPanelWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      itemLABELS.splice(0);
      itemVALUES.splice(0);
      itemICONS.splice(0);
      itemTABCNTS.splice(0);
      labelsARR.splice(0);
      valuesARR.splice(0);
      iconsARR.splice(0);
      tabcntsARR.splice(0);
      selectedARR.splice(0);
      application.trace("<" + this + " ListPanelWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " ListPanelWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      itemLABELS = null;
      itemVALUES = null;
      itemICONS = null;
      itemTABCNTS = null;
      labelsARR = null;
      valuesARR = null;
      iconsARR = null;
      tabcntsARR = null;
      selectedARR = null;
      itemsINI = 0;
      refreshTABCNT = 0;
      refreshICON = null;
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
      exampleListPanel = null;
      addItemOBJ = null;
      removeItemOBJ = null;
      removeAllItemsOBJ = null;
      itemIndexOBJ = null;
      refreshItemOBJ = null;
      selectOBJ = null;
      deselectOBJ = null;
      clearSelectionOBJ = null;
      startIndexOBJ = null;
      multipleOBJ = null;
      canBeEmptyOBJ = null;
      alwaysDispatchOBJ = null;
      numOfElementsOBJ = null;
      itemsVAL = null;
      itemValuesVAL = null;
      itemIconsVAL = null;
      itemTabcntsVAL = null;
      selectionVAL = null;
      multipleVAL = null;
      canBeEmptyVAL = null;
      alwaysDispatchVAL = null;
      numOfElementsVAL = null;
      textTypeVAL = null;
    }
  }
}
