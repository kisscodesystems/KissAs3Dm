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
 * VideoPlayerWidget.
 * The widget of the VideoPlayer component of the framework.
 *
 * MAIN FEATURES:
 * - the example player stands on the top of the content and every row below works on
 *   it, the way every other widget of this application does it
 * - the chapters of it are the sample videos of the site of this framework, three of
 *   them in three resolutions, so the stepping from one chapter to the other and the
 *   shrinking of a picture into its box can be tried on all of them
 * - the picker of the chapters follows that player: it is taken onto the chapter that
 *   player has stepped onto, whether that step has been made by the buttons of the
 *   player itself, by the two links of this widget or by the automatic continuation
 * - the length and the dimensions of a chapter arrive with the metadata of the file, so
 *   they are displayed as soon as the preview picture of that chapter stands in it
 * - the time played so far is the one value that runs on its own: the rows are
 *   refreshed by the events of that player and not in every frame, so that value
 *   stands until the next report of it arrives
 * - the fullscreen of the video is switched, opened and closed from here as well, and
 *   the row of it displays whether that fullscreen is opened at the moment, so the
 *   button standing on the picture of the player is followed by this widget too
 * - the list the chapters are picked from works exactly the same way: it is switched,
 *   opened and closed from its own row, and that row displays whether the list stands
 *   on the picture of the player at the moment
 * - the sound of that player is controlled from here as well: the potmeter of the row of
 *   the volume follows every drag of the one standing on the player itself, and the
 *   switcher of the muting follows every click on the button of it
 * - the smallest width that player can be laid out in is displayed too: it comes from the
 *   font size, from the margin of the application and from the width of the potmeter of
 *   the sound, so it changes with the appearance and with the volume as well
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import com.kisscodesystems.KissAs3Fw.ui.VideoPlayer;
  import flash.events.Event;
  public class VideoPlayerWidget extends PropertyWidget
  {
    // the folder of the sample videos of the site of this framework and the resolution of
    // every one of them: the name of a file is the prefix, the resolution and the
    // extension written after each other
    private const SAMPLES_URL:String = "https://app1.kisscodesystems.com/kcsops/samples/";
    private const SAMPLES_PREFIX:String = "sample_";
    private const SAMPLES_EXTENSION:String = ".flv";
    private const SAMPLES_RESOLUTIONS:Array = ["426x240", "640x360", "854x480"];
    // the range and the starting value of the box the picture is drawn inside
    private var boxMIN:int = 0;
    private var boxMAX:int = 640;
    private var boxINC:int = 20;
    private var boxDwINI:int = 390;
    private var boxDhINI:int = 320;
    // the range of the volume of the sound of the video, the very one the potmeter of the
    // player itself is built with
    private var soundVolumeMIN:int = 0;
    private var soundVolumeMAX:int = 100;
    private var soundVolumeINC:int = 1;
    // the chapters of the example video: the name and the url of every one of them, and
    // the text key every name comes from, so the code of the current state can name it
    private var chapterNamesARR:Array = null;
    private var chapterUrlsARR:Array = null;
    // the example player: the very object the rows of this widget work on
    private var exampleVideoPlayer:VideoPlayer = null;
    // the elements changing the properties of that player
    private var setChaptersOBJ:ButtonLink = null;
    private var clearChaptersOBJ:ButtonLink = null;
    private var chapterOBJ:ListPicker = null;
    private var prevChapterOBJ:ButtonLink = null;
    private var nextChapterOBJ:ButtonLink = null;
    private var autoContinueOBJ:Switcher = null;
    private var playOBJ:ButtonLink = null;
    private var pauseOBJ:ButtonLink = null;
    private var stopOBJ:ButtonLink = null;
    private var soundVolumeOBJ:Potmeter = null;
    private var soundMutedOBJ:Switcher = null;
    private var boxDwOBJ:Potmeter = null;
    private var boxDhOBJ:Potmeter = null;
    private var resizableOBJ:Switcher = null;
    private var previewOBJ:Switcher = null;
    private var frameOBJ:Switcher = null;
    private var fullscreenOBJ:Switcher = null;
    private var openFullscreenOBJ:ButtonLink = null;
    private var closeFullscreenOBJ:ButtonLink = null;
    private var chapterListOBJ:Switcher = null;
    private var openChapterListOBJ:ButtonLink = null;
    private var closeChapterListOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that player answer
    private var chaptersVAL:TextLabel = null;
    private var chapterIndexVAL:TextLabel = null;
    private var chapterNameVAL:TextLabel = null;
    private var chapterUrlVAL:TextLabel = null;
    private var chapterSecsVAL:TextLabel = null;
    private var totalSecsVAL:TextLabel = null;
    private var autoContinueVAL:TextLabel = null;
    private var playingVAL:TextLabel = null;
    private var pausedVAL:TextLabel = null;
    private var progressSecsVAL:TextLabel = null;
    private var soundVolumeVAL:TextLabel = null;
    private var soundMutedVAL:TextLabel = null;
    private var boxDimensionsVAL:TextLabel = null;
    private var videoDimensionsVAL:TextLabel = null;
    private var minDwVAL:TextLabel = null;
    private var resizableVAL:TextLabel = null;
    private var previewVAL:TextLabel = null;
    private var frameVAL:TextLabel = null;
    private var fullscreenVAL:TextLabel = null;
    private var chapterListVAL:TextLabel = null;
    /**
     * Constructs the widget of the VideoPlayer component.
     * @param applicationRef the main application reference
     */
    public function VideoPlayerWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " VideoPlayerWidget> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.VIDEOPLAYER();
      headerIcon = EnumIcons.doublerightarrow();
      infoCode = EnumTextKeysDemo.WIDGETINFO_VIDEOPLAYER();
      codeVarName = "videoPlayer";
      iniSizeWidth = 800;
      iniSizeHeight = 950;
      chapterNamesARR = [EnumTextKeysDemo.WIDGET_EXAMPLE_CHAPTER_1()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_CHAPTER_2()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_CHAPTER_3()];
      chapterUrlsARR = new Array();
      for (var i:int = 0; i < SAMPLES_RESOLUTIONS.length; i++)
      {
        chapterUrlsARR.push(SAMPLES_URL + SAMPLES_PREFIX + SAMPLES_RESOLUTIONS[i]
            + SAMPLES_EXTENSION);
      }
      application.trace("<" + this + " VideoPlayerWidget> constructed.", 4);
    }
    /**
     * Builds the example player of this widget: it carries a frame, it can be resized by
     * hand and opened in fullscreen, the chapters of it can be picked from the list
     * standing on its picture, it stands inside a box of a widescreen shape and it is
     * given the three sample chapters right away, so this widget holds something to be
     * played by one single click.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " VideoPlayerWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleVideoPlayer = new VideoPlayer(application);
      setExampleElement(exampleVideoPlayer);
      exampleVideoPlayer.setFrame(true);
      exampleVideoPlayer.setResizable(true);
      exampleVideoPlayer.setFullscreenEnabled(true);
      exampleVideoPlayer.setChapterListEnabled(true);
      exampleVideoPlayer.setDwh(boxDwINI, boxDhINI);
      exampleVideoPlayer.setChapters(chapterNamesARR.concat(), chapterUrlsARR.concat());
    }
    /**
     * Builds every row of this widget: the ones of the VideoPlayer component itself and
     * the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " VideoPlayerWidget createRows> called.", 4);
      super.createRows();
      createChapterRows();
      createPlayingRows();
      createSoundRows();
      createBoxRows();
      createFullscreenRows();
      createChapterListRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * player as well: that player reports every start and every stop of its own by four
     * events, it reports by a fifth one that the chapters, the chapter it stands on or the
     * metadata of that chapter has been changed, and it reports by a sixth one that it
     * stands on another chapter from now on: that last one is the one the picker of the
     * chapters is taken by.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " VideoPlayerWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleVideoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_PLAYED_BY_HAND(), exampleVideoPlayerChanged);
      exampleVideoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_PLAYED_BY_OUTSIDE(), exampleVideoPlayerChanged);
      exampleVideoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_STOPPED_BY_END(), exampleVideoPlayerChanged);
      exampleVideoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_STOPPED_BY_HAND(), exampleVideoPlayerChanged);
      exampleVideoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleVideoPlayerChanged);
      exampleVideoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHAPTER_CHANGED(), exampleVideoPlayerChapterChanged);
      setChaptersOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), setChaptersClick);
      clearChaptersOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), clearChaptersClick);
      chapterOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), chapterChanged);
      prevChapterOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), prevChapterClick);
      nextChapterOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), nextChapterClick);
      autoContinueOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), autoContinueChanged);
      playOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), playClick);
      pauseOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), pauseClick);
      stopOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), stopClick);
      soundVolumeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), soundVolumeChanged);
      soundMutedOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), soundMutedChanged);
      boxDwOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), boxChanged);
      boxDhOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), boxChanged);
      previewOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), previewChanged);
      resizableOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), resizableChanged);
      frameOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), frameChanged);
      fullscreenOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), fullscreenChanged);
      openFullscreenOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), openFullscreenClick);
      closeFullscreenOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), closeFullscreenClick);
      chapterListOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), chapterListChanged);
      openChapterListOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), openChapterListClick);
      closeChapterListOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), closeChapterListClick);
    }
    /**
     * Displays the current value of every property of the example player.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " VideoPlayerWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      const index:int = exampleVideoPlayer.getSelectedChapterIndex();
      chaptersVAL.setLabel("" + exampleVideoPlayer.getNumOfChapters());
      chapterIndexVAL.setLabel("" + index);
      chapterNameVAL.setLabel(getTextOrNone(exampleVideoPlayer.getChapterName(index)));
      chapterUrlVAL.setLabel(getShortTextOrNone(exampleVideoPlayer.getChapterUrl(index)));
      chapterSecsVAL.setLabel("" + exampleVideoPlayer.getChapterSecs(index));
      totalSecsVAL.setLabel("" + exampleVideoPlayer.getTotalSecs());
      autoContinueVAL.setLabel(getYesNoKey(exampleVideoPlayer.getAutoContinue()));
      playingVAL.setLabel(getYesNoKey(exampleVideoPlayer.isPlaying()));
      pausedVAL.setLabel(getYesNoKey(exampleVideoPlayer.isPaused()));
      progressSecsVAL.setLabel("" + exampleVideoPlayer.getProgressSecs());
      // the volume and the muting are set on the player itself as well, so the two elements
      // of them follow every drag of its potmeter and every click on its button
      soundVolumeOBJ.setCurValue(exampleVideoPlayer.getSoundVolume(), false);
      soundMutedOBJ.setOn(exampleVideoPlayer.isSoundMuted(), false);
      soundVolumeVAL.setLabel("" + exampleVideoPlayer.getSoundVolume());
      soundMutedVAL.setLabel(getYesNoKey(exampleVideoPlayer.isSoundMuted()));
      // the box of the picture is resized by hand as well, so the two potmeters of it
      // follow every drag of the handle standing in its corner
      boxDwOBJ.setCurValue(exampleVideoPlayer.getBoxDw(), false);
      boxDhOBJ.setCurValue(exampleVideoPlayer.getBoxDh(), false);
      boxDimensionsVAL.setLabel(exampleVideoPlayer.getBoxDw() + " x " + exampleVideoPlayer.getBoxDh());
      videoDimensionsVAL.setLabel(exampleVideoPlayer.getVideoDw() + " x "
        + exampleVideoPlayer.getVideoDh());
      minDwVAL.setLabel("" + exampleVideoPlayer.getMinDw());
      previewVAL.setLabel(getYesNoKey(exampleVideoPlayer.getPreview()));
      resizableVAL.setLabel(getYesNoKey(exampleVideoPlayer.getResizable()));
      frameVAL.setLabel(getYesNoKey(exampleVideoPlayer.getFrame()));
      fullscreenVAL.setLabel(getYesNoKey(exampleVideoPlayer.isFullscreenOpened()));
      chapterListVAL.setLabel(getYesNoKey(exampleVideoPlayer.isChapterListOpened()));
    }
    /**
     * Returns the code writing the example player the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new player. A brand new player holds no chapter at all, and
     * every class the code below names is collected into the imports while those lines are
     * written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " VideoPlayerWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("VideoPlayer", imports);
      if (exampleVideoPlayer.getFrame())
      {
        code += codeVarName + ".setFrame(true);\n";
      }
      if (exampleVideoPlayer.getResizable())
      {
        code += codeVarName + ".setResizable(true);\n";
      }
      if (!exampleVideoPlayer.getPreview())
      {
        code += codeVarName + ".setPreview(false);\n";
      }
      if (exampleVideoPlayer.getFullscreenEnabled())
      {
        code += codeVarName + ".setFullscreenEnabled(true);\n";
      }
      if (exampleVideoPlayer.getChapterListEnabled())
      {
        code += codeVarName + ".setChapterListEnabled(true);\n";
      }
      if (exampleVideoPlayer.getAutoContinue())
      {
        code += codeVarName + ".setAutoContinue(true);\n";
      }
      if (exampleVideoPlayer.getSoundVolume()
          != application.getComponentsConfig().getVideoPlayerSoundVolume())
      {
        code += codeVarName + ".setSoundVolume("
          + exampleVideoPlayer.getSoundVolume() + ");\n";
      }
      if (exampleVideoPlayer.isSoundMuted())
      {
        code += codeVarName + ".setSoundMuted(true);\n";
      }
      if (exampleVideoPlayer.getBoxDw() > 0 || exampleVideoPlayer.getBoxDh() > 0)
      {
        code += codeVarName + ".setDwh(" + exampleVideoPlayer.getBoxDw()
          + ", " + exampleVideoPlayer.getBoxDh() + ");\n";
      }
      code += getChaptersCode(imports);
      if (exampleVideoPlayer.getSelectedChapterIndex() > 0)
      {
        code += codeVarName + ".setSelectedChapterIndex("
          + exampleVideoPlayer.getSelectedChapterIndex() + ");\n";
      }
      code += getSpritePropertiesCode(imports);
      if (exampleVideoPlayer.isPlaying())
      {
        code += codeVarName + ".play();\n";
      }
      if (exampleVideoPlayer.isPaused())
      {
        code += codeVarName + ".pause();\n";
      }
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * A player plays a video of its own and no click sound at all: the setter of that
     * click sound does nothing on it, so the code of the current state leaves it out.
     */
    override protected function getSoundClickCodeNeeded():Boolean
    {
      return false;
    }
    /**
     * Builds the rows of the chapters of the video: the chapters themselves, the one this
     * player stands on, the name, the url and the length of it, the length of the whole
     * video and the automatic continuation. The picker of the chapters and the two links
     * standing on the empty row below it are the three ways one chapter is stepped onto.
     */
    private function createChapterRows():void
    {
      application.trace("<" + this + " VideoPlayerWidget createChapterRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_CHAPTERS());
      setChaptersOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_CHAPTERS());
      clearChaptersOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLEAR_CHAPTERS());
      chaptersVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CHAPTER_INDEX());
      chapterOBJ = createListPicker(cellIndex + 1, chapterNamesARR.concat(), getChapterIndexValues());
      chapterOBJ.setSelectedIndex(0, false);
      chapterIndexVAL = createValueLabel(cellIndex + 2);
      // the two links stepping the chapters stand on the empty row below that picker: they
      // change the very property of the row above, so this one carries no name and no
      // value of its own
      cellIndex = createRow("");
      prevChapterOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_PREV_CHAPTER());
      nextChapterOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_NEXT_CHAPTER());
      // the name, the url and the length of a chapter come from the chapters themselves
      // and from the metadata of the file, so these three rows change nothing
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CHAPTER_NAME());
      chapterNameVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CHAPTER_URL());
      chapterUrlVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CHAPTER_SECS());
      chapterSecsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TOTAL_SECS());
      totalSecsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_AUTO_CONTINUE());
      autoContinueOBJ = createSwitcher(cellIndex + 1, exampleVideoPlayer.getAutoContinue());
      autoContinueVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the playing: the three links starting, pausing and stopping it,
     * and the three values telling what this player is doing at the moment.
     */
    private function createPlayingRows():void
    {
      application.trace("<" + this + " VideoPlayerWidget createPlayingRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_PLAYING());
      playOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_PLAY());
      pauseOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_PAUSE());
      stopOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_STOP());
      playingVAL = createValueLabel(cellIndex + 2);
      // the pause and the seconds played so far are states and not properties, so these
      // two rows have nothing to change them with
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_PAUSED());
      pausedVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_PROGRESS_SECS());
      progressSecsVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the sound of the video: the volume of it and the muting. The
     * potmeter and the switcher of the two rows follow the two controls standing on the
     * player itself, so a drag or a click there is displayed here as well.
     */
    private function createSoundRows():void
    {
      application.trace("<" + this + " VideoPlayerWidget createSoundRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_VOLUME());
      soundVolumeOBJ = createPotmeter(cellIndex + 1, soundVolumeMIN, soundVolumeMAX, soundVolumeINC);
      soundVolumeOBJ.setCurValue(exampleVideoPlayer.getSoundVolume(), false);
      soundVolumeVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_MUTED());
      soundMutedOBJ = createSwitcher(cellIndex + 1, exampleVideoPlayer.isSoundMuted());
      soundMutedVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the box the picture is drawn inside: the dimensions of that box,
     * the ones the picture is really drawn with, the preview picture, the resizing by hand
     * and the frame. The two potmeters of the box share one cell, so they stand next to
     * each other, and they follow every drag of the handle of the resizing as well.
     */
    private function createBoxRows():void
    {
      application.trace("<" + this + " VideoPlayerWidget createBoxRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_BOX_DIMENSIONS());
      boxDwOBJ = createPotmeter(cellIndex + 1, boxMIN, boxMAX, boxINC);
      boxDhOBJ = createPotmeter(cellIndex + 1, boxMIN, boxMAX, boxINC);
      boxDwOBJ.setCurValue(exampleVideoPlayer.getBoxDw(), false);
      boxDhOBJ.setCurValue(exampleVideoPlayer.getBoxDh(), false);
      boxDimensionsVAL = createValueLabel(cellIndex + 2);
      // the dimensions of the picture come from the box and from the metadata of the file,
      // so this row changes nothing
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_VIDEO_DIMENSIONS());
      videoDimensionsVAL = createValueLabel(cellIndex + 2);
      // the smallest width of the player comes from the font size and from the margin of
      // the application, so this row changes nothing either
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MIN_DW());
      minDwVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_PREVIEW());
      previewOBJ = createSwitcher(cellIndex + 1, exampleVideoPlayer.getPreview());
      previewVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_RESIZABLE());
      resizableOBJ = createSwitcher(cellIndex + 1, exampleVideoPlayer.getResizable());
      resizableVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_FRAME());
      frameOBJ = createSwitcher(cellIndex + 1, exampleVideoPlayer.getFrame());
      frameVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the fullscreen of the video: the switcher of the feature itself
     * and the two links opening and closing it. The value of the row is the state of that
     * fullscreen, so the button standing on the picture of the player is followed here as
     * well.
     */
    private function createFullscreenRows():void
    {
      application.trace("<" + this + " VideoPlayerWidget createFullscreenRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_FULLSCREEN());
      fullscreenOBJ = createSwitcher(cellIndex + 1, exampleVideoPlayer.getFullscreenEnabled());
      openFullscreenOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_OPEN());
      closeFullscreenOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLOSE());
      fullscreenVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the list the chapters are picked from: the switcher of the feature
     * itself and the two links opening and closing that list. The value of the row is the
     * state of it, so the button standing on the picture of the player is followed here as
     * well.
     */
    private function createChapterListRows():void
    {
      application.trace("<" + this + " VideoPlayerWidget createChapterListRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_CHAPTER_LIST());
      chapterListOBJ = createSwitcher(cellIndex + 1, exampleVideoPlayer.getChapterListEnabled());
      openChapterListOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_OPEN());
      closeChapterListOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLOSE());
      chapterListVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the values of the picker of the chapters: the index of every chapter, the
     * very number the setter of the chapter of this player takes.
     */
    private function getChapterIndexValues():Array
    {
      application.trace("<" + this + " VideoPlayerWidget getChapterIndexValues> called.", 4);
      const values:Array = new Array();
      for (var i:int = 0; i < chapterNamesARR.length; i++)
      {
        values.push("" + i);
      }
      return values;
    }
    /**
     * Returns the code of the chapters of the example player: the two arrays of one single
     * call, the names in the first one and the urls in the second. The names are the text
     * keys of this application, so the enum of them is collected into the imports as well.
     * @param imports the names of the classes collected so far
     */
    private function getChaptersCode(imports:Array):String
    {
      application.trace("<" + this + " VideoPlayerWidget getChaptersCode> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget getChaptersCode> imports: " + imports, 3);
      const numOfChapters:int = exampleVideoPlayer.getNumOfChapters();
      if (numOfChapters < 1)
      {
        return "";
      }
      pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
      var names:String = "";
      var urls:String = "";
      for (var i:int = 0; i < numOfChapters; i++)
      {
        names += (i > 0 ? "\n    , " : "") + "EnumTextKeysDemo."
          + getTextKeyName(exampleVideoPlayer.getChapterName(i)) + "()";
        urls += (i > 0 ? "\n    , " : "") + "\"" + exampleVideoPlayer.getChapterUrl(i) + "\"";
      }
      return codeVarName + ".setChapters([" + names + "]\n    , [" + urls + "]);\n";
    }
    /**
     * Displays every value again after the example player has been started, stopped or
     * changed: every one of those can be done by its own buttons as well, and the row of
     * the last event tells which of the five reports has arrived.
     * @param e the played, stopped or changed event of that player
     */
    private function exampleVideoPlayerChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget exampleVideoPlayerChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget exampleVideoPlayerChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Takes the picker of the chapters onto the chapter the example player has stepped
     * onto and displays every value again: that player is stepped by the buttons of its
     * own, by the two links of this widget and by the automatic continuation at the end of
     * a chapter as well, and the picker has to follow it in every one of those cases.
     * @param e the chapter changed event of that player
     */
    private function exampleVideoPlayerChapterChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget exampleVideoPlayerChapterChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget exampleVideoPlayerChapterChanged> e: " + e, 3);
      updateChapterListPicker();
      setLastEvent(e.type);
    }
    /**
     * Gives the three sample chapters to the example player.
     * @param e the click event of that link
     */
    private function setChaptersClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget setChaptersClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget setChaptersClick> e: " + e, 3);
      exampleVideoPlayer.setChapters(chapterNamesARR.concat(), chapterUrlsARR.concat());
      updateChapterListPicker();
      displayEveryCurrentValue();
    }
    /**
     * Drops every chapter of the example player.
     * @param e the click event of that link
     */
    private function clearChaptersClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget clearChaptersClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget clearChaptersClick> e: " + e, 3);
      exampleVideoPlayer.clearChapters();
      displayEveryCurrentValue();
    }
    /**
     * Takes the example player onto the picked chapter.
     * @param e the changed event of the picker of the chapters
     */
    private function chapterChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget chapterChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget chapterChanged> e: " + e, 3);
      exampleVideoPlayer.setSelectedChapterIndex(parseInt(chapterOBJ.getSelectedValue()));
      displayEveryCurrentValue();
    }
    /**
     * Takes the example player onto the chapter standing before this one: that player
     * reports the step it has made and the picker of the chapters is taken by that report,
     * so there is nothing to be displayed here.
     * @param e the click event of that link
     */
    private function prevChapterClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget prevChapterClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget prevChapterClick> e: " + e, 3);
      exampleVideoPlayer.prevChapter();
    }
    /**
     * Takes the example player onto the chapter standing after this one: that player
     * reports the step it has made and the picker of the chapters is taken by that report,
     * so there is nothing to be displayed here.
     * @param e the click event of that link
     */
    private function nextChapterClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget nextChapterClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget nextChapterClick> e: " + e, 3);
      exampleVideoPlayer.nextChapter();
    }
    /**
     * Takes the picker of the chapters onto the chapter the example player stands on: that
     * picker has to follow that player silently, so it is not told that the one using this
     * application has picked anything at all. A player holding no chapter leaves that
     * picker the way it stands: there is no item of a minus one index to be taken.
     */
    private function updateChapterListPicker():void
    {
      application.trace("<" + this + " VideoPlayerWidget updateChapterListPicker> called.", 4);
      const index:int = exampleVideoPlayer.getSelectedChapterIndex();
      if (index > -1)
      {
        chapterOBJ.setSelectedIndex(index, false);
      }
    }
    /**
     * Tells the example player whether it has to step onto the next chapter by itself as
     * soon as the one it plays is over.
     * @param e the changed event of that switcher
     */
    private function autoContinueChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget autoContinueChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget autoContinueChanged> e: " + e, 3);
      exampleVideoPlayer.setAutoContinue(autoContinueOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Starts the playing of the example player from the outside: that player reports it
     * with its played by outside event and not with the one of a click on it.
     * @param e the click event of that link
     */
    private function playClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget playClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget playClick> e: " + e, 3);
      exampleVideoPlayer.play();
      displayEveryCurrentValue();
    }
    /**
     * Pauses the playing of the example player: the next playing of it goes on from the
     * very point it stands at now.
     * @param e the click event of that link
     */
    private function pauseClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget pauseClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget pauseClick> e: " + e, 3);
      exampleVideoPlayer.pause();
      displayEveryCurrentValue();
    }
    /**
     * Stops the playing of the example player and takes it back to the beginning of its
     * chapter.
     * @param e the click event of that link
     */
    private function stopClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget stopClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget stopClick> e: " + e, 3);
      exampleVideoPlayer.stop();
      displayEveryCurrentValue();
    }
    /**
     * Gives the volume the potmeter of this widget has been dragged to to the example
     * player: the potmeter standing on that player itself follows the very same value.
     * @param e the changed event of that potmeter
     */
    private function soundVolumeChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget soundVolumeChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget soundVolumeChanged> e: " + e, 3);
      exampleVideoPlayer.setSoundVolume(int(soundVolumeOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Mutes or unmutes the sound of the example player: the button standing on that player
     * itself carries the very same state.
     * @param e the changed event of that switcher
     */
    private function soundMutedChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget soundMutedChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget soundMutedChanged> e: " + e, 3);
      exampleVideoPlayer.setSoundMuted(soundMutedOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Gives the new box to the example player. Both potmeters hand both dimensions over at
     * once, so the picture is drawn once whichever of them has been moved.
     * @param e the changed event of one of the potmeters of the box
     */
    private function boxChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget boxChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget boxChanged> e: " + e, 3);
      exampleVideoPlayer.setDwh(int(boxDwOBJ.getCurValue()), int(boxDhOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Tells the example player whether it has to display the first frame of its chapter
     * while nothing is playing.
     * @param e the changed event of that switcher
     */
    private function previewChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget previewChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget previewChanged> e: " + e, 3);
      exampleVideoPlayer.setPreview(previewOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Tells the example player whether the box of it can be resized by hand.
     * @param e the changed event of that switcher
     */
    private function resizableChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget resizableChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget resizableChanged> e: " + e, 3);
      exampleVideoPlayer.setResizable(resizableOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Draws a frame around the example player or takes that frame away.
     * @param e the changed event of that switcher
     */
    private function frameChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget frameChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget frameChanged> e: " + e, 3);
      exampleVideoPlayer.setFrame(frameOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Tells the example player whether the video of it can be opened in fullscreen at all.
     * @param e the changed event of that switcher
     */
    private function fullscreenChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget fullscreenChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget fullscreenChanged> e: " + e, 3);
      exampleVideoPlayer.setFullscreenEnabled(fullscreenOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Opens the video of the example player in fullscreen.
     * @param e the click event of that link
     */
    private function openFullscreenClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget openFullscreenClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget openFullscreenClick> e: " + e, 3);
      exampleVideoPlayer.openFullscreen();
      displayEveryCurrentValue();
    }
    /**
     * Closes the fullscreen of the video of the example player.
     * @param e the click event of that link
     */
    private function closeFullscreenClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget closeFullscreenClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget closeFullscreenClick> e: " + e, 3);
      exampleVideoPlayer.closeFullscreen();
      displayEveryCurrentValue();
    }
    /**
     * Tells the example player whether the chapters of it can be picked from a list at all.
     * @param e the changed event of the switcher of that feature
     */
    private function chapterListChanged(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget chapterListChanged> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget chapterListChanged> e: " + e, 3);
      exampleVideoPlayer.setChapterListEnabled(chapterListOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Opens the list the chapters of the example player are picked from.
     * @param e the click event of that link
     */
    private function openChapterListClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget openChapterListClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget openChapterListClick> e: " + e, 3);
      exampleVideoPlayer.openChapterList();
      displayEveryCurrentValue();
    }
    /**
     * Closes the list the chapters of the example player are picked from.
     * @param e the click event of that link
     */
    private function closeChapterListClick(e:Event):void
    {
      application.trace("<" + this + " VideoPlayerWidget closeChapterListClick> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget closeChapterListClick> e: " + e, 3);
      exampleVideoPlayer.closeChapterList();
      displayEveryCurrentValue();
    }
    /**
     * Destroys this object and frees up everything. Every element of this widget stands in
     * the content of it, and that content is destroyed by the super destroy below, so the
     * references of them are only cleared here. The listeners registered above are the
     * ones of those very elements, so they are freed up together with them.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " VideoPlayerWidget destroy> called.", 4);
      application.trace("<" + this + " VideoPlayerWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " VideoPlayerWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      chapterNamesARR.splice(0);
      chapterUrlsARR.splice(0);
      application.trace("<" + this + " VideoPlayerWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " VideoPlayerWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      boxMIN = 0;
      boxMAX = 0;
      boxINC = 0;
      boxDwINI = 0;
      boxDhINI = 0;
      soundVolumeMIN = 0;
      soundVolumeMAX = 0;
      soundVolumeINC = 0;
      chapterNamesARR = null;
      chapterUrlsARR = null;
      exampleVideoPlayer = null;
      setChaptersOBJ = null;
      clearChaptersOBJ = null;
      chapterOBJ = null;
      prevChapterOBJ = null;
      nextChapterOBJ = null;
      autoContinueOBJ = null;
      playOBJ = null;
      pauseOBJ = null;
      stopOBJ = null;
      soundVolumeOBJ = null;
      soundMutedOBJ = null;
      boxDwOBJ = null;
      boxDhOBJ = null;
      previewOBJ = null;
      resizableOBJ = null;
      frameOBJ = null;
      fullscreenOBJ = null;
      openFullscreenOBJ = null;
      closeFullscreenOBJ = null;
      chapterListOBJ = null;
      openChapterListOBJ = null;
      closeChapterListOBJ = null;
      chaptersVAL = null;
      chapterIndexVAL = null;
      chapterNameVAL = null;
      chapterUrlVAL = null;
      chapterSecsVAL = null;
      totalSecsVAL = null;
      autoContinueVAL = null;
      playingVAL = null;
      pausedVAL = null;
      progressSecsVAL = null;
      soundVolumeVAL = null;
      soundMutedVAL = null;
      boxDimensionsVAL = null;
      videoDimensionsVAL = null;
      minDwVAL = null;
      previewVAL = null;
      resizableVAL = null;
      frameVAL = null;
      fullscreenVAL = null;
      chapterListVAL = null;
    }
  }
}
