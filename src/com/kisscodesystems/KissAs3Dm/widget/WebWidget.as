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
 * WebWidget.
 * The common base of the two widgets that demonstrate the communication of this
 * application to the outside world: one request is sent to a server of it and the
 * answer that comes back is displayed.
 *
 * MAIN FEATURES:
 * - the content of these widgets stands in one single column of rows: the description
 *   of the demonstration at the top, the button starting the request under it and the
 *   answer of the server at the bottom
 * - the extenders of this class build the rows of their own between those two: they
 *   only tell what they are and how they talk to their own server
 * - a request is started by that button, which is switched off for the time of it, and
 *   the three dots standing in the place of the answer are replaced by the very answer
 *   that arrives: that answer is the proof that the communication works
 * - the second content displays the code snippet of the communication being
 *   demonstrated, and that snippet can be copied to the clipboard
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.base.BaseScroll;
  import com.kisscodesystems.KissAs3Fw.base.BaseSprite;
  import com.kisscodesystems.KissAs3Fw.enum.EnumDocks;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumOrientations;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonText;
  import com.kisscodesystems.KissAs3Fw.ui.TextBox;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  import flash.events.TimerEvent;
  import flash.system.System;
  import flash.utils.Timer;
  public class WebWidget extends DemoWidget
  {
    // the text key of the description standing at the top of the content: every extender
    // of this class tells here what the demonstration of its own does
    protected var descriptionCode:String = "";
    // the text key of the label of the button starting the request
    protected var actionCode:String = "";
    // the button starting that request: it is switched off for the time of it, so it can
    // not be pressed again before the answer of the server has arrived
    protected var actionOBJ:ButtonText = null;
    // whether a request is on its way at the moment
    protected var requestPending:Boolean = false;
    // the label of the answer of the server, the last row of the content
    private var answerVAL:TextLabel = null;
    // the cell of the content the next row of it goes into
    private var nextCellIndex:int = 0;
    // The labels kept inside the width of one row: a text longer than that is broken into
    // several lines instead of making the whole content scroll to the right. Every row of
    // these widgets is a label of this kind but the one of the button.
    private var maxWidthLabelsARR:Array = null;
    // the width those labels stand with at the moment
    private var rowDw:int = 0;
    // the text standing in the place of the answer while the request is on its way
    private var pendingText:String = "...";
    // the index of the content displaying the code snippet of the demonstration
    private var indexCode:int = -1;
    // the first line of that content: the button copying that snippet and the label telling
    // that it has been copied, standing next to it in a sprite of the two of them
    private var codeHeaderSprite:BaseSprite = null;
    private var copyOBJ:ButtonText = null;
    private var copiedVAL:TextLabel = null;
    // the milliseconds the label of the copying is displayed for, and the timer taking it
    private var copiedMs:int = 5000;
    private var copiedTimer:Timer = null;
    // the box of the snippet itself and the snippet standing in it
    private var codeTextBox:TextBox = null;
    private var codeText:String = "";
    /**
     * Constructs the widget. Every extender of this class sets the header, the header
     * icon, the info text, the description, the label of the button and the initialization
     * dimensions of its own in its own constructor, the way every other widget of this
     * application does.
     * @param applicationRef the main application reference
     */
    public function WebWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " WebWidget> called.", 4);
      application.trace("<" + this + " WebWidget> applicationRef: " + applicationRef, 3);
      maxWidthLabelsARR = new Array();
      application.trace("<" + this + " WebWidget> constructed.", 4);
    }
    /**
     * Builds the elements demonstrating the communication: the description of it, the rows
     * of the extender of this class, the button starting the request and the answer of the
     * server. The listeners are registered before the sizing on purpose: the room of the
     * rows is the room of the content of this widget, and that content can be measured
     * later than it is built, so the sizing has to be able to run again.
     */
    override protected function createElements():void
    {
      application.trace("<" + this + " WebWidget createElements> called.", 4);
      super.createElements();
      removeInfoTextLabel();
      createDescription();
      createOwnElements();
      createActionRow();
      createCodeContent();
      addListenersToElements();
      addListenersToApplication();
      resizeRowLabels();
      reposCodeHeader();
      refreshCode();
    }
    /**
     * Builds the rows the extender of this class brings of its own. Every extender
     * overrides this and adds the rows it needs between the description and the button
     * with the createRowLabel below.
     */
    protected function createOwnElements():void
    {
      application.trace("<" + this + " WebWidget createOwnElements> called.", 4);
      application.trace("<" + this + " WebWidget createOwnElements> the extenders of this class build their rows here.", 3);
    }
    /**
     * Starts the request of the demonstration. Every extender of this class overrides this
     * and talks to its own server here, and it hands the answer that arrives over to the
     * finishRequest below.
     */
    protected function startRequest():void
    {
      application.trace("<" + this + " WebWidget startRequest> called.", 4);
      application.trace("<" + this + " WebWidget startRequest> the extenders of this class send their request here.", 3);
    }
    /**
     * Displays the answer the server has sent and gives the button of the request back:
     * that request is over, so a new one can be started.
     * @param answer the answer of the server, or the telling of the failure of the request
     */
    protected function finishRequest(answer:String):void
    {
      application.trace("<" + this + " WebWidget finishRequest> called.", 4);
      application.trace("<" + this + " WebWidget finishRequest> answer: " + answer, 3);
      requestPending = false;
      setAnswer(answer);
      actionOBJ.setEnabled(true);
    }
    /**
     * Returns the code snippet of the communication being demonstrated. Every extender of
     * this class overrides this and writes the lines of its own here.
     */
    protected function getCode():String
    {
      application.trace("<" + this + " WebWidget getCode> called.", 4);
      application.trace("<" + this + " WebWidget getCode> the extenders of this class write their snippet here.", 3);
      return "";
    }
    /**
     * Opens a new row of the content: it builds one label, places it into the next free
     * cell of that content and returns it. Such a label is kept inside the width of one
     * row, so a long text of it is broken into several lines.
     */
    protected function createRowLabel():TextLabel
    {
      application.trace("<" + this + " WebWidget createRowLabel> called.", 4);
      const textLabel:TextLabel = new TextLabel(application);
      addToContent(indexBasic, textLabel, nextCellIndex);
      nextCellIndex++;
      textLabel.setType(EnumTextTypes.TEXT_TYPE_MID());
      maxWidthLabelsARR.push(textLabel);
      return textLabel;
    }
    /**
     * Registers the listener of every element built here. Every extender of this class
     * overrides this, calls this one and registers the listeners of its own afterwards.
     */
    protected function addListenersToElements():void
    {
      application.trace("<" + this + " WebWidget addListenersToElements> called.", 4);
      actionOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), actionClick);
      getContentBaseEventDispatcher().addEventListener(EnumEvents.EVENT_DIMENSIONS_CHANGED(), contentResized);
      // the content of the snippet is the one that could not be built at all, and then
      // there is neither a button of the copying nor a box of that snippet to be listened to
      if (indexCode > -1)
      {
        copyOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), copyClick);
        copyOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_DIMENSIONS_CHANGED(), codeHeaderResized);
        copiedVAL.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_DIMENSIONS_CHANGED(), codeHeaderResized);
      }
    }
    /**
     * Registers the listeners of the application: the width of the rows of this widget is
     * measured by the room of its content and by the margin of the application, so it is
     * counted again every time that margin changes.
     */
    protected function addListenersToApplication():void
    {
      application.trace("<" + this + " WebWidget addListenersToApplication> called.", 4);
      application.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_MARGIN_CHANGED(), marginChanged);
    }
    /**
     * Builds the first row of the content: the description telling what this widget
     * demonstrates and how it does that.
     */
    private function createDescription():void
    {
      application.trace("<" + this + " WebWidget createDescription> called.", 4);
      createRowLabel().setLabel(descriptionCode);
    }
    /**
     * Builds the two last rows of the content: the button starting the request and the
     * label of the answer of the server standing under it. That answer is an empty one
     * until the first request has been sent.
     */
    private function createActionRow():void
    {
      application.trace("<" + this + " WebWidget createActionRow> called.", 4);
      actionOBJ = new ButtonText(application);
      addToContent(indexBasic, actionOBJ, nextCellIndex);
      nextCellIndex++;
      actionOBJ.setLabel(actionCode);
      answerVAL = createRowLabel();
      setAnswer(EnumTextKeysDemo.WIDGET_VALUE_NONE());
    }
    /**
     * Displays the given answer of the server in the last row of the content, behind the
     * text telling that it is an answer.
     * @param answer the answer to be displayed
     */
    private function setAnswer(answer:String):void
    {
      application.trace("<" + this + " WebWidget setAnswer> called.", 4);
      application.trace("<" + this + " WebWidget setAnswer> answer: " + answer, 3);
      answerVAL.setLabel(EnumTextKeysDemo.WIDGET_WEB_ANSWER() + " " + answer);
    }
    /**
     * Builds the second content of this widget: the code snippet of the communication
     * being demonstrated. The button copying that snippet and the label telling that it
     * has been copied stand in one sprite, which is docked to the top of this content, and
     * the box of the snippet fills the room that is left under it.
     */
    private function createCodeContent():void
    {
      application.trace("<" + this + " WebWidget createCodeContent> called.", 4);
      indexCode = addContent(EnumTextKeysDemo.WIDGET_TAB_CODE());
      if (indexCode < 0)
      {
        application.trace("<" + this + " WebWidget createCodeContent> the content of the code could not be built!", 6);
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
      // the snippet is read line by line, so the lines of it are never broken: this box
      // scrolls to the right instead when a line is longer than it is
      codeTextBox.setWordWrap(false);
      // the snippet is code and no text of this application at all, so every bracket of it
      // is drawn exactly as it is: a text standing between brackets would be looked up as
      // one single text key and displayed as the empty string of a key that does not exist
      codeTextBox.setTextKeysEnabled(false);
      // the box of the snippet is scrolled itself, so this content has nothing left to
      // scroll at all
      const baseScroll:BaseScroll = getBaseScroll(indexCode);
      if (baseScroll != null)
      {
        baseScroll.setEnabledHorizontal(false);
        baseScroll.setEnabledVertical(false);
      }
    }
    /**
     * Gives the width of one row to every label of the content: a label is as wide as the
     * room that content leaves between its own gaps, so a long text of it is broken into
     * several lines instead of pushing the whole content to the right.
     */
    private function resizeRowLabels():void
    {
      application.trace("<" + this + " WebWidget resizeRowLabels> called.", 4);
      const newRowDw:int = getRowDw();
      if (newRowDw <= 0 || rowDw == newRowDw)
      {
        application.trace("<" + this + " WebWidget resizeRowLabels> nothing to do with: " + newRowDw, 3);
        return;
      }
      rowDw = newRowDw;
      for (var i:int = 0; i < maxWidthLabelsARR.length; i++)
      {
        TextLabel(maxWidthLabelsARR[i]).setMaxWidth(rowDw, true);
      }
    }
    /**
     * Returns the width one row of the content can take: the room of that content without
     * the gaps it leaves on the two sides of its one single column.
     */
    private function getRowDw():int
    {
      application.trace("<" + this + " WebWidget getRowDw> called.", 4);
      const gap:int = getGapFactor(indexBasic) * application.getDynamicsConfig().getAppMargin();
      return getContentDw() - 2 * gap;
    }
    /**
     * Places the button of the copying and the label of it next to each other, and takes
     * the dimensions of the sprite holding the two of them afterwards: that sprite is the
     * element the content of the snippet measures its first strip by.
     */
    private function reposCodeHeader():void
    {
      application.trace("<" + this + " WebWidget reposCodeHeader> called.", 4);
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
     * Writes the code snippet of the demonstration into the box of it. That snippet is the
     * very same one all the time, so it is asked for once, while this widget is built.
     */
    private function refreshCode():void
    {
      application.trace("<" + this + " WebWidget refreshCode> called.", 4);
      if (codeTextBox == null)
      {
        return;
      }
      codeText = getCode();
      codeTextBox.setLabel(codeText);
    }
    /**
     * Starts the request of the demonstration: the button of it is switched off and the
     * three dots step into the place of the answer, so the answer replacing them is seen
     * arriving. The extender of this class is the one talking to its own server.
     * @param e the click event of that button
     */
    private function actionClick(e:Event):void
    {
      application.trace("<" + this + " WebWidget actionClick> called.", 4);
      application.trace("<" + this + " WebWidget actionClick> e: " + e, 3);
      requestPending = true;
      actionOBJ.setEnabled(false);
      setAnswer(pendingText);
      startRequest();
    }
    /**
     * Counts the width of the rows again after the content of this widget has been
     * resized: this widget can be resized by the one using the application and it takes
     * other dimensions in the mobile widget mode as well.
     * @param e the dimensions changed event of that content
     */
    private function contentResized(e:Event):void
    {
      application.trace("<" + this + " WebWidget contentResized> called.", 4);
      application.trace("<" + this + " WebWidget contentResized> e: " + e, 3);
      resizeRowLabels();
    }
    /**
     * Places the rows and the first line of the content of the snippet again after the
     * margin of the application has been changed: the gaps of the content and the room
     * between the button of the copying and the label of it are taken from that margin.
     * @param e the margin changed event of the application
     */
    private function marginChanged(e:Event):void
    {
      application.trace("<" + this + " WebWidget marginChanged> called.", 4);
      application.trace("<" + this + " WebWidget marginChanged> e: " + e, 3);
      resizeRowLabels();
      reposCodeHeader();
    }
    /**
     * Places the first line of the content of the snippet again after the button of the
     * copying or the label of it has taken new dimensions: a new font size and another
     * language give both of them another width.
     * @param e the dimensions changed event of that button or of that label
     */
    private function codeHeaderResized(e:Event):void
    {
      application.trace("<" + this + " WebWidget codeHeaderResized> called.", 4);
      application.trace("<" + this + " WebWidget codeHeaderResized> e: " + e, 3);
      reposCodeHeader();
    }
    /**
     * Puts the code snippet onto the clipboard, displays the label telling that it is
     * there and switches the button of the copying off: that button is the one telling
     * that this snippet is on the clipboard already. Both of them come back together, a
     * few seconds later.
     * @param e the click event of the button of the copying
     */
    private function copyClick(e:Event):void
    {
      application.trace("<" + this + " WebWidget copyClick> called.", 4);
      application.trace("<" + this + " WebWidget copyClick> e: " + e, 3);
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
      application.trace("<" + this + " WebWidget createCopiedTimer> called.", 4);
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
      application.trace("<" + this + " WebWidget dropCopiedTimer> called.", 4);
      if (copiedTimer != null)
      {
        copiedTimer.stop();
        copiedTimer.removeEventListener(TimerEvent.TIMER, copiedTimerHandler);
        copiedTimer = null;
      }
    }
    /**
     * Takes the label of the copying away as soon as its time is over and gives the button
     * of the copying back: the snippet can be put onto the clipboard again.
     * @param e the timer event of the timer of that label
     */
    private function copiedTimerHandler(e:TimerEvent):void
    {
      application.trace("<" + this + " WebWidget copiedTimerHandler> called.", 4);
      application.trace("<" + this + " WebWidget copiedTimerHandler> e: " + e, 3);
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
      application.trace("<" + this + " WebWidget destroy> called.", 4);
      application.trace("<" + this + " WebWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.getBaseEventDispatcher().removeEventListener(EnumEvents.EVENT_MARGIN_CHANGED(), marginChanged);
      dropCopiedTimer();
      application.trace("<" + this + " WebWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      maxWidthLabelsARR.splice(0);
      application.trace("<" + this + " WebWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " WebWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      descriptionCode = null;
      actionCode = null;
      actionOBJ = null;
      requestPending = false;
      answerVAL = null;
      nextCellIndex = 0;
      maxWidthLabelsARR = null;
      rowDw = 0;
      pendingText = null;
      indexCode = -1;
      codeHeaderSprite = null;
      copyOBJ = null;
      copiedVAL = null;
      copiedMs = 0;
      copiedTimer = null;
      codeTextBox = null;
      codeText = null;
    }
  }
}
