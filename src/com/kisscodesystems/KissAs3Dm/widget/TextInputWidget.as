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
 * TextInputWidget.
 * The widget of the TextInput component of the framework.
 *
 * MAIN FEATURES:
 * - one line of editable text with a hint, a delete button and a list of hits
 * - the example input stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the text, of the typing and of the auto completion are built here, every
 *   other one comes from the PropertyWidget base class
 * - the width of that input comes from the outside and its height from its own text
 *   field, so it has a row of a width and no row of a height at all
 * - the row of the dimensions of the base class demonstrates a call doing nothing there:
 *   such an input drops every height it is given
 * - the hint, the password flag, the case of the letters, the characters that can be typed
 *   and the two ends of the length have no getter at all, so the code of the current state
 *   reads every one of them back from the element of its own row
 * - the row of the case of the letters holds one single link that turns the text of that
 *   input to upper case and then back to lower case, so the label of it always tells what
 *   the next click on it does
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
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class TextInputWidget extends PropertyWidget
  {
    // the restrictions the picker of the characters offers, the very strings a flash text
    // field takes: the empty one of the first item takes every character
    private var restrictNONE:String = "";
    private var restrictLETTERS:String = "a-zA-Z ";
    private var restrictDIGITS:String = "0-9";
    private var restrictLETTERSDIGITS:String = "a-zA-Z0-9 ";
    // the range of the two rows of the length of the text: a maximum of zero means that
    // the text of that input can grow as long as it is typed to be
    private var minCharsMIN:int = 0;
    private var minCharsMAX:int = 40;
    private var minCharsINC:int = 1;
    private var maxCharsMIN:int = 0;
    private var maxCharsMAX:int = 200;
    private var maxCharsINC:int = 10;
    // the width the example input is built with, and the range of the row of it
    private var exampleDw:int = 320;
    private var widthMIN:int = 160;
    private var widthMAX:int = 700;
    private var widthINC:int = 20;
    // The dataset the auto completion of the example input starts with and the string the
    // elements of it are separated by. These are the very data of a demo and not a text
    // that is read, so they are no labels of any language.
    private var autoCompleteELEMENTS:String = "anna,bela,cecil,daniel,eszter,ferenc,gabor,helga,istvan,julia";
    private var autoCompleteSEPARATOR:String = ",";
    // the example input: the very object the rows of this widget work on
    private var exampleTextInput:TextInput = null;
    // the elements changing the properties of that input
    private var labelOBJ:TextInput = null;
    private var hintOBJ:TextInput = null;
    private var passwordOBJ:Switcher = null;
    private var toCaseOBJ:ButtonLink = null;
    private var restrictOBJ:ListPicker = null;
    private var minCharsOBJ:Potmeter = null;
    private var maxCharsOBJ:Potmeter = null;
    private var autoCompleteOBJ:TextInput = null;
    private var toFocusOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that input answer
    private var textVAL:TextLabel = null;
    private var longEnoughVAL:TextLabel = null;
    private var focusVAL:TextLabel = null;
    // The hint of that input, the dataset of its auto completion and the case call it has
    // been asked for last. None of these is answered by that input, so the code of the
    // current state is written from these very stores. The two cases exclude each other:
    // a text that has been turned to upper case is turned to lower case by the next click.
    private var hintText:String = "";
    private var autoCompleteText:String = "";
    private var textToUpperCase:Boolean = false;
    private var textToLowerCase:Boolean = false;
    /**
     * Constructs the widget of the TextInput component.
     * @param applicationRef the main application reference
     */
    public function TextInputWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " TextInputWidget> called.", 4);
      application.trace("<" + this + " TextInputWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.TEXTINPUT();
      headerIcon = EnumIconsDemo.textinput();
      infoCode = EnumTextKeysDemo.WIDGETINFO_TEXTINPUT();
      codeVarName = "textInput";
      iniSizeWidth = 770;
      iniSizeHeight = 720;
      application.trace("<" + this + " TextInputWidget> constructed.", 4);
    }
    /**
     * Builds the example input of this widget: an empty one carrying the hint of the
     * example and the dataset of the auto completion, so both of those features are seen
     * from the very first moment. Its height is left alone on purpose: such an input takes
     * it from its own text field and from the open list of the completion.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " TextInputWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleTextInput = new TextInput(application);
      setExampleElement(exampleTextInput);
      exampleTextInput.setDw(exampleDw);
      hintText = EnumTextKeysDemo.WIDGET_EXAMPLE_HINT();
      exampleTextInput.setHint(hintText);
      autoCompleteText = autoCompleteELEMENTS;
      exampleTextInput.addAutoCompleteElements(autoCompleteText, autoCompleteSEPARATOR);
    }
    /**
     * Builds every row of this widget: the ones of the text, of the typing and of the auto
     * completion, and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " TextInputWidget createRows> called.", 4);
      super.createRows();
      createTextRows();
      createTypingRows();
      createCompletionRows();
      createWidthRow(widthMIN, widthMAX, widthINC);
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * input as well: that input dispatches its changed event when the editing of it has
     * been finished, so the text that has been typed and the element that has been picked
     * from the list of the completion both arrive here.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " TextInputWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleTextInput.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleTextInputChanged);
      labelOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelChanged);
      hintOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), hintChanged);
      passwordOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), passwordChanged);
      toCaseOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), toCaseClick);
      restrictOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), restrictChanged);
      minCharsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), minCharsChanged);
      maxCharsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), maxCharsChanged);
      autoCompleteOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), autoCompleteChanged);
      toFocusOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), toFocusClick);
    }
    /**
     * Displays the current value of every property of the example input.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " TextInputWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      textVAL.setLabel(getShortTextOrNone(exampleTextInput.getText()));
      longEnoughVAL.setLabel(getYesNoKey(exampleTextInput.getTextIsAtLeastLength()));
      focusVAL.setLabel(getYesNoKey(exampleTextInput.isInFocus()));
    }
    /**
     * Returns the code writing the example input the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new input. The properties that have no getter at all are read
     * back from the elements changing them, and every class the code below names is
     * collected into the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " TextInputWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("TextInput", imports);
      if (exampleTextInput.getText() != "")
      {
        code += codeVarName + ".setLabel(\"" + exampleTextInput.getText() + "\");\n";
      }
      if (hintText != "")
      {
        code += codeVarName + ".setHint(" + getHintCode(imports) + ");\n";
      }
      if (passwordOBJ.getOn())
      {
        code += codeVarName + ".setDisplayAsPassword(true);\n";
      }
      if (textToUpperCase)
      {
        code += codeVarName + ".setTextToUpperCase();\n";
      }
      else if (textToLowerCase)
      {
        code += codeVarName + ".setTextToLowerCase();\n";
      }
      if (restrictOBJ.getSelectedValue() != restrictNONE)
      {
        code += codeVarName + ".setRestrict(\"" + restrictOBJ.getSelectedValue() + "\");\n";
      }
      const minChars:int = int(minCharsOBJ.getCurValue());
      if (minChars > 0)
      {
        code += codeVarName + ".setMinChars(" + minChars + ");\n";
      }
      const maxChars:int = int(maxCharsOBJ.getCurValue());
      if (maxChars > 0)
      {
        code += codeVarName + ".setMaxChars(" + maxChars + ");\n";
      }
      if (autoCompleteText != "")
      {
        code += codeVarName + ".addAutoCompleteElements(\"" + autoCompleteText
          + "\", \"" + autoCompleteSEPARATOR + "\");\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the text of the example input: the text itself and the hint
     * standing in it while it is empty. An empty hint frees that hint up as a whole, so
     * an input carrying none of it displays nothing at all.
     */
    private function createTextRows():void
    {
      application.trace("<" + this + " TextInputWidget createTextRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL());
      labelOBJ = createTextInput(cellIndex + 1);
      textVAL = createValueLabel(cellIndex + 2);
      // the hint has no getter at all, so this row displays nothing
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_HINT());
      hintOBJ = createTextInput(cellIndex + 1);
      hintOBJ.setLabel(hintText);
    }
    /**
     * Builds the rows of the typing of the example input: the password flag, the upper
     * case, the characters that can be typed and the two ends of the length of the text.
     * The row telling whether that length has been reached stands between the two of them.
     */
    private function createTypingRows():void
    {
      application.trace("<" + this + " TextInputWidget createTypingRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_PASSWORD());
      passwordOBJ = createSwitcher(cellIndex + 1, false);
      // the case of the letters is a call and not a property, and that input answers
      // nothing about it, so the label of this link is the one telling which way the next
      // click on it converts the text
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LETTER_CASE());
      toCaseOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_TO_UPPER_CASE());
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_RESTRICT());
      restrictOBJ = createListPicker(cellIndex + 1
          , [EnumTextKeysDemo.WIDGET_VALUE_NONE(), EnumTextKeysDemo.WIDGET_VALUE_LETTERS()
            , EnumTextKeysDemo.WIDGET_VALUE_DIGITS(), EnumTextKeysDemo.WIDGET_VALUE_LETTERS_DIGITS()]
          , [restrictNONE, restrictLETTERS, restrictDIGITS, restrictLETTERSDIGITS]);
      restrictOBJ.setSelectedIndex(0, false);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MIN_CHARS());
      minCharsOBJ = createPotmeter(cellIndex + 1, minCharsMIN, minCharsMAX, minCharsINC);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LONG_ENOUGH());
      longEnoughVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MAX_CHARS());
      maxCharsOBJ = createPotmeter(cellIndex + 1, maxCharsMIN, maxCharsMAX, maxCharsINC);
    }
    /**
     * Builds the rows of the auto completion and of the focus of the example input. The
     * dataset of that completion is one single string of separated elements, so it is
     * typed into an input of that very form, and an empty one turns the feature off.
     */
    private function createCompletionRows():void
    {
      application.trace("<" + this + " TextInputWidget createCompletionRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_AUTO_COMPLETE());
      autoCompleteOBJ = createTextInput(cellIndex + 1);
      autoCompleteOBJ.setLabel(autoCompleteText);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_FOCUS());
      toFocusOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_TO_FOCUS());
      focusVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the code of the hint of the example input: the text key of the example hint
     * when that one is displayed, and the hint itself in quotation marks otherwise.
     * @param imports the names of the classes collected so far
     */
    private function getHintCode(imports:Array):String
    {
      application.trace("<" + this + " TextInputWidget getHintCode> called.", 4);
      application.trace("<" + this + " TextInputWidget getHintCode> imports: " + imports, 3);
      if (hintText == EnumTextKeysDemo.WIDGET_EXAMPLE_HINT())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        return "EnumTextKeysDemo." + getTextKeyName(hintText) + "()";
      }
      return "\"" + hintText + "\"";
    }
    /**
     * Displays every value again after the editing of the example input has been finished:
     * the text that has been typed into it, or the element that has been picked from the
     * list of the completion, is the one every row of that text answers by.
     * @param e the changed event of that input
     */
    private function exampleTextInputChanged(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget exampleTextInputChanged> called.", 4);
      application.trace("<" + this + " TextInputWidget exampleTextInputChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the text of the input of the label row to the example input.
     * @param e the changed event of that input
     */
    private function labelChanged(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget labelChanged> called.", 4);
      application.trace("<" + this + " TextInputWidget labelChanged> e: " + e, 3);
      exampleTextInput.setLabel(labelOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Gives the text of the input of the hint row to the example input as its hint, or
     * frees that hint up as a whole when that row has been emptied.
     * @param e the changed event of that input
     */
    private function hintChanged(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget hintChanged> called.", 4);
      application.trace("<" + this + " TextInputWidget hintChanged> e: " + e, 3);
      hintText = hintOBJ.getText();
      if (hintText == "")
      {
        exampleTextInput.clearHint();
      }
      else
      {
        exampleTextInput.setHint(hintText);
      }
      displayEveryCurrentValue();
    }
    /**
     * Displays the text of the example input as a password or as a plain text.
     * @param e the changed event of the switcher of the password flag
     */
    private function passwordChanged(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget passwordChanged> called.", 4);
      application.trace("<" + this + " TextInputWidget passwordChanged> e: " + e, 3);
      exampleTextInput.setDisplayAsPassword(passwordOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Turns the text of the example input to upper case, and to lower case on the next
     * click: both of these calls convert the text standing in that input at the moment, so
     * this link goes back and forth between the two of them and the label of it always
     * tells which way it converts that text next.
     * @param e the click event of that link
     */
    private function toCaseClick(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget toCaseClick> called.", 4);
      application.trace("<" + this + " TextInputWidget toCaseClick> e: " + e, 3);
      if (textToUpperCase)
      {
        textToUpperCase = false;
        textToLowerCase = true;
        exampleTextInput.setTextToLowerCase();
        toCaseOBJ.setLabel(EnumTextKeysDemo.WIDGET_ACTION_TO_UPPER_CASE());
      }
      else
      {
        textToUpperCase = true;
        textToLowerCase = false;
        exampleTextInput.setTextToUpperCase();
        toCaseOBJ.setLabel(EnumTextKeysDemo.WIDGET_ACTION_TO_LOWER_CASE());
      }
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked restriction to the example input: the characters that are left out
     * of it can not be typed into that input at all.
     * @param e the changed event of the picker of the characters
     */
    private function restrictChanged(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget restrictChanged> called.", 4);
      application.trace("<" + this + " TextInputWidget restrictChanged> e: " + e, 3);
      exampleTextInput.setRestrict(restrictOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Gives the new minimal length to the example input: the row under this one tells
     * whether the text standing in it has reached that length already.
     * @param e the changed event of the potmeter of the minimal length
     */
    private function minCharsChanged(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget minCharsChanged> called.", 4);
      application.trace("<" + this + " TextInputWidget minCharsChanged> e: " + e, 3);
      exampleTextInput.setMinChars(int(minCharsOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Gives the new maximal length to the example input. A maximum of zero takes that
     * limit away: the text can grow as long as it is typed to be.
     * @param e the changed event of the potmeter of the maximal length
     */
    private function maxCharsChanged(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget maxCharsChanged> called.", 4);
      application.trace("<" + this + " TextInputWidget maxCharsChanged> e: " + e, 3);
      exampleTextInput.setMaxChars(int(maxCharsOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Gives the typed dataset to the auto completion of the example input, or turns that
     * feature off when the row of it has been emptied. The whole previous dataset is
     * dropped either way: this call replaces it and adds nothing to it.
     * @param e the changed event of the input of the dataset
     */
    private function autoCompleteChanged(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget autoCompleteChanged> called.", 4);
      application.trace("<" + this + " TextInputWidget autoCompleteChanged> e: " + e, 3);
      autoCompleteText = autoCompleteOBJ.getText();
      if (autoCompleteText == "")
      {
        exampleTextInput.addAutoCompleteElements(null, null);
      }
      else
      {
        exampleTextInput.addAutoCompleteElements(autoCompleteText, autoCompleteSEPARATOR);
      }
      displayEveryCurrentValue();
    }
    /**
     * Moves the focus of the application into the example input, so the fields of a form
     * can be walked through without any click at all.
     * @param e the click event of that link
     */
    private function toFocusClick(e:Event):void
    {
      application.trace("<" + this + " TextInputWidget toFocusClick> called.", 4);
      application.trace("<" + this + " TextInputWidget toFocusClick> e: " + e, 3);
      exampleTextInput.toFocus();
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
      application.trace("<" + this + " TextInputWidget destroy> called.", 4);
      application.trace("<" + this + " TextInputWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " TextInputWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " TextInputWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " TextInputWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      restrictNONE = null;
      restrictLETTERS = null;
      restrictDIGITS = null;
      restrictLETTERSDIGITS = null;
      minCharsMIN = 0;
      minCharsMAX = 0;
      minCharsINC = 0;
      maxCharsMIN = 0;
      maxCharsMAX = 0;
      maxCharsINC = 0;
      exampleDw = 0;
      widthMIN = 0;
      widthMAX = 0;
      widthINC = 0;
      autoCompleteELEMENTS = null;
      autoCompleteSEPARATOR = null;
      exampleTextInput = null;
      labelOBJ = null;
      hintOBJ = null;
      passwordOBJ = null;
      toCaseOBJ = null;
      restrictOBJ = null;
      minCharsOBJ = null;
      maxCharsOBJ = null;
      autoCompleteOBJ = null;
      toFocusOBJ = null;
      textVAL = null;
      longEnoughVAL = null;
      focusVAL = null;
      hintText = null;
      autoCompleteText = null;
      textToUpperCase = false;
      textToLowerCase = false;
    }
  }
}
