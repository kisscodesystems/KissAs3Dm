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
 * ScrollingProbeWidget.
 * A measuring widget: it holds a content of many objects and tells how smoothly that
 * content can be scrolled on the device the application is running on.
 *
 * MAIN FEATURES:
 * - 200 objects, ten of every kind of the components of the framework, mixed with each
 *   other in a flowing layout, so the content is as heavy as a real one full of objects
 * - a benchmark that scrolls the content to its end and back at a constant speed and at a
 *   raised frame rate, counting the frames that really have been drawn meanwhile
 * - every scrolling by hand is measured the same way, from its first move to the end of
 *   its glide
 * - the scroll measured is the one a finger would scroll: the content of this widget on
 *   desktop, the widget layer in mobile mode
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumSoundsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.enum.EnumOrientations;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes;
  import com.kisscodesystems.KissAs3Fw.ui.Board;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonText;
  import com.kisscodesystems.KissAs3Fw.ui.ColorPicker;
  import com.kisscodesystems.KissAs3Fw.ui.ContentSingle;
  import com.kisscodesystems.KissAs3Fw.ui.DatePanel;
  import com.kisscodesystems.KissAs3Fw.ui.DatePicker;
  import com.kisscodesystems.KissAs3Fw.ui.Icon;
  import com.kisscodesystems.KissAs3Fw.ui.Image;
  import com.kisscodesystems.KissAs3Fw.ui.ListPanel;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Rater;
  import com.kisscodesystems.KissAs3Fw.ui.SoundPlayer;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextArea;
  import com.kisscodesystems.KissAs3Fw.ui.TextBox;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import com.kisscodesystems.KissAs3Fw.ui.VideoPlayer;
  import com.kisscodesystems.KissAs3Fw.ui.Watch;
  import flash.display.DisplayObject;
  import flash.display.DisplayObjectContainer;
  import flash.events.Event;
  import flash.utils.getTimer;
  public class ScrollingProbeWidget extends DemoWidget
  {
    // the number of the objects built of every kind, and the number of those kinds: see
    // createObject, one kind per case of it
    private static const OBJECTS_PER_KIND:int = 10;
    private static const KINDS:int = 20;
    // the smallest sample picture and sample video of the site of this framework: the
    // number of the objects is measured here, not the size of the files
    private static const SAMPLE_IMAGE_URL:String = "https://app1.kisscodesystems.com/kcsops/samples/sample_426x240.png";
    private static const SAMPLE_VIDEO_URL:String = "https://app1.kisscodesystems.com/kcsops/samples/sample_426x240.flv";
    // The frame rate the benchmark runs at, the milliseconds it takes to scroll to the end
    // of the content and back, and the milliseconds a frame is counted as a slow one above.
    private static const BENCHMARK_FRAME_RATE:Number = 60;
    private static const BENCHMARK_DURATION:int = 8000;
    private static const SLOW_FRAME:int = 25;
    // a scrolling by hand is over when the content has not moved for this many milliseconds
    private static const MANUAL_END:int = 500;
    // the elements of the row of the measuring
    private var runOBJ:ButtonText = null;
    private var benchmarkVAL:TextLabel = null;
    private var manualVAL:TextLabel = null;
    // The last results: the numbers the result text is filled with, kept so the text can
    // be written again in a language switched to later. Null while there is no result.
    private var benchmarkResult:Array = null;
    private var manualResult:Array = null;
    // the content being scrolled by the benchmark and the frame rate of the stage before it
    private var benchmarkContent:ContentSingle = null;
    private var benchmarkStart:int = 0;
    private var frameRateSaved:Number = 0;
    // the state of the scrolling by hand being measured
    private var manualMeasuring:Boolean = false;
    private var manualStart:int = 0;
    private var manualLastMove:int = 0;
    private var manualPrevCx:int = int.MIN_VALUE;
    private var manualPrevCy:int = int.MIN_VALUE;
    // the counters of the frames of the measuring in progress
    private var prevFrameTime:int = 0;
    private var frames:int = 0;
    private var slowFrames:int = 0;
    private var slowestFrame:int = 0;
    private var highestFrameRate:Number = 0;
    /**
     * Constructs the scrolling probe widget.
     * @param applicationRef the main application reference
     */
    public function ScrollingProbeWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ScrollingProbeWidget> called.", 4);
      application.trace("<" + this + " ScrollingProbeWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.SCROLLINGPROBE();
      headerIcon = EnumIcons.downarrow();
      infoCode = EnumTextKeysDemo.WIDGETINFO_SCROLLINGPROBE();
      iniSizeWidth = 900;
      iniSizeHeight = 640;
      application.trace("<" + this + " ScrollingProbeWidget> constructed.", 4);
    }
    /**
     * Builds the row of the measuring and the objects of this widget, and starts to follow
     * the frames: every scrolling by hand is measured from the very first one of them.
     */
    override protected function createElements():void
    {
      application.trace("<" + this + " ScrollingProbeWidget createElements> called.", 4);
      super.createElements();
      removeInfoTextLabel();
      setOrientation(indexBasic, EnumOrientations.ORIENTATION_FLOW());
      createMeasuringRow();
      createObjects();
      displayResults();
      runOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), runClick);
      application.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_LANG_CHANGED(), langChanged);
      addEventListener(Event.ENTER_FRAME, enterFrameMeasure);
    }
    /**
     * Builds the button of the benchmark and the labels of the two results.
     */
    private function createMeasuringRow():void
    {
      application.trace("<" + this + " ScrollingProbeWidget createMeasuringRow> called.", 4);
      runOBJ = new ButtonText(application);
      runOBJ.setLabel(EnumTextKeysDemo.WIDGET_PROBE_RUN());
      runOBJ.setIcon(EnumIcons.playing());
      addToContent(indexBasic, runOBJ, 0);
      addToContent(indexBasic, createTextLabel(EnumTextKeysDemo.WIDGET_PROBE_BENCHMARK()), 0);
      benchmarkVAL = createTextLabel("");
      addToContent(indexBasic, benchmarkVAL, 0);
      addToContent(indexBasic, createTextLabel(EnumTextKeysDemo.WIDGET_PROBE_MANUAL()), 0);
      manualVAL = createTextLabel("");
      addToContent(indexBasic, manualVAL, 0);
    }
    /**
     * Builds every object of this widget: the kinds follow each other one by one, so the
     * objects of every kind are spread over the whole content.
     */
    private function createObjects():void
    {
      application.trace("<" + this + " ScrollingProbeWidget createObjects> called.", 4);
      for (var i:int = 0; i < OBJECTS_PER_KIND; i++)
      {
        for (var kind:int = 0; kind < KINDS; kind++)
        {
          addToContent(indexBasic, createObject(kind), 0);
        }
      }
    }
    /**
     * Builds one object of the given kind, the way the widget of that component builds its
     * example, only smaller.
     * @param kind the kind of the object, from zero to KINDS - 1
     */
    private function createObject(kind:int):DisplayObject
    {
      application.trace("<" + this + " ScrollingProbeWidget createObject> called.", 4);
      application.trace("<" + this + " ScrollingProbeWidget createObject> kind: " + kind, 3);
      switch (kind)
      {
        case 0:
          return createTextLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT());
        case 1:
          const textBox:TextBox = new TextBox(application);
          textBox.setDwh(240, 120);
          textBox.setWordWrap(true);
          textBox.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT_LONG());
          return textBox;
        case 2:
          const textArea:TextArea = new TextArea(application);
          textArea.setDwh(240, 120);
          textArea.setWordWrap(true);
          textArea.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT_LONG());
          return textArea;
        case 3:
          const textInput:TextInput = new TextInput(application);
          textInput.setDw(200);
          textInput.setHint(EnumTextKeysDemo.WIDGET_EXAMPLE_HINT());
          return textInput;
        case 4:
          const buttonText:ButtonText = new ButtonText(application);
          buttonText.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT());
          buttonText.setIcon(EnumIcons.ok());
          return buttonText;
        case 5:
          const buttonLink:ButtonLink = new ButtonLink(application);
          buttonLink.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT());
          buttonLink.setIcon(EnumIcons.lightning());
          return buttonLink;
        case 6:
          const switcher:Switcher = new Switcher(application);
          switcher.setLabels(EnumTextKeysDemo.WIDGET_EXAMPLE_STATE_ON(), EnumTextKeysDemo.WIDGET_EXAMPLE_STATE_OFF());
          switcher.setIcons(EnumIcons.switchon(), EnumIcons.switchoff());
          return switcher;
        case 7:
          const colorPicker:ColorPicker = new ColorPicker(application);
          colorPicker.setRGBColor("0x3366CC", false);
          return colorPicker;
        case 8:
          const datePicker:DatePicker = new DatePicker(application);
          datePicker.setDw(200);
          return datePicker;
        case 9:
          return createListPicker();
        case 10:
          return createListPanel();
        case 11:
          return new DatePanel(application);
        case 12:
          const potmeter:Potmeter = new Potmeter(application);
          potmeter.setMinMaxIncValues(0, 100, 1);
          potmeter.setCurValue(50, false);
          return potmeter;
        case 13:
          const rater:Rater = new Rater(application);
          rater.setRate(3.5);
          return rater;
        case 14:
          return new Watch(application);
        case 15:
          const icon:Icon = new Icon(application);
          icon.drawBitmapData(EnumIcons.info(), EnumTextTypes.TEXT_TYPE_BRIGHT(), 48);
          return icon;
        case 16:
          const image:Image = new Image(application);
          image.setFrame(true);
          image.setDwh(160, 120);
          image.loadUrl(SAMPLE_IMAGE_URL, 0);
          return image;
        case 17:
          const soundPlayer:SoundPlayer = new SoundPlayer(application);
          soundPlayer.setDw(260);
          soundPlayer.setSoundTypeAndName(EnumSoundsDemo.sample(), EnumTextKeysDemo.WIDGET_EXAMPLE_SOUND_NAME());
          return soundPlayer;
        case 18:
          const videoPlayer:VideoPlayer = new VideoPlayer(application);
          videoPlayer.setFrame(true);
          videoPlayer.setDwh(320, 240);
          videoPlayer.setChapters([EnumTextKeysDemo.WIDGET_EXAMPLE_CHAPTER_1()], [SAMPLE_VIDEO_URL]);
          return videoPlayer;
        default:
          const board:Board = new Board(application);
          board.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_BOARD_LABEL());
          board.setDwh(260, 200);
          return board;
      }
    }
    /**
     * Builds a label of the given text or text key.
     * @param label the text or the text key of the label
     */
    private function createTextLabel(label:String):TextLabel
    {
      application.trace("<" + this + " ScrollingProbeWidget createTextLabel> called.", 4);
      application.trace("<" + this + " ScrollingProbeWidget createTextLabel> label: " + label, 3);
      const textLabel:TextLabel = new TextLabel(application);
      textLabel.setLabel(label);
      return textLabel;
    }
    /**
     * Builds a list picker of the example items.
     */
    private function createListPicker():ListPicker
    {
      application.trace("<" + this + " ScrollingProbeWidget createListPicker> called.", 4);
      const listPicker:ListPicker = new ListPicker(application);
      listPicker.setDw(200);
      listPicker.setNumOfElements(4);
      listPicker.setArrays(getExampleItems(), getExampleItems());
      listPicker.setSelectedIndex(0, false);
      return listPicker;
    }
    /**
     * Builds a list panel of the example items.
     */
    private function createListPanel():ListPanel
    {
      application.trace("<" + this + " ScrollingProbeWidget createListPanel> called.", 4);
      const listPanel:ListPanel = new ListPanel(application);
      listPanel.setDw(200);
      listPanel.setNumOfElements(4);
      listPanel.setArrays(getExampleItems(), getExampleItems());
      listPanel.setSelectedIndexes([0], false);
      return listPanel;
    }
    /**
     * Returns a new array of the text keys of the example items.
     */
    private function getExampleItems():Array
    {
      return [EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_0(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_1()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_2(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_3()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_4(), EnumTextKeysDemo.WIDGET_EXAMPLE_ITEM_5()];
    }
    /**
     * Returns the content a finger would scroll when it drags this widget: the first content
     * above the elements of it that has something to scroll and takes the drags of its own
     * elements. That is the content of this widget on desktop, and the widget layer in mobile
     * mode, where the content of a widget is not scrolled at all. Null when there is nothing
     * to scroll anywhere.
     */
    private function findScrolledContent():ContentSingle
    {
      application.trace("<" + this + " ScrollingProbeWidget findScrolledContent> called.", 3);
      var parentObject:DisplayObjectContainer = runOBJ != null ? runOBJ.parent : null;
      while (parentObject != null)
      {
        if (parentObject is ContentSingle && ContentSingle(parentObject).enableScrollingFromOthers
          && ContentSingle(parentObject).getBaseScroll().hasSomethingToScroll())
        {
          return ContentSingle(parentObject);
        }
        parentObject = parentObject.parent;
      }
      return null;
    }
    /**
     * Starts the benchmark: the frame rate of the stage is raised, and the frames scroll the
     * content from now on, see enterFrameBenchmark.
     * @param e the click event of the button of the benchmark
     */
    private function runClick(e:Event):void
    {
      application.trace("<" + this + " ScrollingProbeWidget runClick> called.", 4);
      application.trace("<" + this + " ScrollingProbeWidget runClick> e: " + e, 3);
      if (benchmarkContent != null || stage == null)
      {
        return;
      }
      benchmarkContent = findScrolledContent();
      if (benchmarkContent == null)
      {
        benchmarkResult = null;
        benchmarkVAL.setLabel(EnumTextKeysDemo.WIDGET_PROBE_NOTHING());
        return;
      }
      manualMeasuring = false;
      runOBJ.setEnabled(false);
      benchmarkVAL.setLabel(EnumTextKeysDemo.WIDGET_PROBE_RUNNING());
      frameRateSaved = stage.frameRate;
      stage.frameRate = BENCHMARK_FRAME_RATE;
      benchmarkContent.setContentPosition(benchmarkContent.getBaseScroll().getCxContent(), 0, true);
      resetFrameCounters();
      benchmarkStart = getTimer();
    }
    /**
     * Measures the frames: the ones of the benchmark while that one is running, and the ones
     * of a scrolling by hand otherwise.
     * @param e the enter frame event
     */
    private function enterFrameMeasure(e:Event):void
    {
      application.trace("<" + this + " ScrollingProbeWidget enterFrameMeasure> called.", 3);
      application.trace("<" + this + " ScrollingProbeWidget enterFrameMeasure> e: " + e, 3);
      if (benchmarkContent != null)
      {
        enterFrameBenchmark();
      }
      else if (stage != null)
      {
        enterFrameManual();
      }
    }
    /**
     * Counts the frame and scrolls the content of the benchmark to the place this moment of
     * it belongs to: to the end of the content in the first half of the time, and back to the
     * beginning in the second one, at a constant speed.
     */
    private function enterFrameBenchmark():void
    {
      application.trace("<" + this + " ScrollingProbeWidget enterFrameBenchmark> called.", 3);
      const now:int = getTimer();
      countFrame(now);
      const progress:Number = (now - benchmarkStart) / BENCHMARK_DURATION;
      if (progress >= 1 || stage == null)
      {
        finishBenchmark(now);
        return;
      }
      const cyEnd:int = Math.min(0, benchmarkContent.getBaseScroll().getDh() - benchmarkContent.getBaseScroll().getDhContent());
      const factor:Number = progress < 0.5 ? progress * 2 : 2 - progress * 2;
      benchmarkContent.setContentPosition(benchmarkContent.getBaseScroll().getCxContent(), Math.round(cyEnd * factor), true);
    }
    /**
     * Ends the benchmark: puts the frame rate and the content back and displays the result.
     * @param now the time of the frame the benchmark ends in
     */
    private function finishBenchmark(now:int):void
    {
      application.trace("<" + this + " ScrollingProbeWidget finishBenchmark> called.", 4);
      application.trace("<" + this + " ScrollingProbeWidget finishBenchmark> now: " + now, 3);
      if (stage != null)
      {
        stage.frameRate = frameRateSaved;
      }
      benchmarkContent.setContentPosition(benchmarkContent.getBaseScroll().getCxContent(), 0, true);
      benchmarkContent = null;
      benchmarkResult = createResult(now - benchmarkStart);
      runOBJ.setEnabled(true);
      displayResults();
      // the content has just been put back, which is not a move of a finger
      manualPrevCx = manualPrevCy = int.MIN_VALUE;
    }
    /**
     * Follows the content a finger would scroll: its first move starts the measuring, every
     * further frame is counted, and the measuring ends when the content has been standing
     * still for MANUAL_END milliseconds, the glide included.
     */
    private function enterFrameManual():void
    {
      application.trace("<" + this + " ScrollingProbeWidget enterFrameManual> called.", 3);
      const content:ContentSingle = findScrolledContent();
      if (content == null)
      {
        return;
      }
      const now:int = getTimer();
      const cx:int = content.getBaseScroll().getCxContent();
      const cy:int = content.getBaseScroll().getCyContent();
      const moved:Boolean = manualPrevCx != int.MIN_VALUE && (cx != manualPrevCx || cy != manualPrevCy);
      manualPrevCx = cx;
      manualPrevCy = cy;
      if (moved)
      {
        if (!manualMeasuring)
        {
          manualMeasuring = true;
          manualStart = now;
          resetFrameCounters();
        }
        countFrame(now);
        manualLastMove = now;
      }
      else if (manualMeasuring)
      {
        // the frames standing still are counted too: a stuck frame of a drag is one of them
        prevFrameTime = now;
        if (now - manualLastMove > MANUAL_END)
        {
          manualMeasuring = false;
          manualResult = createResult(manualLastMove - manualStart);
          displayResults();
        }
      }
    }
    /**
     * Clears the counters of the frames before a new measuring.
     */
    private function resetFrameCounters():void
    {
      application.trace("<" + this + " ScrollingProbeWidget resetFrameCounters> called.", 4);
      prevFrameTime = 0;
      frames = 0;
      slowFrames = 0;
      slowestFrame = 0;
      highestFrameRate = 0;
    }
    /**
     * Counts a frame of the measuring in progress by the time passed since the previous one.
     * @param now the time of this frame
     */
    private function countFrame(now:int):void
    {
      application.trace("<" + this + " ScrollingProbeWidget countFrame> called.", 3);
      application.trace("<" + this + " ScrollingProbeWidget countFrame> now: " + now, 3);
      if (prevFrameTime > 0)
      {
        const frameTime:int = now - prevFrameTime;
        frames++;
        slowestFrame = Math.max(slowestFrame, frameTime);
        if (frameTime > SLOW_FRAME)
        {
          slowFrames++;
        }
      }
      prevFrameTime = now;
      if (stage != null)
      {
        highestFrameRate = Math.max(highestFrameRate, stage.frameRate);
      }
    }
    /**
     * Returns the numbers of the result of the measuring that has just ended, in the order
     * of the placeholders of the result text.
     * @param duration the milliseconds the measuring took
     */
    private function createResult(duration:int):Array
    {
      application.trace("<" + this + " ScrollingProbeWidget createResult> called.", 4);
      application.trace("<" + this + " ScrollingProbeWidget createResult> duration: " + duration, 3);
      const fps:Number = duration > 0 ? Math.round(frames * 10000 / duration) / 10 : 0;
      return [fps, highestFrameRate, slowestFrame, slowFrames, frames, SLOW_FRAME];
    }
    /**
     * Writes both results into their labels, in the language that is on.
     */
    private function displayResults():void
    {
      application.trace("<" + this + " ScrollingProbeWidget displayResults> called.", 4);
      if (benchmarkContent == null)
      {
        benchmarkVAL.setLabel(getResultText(benchmarkResult));
      }
      manualVAL.setLabel(getResultText(manualResult));
    }
    /**
     * Returns the result text filled with the given numbers, or the text key telling that
     * there is no result yet.
     * @param result the numbers of a result, null when there is none
     */
    private function getResultText(result:Array):String
    {
      application.trace("<" + this + " ScrollingProbeWidget getResultText> called.", 4);
      application.trace("<" + this + " ScrollingProbeWidget getResultText> result: " + result, 3);
      if (result == null)
      {
        return EnumTextKeysDemo.WIDGET_PROBE_NONE();
      }
      var text:String = application.getLabelManager().getLabel(EnumTextKeysDemo.WIDGET_PROBE_RESULT());
      for (var i:int = 0; i < result.length; i++)
      {
        text = text.split("{" + i + "}").join("" + result[i]);
      }
      return text;
    }
    /**
     * Writes the results again in the language that has just been switched to.
     * @param e the language changed event
     */
    private function langChanged(e:Event):void
    {
      application.trace("<" + this + " ScrollingProbeWidget langChanged> called.", 4);
      application.trace("<" + this + " ScrollingProbeWidget langChanged> e: " + e, 3);
      displayResults();
    }
    /**
     * Stops the benchmark that may be running and puts its frame rate back, then destroys
     * this object and frees up everything. Every object of this widget stands in the content
     * of it, and that content is destroyed by the super destroy below.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " ScrollingProbeWidget destroy> called.", 4);
      application.trace("<" + this + " ScrollingProbeWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.getBaseEventDispatcher().removeEventListener(EnumEvents.EVENT_LANG_CHANGED(), langChanged);
      removeEventListener(Event.ENTER_FRAME, enterFrameMeasure);
      if (benchmarkContent != null && stage != null)
      {
        stage.frameRate = frameRateSaved;
      }
      application.trace("<" + this + " ScrollingProbeWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      if (benchmarkResult != null)
      {
        benchmarkResult.splice(0);
      }
      if (manualResult != null)
      {
        manualResult.splice(0);
      }
      application.trace("<" + this + " ScrollingProbeWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " ScrollingProbeWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      runOBJ = null;
      benchmarkVAL = null;
      manualVAL = null;
      benchmarkResult = null;
      manualResult = null;
      benchmarkContent = null;
      benchmarkStart = 0;
      frameRateSaved = 0;
      manualMeasuring = false;
      manualStart = 0;
      manualLastMove = 0;
      manualPrevCx = 0;
      manualPrevCy = 0;
      prevFrameTime = 0;
      frames = 0;
      slowFrames = 0;
      slowestFrame = 0;
      highestFrameRate = 0;
    }
  }
}
