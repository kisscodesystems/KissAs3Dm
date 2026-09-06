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
 * MoreWidget.
 * The widget of the More component of the framework.
 *
 * MAIN FEATURES:
 * - an openable panel that displays the elements of it one by one, on demand
 * - the example panel stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the label of its button, of the open state and of the elements standing in
 *   it are built here, every other one comes from the PropertyWidget base class
 * - the dimensions of that panel come from its own label while it is closed and from its
 *   elements while it is open, so it has no row of a width and no row of a height at all
 * - the elements of that panel are the links of the example, built one by one by the row
 *   of them: a link that is taken out of the panel is destroyed as well, because the panel
 *   only drops the elements it has been given and never frees any one of them up
 * - that panel counts its own elements and answers every one of them, so this widget keeps
 *   no store of them at all: the links stand where they have been put
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextKeys;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.More;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class MoreWidget extends PropertyWidget
  {
    // the labels and the icons of the links of the example: the row of the elements puts
    // the next one of them into the example panel
    private var elementLABELS:Array = null;
    private var elementICONS:Array = null;
    // the number of the links the example panel is built with
    private var elementsINI:int = 3;
    // the example panel: the very object the rows of this widget work on
    private var exampleMore:More = null;
    // the elements changing the properties of that panel
    private var labelOBJ:TextInput = null;
    private var iconOBJ:ListPicker = null;
    private var openOBJ:ButtonLink = null;
    private var closeOBJ:ButtonLink = null;
    private var addElementOBJ:ButtonLink = null;
    private var removeElementOBJ:ButtonLink = null;
    private var removeAllElementsOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that panel answer
    private var labelVAL:TextLabel = null;
    private var iconVAL:TextLabel = null;
    private var labelObjectVAL:TextLabel = null;
    private var openedVAL:TextLabel = null;
    private var elementsVAL:TextLabel = null;
    /**
     * Constructs the widget of the More component.
     * @param applicationRef the main application reference
     */
    public function MoreWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " MoreWidget> called.", 4);
      application.trace("<" + this + " MoreWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.MORE();
      headerIcon = EnumIcons.more();
      infoCode = EnumTextKeysDemo.WIDGETINFO_MORE();
      codeVarName = "more";
      iniSizeWidth = 770;
      iniSizeHeight = 700;
      elementLABELS = [EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_0(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_1()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_2(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_3()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_4(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_5()];
      elementICONS = [EnumIcons.folder(), EnumIcons.folder(), EnumIcons.file()
        , EnumIcons.file(), EnumIcons.playing(), EnumIcons.starfull()];
      application.trace("<" + this + " MoreWidget> constructed.", 4);
    }
    /**
     * Builds the example panel of this widget: the one holding the first links of the
     * example, closed the way such a panel is put onto a screen. Its dimensions are left
     * alone on purpose: such a panel takes them from its own label and from its elements.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " MoreWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleMore = new More(application);
      setExampleElement(exampleMore);
      for (var i:int = 0; i < elementsINI; i++)
      {
        addNextElement();
      }
    }
    /**
     * Builds every row of this widget: the ones of the More component itself and the ones
     * the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " MoreWidget createRows> called.", 4);
      super.createRows();
      createLabelRows();
      createPanelRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * panel as well: that panel dispatches its opened and closed events every time it is
     * opened and closed, and the button of it, a mouse press outside of it and the escape
     * key can do both of those instead of the two links of the row of them.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " MoreWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleMore.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), exampleMoreChanged);
      exampleMore.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), exampleMoreChanged);
      labelOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelChanged);
      iconOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), iconChanged);
      openOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), openClick);
      closeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), closeClick);
      addElementOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), addElementClick);
      removeElementOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), removeElementClick);
      removeAllElementsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), removeAllElementsClick);
    }
    /**
     * Displays the current value of every property of the example panel.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " MoreWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      labelVAL.setLabel(getTextOrNone(exampleMore.getTextLabel().getLabel()));
      iconVAL.setLabel(getTextOrNone(exampleMore.getTextLabel().getIconType()));
      labelObjectVAL.setLabel(exampleMore.getTextLabel().getDw()
        + " x " + exampleMore.getTextLabel().getDh());
      openedVAL.setLabel(getYesNoKey(exampleMore.isOpened()));
      elementsVAL.setLabel(getElementsText());
    }
    /**
     * Returns the code writing the example panel the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new panel. Every link standing in that panel is written out as
     * well, because such a panel holds the elements of the application around it and builds
     * none of them itself, and every class the code below names is collected into the
     * imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " MoreWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("More", imports);
      if (exampleMore.getTextLabel().getLabel() != EnumTextKeys.MORE())
      {
        code += codeVarName + ".getTextLabel().setLabel(" + getLabelCode(imports) + ");\n";
      }
      if (exampleMore.getTextLabel().getIconType() != EnumIcons.more())
      {
        code += codeVarName + ".getTextLabel()." + getIconCode(imports) + ";\n";
      }
      code += getElementsCode(imports);
      code += getSpritePropertiesCode(imports);
      // the opening closes this code: the elements of such a panel have to stand in it
      // already before it is worth being opened at all
      if (exampleMore.isOpened())
      {
        code += codeVarName + ".open();\n";
      }
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the button of the example panel: the text of it, the icon standing
     * in front of that text and the label object holding the two of them. That object is an
     * object of the panel itself, so the row of it has nothing to change it with and it
     * displays the dimensions of it, the very ones the closed panel stands with.
     */
    private function createLabelRows():void
    {
      application.trace("<" + this + " MoreWidget createLabelRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL());
      labelOBJ = createTextInput(cellIndex + 1);
      labelVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON());
      iconOBJ = createListPicker(cellIndex + 1
          , [EnumTextKeysDemo.WIDGET_VALUE_NONE(), EnumIcons.more(), EnumIcons.settings()
            , EnumIcons.list(), EnumIcons.folder(), EnumIcons.starfull()]
          , ["", EnumIcons.more(), EnumIcons.settings()
            , EnumIcons.list(), EnumIcons.folder(), EnumIcons.starfull()]
          , [null, EnumIcons.more(), EnumIcons.settings()
            , EnumIcons.list(), EnumIcons.folder(), EnumIcons.starfull()]);
      // the second item is the icon a brand new panel stands with
      iconOBJ.setSelectedIndex(1, false);
      iconVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL_OBJECT());
      labelObjectVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the panel of the example: the open state of it and the elements
     * standing in it. The three links of the elements put the next link of the example into
     * that panel, take the last one out of it and empty it as a whole, and the value of that
     * row tells how many of them stand in it and what they are.
     */
    private function createPanelRows():void
    {
      application.trace("<" + this + " MoreWidget createPanelRows> called.", 4);
      // the links of one row share one cell, so they stand next to each other
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_OPENED());
      openOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_OPEN());
      closeOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLOSE());
      openedVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_PANEL_ELEMENTS());
      addElementOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_ADD_ELEMENT());
      removeElementOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REMOVE_ELEMENT());
      removeAllElementsOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REMOVE_ALL_ELEMENTS());
      elementsVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the next link of the example and puts it into the example panel. Nothing is
     * done at all when every link of the example stands in that panel already.
     */
    private function addNextElement():void
    {
      application.trace("<" + this + " MoreWidget addNextElement> called.", 4);
      const index:int = exampleMore.getNumOfElements();
      if (index >= elementLABELS.length)
      {
        application.trace("<" + this + " MoreWidget addNextElement> every link of the example stands in the panel already.", 3);
        return;
      }
      const buttonLink:ButtonLink = new ButtonLink(application);
      buttonLink.setLabel(elementLABELS[index]);
      buttonLink.setIcon(elementICONS[index]);
      exampleMore.addToContent(buttonLink);
    }
    /**
     * Takes the link that has been put into the example panel the last time out of it and
     * frees it up. Such a panel only drops the element it is told to drop and never
     * destroys any one of them, because it has built none of them either, so the one that
     * has built this link is the one that has to free it up as well.
     */
    private function removeLastElement():void
    {
      application.trace("<" + this + " MoreWidget removeLastElement> called.", 4);
      const index:int = exampleMore.getNumOfElements() - 1;
      if (index < 0)
      {
        application.trace("<" + this + " MoreWidget removeLastElement> the panel stands empty already.", 3);
        return;
      }
      const buttonLink:ButtonLink = ButtonLink(exampleMore.getElementAt(index));
      // the destroying comes first: that link still stands on the stage here, and the panel
      // takes a destroyed element out of itself just as well as a living one
      buttonLink.destroy();
      exampleMore.removeFromContent(buttonLink);
    }
    /**
     * Returns the links standing in the example panel, one label per link, or the text key
     * of the empty value when that panel stands empty.
     */
    private function getElementsText():String
    {
      application.trace("<" + this + " MoreWidget getElementsText> called.", 4);
      var text:String = "";
      for (var i:int = 0; i < exampleMore.getNumOfElements(); i++)
      {
        text += (i > 0 ? ", " : "") + ButtonLink(exampleMore.getElementAt(i)).getLabel();
      }
      return getShortTextOrNone(text);
    }
    /**
     * Returns the code of the text of the button of the example panel: the text key of the
     * example item when one of those is displayed, and the text itself in quotation marks
     * otherwise.
     * @param imports the names of the classes collected so far
     */
    private function getLabelCode(imports:Array):String
    {
      application.trace("<" + this + " MoreWidget getLabelCode> called.", 4);
      application.trace("<" + this + " MoreWidget getLabelCode> imports: " + imports, 3);
      const label:String = exampleMore.getTextLabel().getLabel();
      if (elementLABELS.indexOf(label) > -1)
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        return "EnumTextKeysDemo." + getTextKeyName(label) + "()";
      }
      return "\"" + label + "\"";
    }
    /**
     * Returns the call giving the leading slot of the button of the example panel the icon
     * it carries at the moment, or the one freeing that slot up when it carries none.
     * @param imports the names of the classes collected so far
     */
    private function getIconCode(imports:Array):String
    {
      application.trace("<" + this + " MoreWidget getIconCode> called.", 4);
      application.trace("<" + this + " MoreWidget getIconCode> imports: " + imports, 3);
      const iconType:String = exampleMore.getTextLabel().getIconType();
      if (iconType == "")
      {
        return "destIcon()";
      }
      pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumIcons");
      return "setIcon(EnumIcons." + iconType + "())";
    }
    /**
     * Returns the code of the links standing in the example panel: the lines building every
     * one of them and the ones putting them into that panel.
     * @param imports the names of the classes collected so far
     */
    private function getElementsCode(imports:Array):String
    {
      application.trace("<" + this + " MoreWidget getElementsCode> called.", 4);
      application.trace("<" + this + " MoreWidget getElementsCode> imports: " + imports, 3);
      if (exampleMore.getNumOfElements() == 0)
      {
        return "";
      }
      pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
      pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumIcons");
      pushImport(imports, "com.kisscodesystems.KissAs3Fw.ui.ButtonLink");
      var code:String = "";
      var name:String = "";
      for (var i:int = 0; i < exampleMore.getNumOfElements(); i++)
      {
        name = "buttonLink" + i;
        code += "const " + name + ":ButtonLink = new ButtonLink(application);\n"
          + name + ".setLabel(EnumTextKeysDemo." + getTextKeyName(elementLABELS[i]) + "());\n"
          + name + ".setIcon(EnumIcons." + elementICONS[i] + "());\n"
          + codeVarName + ".addToContent(" + name + ");\n";
      }
      return code;
    }
    /**
     * Displays every value again after the example panel has been opened or closed by the
     * button of it, by a mouse press outside of it or by the escape key.
     * @param e the opened or closed event of that panel
     */
    private function exampleMoreChanged(e:Event):void
    {
      application.trace("<" + this + " MoreWidget exampleMoreChanged> called.", 4);
      application.trace("<" + this + " MoreWidget exampleMoreChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the text of the input of the label row to the button of the example panel.
     * @param e the changed event of that input
     */
    private function labelChanged(e:Event):void
    {
      application.trace("<" + this + " MoreWidget labelChanged> called.", 4);
      application.trace("<" + this + " MoreWidget labelChanged> e: " + e, 3);
      exampleMore.getTextLabel().setLabel(labelOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked icon to the button of the example panel, or frees the leading slot
     * of it up when the empty item has been picked.
     * @param e the changed event of the picker of the icons
     */
    private function iconChanged(e:Event):void
    {
      application.trace("<" + this + " MoreWidget iconChanged> called.", 4);
      application.trace("<" + this + " MoreWidget iconChanged> e: " + e, 3);
      const iconType:String = iconOBJ.getSelectedValue();
      if (iconType == "")
      {
        exampleMore.getTextLabel().destIcon();
      }
      else
      {
        exampleMore.getTextLabel().setIcon(iconType);
      }
      displayEveryCurrentValue();
    }
    /**
     * Opens the example panel.
     * @param e the click event of that link
     */
    private function openClick(e:Event):void
    {
      application.trace("<" + this + " MoreWidget openClick> called.", 4);
      application.trace("<" + this + " MoreWidget openClick> e: " + e, 3);
      exampleMore.open();
      displayEveryCurrentValue();
    }
    /**
     * Closes the example panel.
     * @param e the click event of that link
     */
    private function closeClick(e:Event):void
    {
      application.trace("<" + this + " MoreWidget closeClick> called.", 4);
      application.trace("<" + this + " MoreWidget closeClick> e: " + e, 3);
      exampleMore.close();
      displayEveryCurrentValue();
    }
    /**
     * Puts the next link of the example into the example panel.
     * @param e the click event of that link
     */
    private function addElementClick(e:Event):void
    {
      application.trace("<" + this + " MoreWidget addElementClick> called.", 4);
      application.trace("<" + this + " MoreWidget addElementClick> e: " + e, 3);
      addNextElement();
      displayEveryCurrentValue();
    }
    /**
     * Takes the last link of the example panel out of it.
     * @param e the click event of that link
     */
    private function removeElementClick(e:Event):void
    {
      application.trace("<" + this + " MoreWidget removeElementClick> called.", 4);
      application.trace("<" + this + " MoreWidget removeElementClick> e: " + e, 3);
      removeLastElement();
      displayEveryCurrentValue();
    }
    /**
     * Takes every link of the example panel out of it.
     * @param e the click event of that link
     */
    private function removeAllElementsClick(e:Event):void
    {
      application.trace("<" + this + " MoreWidget removeAllElementsClick> called.", 4);
      application.trace("<" + this + " MoreWidget removeAllElementsClick> e: " + e, 3);
      while (exampleMore.getNumOfElements() > 0)
      {
        removeLastElement();
      }
      displayEveryCurrentValue();
    }
    /**
     * Destroys this object and frees up everything. Every element of this widget stands
     * in the content of it, and that content is destroyed by the super destroy below, so
     * the references of them are only cleared here. The links of the example panel stand
     * in that panel, so they are freed up together with it. The listeners registered above
     * are the ones of those very elements, so they are freed up together with them.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " MoreWidget destroy> called.", 4);
      application.trace("<" + this + " MoreWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " MoreWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      elementLABELS.splice(0);
      elementICONS.splice(0);
      application.trace("<" + this + " MoreWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " MoreWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      elementLABELS = null;
      elementICONS = null;
      elementsINI = 0;
      exampleMore = null;
      labelOBJ = null;
      iconOBJ = null;
      openOBJ = null;
      closeOBJ = null;
      addElementOBJ = null;
      removeElementOBJ = null;
      removeAllElementsOBJ = null;
      labelVAL = null;
      iconVAL = null;
      labelObjectVAL = null;
      openedVAL = null;
      elementsVAL = null;
    }
  }
}
