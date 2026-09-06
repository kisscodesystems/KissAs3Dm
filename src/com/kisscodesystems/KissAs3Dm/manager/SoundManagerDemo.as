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
 * SoundManagerDemo.
 * Handles embedded sounds.
 * This class is generated so can be overwritten from outside.
 */
package com.kisscodesystems.KissAs3Dm.manager
{
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.manager.SoundManager;
  import flash.media.Sound;
  import flash.media.SoundChannel;
  import flash.media.SoundTransform;
  public class SoundManagerDemo extends SoundManager
  {
    private var sampleSound:Sound;
    private var signalSound:Sound;
    private var files:SoundManagerDemoFiles = new SoundManagerDemoFiles();
    /**
     * Constructs this manager and loads every resource embedded into it.
     * @param applicationRef the main application reference
     */
    public function SoundManagerDemo(applicationRef:Application):void
    {
      super(applicationRef);
      sampleSound = new files.sampleClass() as Sound;
      signalSound = new files.signalClass() as Sound;
      application.trace("<SoundManagerDemo> constructed.", 4);
    }
    /**
     * Plays a sound of this application, or the one the framework answers when this
     * application has no sound of that name at all.
     * @param soundType the name of the sound
     * @param startTime the position the playing is started at
     */
    override public function playSound(soundType:String, startTime:Number = 0):SoundChannel
    {
      var soundChannel:SoundChannel = null;
      if (application.getDynamicsConfig().getAppSoundPlaying())
      {
        var soundTransform:SoundTransform = new SoundTransform();
        soundTransform.volume = application.getDynamicsConfig().getAppSoundVolume() / 100;
        if (soundType == "sample") soundChannel = sampleSound.play(startTime);
        else if (soundType == "signal") soundChannel = signalSound.play(startTime);
        else soundChannel = super.playSound(soundType, startTime);
        if (soundChannel != null)
        {
          soundChannel.soundTransform = soundTransform;
        }
      }
      return soundChannel;
    }
    /**
     * Returns a sound of this application, or the one the framework answers when this
     * application has no sound of that name at all.
     * @param soundType the name of the sound
     */
    override public function getSound(soundType:String):Sound
    {
      if (soundType == "sample") return sampleSound;
      else if (soundType == "signal") return signalSound;
      else return super.getSound(soundType);
    }
    /**
     * Destroys this object: it frees up the resources embedded into this application
     * and lets the framework free up the ones of its own.
     */
    override public function destroy():void
    {
      application.trace("<SoundManagerDemo destroy> called.", 4);
      super.destroy();
      sampleSound = null;
      signalSound = null;
      files = null;
    }
  }
}
class SoundManagerDemoFiles
{
  [Embed(source = "../resource/sound/sample.mp3")]
  public var sampleClass:Class;
  [Embed(source = "../resource/sound/signal.mp3")]
  public var signalClass:Class;
  /**
   * Constructs the embedded resource holder of this manager.
   */
  public function SoundManagerDemoFiles():void
  {
  }
}
