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
 * XmlListerWidget.
 * The widget of the XmlLister component of the framework.
 *
 * MAIN FEATURES:
 * - the tree of an xml, the branches of it can be opened and closed
 * - the example lister stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the xml, of the selected item and of the displaying are built here, every
 *   other one comes from the PropertyWidget base class
 * - the width of that lister comes from the outside and its height from the number of the
 *   elements it displays, so it has a row of a width and no row of a height at all
 * - the row of the xml picks one of the three trees of the example: a tree of folders, a
 *   flat list and an unparsable one, and that last one demonstrates that a broken xml only
 *   empties the list instead of breaking anything
 * - the row of the first displayed item follows that lister on its own: an item that is
 *   opened or closed takes the displaying to itself, so that row can move without anybody
 *   having touched it
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import com.kisscodesystems.KissAs3Fw.ui.XmlLister;
  import flash.events.Event;
  public class XmlListerWidget extends PropertyWidget
  {
    // The three trees of the example. These are the very strings the application walks
    // with, the ones arriving from a server, so they are no labels of any language: the
    // value of an item is the label of the row it is displayed in as well. The last one
    // is a broken xml on purpose: an unparsable tree leaves an empty list behind.
    private var xmlTREE:String = "<items><item value=\"documents\" opened=\"1\">"
      + "<item value=\"holiday\" icon=\"file\"/><item value=\"family\" icon=\"file\"/>"
      + "</item><item value=\"pictures\" opened=\"0\"><item value=\"summer\" icon=\"file\"/>"
      + "<item value=\"winter\" icon=\"file\"/></item><item value=\"music\" icon=\"playing\"/>"
      + "</items>";
    private var xmlFLAT:String = "<items><item value=\"documents\" icon=\"folder\"/>"
      + "<item value=\"pictures\" icon=\"folder\"/><item value=\"music\" icon=\"playing\"/>"
      + "<item value=\"favourites\" icon=\"starfull\"/></items>";
    private var xmlWRONG:String = "<items><item value=\"broken\"></items>";
    // the width the example lister is built with, and the range of the row of it
    private var exampleDw:int = 320;
    private var widthMIN:int = 160;
    private var widthMAX:int = 620;
    private var widthINC:int = 20;
    // the number of the items the example lister displays at the same time, and the range
    // of the row of it
    private var elementsINI:int = 5;
    private var elementsMIN:int = 1;
    private var elementsMAX:int = 10;
    private var elementsINC:int = 1;
    // the range of the row of the item the displaying of that lister starts from
    private var startIndexMIN:int = 0;
    private var startIndexMAX:int = 9;
    private var startIndexINC:int = 1;
    // the example lister: the very object the rows of this widget work on
    private var exampleXmlLister:XmlLister = null;
    // the elements changing the properties of that lister
    private var xmlOBJ:ListPicker = null;
    private var numOfElementsOBJ:Potmeter = null;
    private var startIndexOBJ:Potmeter = null;
    private var setStartIndexOBJ:ButtonLink = null;
    private var alwaysDispatchOBJ:Switcher = null;
    // the labels of the third column: the values the getters of that lister answer
    private var xmlVAL:TextLabel = null;
    private var selectedItemVAL:TextLabel = null;
    private var numOfElementsVAL:TextLabel = null;
    private var startIndexVAL:TextLabel = null;
    private var alwaysDispatchVAL:TextLabel = null;
    private var textTypeVAL:TextLabel = null;
    /**
     * Constructs the widget of the XmlLister component.
     * @param applicationRef the main application reference
     */
    public function XmlListerWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " XmlListerWidget> called.", 4);
      application.trace("<" + this + " XmlListerWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.XMLLISTER();
      headerIcon = EnumIconsDemo.xmllister();
      infoCode = EnumTextKeysDemo.WIDGETINFO_XMLLISTER();
      codeVarName = "xmlLister";
      iniSizeWidth = 770;
      iniSizeHeight = 790;
      application.trace("<" + this + " XmlListerWidget> constructed.", 4);
    }
    /**
     * Builds the example lister of this widget: the one displaying the tree of the example
     * in the width of the example. Its height is left alone on purpose: such a lister takes
     * it from the number of the items it displays at the same time.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " XmlListerWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleXmlLister = new XmlLister(application);
      setExampleElement(exampleXmlLister);
      exampleXmlLister.setDw(exampleDw);
      exampleXmlLister.setNumOfElements(elementsINI);
      exampleXmlLister.setXmlAsString(xmlTREE);
    }
    /**
     * Builds every row of this widget: the ones of the XmlLister component itself and the
     * ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " XmlListerWidget createRows> called.", 4);
      super.createRows();
      createXmlRows();
      createDisplayingRows();
      createWidthRow(widthMIN, widthMAX, widthINC);
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * lister as well: that lister dispatches its changed event every time another leaf item
     * has been selected on it, and the opening and the closing of the branches walked
     * through to reach that item report nothing at all.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " XmlListerWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleXmlLister.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleXmlListerChanged);
      xmlOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), xmlChanged);
      numOfElementsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), numOfElementsChanged);
      setStartIndexOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), setStartIndexClick);
      alwaysDispatchOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), alwaysDispatchChanged);
    }
    /**
     * Displays the current value of every property of the example lister. The number of the
     * displayed items is the one that has really been built: such a lister never builds more
     * elements than the number of the items it holds, so this row can answer with a smaller
     * number than it has been asked for. The first displayed item is read again here as
     * well, because that lister takes the displaying to the item that has just been opened
     * or closed, without this widget having asked for it.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " XmlListerWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      xmlVAL.setLabel(getShortTextOrNone(exampleXmlLister.getXmlAsString()));
      selectedItemVAL.setLabel(getTextOrNone(exampleXmlLister.getSelectedItem()));
      numOfElementsVAL.setLabel("" + exampleXmlLister.getNumOfElements());
      startIndexVAL.setLabel("" + exampleXmlLister.getStartIndex());
      alwaysDispatchVAL.setLabel(getYesNoKey(exampleXmlLister.getAlwaysDispatchSelectedEvent()));
      textTypeVAL.setLabel(exampleXmlLister.getTextType());
    }
    /**
     * Returns the code writing the example lister the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new lister. The number of the displayed items is the only one
     * read back from its own row, because the getter of it answers with the number of the
     * elements that have really been built, and every class the code below names is
     * collected into the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " XmlListerWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("XmlLister", imports);
      code += codeVarName + ".setNumOfElements(" + int(numOfElementsOBJ.getCurValue()) + ");\n";
      if (exampleXmlLister.getAlwaysDispatchSelectedEvent())
      {
        code += codeVarName + ".setAlwaysDispatchSelectedEvent(true);\n";
      }
      code += getSpritePropertiesCode(imports);
      // the tree closes this code: the items of such a lister have to be walked with every
      // rule of the displaying standing ready already
      code += codeVarName + ".setXmlAsString(" + getXmlCode() + ");\n";
      if (exampleXmlLister.getStartIndex() > 0)
      {
        code += codeVarName + ".setStartIndex(" + exampleXmlLister.getStartIndex() + ");\n";
      }
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the tree of the example lister: the xml it is walked from and the
     * item that has been selected on it. The row of the xml displays the very string that
     * lister has been given, the unparsable one included, and the row of the selected item
     * stays empty until a leaf item has been clicked on: a branch item only opens and closes
     * and it is never selected.
     */
    private function createXmlRows():void
    {
      application.trace("<" + this + " XmlListerWidget createXmlRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_XML());
      xmlOBJ = createListPicker(cellIndex + 1
          , [EnumTextKeysDemo.WIDGET_VALUE_XML_TREE(), EnumTextKeysDemo.WIDGET_VALUE_XML_FLAT()
            , EnumTextKeysDemo.WIDGET_VALUE_XML_WRONG()]
          , [xmlTREE, xmlFLAT, xmlWRONG]);
      xmlOBJ.setSelectedIndex(0, false);
      xmlVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SELECTED_ITEM());
      selectedItemVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the displaying of the example lister: the number of the items that
     * stand under each other at the same time, the item the displaying starts from and the
     * rule of the changed event. The potmeter of that item asks for a first item and the
     * value next to it tells the one that lister really starts from: an item that has been
     * opened or closed takes the displaying to itself.
     */
    private function createDisplayingRows():void
    {
      application.trace("<" + this + " XmlListerWidget createDisplayingRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_NUM_OF_ELEMENTS());
      numOfElementsOBJ = createPotmeter(cellIndex + 1, elementsMIN, elementsMAX, elementsINC);
      numOfElementsOBJ.setCurValue(elementsINI, false);
      numOfElementsVAL = createValueLabel(cellIndex + 2);
      // the potmeter of the index and the link scrolling to it share one cell, so they
      // stand next to each other
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_START_INDEX());
      startIndexOBJ = createPotmeter(cellIndex + 1, startIndexMIN, startIndexMAX, startIndexINC);
      setStartIndexOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_START_INDEX());
      startIndexVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ALWAYS_DISPATCH());
      alwaysDispatchOBJ = createSwitcher(cellIndex + 1, false);
      alwaysDispatchVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT_TYPE());
      textTypeVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the code of the xml the example lister has been given the last time: that xml
     * in quotation marks, with the quotation marks and the line breaks of its own escaped,
     * so that the answered line can be pasted into a source file as it is.
     */
    private function getXmlCode():String
    {
      application.trace("<" + this + " XmlListerWidget getXmlCode> called.", 4);
      return "\"" + exampleXmlLister.getXmlAsString().split("\"").join("\\\"")
        .split("\r").join("").split("\n").join("\\n") + "\"";
    }
    /**
     * Displays every value again after another leaf item has been selected on the example
     * lister.
     * @param e the changed event of that lister
     */
    private function exampleXmlListerChanged(e:Event):void
    {
      application.trace("<" + this + " XmlListerWidget exampleXmlListerChanged> called.", 4);
      application.trace("<" + this + " XmlListerWidget exampleXmlListerChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the picked tree to the example lister.
     * @param e the changed event of the picker of the trees
     */
    private function xmlChanged(e:Event):void
    {
      application.trace("<" + this + " XmlListerWidget xmlChanged> called.", 4);
      application.trace("<" + this + " XmlListerWidget xmlChanged> e: " + e, 3);
      exampleXmlLister.setXmlAsString(xmlOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Gives the new number of the displayed items to the example lister.
     * @param e the changed event of the potmeter of that number
     */
    private function numOfElementsChanged(e:Event):void
    {
      application.trace("<" + this + " XmlListerWidget numOfElementsChanged> called.", 4);
      application.trace("<" + this + " XmlListerWidget numOfElementsChanged> e: " + e, 3);
      exampleXmlLister.setNumOfElements(int(numOfElementsOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Scrolls the example lister to the item of the index of the row above.
     * @param e the click event of that link
     */
    private function setStartIndexClick(e:Event):void
    {
      application.trace("<" + this + " XmlListerWidget setStartIndexClick> called.", 4);
      application.trace("<" + this + " XmlListerWidget setStartIndexClick> e: " + e, 3);
      exampleXmlLister.setStartIndex(int(startIndexOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Tells the example lister whether every selection has to be reported, or only the one
     * really changing the selected leaf item.
     * @param e the changed event of the switcher of that rule
     */
    private function alwaysDispatchChanged(e:Event):void
    {
      application.trace("<" + this + " XmlListerWidget alwaysDispatchChanged> called.", 4);
      application.trace("<" + this + " XmlListerWidget alwaysDispatchChanged> e: " + e, 3);
      exampleXmlLister.setAlwaysDispatchSelectedEvent(alwaysDispatchOBJ.getOn());
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
      application.trace("<" + this + " XmlListerWidget destroy> called.", 4);
      application.trace("<" + this + " XmlListerWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " XmlListerWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " XmlListerWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " XmlListerWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      xmlTREE = null;
      xmlFLAT = null;
      xmlWRONG = null;
      exampleDw = 0;
      widthMIN = 0;
      widthMAX = 0;
      widthINC = 0;
      elementsINI = 0;
      elementsMIN = 0;
      elementsMAX = 0;
      elementsINC = 0;
      startIndexMIN = 0;
      startIndexMAX = 0;
      startIndexINC = 0;
      exampleXmlLister = null;
      xmlOBJ = null;
      numOfElementsOBJ = null;
      startIndexOBJ = null;
      setStartIndexOBJ = null;
      alwaysDispatchOBJ = null;
      xmlVAL = null;
      selectedItemVAL = null;
      numOfElementsVAL = null;
      startIndexVAL = null;
      alwaysDispatchVAL = null;
      textTypeVAL = null;
    }
  }
}
