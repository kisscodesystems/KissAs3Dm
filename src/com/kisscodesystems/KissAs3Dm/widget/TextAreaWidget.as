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
 * TextAreaWidget.
 * The widget of the TextArea component of the framework.
 *
 * MAIN FEATURES:
 * - an editable field of several lines of text
 * - the TextArea component is a TextBox that can be written into as well, so this widget
 *   extends the one of that box and only adds the rows of the editing to it
 * - the characters that can be typed, the minimal and the maximal length of the text and
 *   the focus of the editor are the rows built here
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
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.TextArea;
  import com.kisscodesystems.KissAs3Fw.ui.TextBox;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class TextAreaWidget extends TextBoxWidget
  {
    // the restrictions the picker of the characters offers, the very strings a flash text
    // field takes: the empty one of the first item takes every character
    private var restrictNONE:String = "";
    private var restrictLETTERS:String = "a-zA-Z ";
    private var restrictDIGITS:String = "0-9";
    private var restrictLETTERSDIGITS:String = "a-zA-Z0-9 ";
    // the range of the two rows of the length of the text: a maximum of zero means that
    // the text of that area can grow as long as it is typed to be
    private var minCharsMIN:int = 0;
    private var minCharsMAX:int = 40;
    private var minCharsINC:int = 1;
    private var maxCharsMIN:int = 0;
    private var maxCharsMAX:int = 400;
    private var maxCharsINC:int = 10;
    // the example area: the very same object as the example box of the widget this one
    // extends, held by its own class here to take the calls of the editing as well
    private var exampleTextArea:TextArea = null;
    // the elements changing the properties of the editing
    private var restrictOBJ:ListPicker = null;
    private var minCharsOBJ:Potmeter = null;
    private var maxCharsOBJ:Potmeter = null;
    private var toFocusOBJ:ButtonLink = null;
    // the label of the third column: the value the getter of that area answers
    private var longEnoughVAL:TextLabel = null;
    /**
     * Constructs the widget of the TextArea component.
     * @param applicationRef the main application reference
     */
    public function TextAreaWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " TextAreaWidget> called.", 4);
      application.trace("<" + this + " TextAreaWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.TEXTAREA();
      headerIcon = EnumIconsDemo.textarea();
      infoCode = EnumTextKeysDemo.WIDGETINFO_TEXTAREA();
      codeVarName = "textArea";
      exampleClassName = "TextArea";
      // a brand new area wraps its text and it is painted with the mid text type of the
      // appearance, so the code of the current state writes neither of these two setters
      wordWrapByDefault = true;
      textTypeByDefault = EnumTextTypes.TEXT_TYPE_MID();
      iniSizeWidth = 770;
      iniSizeHeight = 810;
      application.trace("<" + this + " TextAreaWidget> constructed.", 4);
    }
    /**
     * Builds the very component this widget demonstrates: an area that both displays and
     * takes a long text. It is held by its own class as well, so the rows of the editing
     * can reach the calls the box it extends does not have.
     */
    override protected function createExampleTextBox():TextBox
    {
      application.trace("<" + this + " TextAreaWidget createExampleTextBox> called.", 4);
      exampleTextArea = new TextArea(application);
      return exampleTextArea;
    }
    /**
     * Builds the rows of the editing of the example area: the text it holds at the moment,
     * the characters that can be typed into it, the two ends of the length of that text
     * and the focus of its editor.
     */
    override protected function createEditorRows():void
    {
      application.trace("<" + this + " TextAreaWidget createEditorRows> called.", 4);
      super.createEditorRows();
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_RESTRICT());
      restrictOBJ = createListPicker(cellIndex + 1
          , [EnumTextKeysDemo.WIDGET_VALUE_NONE(), EnumTextKeysDemo.WIDGET_VALUE_LETTERS()
            , EnumTextKeysDemo.WIDGET_VALUE_DIGITS(), EnumTextKeysDemo.WIDGET_VALUE_LETTERS_DIGITS()]
          , [restrictNONE, restrictLETTERS, restrictDIGITS, restrictLETTERSDIGITS]);
      restrictOBJ.setSelectedIndex(0, false);
      // the two ends of the length have no getter at all, so these two rows display
      // nothing: the one telling whether that length has been reached stands between them
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MIN_CHARS());
      minCharsOBJ = createPotmeter(cellIndex + 1, minCharsMIN, minCharsMAX, minCharsINC);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LONG_ENOUGH());
      longEnoughVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MAX_CHARS());
      maxCharsOBJ = createPotmeter(cellIndex + 1, maxCharsMIN, maxCharsMAX, maxCharsINC);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_FOCUS());
      toFocusOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_TO_FOCUS());
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * area as well: that area dispatches its changed event when the editing of it has been
     * finished, so the text that has been typed arrives here in one single report.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " TextAreaWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleTextArea.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleTextAreaChanged);
      restrictOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), restrictChanged);
      minCharsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), minCharsChanged);
      maxCharsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), maxCharsChanged);
      toFocusOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), toFocusClick);
    }
    /**
     * Displays the current value of every property of the example area.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " TextAreaWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      longEnoughVAL.setLabel(getYesNoKey(exampleTextArea.getTextIsAtLeastLength()));
    }
    /**
     * Returns the code of the editing of the example area: the characters that can be
     * typed into it and the two ends of the length of its text. None of these three is
     * answered by that area, so every one of them is read back from its own element.
     * @param imports the names of the classes collected so far
     */
    override protected function getEditorCode(imports:Array):String
    {
      application.trace("<" + this + " TextAreaWidget getEditorCode> called.", 4);
      application.trace("<" + this + " TextAreaWidget getEditorCode> imports: " + imports, 3);
      var code:String = super.getEditorCode(imports);
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
      return code;
    }
    /**
     * Displays every value again after the editing of the example area has been finished:
     * the text that has been typed into it is the one every row of that text answers by.
     * @param e the changed event of that area
     */
    private function exampleTextAreaChanged(e:Event):void
    {
      application.trace("<" + this + " TextAreaWidget exampleTextAreaChanged> called.", 4);
      application.trace("<" + this + " TextAreaWidget exampleTextAreaChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the picked restriction to the example area: the characters that are left out
     * of it can not be typed into that area at all.
     * @param e the changed event of the picker of the characters
     */
    private function restrictChanged(e:Event):void
    {
      application.trace("<" + this + " TextAreaWidget restrictChanged> called.", 4);
      application.trace("<" + this + " TextAreaWidget restrictChanged> e: " + e, 3);
      exampleTextArea.setRestrict(restrictOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Gives the new minimal length to the example area: the row under this one tells
     * whether the text standing in it has reached that length already.
     * @param e the changed event of the potmeter of the minimal length
     */
    private function minCharsChanged(e:Event):void
    {
      application.trace("<" + this + " TextAreaWidget minCharsChanged> called.", 4);
      application.trace("<" + this + " TextAreaWidget minCharsChanged> e: " + e, 3);
      exampleTextArea.setMinChars(int(minCharsOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Gives the new maximal length to the example area. A maximum of zero takes that
     * limit away: the text can grow as long as it is typed to be.
     * @param e the changed event of the potmeter of the maximal length
     */
    private function maxCharsChanged(e:Event):void
    {
      application.trace("<" + this + " TextAreaWidget maxCharsChanged> called.", 4);
      application.trace("<" + this + " TextAreaWidget maxCharsChanged> e: " + e, 3);
      exampleTextArea.setMaxChars(int(maxCharsOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Opens the editor of the example area and gives the focus to it, the way a click on
     * that area does, so the fields of a form can be walked through without any click.
     * @param e the click event of that link
     */
    private function toFocusClick(e:Event):void
    {
      application.trace("<" + this + " TextAreaWidget toFocusClick> called.", 4);
      application.trace("<" + this + " TextAreaWidget toFocusClick> e: " + e, 3);
      exampleTextArea.toFocus();
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
      application.trace("<" + this + " TextAreaWidget destroy> called.", 4);
      application.trace("<" + this + " TextAreaWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " TextAreaWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " TextAreaWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " TextAreaWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
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
      exampleTextArea = null;
      restrictOBJ = null;
      minCharsOBJ = null;
      maxCharsOBJ = null;
      toFocusOBJ = null;
      longEnoughVAL = null;
    }
  }
}
