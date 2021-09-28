package com . kisscodesystems . KissAs3Dm . ui
{
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . SoundManager ;
  import flash . media . Sound ;
  import flash . media . SoundChannel ;
  import flash . media . SoundTransform ;
  import flash . system . System ;
  public class SoundManagerDemo extends SoundManager
  {
    [ Embed ( source = "../../../../../res/sounds1/signal.mp3" ) ]
    private var SignalClass : Class ;
    private var signalSound : Sound ;
    [ Embed ( source = "../../../../../res/sounds1/sample.mp3" ) ]
    private var SampleClass : Class ;
    private var sampleSound : Sound ;
    public function SoundManagerDemo ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      signalSound = new SignalClass ( ) as Sound ;
      sampleSound = new SampleClass ( ) as Sound ;
    }
    override public function playSound ( soundType : String , startTime : Number = 0 ) : SoundChannel
    {
      var soundChannel : SoundChannel = null ;
      var soundTransform : SoundTransform = null ;
      if ( soundType == "signal" )
      {
        if ( application . getPropsDyn ( ) . getAppSoundPlaying ( ) )
        {
          soundTransform = new SoundTransform ( ) ;
          soundTransform . volume = application . getPropsDyn ( ) . getAppSoundVolume ( ) / 100 ;
          soundChannel = signalSound . play ( startTime ) ;
          soundChannel . soundTransform = soundTransform ;
          return soundChannel ;
        }
        else
        {
          return null ;
        }
      }
      if ( soundType == "sample" )
      {
        soundTransform = new SoundTransform ( ) ;
        soundTransform . volume = application . getPropsDyn ( ) . getAppSoundVolume ( ) / 100 ;
        soundChannel = sampleSound . play ( startTime ) ;
        soundChannel . soundTransform = soundTransform ;
        return soundChannel ;
      }
      else
      {
        return super . playSound ( soundType , startTime ) ;
      }
      return null ;
    }
    override public function getSound ( soundType : String ) : Sound
    {
      if ( soundType == "signal" )
      {
        return signalSound ;
      }
      if ( soundType == "sample" )
      {
        return sampleSound ;
      }
      else
      {
        super . getSound ( soundType ) ;
      }
      return null ;
    }
  }
}
