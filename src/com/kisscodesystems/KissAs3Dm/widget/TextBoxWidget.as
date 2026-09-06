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
 * TextBoxWidget.
 * The widget of the TextBox component of the framework.
 *
 * MAIN FEATURES:
 * - a scrollable and read only box of several lines of text, plain or html
 * - the example box stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the text, of the wrapping and of the scrolling are built here, every
 *   other one comes from the PropertyWidget base class
 * - the dimensions of that box come from the outside, so it has a row of a width and a
 *   row of a height of its own
 * - the text code that box has been written with and the text it displays at the moment
 *   are two rows of their own: an appended text and a text key that is looked up are the
 *   two reasons of those two answering something else than each other
 * - the texts that have been appended to that box are collected here: that box answers
 *   the whole text of it and not the appendings one by one, so the code of the current
 *   state writes them from this very store, one line per text
 * - the TextArea component of the framework is a TextBox that can be written into as
 *   well, so the widget of it extends this one and adds the rows of the editing
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextBox;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class TextBoxWidget extends PropertyWidget
  {
    // the name of the class of the example box: the extender of this widget demonstrates
    // another one, and the code of the current state writes the name it is given here
    protected var exampleClassName:String = "TextBox";
    // The wrapping and the text type a brand new box of that class stands with. A TextBox
    // takes the wrapping of a plain flash text field, which is switched off, and the
    // bright text type of the appearance, and the code of the current state writes these
    // two setters only when the example box has been given something else.
    protected var wordWrapByDefault:Boolean = false;
    protected var textTypeByDefault:String = EnumTextTypes.TEXT_TYPE_BRIGHT();
    // the dimensions the example box is built with, and the range of the two rows of them
    protected var exampleDw:int = 520;
    protected var exampleDh:int = 160;
    protected var widthMIN:int = 160;
    protected var widthMAX:int = 700;
    protected var widthINC:int = 20;
    protected var heightMIN:int = 60;
    protected var heightMAX:int = 400;
    protected var heightINC:int = 20;
    // the example box: the very object the rows of this widget work on
    protected var exampleTextBox:TextBox = null;
    // the elements changing the properties of that box
    private var labelOBJ:ListPicker = null;
    private var appendTextOBJ:TextInput = null;
    private var htmlOBJ:Switcher = null;
    private var textTypeOBJ:ListPicker = null;
    private var wordWrapOBJ:Switcher = null;
    private var resizableOBJ:Switcher = null;
    private var toBottomOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that box answer
    private var labelVAL:TextLabel = null;
    private var textVAL:TextLabel = null;
    private var htmlVAL:TextLabel = null;
    private var textTypeVAL:TextLabel = null;
    private var wordWrapVAL:TextLabel = null;
    private var resizableVAL:TextLabel = null;
    private var scrollingVAL:TextLabel = null;
    private var atBottomVAL:TextLabel = null;
    // The texts that have been appended to the example box, in the order they have
    // arrived in. That box does not answer its own text at all, so this is the only store
    // the code of the current state can write those appendings from. A text set by the row
    // of the label replaces the whole text of that box, so it empties this store as well.
    private var appendedTextsARR:Array = null;
    /**
     * Constructs the widget of the TextBox component.
     * @param applicationRef the main application reference
     */
    public function TextBoxWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " TextBoxWidget> called.", 4);
      application.trace("<" + this + " TextBoxWidget> applicationRef: " + applicationRef, 3);
      appendedTextsARR = new Array();
      headerCode = EnumWidgetsDemo.TEXTBOX();
      headerIcon = EnumIconsDemo.textbox();
      infoCode = EnumTextKeysDemo.WIDGETINFO_TEXTBOX();
      codeVarName = "textBox";
      iniSizeWidth = 770;
      iniSizeHeight = 750;
      application.trace("<" + this + " TextBoxWidget> constructed.", 4);
    }
    /**
     * Builds the example box of this widget: it takes the dimensions of the two rows of
     * them and the example text of several paragraphs, so it has something to scroll from
     * the very first moment. The wrapping is switched on: a text of paragraphs is read
     * inside the width of the box and not scrolled sideways for every single line of it.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " TextBoxWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleTextBox = createExampleTextBox();
      setExampleElement(exampleTextBox);
      exampleTextBox.setDwh(exampleDw, exampleDh);
      exampleTextBox.setWordWrap(true);
      exampleTextBox.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT_LONG());
    }
    /**
     * Builds the very component this widget demonstrates. The extender of this widget
     * overrides this and answers the box of the class of its own.
     */
    protected function createExampleTextBox():TextBox
    {
      application.trace("<" + this + " TextBoxWidget createExampleTextBox> called.", 4);
      return new TextBox(application);
    }
    /**
     * Builds every row of this widget: the ones of the text, of the wrapping and of the
     * scrolling, the ones of the editing when the extender of this widget brings them, and
     * the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " TextBoxWidget createRows> called.", 4);
      super.createRows();
      createTextRows();
      createEditorRows();
      createScrollRows();
      createWidthRow(widthMIN, widthMAX, widthINC);
      createHeightRow(heightMIN, heightMAX, heightINC);
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Builds the rows of the editing of the example box. A TextBox takes no typing at all,
     * so there is nothing to build here: the extender of this widget overrides this and
     * builds the rows the editor of it brings.
     */
    protected function createEditorRows():void
    {
      application.trace("<" + this + " TextBoxWidget createEditorRows> called.", 4);
      application.trace("<" + this + " TextBoxWidget createEditorRows> a TextBox takes no typing, so it has no row of an editor at all.", 3);
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * box as well: that box forwards the top reached and the bottom reached events of its
     * own scroll, and the one using this application reaches both of those ends by hand.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " TextBoxWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleTextBox.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_TOP_REACHED(), exampleTextBoxScrolled);
      exampleTextBox.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_BOTTOM_REACHED(), exampleTextBoxScrolled);
      labelOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelChanged);
      appendTextOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), appendTextChanged);
      htmlOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), htmlChanged);
      textTypeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), textTypeChanged);
      wordWrapOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), wordWrapChanged);
      resizableOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), resizableChanged);
      toBottomOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), toBottomClick);
    }
    /**
     * Displays the current value of every property of the example box.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " TextBoxWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      labelVAL.setLabel(getShortTextOrNone(exampleTextBox.getLabel()));
      textVAL.setLabel(getShortTextOrNone(exampleTextBox.getText()));
      htmlVAL.setLabel(getYesNoKey(exampleTextBox.getHtml()));
      textTypeVAL.setLabel(exampleTextBox.getType());
      wordWrapVAL.setLabel(getYesNoKey(exampleTextBox.getWordWrap()));
      resizableVAL.setLabel(getYesNoKey(exampleTextBox.getResizable()));
      scrollingVAL.setLabel(getYesNoKey(exampleTextBox.getScrolling()));
      atBottomVAL.setLabel(getYesNoKey(exampleTextBox.getAtBottom()));
    }
    /**
     * Returns the code writing the example box the way it stands at the moment: the import
     * lines it needs, an empty line, and the lines of the properties that are not the ones
     * of a brand new box. The properties that have no getter at all are read back from the
     * elements changing them, and every class the code below names is collected into the
     * imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " TextBoxWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode(exampleClassName, imports);
      if (exampleTextBox.getLabel() != "")
      {
        code += codeVarName + ".setLabel(" + getLabelCode(imports) + ");\n";
      }
      code += getAppendedTextsCode();
      if (exampleTextBox.getHtml())
      {
        code += codeVarName + ".setHtml(true);\n";
      }
      if (exampleTextBox.getType() != textTypeByDefault)
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes");
        code += codeVarName + ".setType(EnumTextTypes." + getTextKeyName(exampleTextBox.getType()) + "());\n";
      }
      if (exampleTextBox.getWordWrap() != wordWrapByDefault)
      {
        code += codeVarName + ".setWordWrap(" + exampleTextBox.getWordWrap() + ");\n";
      }
      if (exampleTextBox.getResizable())
      {
        code += codeVarName + ".setResizable(true);\n";
      }
      code += getEditorCode(imports);
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Returns the code of the editing of the example box. A TextBox takes no typing at
     * all, so there is nothing to write here: the extender of this widget overrides this
     * and writes the lines the editor of it needs.
     * @param imports the names of the classes collected so far
     */
    protected function getEditorCode(imports:Array):String
    {
      application.trace("<" + this + " TextBoxWidget getEditorCode> called.", 4);
      application.trace("<" + this + " TextBoxWidget getEditorCode> imports: " + imports, 3);
      return "";
    }
    /**
     * Builds the rows of the text of the example box: the text itself, the text that is
     * appended to it, the html flag and the text type. A TextBox answers none of these
     * four, so every one of them is a row of a name and an element only.
     */
    private function createTextRows():void
    {
      application.trace("<" + this + " TextBoxWidget createTextRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL());
      labelOBJ = createListPicker(cellIndex + 1
          , [EnumTextKeysDemo.WIDGET_VALUE_NONE(), EnumTextKeysDemo.WIDGET_VALUE_TEXT_SHORT()
            , EnumTextKeysDemo.WIDGET_VALUE_TEXT_LONG(), EnumTextKeysDemo.WIDGET_VALUE_TEXT_HTML()]
          , ["", EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT()
            , EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT_LONG(), EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT_HTML()]);
      labelOBJ.setSelectedIndex(2, false);
      labelVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_APPEND_TEXT());
      appendTextOBJ = createTextInput(cellIndex + 1);
      // the text of the box is written by the two rows above it, so this one displays the
      // text that stands in it at the moment and changes nothing at all
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT());
      textVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_HTML());
      htmlOBJ = createSwitcher(cellIndex + 1, false);
      htmlVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT_TYPE());
      textTypeOBJ = createListPicker(cellIndex + 1
          , application.getLabelManager().getKeysTextTypes()
          , application.getLabelManager().getKeysTextTypes());
      textTypeOBJ.setSelectedIndex(application.getLabelManager().getKeysTextTypes().indexOf(textTypeByDefault), false);
      textTypeVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the wrapping and of the scrolling of the example box: the
     * wrapping itself, the resizing by hand, the scrolling that is going on at the moment
     * and the very bottom of the text.
     */
    private function createScrollRows():void
    {
      application.trace("<" + this + " TextBoxWidget createScrollRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_WORD_WRAP());
      wordWrapOBJ = createSwitcher(cellIndex + 1, true);
      wordWrapVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_RESIZABLE());
      resizableOBJ = createSwitcher(cellIndex + 1, false);
      resizableVAL = createValueLabel(cellIndex + 2);
      // the scrolling is going on while the one using this application is dragging the
      // text, so this row has nothing to start it with
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SCROLLING());
      scrollingVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_AT_BOTTOM());
      toBottomOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_TO_BOTTOM());
      atBottomVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the code of the text of the example box: the text key that box answers,
     * which is the key of one of the example texts, because that is the only text such a
     * box can be given from a row of this widget.
     * @param imports the names of the classes collected so far
     */
    private function getLabelCode(imports:Array):String
    {
      application.trace("<" + this + " TextBoxWidget getLabelCode> called.", 4);
      application.trace("<" + this + " TextBoxWidget getLabelCode> imports: " + imports, 3);
      pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
      return "EnumTextKeysDemo." + getTextKeyName(exampleTextBox.getLabel()) + "()";
    }
    /**
     * Returns the code of the texts that have been appended to the example box, one line
     * per text, in the very order they have arrived in.
     */
    private function getAppendedTextsCode():String
    {
      application.trace("<" + this + " TextBoxWidget getAppendedTextsCode> called.", 4);
      var code:String = "";
      for (var i:int = 0; i < appendedTextsARR.length; i++)
      {
        code += codeVarName + ".appendText(\"" + appendedTextsARR[i] + "\");\n";
      }
      return code;
    }
    /**
     * Gives the picked text to the example box, or empties it when the empty item has been
     * picked. A text of this kind replaces the whole text of that box, so the texts that
     * have been appended to the previous one are gone with it.
     * @param e the changed event of the picker of the texts
     */
    private function labelChanged(e:Event):void
    {
      application.trace("<" + this + " TextBoxWidget labelChanged> called.", 4);
      application.trace("<" + this + " TextBoxWidget labelChanged> e: " + e, 3);
      appendedTextsARR.splice(0);
      exampleTextBox.setLabel(labelOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Appends the text of the input of the appending row to the end of the text of the
     * example box and stores it, so the code of the current state can write it as well.
     * @param e the changed event of that input
     */
    private function appendTextChanged(e:Event):void
    {
      application.trace("<" + this + " TextBoxWidget appendTextChanged> called.", 4);
      application.trace("<" + this + " TextBoxWidget appendTextChanged> e: " + e, 3);
      const textToAppend:String = appendTextOBJ.getText();
      if (textToAppend == "")
      {
        application.trace("<" + this + " TextBoxWidget appendTextChanged> there is nothing to append.", 3);
        return;
      }
      appendedTextsARR.push(textToAppend);
      exampleTextBox.appendText(textToAppend);
      displayEveryCurrentValue();
    }
    /**
     * Displays the text of the example box as a html one or as a plain one.
     * @param e the changed event of the switcher of the html flag
     */
    private function htmlChanged(e:Event):void
    {
      application.trace("<" + this + " TextBoxWidget htmlChanged> called.", 4);
      application.trace("<" + this + " TextBoxWidget htmlChanged> e: " + e, 3);
      exampleTextBox.setHtml(htmlOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked text type to the example box.
     * @param e the changed event of the picker of the text types
     */
    private function textTypeChanged(e:Event):void
    {
      application.trace("<" + this + " TextBoxWidget textTypeChanged> called.", 4);
      application.trace("<" + this + " TextBoxWidget textTypeChanged> e: " + e, 3);
      exampleTextBox.setType(textTypeOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Switches the wrapping of the text of the example box. A box that does not wrap its
     * text is scrolled horizontally as well, and the box itself is the one telling its own
     * scroll about it.
     * @param e the changed event of the switcher of the wrapping
     */
    private function wordWrapChanged(e:Event):void
    {
      application.trace("<" + this + " TextBoxWidget wordWrapChanged> called.", 4);
      application.trace("<" + this + " TextBoxWidget wordWrapChanged> e: " + e, 3);
      exampleTextBox.setWordWrap(wordWrapOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Allows or forbids the resizing of the example box by the one using this application.
     * A box that is resized by hand takes new dimensions of its own, so the two rows of
     * them follow that resizing.
     * @param e the changed event of the switcher of the resizing
     */
    private function resizableChanged(e:Event):void
    {
      application.trace("<" + this + " TextBoxWidget resizableChanged> called.", 4);
      application.trace("<" + this + " TextBoxWidget resizableChanged> e: " + e, 3);
      exampleTextBox.setResizable(resizableOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Scrolls the text of the example box down to its very bottom.
     * @param e the click event of that link
     */
    private function toBottomClick(e:Event):void
    {
      application.trace("<" + this + " TextBoxWidget toBottomClick> called.", 4);
      application.trace("<" + this + " TextBoxWidget toBottomClick> e: " + e, 3);
      exampleTextBox.toBottom();
      displayEveryCurrentValue();
    }
    /**
     * Takes the event of the end of the text the example box has just reached: that box
     * forwards the top reached and the bottom reached events of its own scroll, so the
     * arrival at either end of the text is reported by the row of the last event.
     * @param e the top reached or bottom reached event of that box
     */
    private function exampleTextBoxScrolled(e:Event):void
    {
      application.trace("<" + this + " TextBoxWidget exampleTextBoxScrolled> called.", 4);
      application.trace("<" + this + " TextBoxWidget exampleTextBoxScrolled> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Destroys this object and frees up everything. Every element of this widget stands
     * in the content of it, and that content is destroyed by the super destroy below, so
     * the references of them are only cleared here. The listeners registered above are
     * the ones of those very elements, so they are freed up together with them.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " TextBoxWidget destroy> called.", 4);
      application.trace("<" + this + " TextBoxWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " TextBoxWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      appendedTextsARR.splice(0);
      application.trace("<" + this + " TextBoxWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " TextBoxWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      exampleClassName = null;
      wordWrapByDefault = false;
      textTypeByDefault = null;
      exampleDw = 0;
      exampleDh = 0;
      widthMIN = 0;
      widthMAX = 0;
      widthINC = 0;
      heightMIN = 0;
      heightMAX = 0;
      heightINC = 0;
      exampleTextBox = null;
      labelOBJ = null;
      appendTextOBJ = null;
      htmlOBJ = null;
      textTypeOBJ = null;
      wordWrapOBJ = null;
      resizableOBJ = null;
      toBottomOBJ = null;
      labelVAL = null;
      textVAL = null;
      htmlVAL = null;
      textTypeVAL = null;
      wordWrapVAL = null;
      resizableVAL = null;
      scrollingVAL = null;
      atBottomVAL = null;
      appendedTextsARR = null;
    }
  }
}
