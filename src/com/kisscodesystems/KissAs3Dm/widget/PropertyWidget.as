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
 * PropertyWidget.
 * The common base of every widget that demonstrates one component by an example
 * object of it: every property of that object can be changed in real time and the
 * code of its current state can be read and copied.
 *
 * MAIN FEATURES:
 * - the example object stands at the top of the content and every row changing it
 *   walks under it, in a content of its own, so that object is seen all the time
 * - that inner content stands in three columns: the name of a property, the element
 *   changing it and the value the getter of it answers at the moment
 * - a property having no setter at all is a row of a name and a value only, and a
 *   property having no getter is a row of a name and an element only
 * - the rows every component takes from the BaseSprite base class are built here, so
 *   an extender only tells what the component of its own brings on top of them
 * - the second content displays the code writing the example object the way it stands
 *   at the moment, and that code can be copied to the clipboard
 * - the scrolling of both contents is switched off in both directions: the rows and
 *   the code have a scroll of their own, so there is nothing left for those to scroll
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumEmojisDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.base.BaseScroll;
  import com.kisscodesystems.KissAs3Fw.base.BaseSprite;
  import com.kisscodesystems.KissAs3Fw.enum.EnumAligns;
  import com.kisscodesystems.KissAs3Fw.enum.EnumDocks;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumOrientations;
  import com.kisscodesystems.KissAs3Fw.enum.EnumSounds;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextKeys;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonText;
  import com.kisscodesystems.KissAs3Fw.ui.ContentSingle;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextBox;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  import flash.events.TimerEvent;
  import flash.system.System;
  import flash.utils.Timer;
  public class PropertyWidget extends DemoWidget
  {
    // the example object of the top of the content: the one every row below works on
    protected var exampleElement:BaseSprite = null;
    // the content of the rows of the properties, the one that is scrolled
    protected var rowsContent:ContentSingle = null;
    // the name the code of the current state calls the example object by
    protected var codeVarName:String = "exampleElement";
    // the number of the columns the content of the rows stands in: the name of a
    // property, the element changing it and the value of it
    private var numOfColumns:int = 3;
    // the cell index the next row of that content begins at
    private var nextRowCellIndex:int = 0;
    // The width one column of that content stands with, and the elements it has to be
    // given to. An input and a picker take the width of the caller, and a label of the
    // first or of the third column is kept inside that width to leave the two other
    // columns the room of their own.
    private var columnDw:int = 0;
    private var sizedElementsARR:Array = null;
    private var maxWidthLabelsARR:Array = null;
    // the number of the items the pickers of these widgets display at the same time
    private var listPickerCNT:int = 6;
    // the number of the characters one value of the third column is displayed with: a
    // text longer than this is cut, so one single row can not grow taller than the
    // whole content of the rows
    private var valueCNT:int = 60;
    // the dimensions the example object is asked for by the row of the dimensions
    private var dimensionsToSet:int = 200;
    // the index of the content displaying the code of the example object
    private var indexCode:int = -1;
    // the first line of that content: the button copying that code and the label telling
    // that it has been copied, standing next to it in a sprite of the two of them
    private var codeHeaderSprite:BaseSprite = null;
    private var copyOBJ:ButtonText = null;
    private var copiedVAL:TextLabel = null;
    // the milliseconds the label of the copying is displayed for, and the timer taking it
    private var copiedMs:int = 5000;
    private var copiedTimer:Timer = null;
    // the box of the code itself and the code standing in it at the moment
    private var codeTextBox:TextBox = null;
    private var codeText:String = "";
    // the elements of the rows the example object takes from the BaseSprite base class
    private var widthOBJ:Potmeter = null;
    private var heightOBJ:Potmeter = null;
    private var valueOBJ:TextInput = null;
    private var enabledOBJ:Switcher = null;
    private var visibleOBJ:Switcher = null;
    private var toLowestDepthOBJ:ButtonLink = null;
    private var toHighestDepthOBJ:ButtonLink = null;
    private var soundClickOBJ:ListPicker = null;
    private var updateCxyOBJ:ButtonLink = null;
    private var setDimensionsOBJ:ButtonLink = null;
    private var dispatcherOBJ:ButtonLink = null;
    private var toBeVisibleOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of those rows answer
    private var valueVAL:TextLabel = null;
    private var enabledVAL:TextLabel = null;
    private var positionVAL:TextLabel = null;
    private var dimensionsVAL:TextLabel = null;
    // the row of the last event the example object has dispatched, and that very event
    private var lastEventVAL:TextLabel = null;
    private var lastEventName:String = "";
    /**
     * Constructs the widget. Every extender of this class sets the header, the header
     * icon, the info text and the initialization dimensions of its own in its own
     * constructor, the way every other widget of this application does.
     * @param applicationRef the main application reference
     */
    public function PropertyWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " PropertyWidget> called.", 4);
      application.trace("<" + this + " PropertyWidget> applicationRef: " + applicationRef, 3);
      sizedElementsARR = new Array();
      maxWidthLabelsARR = new Array();
      application.trace("<" + this + " PropertyWidget> constructed.", 4);
    }
    /**
     * Builds the elements demonstrating the component: the example object of the top of
     * the content and the rows changing and displaying every property of it. The listeners
     * are registered before the sizing on purpose: the height of the example object is
     * the room the content of the rows can not take, and that object can be measured later
     * than it is built, so the sizing has to be able to run again. Nothing of the sizing
     * and of the displaying below is taken as a change made by the one using this
     * application: an element is given its width and a value is displayed silently.
     */
    override protected function createElements():void
    {
      application.trace("<" + this + " PropertyWidget createElements> called.", 4);
      super.createElements();
      removeInfoTextLabel();
      // the example object and the content of the rows are docked one under the other: the
      // object takes a strip of its own height at the top and the content of the rows fills
      // the room that is left, so the framework is the one measuring it, every time that
      // object or this widget takes another height
      setOrientation(indexBasic, EnumOrientations.ORIENTATION_DOCK());
      createExampleElement();
      createRowsContent();
      createRows();
      createCodeContent();
      switchContentScrollingOff();
      addListenersToElements();
      addListenersToApplication();
      resizeColumns();
      reposCodeHeader();
      displayEveryCurrentValue();
      refreshCode();
    }
    /**
     * Builds the example object of this widget. Every extender of this class overrides
     * this, creates the component it demonstrates and hands it over to the
     * setExampleElement below.
     */
    protected function createExampleElement():void
    {
      application.trace("<" + this + " PropertyWidget createExampleElement> called.", 4);
      application.trace("<" + this + " PropertyWidget createExampleElement> the extenders of this class build their example object here.", 3);
    }
    /**
     * Builds the rows of the properties of the example object. Every extender of this
     * class overrides this, builds the rows the component of its own brings and calls the
     * createSpriteRows and the createCallRows below for the ones every component shares.
     */
    protected function createRows():void
    {
      application.trace("<" + this + " PropertyWidget createRows> called.", 4);
      application.trace("<" + this + " PropertyWidget createRows> the extenders of this class build their rows here.", 3);
    }
    /**
     * Returns the code writing the example object the way it stands at the moment. Every
     * extender of this class overrides this and writes the code of the component of its
     * own with the helpers below.
     */
    protected function getExampleCode():String
    {
      application.trace("<" + this + " PropertyWidget getExampleCode> called.", 4);
      application.trace("<" + this + " PropertyWidget getExampleCode> the extenders of this class write their code here.", 3);
      return "";
    }
    /**
     * Docks the given object to the top of the content of this widget and takes it as the
     * example object every row of this widget works on. It is not filled, so it keeps the
     * dimensions of its own and the strip it takes is as tall as it is.
     * @param example the example object of this widget
     */
    protected function setExampleElement(example:BaseSprite):void
    {
      application.trace("<" + this + " PropertyWidget setExampleElement> called.", 4);
      application.trace("<" + this + " PropertyWidget setExampleElement> example: " + example, 3);
      exampleElement = example;
      addToContent(indexBasic, exampleElement, 0, false);
      setElementDock(indexBasic, exampleElement, EnumDocks.DOCK_TOP());
    }
    /**
     * Builds the rows of the properties every component takes from the BaseSprite base
     * class: the value object, the enabled and the visible state, the depth, the click
     * sound, the coordinates and the dimensions.
     */
    protected function createSpriteRows():void
    {
      application.trace("<" + this + " PropertyWidget createSpriteRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_VALUE());
      valueOBJ = createTextInput(cellIndex + 1);
      valueVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ENABLED());
      enabledOBJ = createSwitcher(cellIndex + 1, true);
      enabledVAL = createValueLabel(cellIndex + 2);
      // the visibility of a sprite has no getter, so this row displays nothing
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_VISIBLE());
      visibleOBJ = createSwitcher(cellIndex + 1, true);
      // the two links of the depth share one cell, so they stand next to each other
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_DEPTH());
      toLowestDepthOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_TO_LOWEST_DEPTH());
      toHighestDepthOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_TO_HIGHEST_DEPTH());
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_CLICK());
      soundClickOBJ = createListPicker(cellIndex + 1
          , [EnumTextKeysDemo.WIDGET_VALUE_NONE(), EnumSounds.button(), EnumSounds.confirm()
            , EnumSounds.error(), EnumSounds.message(), EnumSounds.open()]
          , ["", EnumSounds.button(), EnumSounds.confirm()
            , EnumSounds.error(), EnumSounds.message(), EnumSounds.open()]);
      soundClickOBJ.setSelectedIndex(0, false);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_POSITION());
      updateCxyOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_UPDATE_CXY());
      positionVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_DIMENSIONS());
      setDimensionsOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_DIMENSIONS());
      dimensionsVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the width of the example object. The width of a component that
     * takes it from the outside is changed by a potmeter of its own, and that potmeter
     * follows every other change of that width as well.
     * @param min the narrowest width that can be asked for
     * @param max the widest width that can be asked for
     * @param inc the step of the potmeter
     */
    protected function createWidthRow(min:int, max:int, inc:int):void
    {
      application.trace("<" + this + " PropertyWidget createWidthRow> called.", 4);
      application.trace("<" + this + " PropertyWidget createWidthRow> min: " + min, 3);
      application.trace("<" + this + " PropertyWidget createWidthRow> max: " + max, 3);
      application.trace("<" + this + " PropertyWidget createWidthRow> inc: " + inc, 3);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_WIDTH());
      widthOBJ = createPotmeter(cellIndex + 1, min, max, inc);
    }
    /**
     * Builds the row of the height of the example object.
     * @param min the lowest height that can be asked for
     * @param max the tallest height that can be asked for
     * @param inc the step of the potmeter
     */
    protected function createHeightRow(min:int, max:int, inc:int):void
    {
      application.trace("<" + this + " PropertyWidget createHeightRow> called.", 4);
      application.trace("<" + this + " PropertyWidget createHeightRow> min: " + min, 3);
      application.trace("<" + this + " PropertyWidget createHeightRow> max: " + max, 3);
      application.trace("<" + this + " PropertyWidget createHeightRow> inc: " + inc, 3);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_HEIGHT());
      heightOBJ = createPotmeter(cellIndex + 1, min, max, inc);
    }
    /**
     * Builds the row displaying the last event the example object has dispatched. Such an
     * event is a report and not a property, so this row has nothing to change it with.
     */
    protected function createLastEventRow():void
    {
      application.trace("<" + this + " PropertyWidget createLastEventRow> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_LAST_EVENT());
      lastEventVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the calls every component takes from the BaseSprite base class:
     * the event dispatcher and the scrolling. These are calls and not properties, so an
     * extender closes the rows of its own with them.
     */
    protected function createCallRows():void
    {
      application.trace("<" + this + " PropertyWidget createCallRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_DISPATCHER());
      dispatcherOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_DISPATCHER());
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TO_BE_VISIBLE());
      toBeVisibleOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_TO_BE_VISIBLE());
    }
    /**
     * Opens a new row of the content: it places the name of a property into the first
     * cell of that row and returns the index of that very cell, so the caller can place
     * the element and the value of that property into the two cells next to it.
     * @param textKey the text key of the name of the property
     */
    protected function createRow(textKey:String):int
    {
      application.trace("<" + this + " PropertyWidget createRow> called.", 4);
      application.trace("<" + this + " PropertyWidget createRow> textKey: " + textKey, 3);
      const cellIndex:int = nextRowCellIndex;
      nextRowCellIndex += numOfColumns;
      const textLabel:TextLabel = new TextLabel(application);
      rowsContent.addToContent(textLabel, cellIndex);
      textLabel.setType(EnumTextTypes.TEXT_TYPE_MID());
      textLabel.setLabel(textKey);
      rowsContent.setElementAlignVertical(textLabel, EnumAligns.ALIGN_MIDDLE());
      maxWidthLabelsARR.push(textLabel);
      return cellIndex;
    }
    /**
     * Builds one label of the third column, the one displaying the value a getter of the
     * example object answers, and returns it.
     * @param cellIndex the cell of the content that label goes into
     */
    protected function createValueLabel(cellIndex:int):TextLabel
    {
      application.trace("<" + this + " PropertyWidget createValueLabel> called.", 4);
      application.trace("<" + this + " PropertyWidget createValueLabel> cellIndex: " + cellIndex, 3);
      const textLabel:TextLabel = new TextLabel(application);
      rowsContent.addToContent(textLabel, cellIndex);
      textLabel.setType(EnumTextTypes.TEXT_TYPE_DARK());
      rowsContent.setElementAlignVertical(textLabel, EnumAligns.ALIGN_MIDDLE());
      maxWidthLabelsARR.push(textLabel);
      return textLabel;
    }
    /**
     * Builds one text input of the second column and returns it. Such an input dispatches
     * its changed event on an enter only, so it carries the hint telling exactly that.
     * @param cellIndex the cell of the content that input goes into
     */
    protected function createTextInput(cellIndex:int):TextInput
    {
      application.trace("<" + this + " PropertyWidget createTextInput> called.", 4);
      application.trace("<" + this + " PropertyWidget createTextInput> cellIndex: " + cellIndex, 3);
      const textInput:TextInput = new TextInput(application);
      rowsContent.addToContent(textInput, cellIndex);
      textInput.setHint(EnumTextKeysDemo.WIDGET_HINT_TEXT());
      sizedElementsARR.push(textInput);
      return textInput;
    }
    /**
     * Builds one picker of the second column and returns it.
     * @param cellIndex the cell of the content that picker goes into
     * @param labels the text codes of the items of that picker
     * @param values the values of the items of that picker
     * @param icons the icon types of the items of that picker, no icon at all when it is null
     */
    protected function createListPicker(cellIndex:int, labels:Array, values:Array, icons:Array = null):ListPicker
    {
      application.trace("<" + this + " PropertyWidget createListPicker> called.", 4);
      application.trace("<" + this + " PropertyWidget createListPicker> cellIndex: " + cellIndex, 3);
      application.trace("<" + this + " PropertyWidget createListPicker> labels: " + labels, 3);
      application.trace("<" + this + " PropertyWidget createListPicker> values: " + values, 3);
      application.trace("<" + this + " PropertyWidget createListPicker> icons: " + icons, 3);
      const listPicker:ListPicker = new ListPicker(application);
      rowsContent.addToContent(listPicker, cellIndex);
      listPicker.setNumOfElements(listPickerCNT);
      listPicker.setArrays(labels, values, icons);
      sizedElementsARR.push(listPicker);
      return listPicker;
    }
    /**
     * Builds one switcher of the second column and returns it: every property of a
     * boolean is changed by a yes and no switcher of this kind.
     * @param cellIndex the cell of the content that switcher goes into
     * @param on the state that switcher starts in
     */
    protected function createSwitcher(cellIndex:int, on:Boolean):Switcher
    {
      application.trace("<" + this + " PropertyWidget createSwitcher> called.", 4);
      application.trace("<" + this + " PropertyWidget createSwitcher> cellIndex: " + cellIndex, 3);
      application.trace("<" + this + " PropertyWidget createSwitcher> on: " + on, 3);
      const switcher:Switcher = new Switcher(application);
      rowsContent.addToContent(switcher, cellIndex);
      switcher.setLabels(EnumTextKeys.YN_YES(), EnumTextKeys.YN_NO());
      switcher.setOn(on, false);
      return switcher;
    }
    /**
     * Builds one link of the second column and returns it: the properties that are
     * changed by a call and not by a value are the rows of links of this kind.
     * @param cellIndex the cell of the content that link goes into
     * @param textKey the text key of that link
     */
    protected function createLink(cellIndex:int, textKey:String):ButtonLink
    {
      application.trace("<" + this + " PropertyWidget createLink> called.", 4);
      application.trace("<" + this + " PropertyWidget createLink> cellIndex: " + cellIndex, 3);
      application.trace("<" + this + " PropertyWidget createLink> textKey: " + textKey, 3);
      const buttonLink:ButtonLink = new ButtonLink(application);
      rowsContent.addToContent(buttonLink, cellIndex);
      buttonLink.setLabel(textKey);
      return buttonLink;
    }
    /**
     * Builds one potmeter of the second column and returns it: every property of a number
     * is changed by a potmeter of this kind. The precision comes last, because a property
     * of a whole number is the usual one: a potmeter of no decimals at all.
     * @param cellIndex the cell of the content that potmeter goes into
     * @param min the smallest value that can be asked for
     * @param max the greatest value that can be asked for
     * @param inc the step of that potmeter
     * @param precision the number of the decimals that potmeter works with
     */
    protected function createPotmeter(cellIndex:int, min:Number, max:Number, inc:Number, precision:int = 0):Potmeter
    {
      application.trace("<" + this + " PropertyWidget createPotmeter> called.", 4);
      application.trace("<" + this + " PropertyWidget createPotmeter> cellIndex: " + cellIndex, 3);
      application.trace("<" + this + " PropertyWidget createPotmeter> min: " + min, 3);
      application.trace("<" + this + " PropertyWidget createPotmeter> max: " + max, 3);
      application.trace("<" + this + " PropertyWidget createPotmeter> inc: " + inc, 3);
      application.trace("<" + this + " PropertyWidget createPotmeter> precision: " + precision, 3);
      const potmeter:Potmeter = new Potmeter(application);
      rowsContent.addToContent(potmeter, cellIndex);
      potmeter.setDecimalPrecision(precision);
      potmeter.setMinMaxIncValues(min, max, inc);
      return potmeter;
    }
    /**
     * Registers the listener of every element built here. Every extender of this class
     * overrides this, calls this one and registers the listeners of the elements and of
     * the example object of its own afterwards.
     */
    protected function addListenersToElements():void
    {
      application.trace("<" + this + " PropertyWidget addListenersToElements> called.", 4);
      exampleElement.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_DIMENSIONS_CHANGED(), exampleElementResized);
      if (widthOBJ != null)
      {
        widthOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), widthChanged);
      }
      if (heightOBJ != null)
      {
        heightOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), heightChanged);
      }
      valueOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), valueChanged);
      enabledOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), enabledChanged);
      visibleOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), visibleChanged);
      toLowestDepthOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), toLowestDepthClick);
      toHighestDepthOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), toHighestDepthClick);
      soundClickOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), soundClickChanged);
      updateCxyOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), updateCxyClick);
      setDimensionsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), setDimensionsClick);
      dispatcherOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), dispatcherClick);
      toBeVisibleOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), toBeVisibleClick);
      rowsContent.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_DIMENSIONS_CHANGED(), rowsContentResized);
      // the content of the code is the one that could not be built at all, and then there
      // is neither a button of the copying nor a box of that code to be listened to
      if (indexCode > -1)
      {
        copyOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), copyClick);
        copyOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_DIMENSIONS_CHANGED(), codeHeaderResized);
        copiedVAL.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_DIMENSIONS_CHANGED(), codeHeaderResized);
      }
      getContentBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), activeContentChanged);
    }
    /**
     * Registers the listeners of the application: the columns of this widget are measured
     * by the room of its content and by the margin of the application, so they are counted
     * again every time that margin changes.
     */
    protected function addListenersToApplication():void
    {
      application.trace("<" + this + " PropertyWidget addListenersToApplication> called.", 4);
      application.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_MARGIN_CHANGED(), marginChanged);
    }
    /**
     * Displays the current value of every property built here. Every extender of this
     * class overrides this, calls this one and displays the values of the component of its
     * own afterwards. The coordinates and the dimensions of the example object can be one
     * step behind here: the values written below resize the columns of the content, which
     * moves that object again. No listener of that move is registered on purpose, because
     * the refresh of it would resize those columns once more, over and over again.
     */
    protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " PropertyWidget displayEveryCurrentValue> called.", 4);
      if (widthOBJ != null)
      {
        widthOBJ.setCurValue(exampleElement.getDw(), false);
      }
      if (heightOBJ != null)
      {
        heightOBJ.setCurValue(exampleElement.getDh(), false);
      }
      valueVAL.setLabel(exampleElement.getValue() == null
        ? EnumTextKeysDemo.WIDGET_VALUE_NONE() : "" + exampleElement.getValue());
      // a component can switch itself off as well, the way a working button does it for
      // the time of the work of a click, so the switcher of this row follows that state
      enabledOBJ.setOn(exampleElement.getEnabled(), false);
      enabledVAL.setLabel(getYesNoKey(exampleElement.getEnabled()));
      positionVAL.setLabel(exampleElement.getCx() + ", " + exampleElement.getCy());
      dimensionsVAL.setLabel(exampleElement.getDw() + " x " + exampleElement.getDh());
      if (lastEventVAL != null)
      {
        lastEventVAL.setLabel(getTextOrNone(lastEventName));
      }
    }
    /**
     * Takes the type of the event the example object has just dispatched and displays
     * every value again: an event of that object may well report a property that has been
     * changed by the one using this application and not by a row of this widget.
     * @param eventType the type of that event, an EnumEvents value
     */
    protected function setLastEvent(eventType:String):void
    {
      application.trace("<" + this + " PropertyWidget setLastEvent> called.", 4);
      application.trace("<" + this + " PropertyWidget setLastEvent> eventType: " + eventType, 3);
      lastEventName = eventType;
      displayEveryCurrentValue();
    }
    /**
     * Returns the first two lines of the code of the current state: the ones building the
     * example object and putting it onto its parent.
     * @param className the name of the class of that object
     * @param imports the names of the classes collected so far
     */
    protected function getConstructorCode(className:String, imports:Array):String
    {
      application.trace("<" + this + " PropertyWidget getConstructorCode> called.", 4);
      application.trace("<" + this + " PropertyWidget getConstructorCode> className: " + className, 3);
      application.trace("<" + this + " PropertyWidget getConstructorCode> imports: " + imports, 3);
      pushImport(imports, "com.kisscodesystems.KissAs3Fw.ui." + className);
      return "const " + codeVarName + ":" + className + " = new " + className + "(application);\n"
        + "addChild(" + codeVarName + ");\n";
    }
    /**
     * Tells whether the value object of the example object has to be written into the code
     * of the current state. Every component carries that object for the application around
     * it, and that is the one written here, but there are components storing something of
     * their own in it: such a value belongs to the component itself and it is set by no
     * caller at all, so the extender of this class demonstrating it answers false here.
     */
    protected function getValueCodeNeeded():Boolean
    {
      return true;
    }
    /**
     * Tells whether the click sound of the example object has to be written into the code
     * of the current state. Every component plays that sound when it is pressed, but there
     * are components dropping it: such a one plays a sound of its own, so the extender of
     * this class demonstrating it answers false here.
     */
    protected function getSoundClickCodeNeeded():Boolean
    {
      return true;
    }
    /**
     * Returns the code of the properties the example object takes from the BaseSprite base
     * class: the dimensions of the rows that have been built of them, the value object of
     * the ones that let it be written and the click sound of the ones that play it. The
     * enabled and the visible state are not written here on purpose: those close the whole
     * code, so they have a getter of their own below.
     * @param imports the names of the classes collected so far
     */
    protected function getSpritePropertiesCode(imports:Array):String
    {
      application.trace("<" + this + " PropertyWidget getSpritePropertiesCode> called.", 4);
      application.trace("<" + this + " PropertyWidget getSpritePropertiesCode> imports: " + imports, 3);
      var code:String = "";
      if (widthOBJ != null && heightOBJ != null)
      {
        code += codeVarName + ".setDwh(" + exampleElement.getDw() + ", " + exampleElement.getDh() + ");\n";
      }
      else if (widthOBJ != null)
      {
        code += codeVarName + ".setDw(" + exampleElement.getDw() + ");\n";
      }
      else if (heightOBJ != null)
      {
        code += codeVarName + ".setDh(" + exampleElement.getDh() + ");\n";
      }
      if (getValueCodeNeeded() && exampleElement.getValue() != null)
      {
        code += codeVarName + ".setValue(\"" + exampleElement.getValue() + "\");\n";
      }
      if (getSoundClickCodeNeeded() && soundClickOBJ.getSelectedValue() != "")
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumSounds");
        code += codeVarName + ".setSoundTypeClick(EnumSounds." + soundClickOBJ.getSelectedValue() + "());\n";
      }
      return code;
    }
    /**
     * Returns the two lines closing the code of the current state: an object that has been
     * switched off or hidden is the one every other property has been given to already.
     * The visibility of a sprite has no getter, so it is read back from the row of it.
     */
    protected function getSpriteStateCode():String
    {
      application.trace("<" + this + " PropertyWidget getSpriteStateCode> called.", 4);
      var code:String = "";
      if (!exampleElement.getEnabled())
      {
        code += codeVarName + ".setEnabled(false);\n";
      }
      if (!visibleOBJ.getOn())
      {
        code += codeVarName + ".setSpriteVisible(false);\n";
      }
      return code;
    }
    /**
     * Returns the code of the given emoji: the demo emoji belongs to this application and
     * every other one to the framework.
     * @param emojiType the type of the emoji, an EnumEmojis value
     * @param imports the names of the classes collected so far
     */
    protected function getEmojiCode(emojiType:String, imports:Array):String
    {
      application.trace("<" + this + " PropertyWidget getEmojiCode> called.", 4);
      application.trace("<" + this + " PropertyWidget getEmojiCode> emojiType: " + emojiType, 3);
      application.trace("<" + this + " PropertyWidget getEmojiCode> imports: " + imports, 3);
      if (emojiType == EnumEmojisDemo.demo())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumEmojisDemo");
        return "EnumEmojisDemo." + emojiType + "()";
      }
      pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumEmojis");
      return "EnumEmojis." + emojiType + "()";
    }
    /**
     * Returns the import lines of the given classes, in the alphabetical order every class
     * of this framework keeps its own imports in, and the empty line separating them from
     * the code standing under them. The array is emptied: it is the store of one code only.
     * @param imports the names of the classes the code needs
     */
    protected function getImportsCode(imports:Array):String
    {
      application.trace("<" + this + " PropertyWidget getImportsCode> called.", 4);
      application.trace("<" + this + " PropertyWidget getImportsCode> imports: " + imports, 3);
      imports.sort();
      var code:String = "";
      for (var i:int = 0; i < imports.length; i++)
      {
        code += "import " + imports[i] + ";\n";
      }
      imports.splice(0);
      return code + "\n";
    }
    /**
     * Collects the name of one class the code needs. A class that is named by more than
     * one line of that code is imported once.
     * @param imports the names of the classes collected so far
     * @param className the name of the class to be collected
     */
    protected function pushImport(imports:Array, className:String):void
    {
      application.trace("<" + this + " PropertyWidget pushImport> called.", 4);
      application.trace("<" + this + " PropertyWidget pushImport> className: " + className, 3);
      if (imports.indexOf(className) == -1)
      {
        imports.push(className);
      }
    }
    /**
     * Returns the name of the given text key: the key itself without the brackets
     * standing around it, which is the name of the function answering it.
     * @param textKey the text key the name is asked of
     */
    protected function getTextKeyName(textKey:String):String
    {
      return textKey.substring(1, textKey.length - 1);
    }
    /**
     * Returns the given text, or the text key of the empty value when there is no text
     * at all.
     * @param text the text to be displayed
     */
    protected function getTextOrNone(text:String):String
    {
      return text == null || text == "" ? EnumTextKeysDemo.WIDGET_VALUE_NONE() : text;
    }
    /**
     * Returns the given text in the one line of a value of the third column: the line
     * breaks of it are taken out and it is cut when it is a longer one than a value can
     * be displayed with. An empty text is answered by the text key of the empty value.
     * @param text the text to be displayed
     */
    protected function getShortTextOrNone(text:String):String
    {
      application.trace("<" + this + " PropertyWidget getShortTextOrNone> called.", 4);
      application.trace("<" + this + " PropertyWidget getShortTextOrNone> text: " + text, 3);
      if (text == null || text == "")
      {
        return EnumTextKeysDemo.WIDGET_VALUE_NONE();
      }
      const oneLine:String = text.split("\r").join(" ").split("\n").join(" ");
      if (oneLine.length <= valueCNT)
      {
        return oneLine;
      }
      return oneLine.substring(0, valueCNT) + "...";
    }
    /**
     * Returns the text key of the yes or of the no answer.
     * @param b the value to be displayed
     */
    protected function getYesNoKey(b:Boolean):String
    {
      return b ? EnumTextKeys.YN_YES() : EnumTextKeys.YN_NO();
    }
    /**
     * Builds the content the rows of the properties stand in. It is docked to the middle
     * of the content of this widget and it is filled, so it takes the whole room the
     * example object has left, and it takes it again every time that room changes. It is
     * the one that is scrolled: the rows walk under that object, which stays where it is.
     */
    private function createRowsContent():void
    {
      application.trace("<" + this + " PropertyWidget createRowsContent> called.", 4);
      rowsContent = new ContentSingle(application);
      addToContent(indexBasic, rowsContent, 1, false);
      setElementDock(indexBasic, rowsContent, EnumDocks.DOCK_CENTER());
      setElementFill(indexBasic, rowsContent, true);
      rowsContent.setElementsFix(numOfColumns - 1);
    }
    /**
     * Builds the second content of this widget: the code writing the example object the
     * way it stands at the moment. The button copying that code and the label telling
     * that it has been copied stand in one sprite, which is docked to the top of this
     * content, and the box of the code fills the room that is left under it.
     */
    private function createCodeContent():void
    {
      application.trace("<" + this + " PropertyWidget createCodeContent> called.", 4);
      indexCode = addContent(EnumTextKeysDemo.WIDGET_TAB_CODE());
      if (indexCode < 0)
      {
        application.trace("<" + this + " PropertyWidget createCodeContent> the content of the code could not be built!", 6);
        return;
      }
      setOrientation(indexCode, EnumOrientations.ORIENTATION_DOCK());
      codeHeaderSprite = new BaseSprite(application);
      addToContent(indexCode, codeHeaderSprite, 0);
      setElementDock(indexCode, codeHeaderSprite, EnumDocks.DOCK_TOP());
      copyOBJ = new ButtonText(application);
      codeHeaderSprite.addChild(copyOBJ);
      copyOBJ.setLabel(EnumTextKeysDemo.WIDGET_ACTION_COPY());
      copiedVAL = new TextLabel(application);
      codeHeaderSprite.addChild(copiedVAL);
      copiedVAL.setType(EnumTextTypes.TEXT_TYPE_MID());
      copiedVAL.setLabel(EnumTextKeysDemo.WIDGET_CODE_COPIED());
      copiedVAL.setSpriteVisible(false);
      codeTextBox = new TextBox(application);
      addToContent(indexCode, codeTextBox, 1, false);
      setElementDock(indexCode, codeTextBox, EnumDocks.DOCK_CENTER());
      setElementFill(indexCode, codeTextBox, true);
      codeTextBox.setType(EnumTextTypes.TEXT_TYPE_MID());
      // the code is read line by line, so the lines of it are never broken: this box
      // scrolls to the right instead when a line is longer than it is
      codeTextBox.setWordWrap(false);
      // the code carries the array literals of the calls it writes, and the brackets of
      // those are no text keys of this application at all: an array standing between them
      // would be looked up as one single key and displayed as the empty string of a key
      // that does not exist, so this box displays every bracket exactly as it is
      codeTextBox.setTextKeysEnabled(false);
    }
    /**
     * Switches the scrolling of both contents of this widget off. The rows of the
     * properties have a content of their own and the code has its own box, and both of
     * those are scrolled themselves, so there is nothing left for these two to scroll.
     */
    private function switchContentScrollingOff():void
    {
      application.trace("<" + this + " PropertyWidget switchContentScrollingOff> called.", 4);
      switchScrollingOff(indexBasic);
      switchScrollingOff(indexCode);
    }
    /**
     * Switches the scrolling of the single content of the given index off in both
     * directions.
     * @param index the index of the single content
     */
    private function switchScrollingOff(index:int):void
    {
      application.trace("<" + this + " PropertyWidget switchScrollingOff> called.", 4);
      application.trace("<" + this + " PropertyWidget switchScrollingOff> index: " + index, 3);
      const baseScroll:BaseScroll = getBaseScroll(index);
      if (baseScroll != null)
      {
        baseScroll.setEnabledHorizontal(false);
        baseScroll.setEnabledVertical(false);
      }
    }
    /**
     * Places the button of the copying and the label of it next to each other, and takes
     * the dimensions of the sprite holding the two of them afterwards: that sprite is the
     * element the content of the code measures its first strip by.
     */
    private function reposCodeHeader():void
    {
      application.trace("<" + this + " PropertyWidget reposCodeHeader> called.", 4);
      if (codeHeaderSprite == null)
      {
        return;
      }
      const margin:int = application.getDynamicsConfig().getAppMargin();
      copyOBJ.setCxy(0, 0);
      copiedVAL.setCxy(copyOBJ.getCx(true) + margin
        , int((copyOBJ.getDh() - copiedVAL.getDh()) / 2));
      codeHeaderSprite.setDwh(copiedVAL.getCx(true)
        , Math.max(copyOBJ.getDh(), copiedVAL.getDh()));
    }
    /**
     * Writes the code of the current state of the example object into the box of it.
     */
    private function refreshCode():void
    {
      application.trace("<" + this + " PropertyWidget refreshCode> called.", 4);
      if (codeTextBox == null)
      {
        return;
      }
      codeText = getExampleCode();
      codeTextBox.setLabel(codeText);
    }
    /**
     * Gives the width of one column to every element that does not take a width of its
     * own. An input and a picker are as wide as they are told to be, and a label of the
     * first or of the third column is kept inside that width, so a long text of it is
     * broken into several lines instead of pushing the columns next to it away. The
     * switchers, the potmeters and the links are left alone: those take the width their
     * own labels need.
     */
    private function resizeColumns():void
    {
      application.trace("<" + this + " PropertyWidget resizeColumns> called.", 4);
      const newColumnDw:int = getColumnDw();
      if (newColumnDw <= 0 || columnDw == newColumnDw)
      {
        application.trace("<" + this + " PropertyWidget resizeColumns> nothing to do with: " + newColumnDw, 3);
        return;
      }
      columnDw = newColumnDw;
      var i:int = 0;
      for (i = 0; i < sizedElementsARR.length; i++)
      {
        BaseSprite(sizedElementsARR[i]).setDw(columnDw);
      }
      for (i = 0; i < maxWidthLabelsARR.length; i++)
      {
        TextLabel(maxWidthLabelsARR[i]).setMaxWidth(columnDw, true);
      }
    }
    /**
     * Returns the width one column of the content can take: the room of that content
     * without the gaps it leaves around and between its cells, shared by the columns.
     */
    private function getColumnDw():int
    {
      application.trace("<" + this + " PropertyWidget getColumnDw> called.", 4);
      const gap:int = rowsContent.getGapFactor() * application.getDynamicsConfig().getAppMargin();
      const columnsDw:int = rowsContent.getDw() - (numOfColumns + 1) * gap;
      return int(columnsDw / numOfColumns);
    }
    /**
     * Counts the columns again after the content of the rows has been resized: it is the
     * room of those columns. This widget can be resized by the one using the application,
     * it takes other dimensions in the mobile widget mode as well, and the example object
     * standing above that content can take another height at any time, so that room
     * changes over and over again.
     * @param e the dimensions changed event of the content of the rows
     */
    private function rowsContentResized(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget rowsContentResized> called.", 4);
      application.trace("<" + this + " PropertyWidget rowsContentResized> e: " + e, 3);
      resizeColumns();
    }
    /**
     * Counts the columns again after the margin of the application has been changed: the
     * gaps of the content are taken from that margin.
     * @param e the margin changed event of the application
     */
    private function marginChanged(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget marginChanged> called.", 4);
      application.trace("<" + this + " PropertyWidget marginChanged> e: " + e, 3);
      resizeColumns();
    }
    /**
     * Displays every value again after the example object has taken new dimensions. The
     * room of the rows under it is left alone here: that object is docked to the top of
     * the content of this widget, so the strip of it and the room the rows fill are
     * measured by that content itself.
     * @param e the dimensions changed event of that object
     */
    private function exampleElementResized(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget exampleElementResized> called.", 4);
      application.trace("<" + this + " PropertyWidget exampleElementResized> e: " + e, 3);
      displayEveryCurrentValue();
    }
    /**
     * Gives the new width to the example object.
     * @param e the changed event of the potmeter of the width
     */
    private function widthChanged(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget widthChanged> called.", 4);
      application.trace("<" + this + " PropertyWidget widthChanged> e: " + e, 3);
      exampleElement.setDw(int(widthOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Gives the new height to the example object.
     * @param e the changed event of the potmeter of the height
     */
    private function heightChanged(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget heightChanged> called.", 4);
      application.trace("<" + this + " PropertyWidget heightChanged> e: " + e, 3);
      exampleElement.setDh(int(heightOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Gives the text of the input of the value row to the example object as its value
     * object.
     * @param e the changed event of that input
     */
    private function valueChanged(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget valueChanged> called.", 4);
      application.trace("<" + this + " PropertyWidget valueChanged> e: " + e, 3);
      exampleElement.setValue(valueOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Enables or disables the example object.
     * @param e the changed event of the switcher of the enabled state
     */
    private function enabledChanged(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget enabledChanged> called.", 4);
      application.trace("<" + this + " PropertyWidget enabledChanged> e: " + e, 3);
      exampleElement.setEnabled(enabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Shows or hides the example object. A hidden sprite has no dimensions at all, so the
     * rows of them stand empty until it is shown again.
     * @param e the changed event of the switcher of the visibility
     */
    private function visibleChanged(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget visibleChanged> called.", 4);
      application.trace("<" + this + " PropertyWidget visibleChanged> e: " + e, 3);
      exampleElement.setSpriteVisible(visibleOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Takes the example object to the lowest depth of the content of this widget.
     * @param e the click event of that link
     */
    private function toLowestDepthClick(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget toLowestDepthClick> called.", 4);
      application.trace("<" + this + " PropertyWidget toLowestDepthClick> e: " + e, 3);
      exampleElement.toTheLowestDepth();
      displayEveryCurrentValue();
    }
    /**
     * Takes the example object to the highest depth of the content of this widget.
     * @param e the click event of that link
     */
    private function toHighestDepthClick(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget toHighestDepthClick> called.", 4);
      application.trace("<" + this + " PropertyWidget toHighestDepthClick> e: " + e, 3);
      exampleElement.toTheHighestDepth();
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked sound to the example object, or takes the sound of it away when the
     * empty item has been picked. That sound is played when that object is pressed.
     * @param e the changed event of the picker of the sounds
     */
    private function soundClickChanged(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget soundClickChanged> called.", 4);
      application.trace("<" + this + " PropertyWidget soundClickChanged> e: " + e, 3);
      const soundType:String = soundClickOBJ.getSelectedValue();
      exampleElement.setSoundTypeClick(soundType == "" ? null : soundType);
      displayEveryCurrentValue();
    }
    /**
     * Takes the stored coordinates of the example object from the ones it stands at.
     * @param e the click event of that link
     */
    private function updateCxyClick(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget updateCxyClick> called.", 4);
      application.trace("<" + this + " PropertyWidget updateCxyClick> e: " + e, 3);
      exampleElement.updateCxy();
      displayEveryCurrentValue();
    }
    /**
     * Asks the example object for the very dimensions the label of that link tells.
     * @param e the click event of that link
     */
    private function setDimensionsClick(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget setDimensionsClick> called.", 4);
      application.trace("<" + this + " PropertyWidget setDimensionsClick> e: " + e, 3);
      exampleElement.setDwh(dimensionsToSet, dimensionsToSet);
      displayEveryCurrentValue();
    }
    /**
     * Takes the parent object of the event dispatcher of the example object to that object
     * itself: every event of it carries that object, so a listener knows what it has
     * arrived from.
     * @param e the click event of that link
     */
    private function dispatcherClick(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget dispatcherClick> called.", 4);
      application.trace("<" + this + " PropertyWidget dispatcherClick> e: " + e, 3);
      exampleElement.setEventDispatcherObjectToThis();
      displayEveryCurrentValue();
    }
    /**
     * Scrolls the content of this widget to the example object.
     * @param e the click event of that link
     */
    private function toBeVisibleClick(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget toBeVisibleClick> called.", 4);
      application.trace("<" + this + " PropertyWidget toBeVisibleClick> e: " + e, 3);
      exampleElement.toBeVisible();
      displayEveryCurrentValue();
    }
    /**
     * Writes the code of the current state into the box of it as soon as the content of
     * the code has become the active one. That code is not written while the rows of the
     * properties are the ones being displayed: it is asked for once, when it is about to
     * be read.
     * @param e the changed event of the content of this widget
     */
    private function activeContentChanged(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget activeContentChanged> called.", 4);
      application.trace("<" + this + " PropertyWidget activeContentChanged> e: " + e, 3);
      if (getActiveIndex() == indexCode)
      {
        refreshCode();
      }
    }
    /**
     * Places the first line of the content of the code again after the button of the
     * copying or the label of it has taken new dimensions: a new font size and another
     * language give both of them another width.
     * @param e the dimensions changed event of that button or of that label
     */
    private function codeHeaderResized(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget codeHeaderResized> called.", 4);
      application.trace("<" + this + " PropertyWidget codeHeaderResized> e: " + e, 3);
      reposCodeHeader();
    }
    /**
     * Puts the code of the current state onto the clipboard, displays the label telling
     * that it is there and switches the button of the copying off: that button is the one
     * telling that this code is on the clipboard already. Both of them come back together,
     * a few seconds later.
     * @param e the click event of the button of the copying
     */
    private function copyClick(e:Event):void
    {
      application.trace("<" + this + " PropertyWidget copyClick> called.", 4);
      application.trace("<" + this + " PropertyWidget copyClick> e: " + e, 3);
      System.setClipboard(codeText);
      copiedVAL.setSpriteVisible(true);
      copyOBJ.setEnabled(false);
      createCopiedTimer();
    }
    /**
     * Creates and starts the timer taking the label of the copying away.
     */
    private function createCopiedTimer():void
    {
      application.trace("<" + this + " PropertyWidget createCopiedTimer> called.", 4);
      dropCopiedTimer();
      copiedTimer = new Timer(copiedMs, 1);
      copiedTimer.addEventListener(TimerEvent.TIMER, copiedTimerHandler);
      copiedTimer.start();
    }
    /**
     * Stops and frees up the timer taking the label of the copying away.
     */
    private function dropCopiedTimer():void
    {
      application.trace("<" + this + " PropertyWidget dropCopiedTimer> called.", 4);
      if (copiedTimer != null)
      {
        copiedTimer.stop();
        copiedTimer.removeEventListener(TimerEvent.TIMER, copiedTimerHandler);
        copiedTimer = null;
      }
    }
    /**
     * Takes the label of the copying away as soon as its time is over and gives the button
     * of the copying back: the code can be put onto the clipboard again.
     * @param e the timer event of the timer of that label
     */
    private function copiedTimerHandler(e:TimerEvent):void
    {
      application.trace("<" + this + " PropertyWidget copiedTimerHandler> called.", 4);
      application.trace("<" + this + " PropertyWidget copiedTimerHandler> e: " + e, 3);
      copiedVAL.setSpriteVisible(false);
      copyOBJ.setEnabled(true);
      dropCopiedTimer();
    }
    /**
     * Destroys this object and frees up everything. Every element of this widget stands
     * in the content of it, and that content is destroyed by the super destroy below, so
     * the references of them are only cleared here. The listeners registered above are
     * the ones of those very elements, so they are freed up together with them.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " PropertyWidget destroy> called.", 4);
      application.trace("<" + this + " PropertyWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.getBaseEventDispatcher().removeEventListener(EnumEvents.EVENT_MARGIN_CHANGED(), marginChanged);
      dropCopiedTimer();
      application.trace("<" + this + " PropertyWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      sizedElementsARR.splice(0);
      maxWidthLabelsARR.splice(0);
      application.trace("<" + this + " PropertyWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " PropertyWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      exampleElement = null;
      rowsContent = null;
      codeVarName = null;
      numOfColumns = 0;
      nextRowCellIndex = 0;
      columnDw = 0;
      sizedElementsARR = null;
      maxWidthLabelsARR = null;
      listPickerCNT = 0;
      valueCNT = 0;
      dimensionsToSet = 0;
      indexCode = -1;
      codeHeaderSprite = null;
      copyOBJ = null;
      copiedVAL = null;
      copiedMs = 0;
      copiedTimer = null;
      codeTextBox = null;
      codeText = null;
      widthOBJ = null;
      heightOBJ = null;
      valueOBJ = null;
      enabledOBJ = null;
      visibleOBJ = null;
      toLowestDepthOBJ = null;
      toHighestDepthOBJ = null;
      soundClickOBJ = null;
      updateCxyOBJ = null;
      setDimensionsOBJ = null;
      dispatcherOBJ = null;
      toBeVisibleOBJ = null;
      valueVAL = null;
      enabledVAL = null;
      positionVAL = null;
      dimensionsVAL = null;
      lastEventVAL = null;
      lastEventName = null;
    }
  }
}
