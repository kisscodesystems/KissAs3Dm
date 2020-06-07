/*
** This class is a part of the KissAs3Fw actionscrip framework.
** See the header comment lines of the
** com . kisscodesystems . KissAs3Fw . Application
** The whole framework is available at:
** https://github.com/kisscodesystems/KissAs3Fw
** Demo applications:
** https://github.com/kisscodesystems/KissAs3FwDemos
**
** DESCRIPTION:
** PropsDynDemo. The extender class of the PropsDynDemo. Its values can be redefined here.
** Contains the embedded resources.
**
*/
package com . kisscodesystems . KissAs3Ds . prop
{
  import com . kisscodesystems . KissAs3Ds . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import flash . display . Bitmap ;
  import flash . display . BitmapData ;
  public class PropsDynDemo extends PropsDynDemo0
  {
// Adding new fonts.
    [ Embed ( source = "../../../../../res/pala.ttf" , fontName = "Palatino Linotype" , mimeType = "application/x-font" , advancedAntiAliasing = "true" , embedAsCFF = "false" ) ]
    private var fontPalatinoLinotypeEmbedded : Class ;
    [ Embed ( source = "../../../../../res/arial.ttf" , fontName = "Arial" , mimeType = "application/x-font" , advancedAntiAliasing = "true" , embedAsCFF = "false" ) ]
    private var fontArialEmbedded : Class ;
// Adding new background image.
    [ Embed ( source = "../../../../../res/bg2.jpg" ) ]
    private var Bg2 : Class ;
    private var bg2Bitmap : Bitmap ;
/*
** Constructing the props dyn object.
*/
    public function PropsDynDemo ( applicationRef : Application ) : void
    {
// This is necessary.
      super ( applicationRef ) ;
// The new images.
      bg2Bitmap = new Bg2 ( ) as Bitmap ;
    }
/*
** Overrides these methods because new backgrounds can be set.
*/
    override protected function setBackgroundBitmapData ( ) : void
    {
      super . setBackgroundBitmapData ( ) ;
      if ( application . getTexts ( ) is TextsDemo )
      {
        if ( appBackgroundImage == TextsDemo ( application . getTexts ( ) ) . BACKGROUND_IMAGE_BG2 )
        {
          try
          {
            backgroundBitmapData = new BitmapData ( bg2Bitmap . bitmapData . width , bg2Bitmap . bitmapData . height , false ) ;
            backgroundBitmapData . draw ( bg2Bitmap . bitmapData ) ;
          }
          catch ( e : * )
          {
            backgroundBitmapData = new BitmapData ( 1 , 1 , false ) ;
          }
        }
      }
    }
    override public function setAppBackgroundImage ( newBackgroundImage : String ) : void
    {
      super . setAppBackgroundImage ( newBackgroundImage ) ;
      if ( application . getTexts ( ) is TextsDemo )
      {
        if ( newBackgroundImage == TextsDemo ( application . getTexts ( ) ) . BACKGROUND_IMAGE_BG2 )
        {
          appBackgroundImage = TextsDemo ( application . getTexts ( ) ) . BACKGROUND_IMAGE_BG2 ;
          setBackgroundBitmapData ( ) ;
          application . getBaseEventDispatcher ( ) . dispatchEvent ( eventAppBackgroundImageChanged ) ;
        }
      }
    }
  }
}
