/*
** This class is a part of the KissAs3Fw actionscrip framework.
** See the header comment lines of the
** com . kisscodesystems . KissAs3Fw . Application
** The whole framework is available at:
** https://github.com/kisscodesystems/KissAs3Fw
** Demo applications:
** https://github.com/kisscodesystems/KissAs3Dm
**
** DESCRIPTION:
** PropsDynDemo0. The extender class of the PropsDyn. Its values can be redefined here.
** Does not contain the embedded resources.
**
*/
package com . kisscodesystems . KissAs3Dm . prop
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . prop . PropsDyn ;
  public class PropsDynDemo extends PropsDyn
  {
    public function PropsDynDemo ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      createAppDisplayingStyles ( ) ;
    }
    private function createAppDisplayingStyles ( ) : void
    {
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundFillBgColor" ] = "113A00" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundFillFgColor" ] = "C44400" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundFillAlpha" ] = 0.30 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontColorBright" ] = "EFEAD8" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontColorMid" ] = "541101" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontColorDark" ] = "BEB443" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundFillBgColor" ] = "270100" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundFillFgColor" ] = "F1C3C3" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundFillAlpha" ] = 0.29 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontColorBright" ] = "FCE3E0" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontColorMid" ] = "BA7269" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontColorDark" ] = "BA321D" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundFillBgColor" ] = "CCC5BC" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundFillFgColor" ] = "F1EDE4" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundFillAlpha" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontColorBright" ] = "617886" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontColorMid" ] = "284A65" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontColorDark" ] = "4E312B" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appRadius" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundFillBgColor" ] = "002F4D" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundFillFgColor" ] = "53FFFF" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundFillAlpha" ] = 0.35 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontColorBright" ] = "D1FFFF" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontColorMid" ] = "6EABD4" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontColorDark" ] = "4A575F" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundFillBgColor" ] = "160D0E" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundFillFgColor" ] = "BED39A" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundFillAlpha" ] = 0.25 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontColorBright" ] = "EAE1E1" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontColorMid" ] = "C5DB4E" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontColorDark" ] = "837777" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundFillBgColor" ] = "001029" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundFillFgColor" ] = "F8ECDC" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundFillAlpha" ] = 0.21 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontColorBright" ] = "E3ECF2" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontColorMid" ] = "A8BBCA" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontColorDark" ] = "AFA5A3" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundFillBgColor" ] = "77726E" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundFillFgColor" ] = "F8F8F8" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundFillAlpha" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontColorBright" ] = "E3E3E3" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontColorMid" ] = "6A6562" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontColorDark" ] = "555150" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundFillBgColor" ] = "B0060F" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundFillFgColor" ] = "D8E502" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundFillAlpha" ] = 0.33 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontColorBright" ] = "E1E9DD" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontColorMid" ] = "346B17" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontColorDark" ] = "DE9D89" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundFillBgColor" ] = "5A707E" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundFillFgColor" ] = "D2D2D2" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundFillAlpha" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontColorBright" ] = "F4F2D2" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontColorMid" ] = "E0FA03" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontColorDark" ] = "C28A69" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundFillBgColor" ] = "7F4026" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundFillFgColor" ] = "CDAA8A" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundFillAlpha" ] = 0.21 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontColorBright" ] = "FAF9F8" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontColorMid" ] = "CEAF7C" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontColorDark" ] = "411F1D" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundFillBgColor" ] = "34220A" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundFillFgColor" ] = "A19F3A" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundFillAlpha" ] = 0.12 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontColorBright" ] = "FAF5E2" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontColorMid" ] = "B99C75" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontColorDark" ] = "CD8338" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundFillBgColor" ] = "202020" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundFillFgColor" ] = "999999" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundFillAlpha" ] = 0.66 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontColorBright" ] = "EEEEEE" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontColorMid" ] = "B4B4B4" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontColorDark" ] = "191919" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ] [ "appFontItalic" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] = new Array ( ) ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appLineThickness" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appMargin" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appPadding" ] = 10 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appRadius" ] = 8 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundFillBgColor" ] = "321941" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundFillFgColor" ] = "FAF5F9" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundFillAlpha" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundImage" ] = "" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundAlign" ] = application . getTexts ( ) . BACKGROUND_ALIGN_CENTER2 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundAlpha" ] = 1 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundBlur" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appBackgroundLive" ] = true ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontFace" ] = FONT_FACE_ARIAL ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontSize" ] = 0 ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontColorBright" ] = "D1D8F4" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontColorMid" ] = "CE0E41" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontColorDark" ] = "7992BA" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontBold" ] = false ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ] [ "appFontItalic" ] = false ;
    }
  }
}
