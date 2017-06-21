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
** PropsDynDemo. The extender class of the PropsDyn. Its values can be redefined here.
**
*/
package com . kisscodesystems . KissAs3FwDemos . prop
{
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . prop . PropsDyn ;
  import com . kisscodesystems . KissAs3FwDemos . text . TextsDemo ;
  import flash . display . Bitmap ;
  import flash . display . BitmapData ;
  public class PropsDynDemo extends PropsDyn
  {
// Adding a new font.
    public const FONT_FACE_PALATINO_LINOTYPE : String = "Palatino Linotype" ;
    [ Embed ( source = "../../../../../res/font/pala.ttf" , fontName = "Palatino Linotype" , mimeType = "application/x-font" , advancedAntiAliasing = "true" , embedAsCFF = "false" ) ]
    private var fontPalatinoLinotypeEmbedded : Class ;
// Adding new background image.
    [ Embed ( source = "../../../../../res/bg/bg2.jpg" ) ]
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
// The predefined displaying styles can be continued to be defined.
      createAppDisplayingStyles ( ) ;
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
          backgroundBitmapData = new BitmapData ( bg2Bitmap . bitmapData . width , bg2Bitmap . bitmapData . height , false ) ;
          backgroundBitmapData . draw ( bg2Bitmap . bitmapData ) ;
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
          application . getBaseEventDispatcher ( ) . dispatchEvent ( eventAppBackgroundImageOrAlignOrAlphaChanged ) ;
        }
      }
    }
/*
** Creating the displaying styles predefined.
*/
    private function createAppDisplayingStyles ( ) : void
    {
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appMargin" ] = 7 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appPadding" ] = 4 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appRadius0" ] = 3 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appRadius1" ] = 6 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appBackgroundBgColor" ] = "45555A" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appBackgroundFgColor" ] = "C8CFD1" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appBackgroundFillAlpha" ] = 0.26 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appBackgroundImage" ] = TextsDemo ( application . getTexts ( ) ) . BACKGROUND_IMAGE_BG2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appFontColorBright" ] = "EAEFF0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appFontColorMid" ] = "646E76" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appFontColorDark" ] = "000022" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appMargin" ] = 11 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appPadding" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appRadius0" ] = 7 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appRadius1" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundBgColor" ] = "2D3547" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundFgColor" ] = "AF9D8D" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundFillAlpha" ] = 0.2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontColorBright" ] = "D1D4CC" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontColorMid" ] = "172748" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontColorDark" ] = "0E0F0C" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontBold" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appMargin" ] = 14 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appPadding" ] = 4 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appRadius0" ] = 9 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appRadius1" ] = 6 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundBgColor" ] = "847C7E" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundFgColor" ] = "C37F2D" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundFillAlpha" ] = 0.34 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontColorBright" ] = "CAB99B" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontColorMid" ] = "B8823D" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontColorDark" ] = "5F5146" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontBold" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appPadding" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appRadius0" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appRadius1" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundBgColor" ] = "827568" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundFgColor" ] = "B5A592" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundFillAlpha" ] = 0.49 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontColorBright" ] = "D4D2CD" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontColorMid" ] = "908D8B" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontColorDark" ] = "696460" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appMargin" ] = 6 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appPadding" ] = 7 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appRadius0" ] = 9 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appRadius1" ] = 12 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundBgColor" ] = "482B2B" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundFgColor" ] = "635940" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundFillAlpha" ] = 0.45 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontColorBright" ] = "97884A" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontColorMid" ] = "601A10" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontColorDark" ] = "2C1F11" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontItalic" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appMargin" ] = 7 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appPadding" ] = 3 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appRadius0" ] = 6 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appRadius1" ] = 3 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundBgColor" ] = "484845" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundFgColor" ] = "CDCDCD" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundFillAlpha" ] = 0.59 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontColorBright" ] = "D0CED5" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontColorMid" ] = "AEA770" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontColorDark" ] = "636768" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontBold" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appMargin" ] = 4 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appPadding" ] = 4 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appRadius0" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appRadius1" ] = 3 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundBgColor" ] = "BEBEBE" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundFgColor" ] = "660922" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundFillAlpha" ] = 0.2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontColorBright" ] = "C8BBBE" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontColorMid" ] = "512733" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontColorDark" ] = "2E0C13" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontBold" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appMargin" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appPadding" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appRadius0" ] = 3 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appRadius1" ] = 6 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundBgColor" ] = "7A643B" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundFgColor" ] = "CDB666" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundFillAlpha" ] = 0.1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontFace" ] = FONT_FACE_PALATINO_LINOTYPE ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontColorBright" ] = "C0B38F" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontColorMid" ] = "A9984D" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontColorDark" ] = "292013" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appMargin" ] = 9 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appPadding" ] = 4 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appRadius0" ] = 11 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appRadius1" ] = 4 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundBgColor" ] = "48556C" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundFgColor" ] = "5D3447" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundFillAlpha" ] = 0.1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontColorBright" ] = "B0AAB3" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontColorMid" ] = "61667B" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontColorDark" ] = "1F1E29" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontBold" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appPadding" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appRadius0" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appRadius1" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundBgColor" ] = "1D1D1D" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundFgColor" ] = "989898" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundFillAlpha" ] = 0.45 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontColorBright" ] = "CACACA" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontColorMid" ] = "717171" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontColorDark" ] = "363636" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontItalic" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appMargin" ] = 6 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appPadding" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appRadius0" ] = 6 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appRadius1" ] = 9 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundBgColor" ] = "4F4F4F" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundFgColor" ] = "A3A3A3" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundFillAlpha" ] = 0.17 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontColorBright" ] = "C7C7C7" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontColorMid" ] = "868686" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontColorDark" ] = "222222" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appMargin" ] = 3 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appPadding" ] = 6 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appRadius0" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appRadius1" ] = 4 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundBgColor" ] = "323F37" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundFgColor" ] = "30783D" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundFillAlpha" ] = 0.21 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontFace" ] = FONT_FACE_PALATINO_LINOTYPE ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontColorBright" ] = "94BB97" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontColorMid" ] = "002200" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontColorDark" ] = "123E19" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontBold" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appMargin" ] = 7 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appPadding" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appRadius0" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appRadius1" ] = 11 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundBgColor" ] = "69522A" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundFgColor" ] = "B3A399" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundFillAlpha" ] = 0.42 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontColorBright" ] = "A2926B" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontColorMid" ] = "897157" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontColorDark" ] = "755931" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontItalic" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appMargin" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appPadding" ] = 4 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appRadius0" ] = 7 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appRadius1" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundBgColor" ] = "117963" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundFgColor" ] = "A2D9B6" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundFillAlpha" ] = 0.63 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontSize" ] = "0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontColorBright" ] = "C6DDD6" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontColorMid" ] = "1C5E4F" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontColorDark" ] = "242424" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontBold" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appPadding" ] = 6 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appRadius0" ] = 5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appRadius1" ] = 9 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appBackgroundBgColor" ] = "000000" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appBackgroundFgColor" ] = "00CC00" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appBackgroundFillAlpha" ] = 0.5 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appBackgroundImage" ] = application . getTexts ( ) . BACKGROUND_IMAGE_BG1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_MOSAIC ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appFontFace" ] = FONT_FACE_PALATINO_LINOTYPE ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appFontSize" ] = "14" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appFontColorBright" ] = "EEEEEE" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appFontColorMid" ] = "7B7B00" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appFontColorDark" ] = "003300" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appFontBold" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ] [ "appFontItalic" ] = false ;
    }
  }
}