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
 * SoundPlayerWidget.
 * The widget of the SoundPlayer component of the framework.
 *
 * MAIN FEATURES:
 * - the player of an embedded sound with a progress bar and a volume setter
 * - the example player stands at the top of the content of this widget and every
 *   property of it can be changed right under it
 * - the rows of the sound, of the name, of the starting second, of the playing, of the
 *   volume, of the muting and of the length are built here, every other one comes from
 *   the PropertyWidget base class
 * - the volume of that player belongs to the player alone: the sound volume of the
 *   application is the one of the sound effects, so the row of the volume here is the
 *   only one changing it
 * - the volume and the muting are set on the player itself as well, so the potmeter of
 *   the volume and the switcher of the muting follow every drag of the potmeter standing
 *   on that player and every click on the button of its sound
 * - the sound, the name and the starting second are the three parameters of one single
 *   setter, so every one of those rows hands all the three of them over at once
 * - the height of that player comes from its own buttons and from the state it stands
 *   in, so it has a row of a width but no row of a height at all
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumSoundsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.enum.EnumSounds;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.SoundPlayer;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class SoundPlayerWidget extends PropertyWidget
  {
    // the range and the starting value of the width of the example player
    private var widthMIN:int = 200;
    private var widthMAX:int = 600;
    private var widthINC:int = 20;
    private var widthINI:int = 400;
    // the range of the volume of the example player
    private var soundVolumeMIN:int = 0;
    private var soundVolumeMAX:int = 100;
    private var soundVolumeINC:int = 1;
    // The range of the second the playing of the example player is started at. The
    // greatest one is the length of the sound that stands in it, so the potmeter of it
    // is given a new range with every new sound.
    private var sampleMIN:int = 0;
    private var sampleINC:int = 1;
    // The sound types the picker of the sounds offers. The ones of this demo application
    // are held on their own as well: the code of the current state names the enum of
    // this application for those and the one of the framework for every other.
    private var soundTypesARR:Array = null;
    private var soundTypesDemoARR:Array = null;
    // the example player: the very object the rows of this widget work on
    private var exampleSoundPlayer:SoundPlayer = null;
    // the elements changing the properties of that player
    private var soundOBJ:ListPicker = null;
    private var soundNameOBJ:TextInput = null;
    private var sampleOBJ:Potmeter = null;
    private var playOBJ:ButtonLink = null;
    private var pauseOBJ:ButtonLink = null;
    private var stopOBJ:ButtonLink = null;
    private var soundVolumeOBJ:Potmeter = null;
    private var soundMutedOBJ:Switcher = null;
    // the labels of the third column: the values the getters of that player answer
    private var soundVAL:TextLabel = null;
    private var soundNameVAL:TextLabel = null;
    private var playingVAL:TextLabel = null;
    private var soundVolumeVAL:TextLabel = null;
    private var soundMutedVAL:TextLabel = null;
    private var soundLengthMillisVAL:TextLabel = null;
    private var soundLengthBytesVAL:TextLabel = null;
    private var soundMaxSecsVAL:TextLabel = null;
    /**
     * Constructs the widget of the SoundPlayer component.
     * @param applicationRef the main application reference
     */
    public function SoundPlayerWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " SoundPlayerWidget> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.SOUNDPLAYER();
      headerIcon = EnumIcons.playing();
      infoCode = EnumTextKeysDemo.WIDGETINFO_SOUNDPLAYER();
      codeVarName = "soundPlayer";
      iniSizeWidth = 770;
      iniSizeHeight = 700;
      soundTypesDemoARR = [EnumSoundsDemo.sample(), EnumSoundsDemo.signal()];
      soundTypesARR = soundTypesDemoARR.concat([EnumSounds.button(), EnumSounds.confirm()
        , EnumSounds.message(), EnumSounds.open()]);
      application.trace("<" + this + " SoundPlayerWidget> constructed.", 4);
    }
    /**
     * Builds the example player of this widget and gives the sample sound of this demo
     * application to it. It is not filled, so it keeps the width it is given here, and
     * the strip it takes is as tall as it is: that height grows as soon as it is played.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " SoundPlayerWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleSoundPlayer = new SoundPlayer(application);
      setExampleElement(exampleSoundPlayer);
      exampleSoundPlayer.setDw(widthINI);
      exampleSoundPlayer.setSoundTypeAndName(EnumSoundsDemo.sample()
        , EnumTextKeysDemo.WIDGET_EXAMPLE_SOUND_NAME());
    }
    /**
     * Builds every row of this widget: the ones of the SoundPlayer component itself and
     * the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " SoundPlayerWidget createRows> called.", 4);
      super.createRows();
      createSoundRows();
      createWidthRow(widthMIN, widthMAX, widthINC);
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * player as well: that player reports every start and every stop of its own by four
     * events and the setting of the volume and of the muting on itself by a changed one,
     * and the one using this application can start it, stop it, set the volume of it and
     * mute it by the controls of that player instead of a row below.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " SoundPlayerWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleSoundPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_PLAYED_BY_HAND(), exampleSoundPlayerChanged);
      exampleSoundPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_PLAYED_BY_OUTSIDE(), exampleSoundPlayerChanged);
      exampleSoundPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_STOPPED_BY_END(), exampleSoundPlayerChanged);
      exampleSoundPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_STOPPED_BY_HAND(), exampleSoundPlayerChanged);
      exampleSoundPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleSoundPlayerChanged);
      soundOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), soundChanged);
      soundNameOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), soundNameChanged);
      sampleOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), sampleChanged);
      playOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), playClick);
      pauseOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), pauseClick);
      stopOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), stopClick);
      soundVolumeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), soundVolumeChanged);
      soundMutedOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), soundMutedChanged);
    }
    /**
     * Displays the current value of every property of the example player.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " SoundPlayerWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      soundVAL.setLabel(getTextOrNone(exampleSoundPlayer.getSoundType()));
      soundNameVAL.setLabel(getTextOrNone(exampleSoundPlayer.getSoundName()));
      playingVAL.setLabel(getYesNoKey(exampleSoundPlayer.isPlaying()));
      soundVolumeOBJ.setCurValue(exampleSoundPlayer.getSoundVolume(), false);
      soundVolumeVAL.setLabel("" + exampleSoundPlayer.getSoundVolume());
      soundMutedOBJ.setOn(exampleSoundPlayer.isSoundMuted(), false);
      soundMutedVAL.setLabel(getYesNoKey(exampleSoundPlayer.isSoundMuted()));
      soundLengthMillisVAL.setLabel("" + exampleSoundPlayer.getSoundLengthMillis());
      soundLengthBytesVAL.setLabel("" + exampleSoundPlayer.getSoundLengthBytes());
      soundMaxSecsVAL.setLabel("" + exampleSoundPlayer.getSoundMaxSecs());
    }
    /**
     * Returns the code writing the example player the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new player. A brand new player holds no sound at all, and every
     * class the code below names is collected into the imports while those lines are
     * written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " SoundPlayerWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("SoundPlayer", imports);
      if (exampleSoundPlayer.getSoundType() != "")
      {
        code += codeVarName + ".setSoundTypeAndName("
          + getSoundCode(exampleSoundPlayer.getSoundType(), imports) + ", "
          + getSoundNameCode(imports) + getSampleCode() + ");\n";
      }
      if (exampleSoundPlayer.getSoundVolume()
          != application.getComponentsConfig().getSoundPlayerSoundVolume())
      {
        code += codeVarName + ".setSoundVolume("
          + exampleSoundPlayer.getSoundVolume() + ");\n";
      }
      if (exampleSoundPlayer.isSoundMuted())
      {
        code += codeVarName + ".setSoundMuted(true);\n";
      }
      code += getSpritePropertiesCode(imports);
      if (exampleSoundPlayer.isPlaying())
      {
        code += codeVarName + ".play();\n";
      }
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * A player plays a sound of its own and no click sound at all: the setter of that
     * click sound does nothing on it, so the code of the current state leaves it out.
     */
    override protected function getSoundClickCodeNeeded():Boolean
    {
      return false;
    }
    /**
     * Builds the rows of the properties the SoundPlayer component brings of its own: the
     * sound it plays, the name of that sound, the second the playing is started at, the
     * playing itself, the volume, the muting and the length of that sound. The three rows
     * on the top of them are
     * the three parameters of one single setter, so every one of them hands all the three
     * of them over at once, and that setter stops a playing player first.
     */
    private function createSoundRows():void
    {
      application.trace("<" + this + " SoundPlayerWidget createSoundRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND());
      soundOBJ = createListPicker(cellIndex + 1, soundTypesARR.concat(), soundTypesARR.concat());
      soundOBJ.setSelectedIndex(0, false);
      soundVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_NAME());
      soundNameOBJ = createTextInput(cellIndex + 1);
      soundNameOBJ.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_SOUND_NAME());
      soundNameVAL = createValueLabel(cellIndex + 2);
      // the starting second has no getter at all, so this row displays nothing
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_SAMPLE());
      sampleOBJ = createPotmeter(cellIndex + 1, sampleMIN, sampleMIN + sampleINC, sampleINC);
      updateSampleRange();
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_PLAYING());
      playOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_PLAY());
      pauseOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_PAUSE());
      stopOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_STOP());
      playingVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_VOLUME());
      soundVolumeOBJ = createPotmeter(cellIndex + 1, soundVolumeMIN, soundVolumeMAX, soundVolumeINC);
      soundVolumeOBJ.setCurValue(exampleSoundPlayer.getSoundVolume(), false);
      soundVolumeVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_MUTED());
      soundMutedOBJ = createSwitcher(cellIndex + 1, exampleSoundPlayer.isSoundMuted());
      soundMutedVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_LENGTH_MILLIS());
      soundLengthMillisVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_LENGTH_BYTES());
      soundLengthBytesVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_SOUND_MAX_SECS());
      soundMaxSecsVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the code of the given sound: the sounds of this demo application come from
     * the enum of this application and every other one from the enum of the framework.
     * @param soundType the type of the sound, an EnumSounds value
     * @param imports the names of the classes collected so far
     */
    private function getSoundCode(soundType:String, imports:Array):String
    {
      application.trace("<" + this + " SoundPlayerWidget getSoundCode> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget getSoundCode> soundType: " + soundType, 3);
      application.trace("<" + this + " SoundPlayerWidget getSoundCode> imports: " + imports, 3);
      if (soundTypesDemoARR.indexOf(soundType) > -1)
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumSoundsDemo");
        return "EnumSoundsDemo." + soundType + "()";
      }
      pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumSounds");
      return "EnumSounds." + soundType + "()";
    }
    /**
     * Returns the code of the name of the sound of the example player: the text key of
     * the example name when that one is displayed, and the name itself in quotation
     * marks otherwise.
     * @param imports the names of the classes collected so far
     */
    private function getSoundNameCode(imports:Array):String
    {
      application.trace("<" + this + " SoundPlayerWidget getSoundNameCode> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget getSoundNameCode> imports: " + imports, 3);
      const soundName:String = exampleSoundPlayer.getSoundName();
      if (soundName == EnumTextKeysDemo.WIDGET_EXAMPLE_SOUND_NAME())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        return "EnumTextKeysDemo." + getTextKeyName(soundName) + "()";
      }
      return "\"" + soundName + "\"";
    }
    /**
     * Returns the code of the third parameter of the setter of the sound: the second the
     * playing has to be started at. That second has no getter at all, so it is read back
     * from the potmeter of it, and a playing that starts at the beginning of the sound
     * needs no parameter at all.
     */
    private function getSampleCode():String
    {
      application.trace("<" + this + " SoundPlayerWidget getSampleCode> called.", 4);
      const sample:int = int(sampleOBJ.getCurValue());
      return sample == sampleMIN ? "" : ", " + sample;
    }
    /**
     * Gives the sound, the name and the starting second of the three rows above to the
     * example player. Those three are the parameters of one single setter, so all of them
     * are handed over together, whichever row of them has been changed.
     */
    private function applySoundTypeAndName():void
    {
      application.trace("<" + this + " SoundPlayerWidget applySoundTypeAndName> called.", 4);
      exampleSoundPlayer.setSoundTypeAndName(soundOBJ.getSelectedValue()
        , soundNameOBJ.getText(), int(sampleOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Gives the potmeter of the starting second the range of the sound that stands in the
     * example player: that second can not point behind the end of the sound it starts.
     * A sound shorter than one whole second leaves that potmeter where it is, because a
     * range of no step at all is refused by it.
     */
    private function updateSampleRange():void
    {
      application.trace("<" + this + " SoundPlayerWidget updateSampleRange> called.", 4);
      const soundMaxSecs:int = exampleSoundPlayer.getSoundMaxSecs();
      if (soundMaxSecs <= sampleMIN)
      {
        application.trace("<" + this + " SoundPlayerWidget updateSampleRange> nothing to do with: " + soundMaxSecs, 3);
        return;
      }
      sampleOBJ.setMinMaxIncValues(sampleMIN, soundMaxSecs, sampleINC);
    }
    /**
     * Displays every value again after the example player has been started or stopped or
     * after the volume or the muting of it has been set on the player itself: every one of
     * those can be done by the controls of that player as well, and the row of the last
     * event tells which of the five reports has arrived.
     * @param e the played, stopped or changed event of that player
     */
    private function exampleSoundPlayerChanged(e:Event):void
    {
      application.trace("<" + this + " SoundPlayerWidget exampleSoundPlayerChanged> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget exampleSoundPlayerChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the picked sound to the example player. A new sound is started at its own
     * beginning and it is a longer or a shorter one than the previous, so the potmeter of
     * the starting second is taken back to zero silently and it is given the range of
     * that new sound afterwards.
     * @param e the changed event of the picker of the sounds
     */
    private function soundChanged(e:Event):void
    {
      application.trace("<" + this + " SoundPlayerWidget soundChanged> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget soundChanged> e: " + e, 3);
      sampleOBJ.setCurValue(sampleMIN, false);
      applySoundTypeAndName();
      updateSampleRange();
    }
    /**
     * Gives the text of the input of the name row to the example player. That name can
     * only be given together with the sound itself, so a new name stops a playing player.
     * @param e the changed event of that input
     */
    private function soundNameChanged(e:Event):void
    {
      application.trace("<" + this + " SoundPlayerWidget soundNameChanged> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget soundNameChanged> e: " + e, 3);
      applySoundTypeAndName();
    }
    /**
     * Gives the new starting second to the example player: the next playing of it begins
     * at that very second of its sound.
     * @param e the changed event of the potmeter of the starting second
     */
    private function sampleChanged(e:Event):void
    {
      application.trace("<" + this + " SoundPlayerWidget sampleChanged> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget sampleChanged> e: " + e, 3);
      applySoundTypeAndName();
    }
    /**
     * Starts the playing of the example player from the outside: that player reports it
     * with its played by outside event and not with the one of a click on it.
     * @param e the click event of that link
     */
    private function playClick(e:Event):void
    {
      application.trace("<" + this + " SoundPlayerWidget playClick> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget playClick> e: " + e, 3);
      exampleSoundPlayer.play();
      displayEveryCurrentValue();
    }
    /**
     * Pauses the playing of the example player: the next playing of it goes on from the
     * very point it stands at now.
     * @param e the click event of that link
     */
    private function pauseClick(e:Event):void
    {
      application.trace("<" + this + " SoundPlayerWidget pauseClick> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget pauseClick> e: " + e, 3);
      exampleSoundPlayer.pause();
      displayEveryCurrentValue();
    }
    /**
     * Stops the playing of the example player and takes it back to the beginning of its
     * sound.
     * @param e the click event of that link
     */
    private function stopClick(e:Event):void
    {
      application.trace("<" + this + " SoundPlayerWidget stopClick> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget stopClick> e: " + e, 3);
      exampleSoundPlayer.stop();
      displayEveryCurrentValue();
    }
    /**
     * Takes the dragged volume to the example player.
     * @param e the changed event of the potmeter of that volume
     */
    private function soundVolumeChanged(e:Event):void
    {
      application.trace("<" + this + " SoundPlayerWidget soundVolumeChanged> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget soundVolumeChanged> e: " + e, 3);
      exampleSoundPlayer.setSoundVolume(int(soundVolumeOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Mutes or unmutes the example player.
     * @param e the changed event of the switcher of that muting
     */
    private function soundMutedChanged(e:Event):void
    {
      application.trace("<" + this + " SoundPlayerWidget soundMutedChanged> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget soundMutedChanged> e: " + e, 3);
      exampleSoundPlayer.setSoundMuted(soundMutedOBJ.getOn());
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
      application.trace("<" + this + " SoundPlayerWidget destroy> called.", 4);
      application.trace("<" + this + " SoundPlayerWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " SoundPlayerWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      soundTypesARR.splice(0);
      soundTypesDemoARR.splice(0);
      application.trace("<" + this + " SoundPlayerWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " SoundPlayerWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      widthMIN = 0;
      widthMAX = 0;
      widthINC = 0;
      widthINI = 0;
      soundVolumeMIN = 0;
      soundVolumeMAX = 0;
      soundVolumeINC = 0;
      sampleMIN = 0;
      sampleINC = 0;
      soundTypesARR = null;
      soundTypesDemoARR = null;
      exampleSoundPlayer = null;
      soundOBJ = null;
      soundNameOBJ = null;
      sampleOBJ = null;
      playOBJ = null;
      pauseOBJ = null;
      stopOBJ = null;
      soundVolumeOBJ = null;
      soundMutedOBJ = null;
      soundVAL = null;
      soundNameVAL = null;
      playingVAL = null;
      soundVolumeVAL = null;
      soundMutedVAL = null;
      soundLengthMillisVAL = null;
      soundLengthBytesVAL = null;
      soundMaxSecsVAL = null;
    }
  }
}
