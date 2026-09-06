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
 * BoardWidget.
 * The widget of the Board component of the framework.
 *
 * MAIN FEATURES:
 * - a surface to draw on: lines, colors, thickness and the saving of the drawing
 * - the example board stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the toolbar, of the drawable area and of the png image are built here,
 *   every other one comes from the PropertyWidget base class
 * - both dimensions of that board come from the outside, so it has a row of a width and a
 *   row of a height as well, and both of those are refused as soon as the first line has
 *   been drawn onto it
 * - the drawable area sizes itself from the dimensions of the whole board, so the code of
 *   the current state writes those dimensions only and leaves that area to follow them
 * - the enabled state of the whole board switches every tool of its toolbar at once, and
 *   the seven rows of those tools follow it: each of them is read back from that board and
 *   not from its own switcher
 * - the picker of the color of the background is the only tool that refuses the row of it: it
 *   is locked by the very first line drawn onto that board and only the clearing unlocks it,
 *   so that row falls back onto the state of that board every time it is touched in vain
 * - the last movement of the drawing can be undone from the toolbar of that board and from
 *   the row of the movements as well, and that row displays the number of the movements
 *   that can still be undone
 * - the last undone movement can be redone the very same way, from that toolbar and from the
 *   row of the undone movements, and every undone movement is dropped for good as soon as a
 *   new line is drawn onto that board, so the number of that row falls back to zero there
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.ui.Board;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  import flash.utils.ByteArray;
  public class BoardWidget extends PropertyWidget
  {
    // the dimensions the example board is built with, and the range of the two rows of them
    private var exampleDw:int = 420;
    private var exampleDh:int = 300;
    private var widthMIN:int = 240;
    private var widthMAX:int = 700;
    private var widthINC:int = 20;
    private var heightMIN:int = 200;
    private var heightMAX:int = 520;
    private var heightINC:int = 20;
    // the dimensions the drawable area is asked for by the row of it, the very ones the
    // label of that link tells
    private var contentDwToSet:int = 240;
    private var contentDhToSet:int = 160;
    // The number of the bytes of the png image the row of it has read the last time, and
    // the number telling that it has not been read at all yet. Such an image is counted on
    // demand only, so it is no state of that board and it can not be displayed before the
    // first reading.
    private var imageLength:int = -1;
    private var imageNotRead:int = -1;
    // the example board: the very object the rows of this widget work on
    private var exampleBoard:Board = null;
    // the elements changing the properties of that board
    private var labelOBJ:TextInput = null;
    private var backgroundColorOBJ:TextInput = null;
    private var backgroundEnabledOBJ:Switcher = null;
    private var lineColorOBJ:TextInput = null;
    private var lineEnabledOBJ:Switcher = null;
    private var lineThicknessOBJ:Potmeter = null;
    private var lineThicknessEnabledOBJ:Switcher = null;
    private var drawOBJ:Switcher = null;
    private var drawEnabledOBJ:Switcher = null;
    private var undoEnabledOBJ:Switcher = null;
    private var redoEnabledOBJ:Switcher = null;
    private var clearEnabledOBJ:Switcher = null;
    private var clearOBJ:ButtonLink = null;
    private var undoOBJ:ButtonLink = null;
    private var redoOBJ:ButtonLink = null;
    private var setContentDimensionsOBJ:ButtonLink = null;
    private var readImageOBJ:ButtonLink = null;
    private var resizeIsPossibleOBJ:Switcher = null;
    // the labels of the third column: the values the getters of that board answer
    private var labelVAL:TextLabel = null;
    private var backgroundColorVAL:TextLabel = null;
    private var backgroundEnabledVAL:TextLabel = null;
    private var lineColorVAL:TextLabel = null;
    private var lineEnabledVAL:TextLabel = null;
    private var lineThicknessVAL:TextLabel = null;
    private var lineThicknessEnabledVAL:TextLabel = null;
    private var drawVAL:TextLabel = null;
    private var drawEnabledVAL:TextLabel = null;
    private var undoEnabledVAL:TextLabel = null;
    private var redoEnabledVAL:TextLabel = null;
    private var clearEnabledVAL:TextLabel = null;
    private var contentEmptyVAL:TextLabel = null;
    private var movementsVAL:TextLabel = null;
    private var undoneMovementsVAL:TextLabel = null;
    private var canvasVAL:TextLabel = null;
    private var contentDimensionsVAL:TextLabel = null;
    private var imageVAL:TextLabel = null;
    private var resizeIsPossibleVAL:TextLabel = null;
    /**
     * Constructs the widget of the Board component.
     * @param applicationRef the main application reference
     */
    public function BoardWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " BoardWidget> called.", 4);
      application.trace("<" + this + " BoardWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.BOARD();
      headerIcon = EnumIconsDemo.board();
      infoCode = EnumTextKeysDemo.WIDGETINFO_BOARD();
      codeVarName = "board";
      iniSizeWidth = 770;
      iniSizeHeight = 920;
      application.trace("<" + this + " BoardWidget> constructed.", 4);
    }
    /**
     * Builds the example board of this widget: the one standing in the dimensions of the
     * example, with the label naming it. Its drawable area is left alone on purpose: such
     * an area sizes itself from the dimensions of the whole board, under the toolbar of it.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " BoardWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleBoard = new Board(application);
      setExampleElement(exampleBoard);
      exampleBoard.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_BOARD_LABEL());
      exampleBoard.setDwh(exampleDw, exampleDh);
    }
    /**
     * Builds every row of this widget: the ones of the toolbar of the Board component, the
     * ones of the drawable area of it and the ones the base class holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " BoardWidget createRows> called.", 4);
      super.createRows();
      createToolbarRows();
      createContentRows();
      createWidthRow(widthMIN, widthMAX, widthINC);
      createHeightRow(heightMIN, heightMAX, heightINC);
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * board as well: that board dispatches its changed event on every change of it, whether
     * it comes from its own toolbar, from the hand drawing on it or from a row of this
     * widget, and its cleared event every time it has been taken back to the empty state.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " BoardWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleBoard.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleBoardChanged);
      exampleBoard.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLEARED(), exampleBoardChanged);
      labelOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelChanged);
      backgroundColorOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), backgroundColorChanged);
      backgroundEnabledOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), backgroundEnabledChanged);
      lineColorOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), lineColorChanged);
      lineEnabledOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), lineEnabledChanged);
      lineThicknessOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), lineThicknessChanged);
      lineThicknessEnabledOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), lineThicknessEnabledChanged);
      drawOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), drawChanged);
      drawEnabledOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), drawEnabledChanged);
      undoEnabledOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), undoEnabledChanged);
      redoEnabledOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), redoEnabledChanged);
      clearEnabledOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), clearEnabledChanged);
      undoOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), undoClick);
      redoOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), redoClick);
      clearOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), clearClick);
      setContentDimensionsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), setContentDimensionsClick);
      readImageOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), readImageClick);
      resizeIsPossibleOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), resizeIsPossibleChanged);
    }
    /**
     * Displays the current value of every property of the example board. Every row that has
     * a getter behind it is set silently onto the state of that board: the thickness and the
     * drawing stand in the toolbar of it as well, and the enabled state of the whole board
     * switches every tool of that toolbar at once, so all six of those rows can move
     * without anybody having touched them. An event of such a setting would be taken as a
     * change made by the one using this application.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " BoardWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      labelVAL.setLabel(getTextOrNone(exampleBoard.getLabel()));
      backgroundColorVAL.setLabel(exampleBoard.getBackgroundRGBColor());
      backgroundEnabledOBJ.setOn(exampleBoard.getBackgroundEnabled(), false);
      backgroundEnabledVAL.setLabel(getYesNoKey(exampleBoard.getBackgroundEnabled()));
      lineColorVAL.setLabel(exampleBoard.getLineRGBColor());
      lineEnabledOBJ.setOn(exampleBoard.getLineEnabled(), false);
      lineEnabledVAL.setLabel(getYesNoKey(exampleBoard.getLineEnabled()));
      lineThicknessOBJ.setCurValue(exampleBoard.getLineThickness(), false);
      lineThicknessVAL.setLabel("" + exampleBoard.getLineThickness());
      lineThicknessEnabledOBJ.setOn(exampleBoard.getLineThicknessEnabled(), false);
      lineThicknessEnabledVAL.setLabel(getYesNoKey(exampleBoard.getLineThicknessEnabled()));
      drawOBJ.setOn(exampleBoard.getDraw(), false);
      drawVAL.setLabel(getYesNoKey(exampleBoard.getDraw()));
      drawEnabledOBJ.setOn(exampleBoard.getDrawEnabled(), false);
      drawEnabledVAL.setLabel(getYesNoKey(exampleBoard.getDrawEnabled()));
      undoEnabledOBJ.setOn(exampleBoard.getUndoEnabled(), false);
      undoEnabledVAL.setLabel(getYesNoKey(exampleBoard.getUndoEnabled()));
      redoEnabledOBJ.setOn(exampleBoard.getRedoEnabled(), false);
      redoEnabledVAL.setLabel(getYesNoKey(exampleBoard.getRedoEnabled()));
      clearEnabledOBJ.setOn(exampleBoard.getClearEnabled(), false);
      clearEnabledVAL.setLabel(getYesNoKey(exampleBoard.getClearEnabled()));
      contentEmptyVAL.setLabel(getYesNoKey(exampleBoard.isContentEmpty()));
      movementsVAL.setLabel("" + exampleBoard.getMovementsCount());
      undoneMovementsVAL.setLabel("" + exampleBoard.getUndoneMovementsCount());
      canvasVAL.setLabel(exampleBoard.getCanvasWidth() + " x " + exampleBoard.getCanvasHeight());
      contentDimensionsVAL.setLabel(exampleBoard.getDwContent() + " x " + exampleBoard.getDhContent());
      imageVAL.setLabel(imageLength == imageNotRead
        ? EnumTextKeysDemo.WIDGET_VALUE_NONE() : "" + imageLength);
      resizeIsPossibleOBJ.setOn(exampleBoard.getResizeIsPossible(), false);
      resizeIsPossibleVAL.setLabel(getYesNoKey(exampleBoard.getResizeIsPossible()));
    }
    /**
     * Returns the code writing the example board the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new board. The colors and the thickness of a brand new one come
     * from the components config of the application, so those three are compared to that
     * config, and every class the code below names is collected into the imports while
     * those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " BoardWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("Board", imports);
      if (exampleBoard.getLabel() != "")
      {
        code += codeVarName + ".setLabel(" + getLabelCode(imports) + ");\n";
      }
      if (exampleBoard.getBackgroundRGBColor() != application.getComponentsConfig().getBoardBackgroundColor())
      {
        code += codeVarName + ".setBackgroundRGBColor(\"" + exampleBoard.getBackgroundRGBColor() + "\");\n";
      }
      if (exampleBoard.getLineRGBColor() != application.getComponentsConfig().getBoardLineColor())
      {
        code += codeVarName + ".setLineRGBColor(\"" + exampleBoard.getLineRGBColor() + "\");\n";
      }
      if (exampleBoard.getLineThickness() != application.getComponentsConfig().getBoardLineThickness())
      {
        code += codeVarName + ".setLineThickness(" + exampleBoard.getLineThickness() + ");\n";
      }
      if (!exampleBoard.getDraw())
      {
        code += codeVarName + ".setDraw(false);\n";
      }
      if (!exampleBoard.getResizeIsPossible())
      {
        code += codeVarName + ".setResizeIsPossible(false);\n";
      }
      code += getToolbarStateCode();
      // the dimensions of the whole board close the properties of it: the drawable area
      // sizes itself from them, under the toolbar
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the toolbar of the example board: the label naming it, the color
     * of the background, the color of the line, the thickness of that line and the switch
     * between the drawing and the rubbing out. Every one of these can be switched off on
     * its own as well, and the row of every one of those switchings displays the state that
     * board really stands in. The two inputs of the colors take the six hexadecimal
     * characters of an rgb string and nothing else, the very same way the two pickers
     * standing in that toolbar do.
     */
    private function createToolbarRows():void
    {
      application.trace("<" + this + " BoardWidget createToolbarRows> called.", 4);
      const maxCharsRgb:int = application.getComponentsConfig().getColorMaxCharsRgbInput();
      const enabledCharsHex:String = application.getComponentsConfig().getTextEnabledCharsHex();
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL());
      labelOBJ = createTextInput(cellIndex + 1);
      labelVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_BACKGROUND_COLOR());
      backgroundColorOBJ = createTextInput(cellIndex + 1);
      backgroundColorOBJ.setMaxChars(maxCharsRgb);
      backgroundColorOBJ.setRestrict(enabledCharsHex);
      backgroundColorOBJ.setLabel(application.getComponentsConfig().getBoardBackgroundColor());
      backgroundColorVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_BACKGROUND_ENABLED());
      backgroundEnabledOBJ = createSwitcher(cellIndex + 1, true);
      backgroundEnabledVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LINE_COLOR());
      lineColorOBJ = createTextInput(cellIndex + 1);
      lineColorOBJ.setMaxChars(maxCharsRgb);
      lineColorOBJ.setRestrict(enabledCharsHex);
      lineColorOBJ.setLabel(application.getComponentsConfig().getBoardLineColor());
      lineColorVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LINE_ENABLED());
      lineEnabledOBJ = createSwitcher(cellIndex + 1, true);
      lineEnabledVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LINE_THICKNESS());
      lineThicknessOBJ = createPotmeter(cellIndex + 1
          , application.getComponentsConfig().getBoardLineMinThickness()
          , application.getComponentsConfig().getBoardLineMaxThickness()
          , application.getComponentsConfig().getBoardLineIncThickness());
      lineThicknessVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LINE_THICKNESS_ENABLED());
      lineThicknessEnabledOBJ = createSwitcher(cellIndex + 1, true);
      lineThicknessEnabledVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_DRAW());
      drawOBJ = createSwitcher(cellIndex + 1, true);
      drawVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_DRAW_ENABLED());
      drawEnabledOBJ = createSwitcher(cellIndex + 1, true);
      drawEnabledVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_UNDO_ENABLED());
      undoEnabledOBJ = createSwitcher(cellIndex + 1, true);
      undoEnabledVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_REDO_ENABLED());
      redoEnabledOBJ = createSwitcher(cellIndex + 1, true);
      redoEnabledVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CLEAR_ENABLED());
      clearEnabledOBJ = createSwitcher(cellIndex + 1, true);
      clearEnabledVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the drawable area of the example board: the empty state of it, the
     * movements drawn onto it, the ones undone so far, the dimensions it stands in and the
     * png image it is read out as. The clearing of this row asks nothing at all, while the
     * button of the toolbar asks for a confirmation first: this is the very call the code of
     * an application clears such a board by. The undoing and the redoing ask nothing in
     * either place, and the two rows of the movements tell how many of them can still be
     * undone and how many of them can still be redone. The image is counted on demand only,
     * because it is drawn into a bitmap and encoded every time it is asked for.
     */
    private function createContentRows():void
    {
      application.trace("<" + this + " BoardWidget createContentRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_CONTENT_EMPTY());
      clearOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLEAR());
      contentEmptyVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MOVEMENTS());
      undoOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_UNDO());
      movementsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_UNDONE_MOVEMENTS());
      redoOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REDO());
      undoneMovementsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CANVAS());
      canvasVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CONTENT_DIMENSIONS());
      setContentDimensionsOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_CONTENT_DIMENSIONS());
      contentDimensionsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CANVAS_IMAGE());
      readImageOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_READ_IMAGE());
      imageVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_RESIZE_POSSIBLE());
      resizeIsPossibleOBJ = createSwitcher(cellIndex + 1, true);
      resizeIsPossibleVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the code of the text naming the example board: the text key of the label of
     * the example when that one is displayed, and the text itself in quotation marks
     * otherwise.
     * @param imports the names of the classes collected so far
     */
    private function getLabelCode(imports:Array):String
    {
      application.trace("<" + this + " BoardWidget getLabelCode> called.", 4);
      application.trace("<" + this + " BoardWidget getLabelCode> imports: " + imports, 3);
      if (exampleBoard.getLabel() == EnumTextKeysDemo.WIDGET_EXAMPLE_BOARD_LABEL())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        return "EnumTextKeysDemo." + getTextKeyName(exampleBoard.getLabel()) + "()";
      }
      return "\"" + exampleBoard.getLabel() + "\"";
    }
    /**
     * Returns the code of the seven switchings of the toolbar of the example board: one line
     * per tool that has been switched off. A board that has been switched off as a whole
     * carries all seven of them, and the line switching that board off closes the whole code
     * anyway, so every one of these lines is written before it.
     */
    private function getToolbarStateCode():String
    {
      application.trace("<" + this + " BoardWidget getToolbarStateCode> called.", 4);
      var code:String = "";
      if (!exampleBoard.getBackgroundEnabled())
      {
        code += codeVarName + ".setBackgroundEnabled(false);\n";
      }
      if (!exampleBoard.getLineEnabled())
      {
        code += codeVarName + ".setLineEnabled(false);\n";
      }
      if (!exampleBoard.getLineThicknessEnabled())
      {
        code += codeVarName + ".setLineThicknessEnabled(false);\n";
      }
      if (!exampleBoard.getDrawEnabled())
      {
        code += codeVarName + ".setDrawEnabled(false);\n";
      }
      if (!exampleBoard.getUndoEnabled())
      {
        code += codeVarName + ".setUndoEnabled(false);\n";
      }
      if (!exampleBoard.getRedoEnabled())
      {
        code += codeVarName + ".setRedoEnabled(false);\n";
      }
      if (!exampleBoard.getClearEnabled())
      {
        code += codeVarName + ".setClearEnabled(false);\n";
      }
      return code;
    }
    /**
     * Displays every value again after the example board has reported a change of it or a
     * clearing of its drawable area.
     * @param e the changed or cleared event of that board
     */
    private function exampleBoardChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget exampleBoardChanged> called.", 4);
      application.trace("<" + this + " BoardWidget exampleBoardChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the text of the input of the label row to the example board.
     * @param e the changed event of that input
     */
    private function labelChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget labelChanged> called.", 4);
      application.trace("<" + this + " BoardWidget labelChanged> e: " + e, 3);
      exampleBoard.setLabel(labelOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Gives the typed color to the background of the drawable area of the example board.
     * Such a board only takes a new background while nothing has been drawn onto it yet, so
     * this row does nothing at all from the first line on.
     * @param e the changed event of the input of the color of the background
     */
    private function backgroundColorChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget backgroundColorChanged> called.", 4);
      application.trace("<" + this + " BoardWidget backgroundColorChanged> e: " + e, 3);
      exampleBoard.setBackgroundRGBColor(backgroundColorOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Switches the picker of the color of the background on or off in the toolbar of the
     * example board. Such a picker is locked by the very first line drawn onto that board and
     * only the clearing unlocks it, so this row is refused from that first line on: the state
     * displayed below is read back from that board and it falls onto the switcher of this row
     * as well, so a switching in vain is taken back at once.
     * @param e the changed event of the switcher of that picker
     */
    private function backgroundEnabledChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget backgroundEnabledChanged> called.", 4);
      application.trace("<" + this + " BoardWidget backgroundEnabledChanged> e: " + e, 3);
      exampleBoard.setBackgroundEnabled(backgroundEnabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Gives the typed color to the line the example board draws by.
     * @param e the changed event of the input of the color of the line
     */
    private function lineColorChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget lineColorChanged> called.", 4);
      application.trace("<" + this + " BoardWidget lineColorChanged> e: " + e, 3);
      exampleBoard.setLineRGBColor(lineColorOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Switches the picker of the color of the line on or off in the toolbar of the example
     * board.
     * @param e the changed event of the switcher of that picker
     */
    private function lineEnabledChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget lineEnabledChanged> called.", 4);
      application.trace("<" + this + " BoardWidget lineEnabledChanged> e: " + e, 3);
      exampleBoard.setLineEnabled(lineEnabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Gives the turned thickness to the line the example board draws by.
     * @param e the changed event of the potmeter of the thickness of the line
     */
    private function lineThicknessChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget lineThicknessChanged> called.", 4);
      application.trace("<" + this + " BoardWidget lineThicknessChanged> e: " + e, 3);
      exampleBoard.setLineThickness(int(lineThicknessOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Switches the potmeter of the thickness of the line on or off in the toolbar of the
     * example board.
     * @param e the changed event of the switcher of that potmeter
     */
    private function lineThicknessEnabledChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget lineThicknessEnabledChanged> called.", 4);
      application.trace("<" + this + " BoardWidget lineThicknessEnabledChanged> e: " + e, 3);
      exampleBoard.setLineThicknessEnabled(lineThicknessEnabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Takes the example board to the drawing or to the rubbing out.
     * @param e the changed event of the switcher of the drawing
     */
    private function drawChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget drawChanged> called.", 4);
      application.trace("<" + this + " BoardWidget drawChanged> e: " + e, 3);
      exampleBoard.setDraw(drawOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Switches the switcher of the drawing on or off in the toolbar of the example board.
     * @param e the changed event of the switcher of that switcher
     */
    private function drawEnabledChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget drawEnabledChanged> called.", 4);
      application.trace("<" + this + " BoardWidget drawEnabledChanged> e: " + e, 3);
      exampleBoard.setDrawEnabled(drawEnabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Switches the button of the undoing on or off in the toolbar of the example board.
     * @param e the changed event of the switcher of that button
     */
    private function undoEnabledChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget undoEnabledChanged> called.", 4);
      application.trace("<" + this + " BoardWidget undoEnabledChanged> e: " + e, 3);
      exampleBoard.setUndoEnabled(undoEnabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Switches the button of the redoing on or off in the toolbar of the example board.
     * @param e the changed event of the switcher of that button
     */
    private function redoEnabledChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget redoEnabledChanged> called.", 4);
      application.trace("<" + this + " BoardWidget redoEnabledChanged> e: " + e, 3);
      exampleBoard.setRedoEnabled(redoEnabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Switches the button of the clearing on or off in the toolbar of the example board.
     * @param e the changed event of the switcher of that button
     */
    private function clearEnabledChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget clearEnabledChanged> called.", 4);
      application.trace("<" + this + " BoardWidget clearEnabledChanged> e: " + e, 3);
      exampleBoard.setClearEnabled(clearEnabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Undoes the last movement drawn onto the example board: the very thing the button of
     * the toolbar of that board does, because neither of the two asks anything at all.
     * Nothing happens at all when there is no movement left to be undone.
     * @param e the click event of that link
     */
    private function undoClick(e:Event):void
    {
      application.trace("<" + this + " BoardWidget undoClick> called.", 4);
      application.trace("<" + this + " BoardWidget undoClick> e: " + e, 3);
      exampleBoard.undo();
      displayEveryCurrentValue();
    }
    /**
     * Redoes the last undone movement of the example board: the very thing the button of the
     * toolbar of that board does, because neither of the two asks anything at all. Nothing
     * happens at all when there is no undone movement left to be redone, and every one of
     * them is gone as soon as a new line has been drawn onto that board.
     * @param e the click event of that link
     */
    private function redoClick(e:Event):void
    {
      application.trace("<" + this + " BoardWidget redoClick> called.", 4);
      application.trace("<" + this + " BoardWidget redoClick> e: " + e, 3);
      exampleBoard.redo();
      displayEveryCurrentValue();
    }
    /**
     * Clears the drawable area of the example board at once. The button of the toolbar asks
     * for a confirmation before it does the very same thing, and this call asks nothing at
     * all: this is the one the code of an application clears such a board by.
     * @param e the click event of that link
     */
    private function clearClick(e:Event):void
    {
      application.trace("<" + this + " BoardWidget clearClick> called.", 4);
      application.trace("<" + this + " BoardWidget clearClick> e: " + e, 3);
      exampleBoard.clear();
      displayEveryCurrentValue();
    }
    /**
     * Asks the drawable area of the example board for the very dimensions the label of that
     * link tells. Such an area is only sized while nothing has been drawn onto it yet, and
     * the whole board takes the room that area and the toolbar above it need.
     * @param e the click event of that link
     */
    private function setContentDimensionsClick(e:Event):void
    {
      application.trace("<" + this + " BoardWidget setContentDimensionsClick> called.", 4);
      application.trace("<" + this + " BoardWidget setContentDimensionsClick> e: " + e, 3);
      exampleBoard.setDwhContent(contentDwToSet, contentDhToSet);
      displayEveryCurrentValue();
    }
    /**
     * Reads the drawable area of the example board out as a png image and displays the
     * number of the bytes of it. That image is drawn into a bitmap and encoded every time
     * it is asked for, so it is read on demand only, and the bytes of it are freed up right
     * after they have been counted: this row demonstrates that such an image can be taken
     * at all, and the application around a board is the one sending it or saving it.
     * @param e the click event of that link
     */
    private function readImageClick(e:Event):void
    {
      application.trace("<" + this + " BoardWidget readImageClick> called.", 4);
      application.trace("<" + this + " BoardWidget readImageClick> e: " + e, 3);
      const byteArray:ByteArray = exampleBoard.getCanvasByteArray();
      imageLength = byteArray.length;
      byteArray.clear();
      displayEveryCurrentValue();
    }
    /**
     * Tells the example board whether it can be resized by the resizer standing in its
     * bottom right corner.
     * @param e the changed event of the switcher of the resizing
     */
    private function resizeIsPossibleChanged(e:Event):void
    {
      application.trace("<" + this + " BoardWidget resizeIsPossibleChanged> called.", 4);
      application.trace("<" + this + " BoardWidget resizeIsPossibleChanged> e: " + e, 3);
      exampleBoard.setResizeIsPossible(resizeIsPossibleOBJ.getOn());
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
      application.trace("<" + this + " BoardWidget destroy> called.", 4);
      application.trace("<" + this + " BoardWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " BoardWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " BoardWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " BoardWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      exampleDw = 0;
      exampleDh = 0;
      widthMIN = 0;
      widthMAX = 0;
      widthINC = 0;
      heightMIN = 0;
      heightMAX = 0;
      heightINC = 0;
      contentDwToSet = 0;
      contentDhToSet = 0;
      imageLength = 0;
      imageNotRead = 0;
      exampleBoard = null;
      labelOBJ = null;
      backgroundColorOBJ = null;
      backgroundEnabledOBJ = null;
      lineColorOBJ = null;
      lineEnabledOBJ = null;
      lineThicknessOBJ = null;
      lineThicknessEnabledOBJ = null;
      drawOBJ = null;
      drawEnabledOBJ = null;
      undoEnabledOBJ = null;
      redoEnabledOBJ = null;
      clearEnabledOBJ = null;
      clearOBJ = null;
      undoOBJ = null;
      redoOBJ = null;
      setContentDimensionsOBJ = null;
      readImageOBJ = null;
      resizeIsPossibleOBJ = null;
      labelVAL = null;
      backgroundColorVAL = null;
      backgroundEnabledVAL = null;
      lineColorVAL = null;
      lineEnabledVAL = null;
      lineThicknessVAL = null;
      lineThicknessEnabledVAL = null;
      drawVAL = null;
      drawEnabledVAL = null;
      undoEnabledVAL = null;
      redoEnabledVAL = null;
      clearEnabledVAL = null;
      contentEmptyVAL = null;
      movementsVAL = null;
      undoneMovementsVAL = null;
      canvasVAL = null;
      contentDimensionsVAL = null;
      imageVAL = null;
      resizeIsPossibleVAL = null;
    }
  }
}
