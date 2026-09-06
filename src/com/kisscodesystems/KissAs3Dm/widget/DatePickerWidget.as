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
 * DatePickerWidget.
 * The widget of the DatePicker component of the framework.
 *
 * MAIN FEATURES:
 * - a button displaying the selected date, with a date panel opening under it
 * - the example picker stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the date and of the open state are built here, every other one comes from
 *   the PropertyWidget base class
 * - the width of that picker comes from the outside and its height from its own label, so
 *   it has a row of a width and no row of a height at all
 * - the date is typed into the input of its own row, in the very format the getter of that
 *   date answers in, and an empty input means the current date: such a picker takes the
 *   current one for every date it is not given
 * - the format of the displayed date is handed over to the panel of that picker, and
 *   switching the hours and the minutes on rewrites that format, so the row of it follows
 *   that switch
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.DatePicker;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class DatePickerWidget extends PropertyWidget
  {
    // Two date time patterns of their own the picker of the format offers on top of the
    // ones the appearance of the application carries. These are patterns the application
    // thinks in and no texts that are read, so they are no labels of any language.
    private var dateFormatDAY:String = "dd/MM/yyyy";
    private var dateFormatLONG:String = "EEEE, MMMM d, yyyy";
    // the width the example picker is built with, and the range of the row of it
    private var exampleDw:int = 260;
    private var widthMIN:int = 140;
    private var widthMAX:int = 520;
    private var widthINC:int = 20;
    // the example picker: the very object the rows of this widget work on
    private var exampleDatePicker:DatePicker = null;
    // the elements changing the properties of that picker
    private var selectedDateOBJ:TextInput = null;
    private var dateFormatOBJ:ListPicker = null;
    private var hoursAndMinutesOBJ:Switcher = null;
    private var openOBJ:ButtonLink = null;
    private var closeOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that picker answer
    private var selectedDateVAL:TextLabel = null;
    private var selectedDateObjectVAL:TextLabel = null;
    private var displayedDateVAL:TextLabel = null;
    private var textVAL:TextLabel = null;
    private var dateFormatVAL:TextLabel = null;
    private var hoursAndMinutesVAL:TextLabel = null;
    private var openedVAL:TextLabel = null;
    /**
     * Constructs the widget of the DatePicker component.
     * @param applicationRef the main application reference
     */
    public function DatePickerWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " DatePickerWidget> called.", 4);
      application.trace("<" + this + " DatePickerWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.DATEPICKER();
      headerIcon = EnumIconsDemo.pickers();
      infoCode = EnumTextKeysDemo.WIDGETINFO_DATEPICKER();
      codeVarName = "datePicker";
      iniSizeWidth = 770;
      iniSizeHeight = 770;
      application.trace("<" + this + " DatePickerWidget> constructed.", 4);
    }
    /**
     * Builds the example picker of this widget: the one standing on the current date, in
     * the width of the example. Its height is left alone on purpose: such a picker takes it
     * from its own label while it is closed and from its panel while it is open.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " DatePickerWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleDatePicker = new DatePicker(application);
      setExampleElement(exampleDatePicker);
      exampleDatePicker.setDw(exampleDw);
    }
    /**
     * Builds every row of this widget: the ones of the date, of the time and of the open
     * state of the example picker, and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " DatePickerWidget createRows> called.", 4);
      super.createRows();
      createDateRows();
      createFormatRows();
      createTimeRows();
      createOpenRows();
      createWidthRow(widthMIN, widthMAX, widthINC);
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * picker as well: that picker dispatches its changed event on every selection, the one
     * of the row of the date among them, and its opened and closed events when its panel is
     * opened and closed.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " DatePickerWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleDatePicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleDatePickerChanged);
      exampleDatePicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), exampleDatePickerChanged);
      exampleDatePicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), exampleDatePickerChanged);
      selectedDateOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), selectedDateChanged);
      dateFormatOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), dateFormatChanged);
      hoursAndMinutesOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), hoursAndMinutesChanged);
      openOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), openClick);
      closeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), closeClick);
    }
    /**
     * Displays the current value of every property of the example picker. The picker of the
     * format follows the pattern that picker writes its date by: switching the hours and the
     * minutes on or off rewrites that pattern, so it is not always the picked one.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " DatePickerWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      selectedDateVAL.setLabel(exampleDatePicker.getSelectedDate());
      selectedDateObjectVAL.setLabel(getShortTextOrNone("" + exampleDatePicker.getSelectedDateObject()));
      displayedDateVAL.setLabel(getTextOrNone(exampleDatePicker.getDisplayedDate()));
      textVAL.setLabel(getTextOrNone(exampleDatePicker.getText()));
      dateFormatVAL.setLabel(exampleDatePicker.getDateFormat());
      hoursAndMinutesVAL.setLabel(getYesNoKey(exampleDatePicker.getHoursAndMinutes()));
      openedVAL.setLabel(getYesNoKey(exampleDatePicker.isOpened()));
      const formatIndex:int = dateFormatOBJ.getArrayValues().indexOf(exampleDatePicker.getDateFormat());
      if (formatIndex > -1)
      {
        dateFormatOBJ.setSelectedIndex(formatIndex, false);
      }
    }
    /**
     * Returns the code writing the example picker the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new picker. Every class the code below names is collected into
     * the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " DatePickerWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("DatePicker", imports);
      // the time comes first on purpose: the hours and the minutes of a date are only taken
      // by such a picker while those two are the selectable ones
      if (exampleDatePicker.getHoursAndMinutes())
      {
        code += codeVarName + ".setHoursAndMinutes(true);\n";
      }
      // the format comes after that switch on purpose: switching the time on rewrites the
      // format of the date, so a format of its own has to be given after it and not before
      if (exampleDatePicker.getDateFormat() != getDateFormatOfANewPicker())
      {
        code += codeVarName + ".setDateFormat(\"" + exampleDatePicker.getDateFormat() + "\");\n";
      }
      if (!selectedDateIsTheOneOfANewPicker())
      {
        code += codeVarName + ".setSelectedDate(" + getSelectedDateCode() + ");\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the date of the example picker: the selected date itself, the date
     * object of it, the date the label of that picker stands with and the text that label
     * displays. That date object is answered as a copy of its own, so the row of it can
     * display it as it is, and the three rows under the date have nothing to change it with:
     * every one of them is answered by that picker alone.
     */
    private function createDateRows():void
    {
      application.trace("<" + this + " DatePickerWidget createDateRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_SELECTED_DATE());
      selectedDateOBJ = createTextInput(cellIndex + 1);
      selectedDateVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SELECTED_DATE_OBJECT());
      selectedDateObjectVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_DISPLAYED_DATE());
      displayedDateVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT());
      textVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the format of the displayed date: the two patterns of the appearance
     * of the application, the one of the seconds among them, and two more of this widget.
     * These are date time patterns and no texts that are read, so the items of that picker
     * display the very patterns they stand for.
     */
    private function createFormatRows():void
    {
      application.trace("<" + this + " DatePickerWidget createFormatRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_DATE_FORMAT());
      dateFormatOBJ = createListPicker(cellIndex + 1, getDateFormats(), getDateFormats());
      dateFormatVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the time of the example picker: the hours and the minutes it lets
     * be selected. Switching those on extends the format of the displayed date by the time
     * as well, so the row of that format answers with another pattern right away.
     */
    private function createTimeRows():void
    {
      application.trace("<" + this + " DatePickerWidget createTimeRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_HOURS_AND_MINUTES());
      hoursAndMinutesOBJ = createSwitcher(cellIndex + 1, false);
      hoursAndMinutesVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the open state of the example picker: the two links opening and
     * closing the panel of it, and the state that panel stands in.
     */
    private function createOpenRows():void
    {
      application.trace("<" + this + " DatePickerWidget createOpenRows> called.", 4);
      // the two links share one cell, so they stand next to each other
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_OPENED());
      openOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_OPEN_PICKER());
      closeOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLOSE_PICKER());
      openedVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the date time patterns the picker of the format offers: the ones the
     * appearance of the application carries and the two of this widget.
     */
    private function getDateFormats():Array
    {
      application.trace("<" + this + " DatePickerWidget getDateFormats> called.", 4);
      return [application.getComponentsConfig().getDatePanelDateFormat()
        , application.getComponentsConfig().getDatePanelDateTimeFormat()
        , application.getComponentsConfig().getDatePanelDateTimeSecFormat()
        , dateFormatDAY, dateFormatLONG];
    }
    /**
     * Returns the date time pattern a brand new picker writes its date by: the plain date of
     * the appearance of the application, or the one carrying the time as well when the hours
     * and the minutes are the selectable ones. Switching those on takes that very pattern,
     * so the code of the current state writes no format at all then.
     */
    private function getDateFormatOfANewPicker():String
    {
      application.trace("<" + this + " DatePickerWidget getDateFormatOfANewPicker> called.", 4);
      return exampleDatePicker.getHoursAndMinutes()
        ? application.getComponentsConfig().getDatePanelDateTimeFormat()
        : application.getComponentsConfig().getDatePanelDateFormat();
    }
    /**
     * Tells whether the example picker stands on the very date a brand new one stands on:
     * the current day, with the hours and the minutes of it left at zero. Such a picker
     * takes the current date the moment it is built, and the two pickers of the time start
     * at their first item, so the code of the current state writes no date at all then.
     */
    private function selectedDateIsTheOneOfANewPicker():Boolean
    {
      application.trace("<" + this + " DatePickerWidget selectedDateIsTheOneOfANewPicker> called.", 4);
      const selected:Date = exampleDatePicker.getSelectedDateObject();
      const today:Date = new Date();
      return selected.getFullYear() == today.getFullYear()
        && selected.getMonth() == today.getMonth()
        && selected.getDate() == today.getDate()
        && selected.getHours() == 0
        && selected.getMinutes() == 0;
    }
    /**
     * Returns the code of the date object the example picker stands on. The month of a date
     * of this language is counted from zero, so the number of it is written as it is
     * answered, and the hours and the minutes are only written while those are the
     * selectable ones: a picker that does not offer them keeps them at zero anyway.
     */
    private function getSelectedDateCode():String
    {
      application.trace("<" + this + " DatePickerWidget getSelectedDateCode> called.", 4);
      const selected:Date = exampleDatePicker.getSelectedDateObject();
      var code:String = "new Date(" + selected.getFullYear()
        + ", " + selected.getMonth()
        + ", " + selected.getDate();
      if (exampleDatePicker.getHoursAndMinutes())
      {
        code += ", " + selected.getHours() + ", " + selected.getMinutes();
      }
      return code + ")";
    }
    /**
     * Displays every value again after the example picker has reported something: a date
     * that has been selected on its panel or given to it by the row of that date, and the
     * opening and the closing of that panel.
     * @param e the changed, opened or closed event of that picker
     */
    private function exampleDatePickerChanged(e:Event):void
    {
      application.trace("<" + this + " DatePickerWidget exampleDatePickerChanged> called.", 4);
      application.trace("<" + this + " DatePickerWidget exampleDatePickerChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the typed date to the example picker. An empty input is handed over as a date
     * of nothing at all, and such a picker takes the current date for that: that is the
     * very date it starts its own life on. Every date is set with the event of it, because
     * the setter of such a picker reports every date it is given, the ones the code of the
     * application hands over as well.
     * @param e the changed event of the input of the date
     */
    private function selectedDateChanged(e:Event):void
    {
      application.trace("<" + this + " DatePickerWidget selectedDateChanged> called.", 4);
      application.trace("<" + this + " DatePickerWidget selectedDateChanged> e: " + e, 3);
      const dateText:String = selectedDateOBJ.getText();
      exampleDatePicker.setSelectedDate(dateText == ""
        ? null : application.getUtils().getDateFromTime(dateText));
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked date time pattern to the example picker: the label of it is rewritten
     * by that new pattern right away.
     * @param e the changed event of the picker of the formats
     */
    private function dateFormatChanged(e:Event):void
    {
      application.trace("<" + this + " DatePickerWidget dateFormatChanged> called.", 4);
      application.trace("<" + this + " DatePickerWidget dateFormatChanged> e: " + e, 3);
      exampleDatePicker.setDateFormat(dateFormatOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Switches the hours and the minutes of the example picker on or off. That switch
     * rewrites the format of the displayed date as well, so the row of that format is taken
     * to the pattern it has been given by the displaying below.
     * @param e the changed event of the switcher of them
     */
    private function hoursAndMinutesChanged(e:Event):void
    {
      application.trace("<" + this + " DatePickerWidget hoursAndMinutesChanged> called.", 4);
      application.trace("<" + this + " DatePickerWidget hoursAndMinutesChanged> e: " + e, 3);
      exampleDatePicker.setHoursAndMinutes(hoursAndMinutesOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Opens the panel of the example picker.
     * @param e the click event of that link
     */
    private function openClick(e:Event):void
    {
      application.trace("<" + this + " DatePickerWidget openClick> called.", 4);
      application.trace("<" + this + " DatePickerWidget openClick> e: " + e, 3);
      exampleDatePicker.open();
      displayEveryCurrentValue();
    }
    /**
     * Closes the panel of the example picker.
     * @param e the click event of that link
     */
    private function closeClick(e:Event):void
    {
      application.trace("<" + this + " DatePickerWidget closeClick> called.", 4);
      application.trace("<" + this + " DatePickerWidget closeClick> e: " + e, 3);
      exampleDatePicker.close();
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
      application.trace("<" + this + " DatePickerWidget destroy> called.", 4);
      application.trace("<" + this + " DatePickerWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " DatePickerWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " DatePickerWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " DatePickerWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      dateFormatDAY = null;
      dateFormatLONG = null;
      exampleDw = 0;
      widthMIN = 0;
      widthMAX = 0;
      widthINC = 0;
      exampleDatePicker = null;
      selectedDateOBJ = null;
      dateFormatOBJ = null;
      hoursAndMinutesOBJ = null;
      openOBJ = null;
      closeOBJ = null;
      selectedDateVAL = null;
      selectedDateObjectVAL = null;
      displayedDateVAL = null;
      textVAL = null;
      dateFormatVAL = null;
      hoursAndMinutesVAL = null;
      openedVAL = null;
    }
  }
}
