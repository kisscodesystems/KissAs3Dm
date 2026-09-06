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
 * DatePanelWidget.
 * The widget of the DatePanel component of the framework.
 *
 * MAIN FEATURES:
 * - the panel of the date picking: one whole month in a calendar view, with the number of
 *   its weeks and with the hours and the minutes of the selected day
 * - the example panel stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the date, of the format and of the time are built here, every other one
 *   comes from the PropertyWidget base class
 * - the dimensions of that panel come from its own calendar view, so it has no row of a
 *   width and no row of a height at all
 * - the row of the dimensions of the base class demonstrates a call doing nothing there:
 *   such a panel drops every size it is given
 * - switching the hours and the minutes on takes the date time pattern of the appearance
 *   of the application, so the row of the format follows that switch
 * - only a click on a day dispatches the changed event of that panel: a date that is
 *   selected by the row of it is a silent one, so the row of the last event stands empty
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.DatePanel;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class DatePanelWidget extends PropertyWidget
  {
    // Two date time patterns of their own the picker of the format offers on top of the
    // ones the appearance of the application carries. These are patterns the application
    // thinks in and no texts that are read, so they are no labels of any language.
    private var dateFormatDAY:String = "dd/MM/yyyy";
    private var dateFormatLONG:String = "EEEE, MMMM d, yyyy";
    // the example panel: the very object the rows of this widget work on
    private var exampleDatePanel:DatePanel = null;
    // the elements changing the properties of that panel
    private var selectedDateOBJ:TextInput = null;
    private var dateFormatOBJ:ListPicker = null;
    private var hoursAndMinutesOBJ:Switcher = null;
    private var staticContentOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that panel answer
    private var selectedDateVAL:TextLabel = null;
    private var selectedDateObjectVAL:TextLabel = null;
    private var displayedDateVAL:TextLabel = null;
    private var dateFormatVAL:TextLabel = null;
    private var hoursAndMinutesVAL:TextLabel = null;
    /**
     * Constructs the widget of the DatePanel component.
     * @param applicationRef the main application reference
     */
    public function DatePanelWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " DatePanelWidget> called.", 4);
      application.trace("<" + this + " DatePanelWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.DATEPANEL();
      headerIcon = EnumIcons.calendar();
      infoCode = EnumTextKeysDemo.WIDGETINFO_DATEPANEL();
      codeVarName = "datePanel";
      iniSizeWidth = 770;
      iniSizeHeight = 810;
      application.trace("<" + this + " DatePanelWidget> constructed.", 4);
    }
    /**
     * Builds the example panel of this widget: the one standing on the current date, with
     * the date format and without the time of the appearance of the application. Its
     * dimensions are left alone on purpose: such a panel takes them from its own view.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " DatePanelWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleDatePanel = new DatePanel(application);
      setExampleElement(exampleDatePanel);
    }
    /**
     * Builds every row of this widget: the ones of the date, of the format, of the time and
     * of the calls of the example panel, and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " DatePanelWidget createRows> called.", 4);
      super.createRows();
      createDateRows();
      createFormatRows();
      createTimeRows();
      createStaticContentRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * panel as well: that panel dispatches its changed event when a day has been clicked on
     * it, and only then.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " DatePanelWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleDatePanel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleDatePanelChanged);
      selectedDateOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), selectedDateChanged);
      dateFormatOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), dateFormatChanged);
      hoursAndMinutesOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), hoursAndMinutesChanged);
      staticContentOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), staticContentClick);
    }
    /**
     * Displays the current value of every property of the example panel. The picker of the
     * format follows the pattern that panel writes its date by: switching the hours and the
     * minutes on or off rewrites that pattern, so it is not always the picked one.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " DatePanelWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      selectedDateVAL.setLabel(exampleDatePanel.getSelectedDate());
      selectedDateObjectVAL.setLabel(getShortTextOrNone("" + exampleDatePanel.getSelectedDateObject()));
      displayedDateVAL.setLabel(getTextOrNone(exampleDatePanel.getDisplayedDate()));
      dateFormatVAL.setLabel(exampleDatePanel.getDateFormat());
      hoursAndMinutesVAL.setLabel(getYesNoKey(exampleDatePanel.getHoursAndMinutes()));
      const formatIndex:int = dateFormatOBJ.getArrayValues().indexOf(exampleDatePanel.getDateFormat());
      if (formatIndex > -1)
      {
        dateFormatOBJ.setSelectedIndex(formatIndex, false);
      }
    }
    /**
     * Returns the code writing the example panel the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new panel. Every class the code below names is collected into
     * the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " DatePanelWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("DatePanel", imports);
      // the time comes first on purpose: switching it on rewrites the format of the date,
      // so a format of its own has to be given after that switch and not before it
      if (exampleDatePanel.getHoursAndMinutes())
      {
        code += codeVarName + ".setHoursAndMinutes(true);\n";
      }
      if (exampleDatePanel.getDateFormat() != getDateFormatOfANewPanel())
      {
        code += codeVarName + ".setDateFormat(\"" + exampleDatePanel.getDateFormat() + "\");\n";
      }
      if (!selectedDateIsTheOneOfANewPanel())
      {
        code += codeVarName + ".setSelectedDate(" + getSelectedDateCode() + ");\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the date of the example panel: the selected date itself, the date
     * object of it and the text that panel displays that date by. The date is typed in the
     * very format the getter of it answers in, and an empty input means the current date:
     * such a panel takes the current one for every date it is not given.
     */
    private function createDateRows():void
    {
      application.trace("<" + this + " DatePanelWidget createDateRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_SELECTED_DATE());
      selectedDateOBJ = createTextInput(cellIndex + 1);
      selectedDateVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SELECTED_DATE_OBJECT());
      selectedDateObjectVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_DISPLAYED_DATE());
      displayedDateVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the format of the displayed date: the two patterns of the
     * appearance of the application, the one of the seconds among them, and two more of
     * this widget. These are date time patterns and no texts that are read, so the items of
     * that picker display the very patterns they stand for.
     */
    private function createFormatRows():void
    {
      application.trace("<" + this + " DatePanelWidget createFormatRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_DATE_FORMAT());
      dateFormatOBJ = createListPicker(cellIndex + 1, getDateFormats(), getDateFormats());
      dateFormatVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the time of the example panel: the hours and the minutes it lets be
     * selected. Two pickers of them are built on demand and dropped again as soon as they
     * are not needed, so that panel takes another height on every switch of this row.
     */
    private function createTimeRows():void
    {
      application.trace("<" + this + " DatePanelWidget createTimeRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_HOURS_AND_MINUTES());
      hoursAndMinutesOBJ = createSwitcher(cellIndex + 1, false);
      hoursAndMinutesVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the static content of the example panel: the link placing the
     * navigation buttons, the label of the date and the pickers of the time again. That
     * panel does it on its own every time it is rebuilt, so this call changes nothing at
     * all while nothing else has moved.
     */
    private function createStaticContentRows():void
    {
      application.trace("<" + this + " DatePanelWidget createStaticContentRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_STATIC_CONTENT());
      staticContentOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REPOS_STATIC_CONTENT());
    }
    /**
     * Returns the date time patterns the picker of the format offers: the ones the
     * appearance of the application carries and the two of this widget.
     */
    private function getDateFormats():Array
    {
      application.trace("<" + this + " DatePanelWidget getDateFormats> called.", 4);
      return [application.getComponentsConfig().getDatePanelDateFormat()
        , application.getComponentsConfig().getDatePanelDateTimeFormat()
        , application.getComponentsConfig().getDatePanelDateTimeSecFormat()
        , dateFormatDAY, dateFormatLONG];
    }
    /**
     * Returns the date time pattern a brand new panel writes its date by: the plain date of
     * the appearance of the application, or the one carrying the time as well when the
     * hours and the minutes are the selectable ones. Switching those on takes that very
     * pattern, so the code of the current state writes no format at all then.
     */
    private function getDateFormatOfANewPanel():String
    {
      application.trace("<" + this + " DatePanelWidget getDateFormatOfANewPanel> called.", 4);
      return exampleDatePanel.getHoursAndMinutes()
        ? application.getComponentsConfig().getDatePanelDateTimeFormat()
        : application.getComponentsConfig().getDatePanelDateFormat();
    }
    /**
     * Tells whether the example panel stands on the very date a brand new one stands on:
     * the current day, with the hours and the minutes of it left at zero. Such a panel
     * takes the current date the moment it is built, and the two pickers of the time start
     * at their first item, so the code of the current state writes no date at all then.
     */
    private function selectedDateIsTheOneOfANewPanel():Boolean
    {
      application.trace("<" + this + " DatePanelWidget selectedDateIsTheOneOfANewPanel> called.", 4);
      const selected:Date = exampleDatePanel.getSelectedDateObject();
      const today:Date = new Date();
      return selected.getFullYear() == today.getFullYear()
        && selected.getMonth() == today.getMonth()
        && selected.getDate() == today.getDate()
        && selected.getHours() == 0
        && selected.getMinutes() == 0;
    }
    /**
     * Returns the code of the date object the example panel stands on. The month of a date
     * of this language is counted from zero, so the number of it is written as it is
     * answered, and the hours and the minutes are only written while those are the
     * selectable ones: a panel that does not offer them keeps them at zero anyway.
     */
    private function getSelectedDateCode():String
    {
      application.trace("<" + this + " DatePanelWidget getSelectedDateCode> called.", 4);
      const selected:Date = exampleDatePanel.getSelectedDateObject();
      var code:String = "new Date(" + selected.getFullYear()
        + ", " + selected.getMonth()
        + ", " + selected.getDate();
      if (exampleDatePanel.getHoursAndMinutes())
      {
        code += ", " + selected.getHours() + ", " + selected.getMinutes();
      }
      return code + ")";
    }
    /**
     * Displays every value again after a day has been clicked on the example panel: that
     * click is the one and only change such a panel reports.
     * @param e the changed event of that panel
     */
    private function exampleDatePanelChanged(e:Event):void
    {
      application.trace("<" + this + " DatePanelWidget exampleDatePanelChanged> called.", 4);
      application.trace("<" + this + " DatePanelWidget exampleDatePanelChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the typed date to the example panel. An empty input is handed over as a date of
     * nothing at all, and such a panel takes the current date for that: that is the very
     * date it starts its own life on. This selection is a silent one, the way every date
     * that is not clicked on that panel is.
     * @param e the changed event of the input of the date
     */
    private function selectedDateChanged(e:Event):void
    {
      application.trace("<" + this + " DatePanelWidget selectedDateChanged> called.", 4);
      application.trace("<" + this + " DatePanelWidget selectedDateChanged> e: " + e, 3);
      const dateText:String = selectedDateOBJ.getText();
      exampleDatePanel.setSelectedDate(dateText == ""
        ? null : application.getUtils().getDateFromTime(dateText));
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked date time pattern to the example panel.
     * @param e the changed event of the picker of the formats
     */
    private function dateFormatChanged(e:Event):void
    {
      application.trace("<" + this + " DatePanelWidget dateFormatChanged> called.", 4);
      application.trace("<" + this + " DatePanelWidget dateFormatChanged> e: " + e, 3);
      exampleDatePanel.setDateFormat(dateFormatOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Switches the hours and the minutes of the example panel on or off. That switch
     * rewrites the format of the displayed date as well, so the row of that format is
     * taken to the pattern it has been given by the displaying below.
     * @param e the changed event of the switcher of them
     */
    private function hoursAndMinutesChanged(e:Event):void
    {
      application.trace("<" + this + " DatePanelWidget hoursAndMinutesChanged> called.", 4);
      application.trace("<" + this + " DatePanelWidget hoursAndMinutesChanged> e: " + e, 3);
      exampleDatePanel.setHoursAndMinutes(hoursAndMinutesOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Places the static content of the example panel again.
     * @param e the click event of that link
     */
    private function staticContentClick(e:Event):void
    {
      application.trace("<" + this + " DatePanelWidget staticContentClick> called.", 4);
      application.trace("<" + this + " DatePanelWidget staticContentClick> e: " + e, 3);
      exampleDatePanel.reposStaticContent();
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
      application.trace("<" + this + " DatePanelWidget destroy> called.", 4);
      application.trace("<" + this + " DatePanelWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " DatePanelWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " DatePanelWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " DatePanelWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      dateFormatDAY = null;
      dateFormatLONG = null;
      exampleDatePanel = null;
      selectedDateOBJ = null;
      dateFormatOBJ = null;
      hoursAndMinutesOBJ = null;
      staticContentOBJ = null;
      selectedDateVAL = null;
      selectedDateObjectVAL = null;
      displayedDateVAL = null;
      dateFormatVAL = null;
      hoursAndMinutesVAL = null;
    }
  }
}
