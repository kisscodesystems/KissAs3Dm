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
      appBackgroundImages [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] = "aaaaaaaaaaaaaaaaaa13" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] = new Array ( ) ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appLineThickness" ] = 1 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appMargin" ] = 10 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appPadding" ] = 8 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appRadius" ] = 9 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBoxCorner" ] = 4 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBoxFrame" ] = application . getTexts ( ) . BOX_FRAME_FULL ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundColorRand" ] = appBackgroundColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundColorToFont" ] = appBackgroundColorToFont ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundColorDark" ] = "695552" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundColorMid" ] = "4A302A" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundColorBright" ] = "2B4142" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundColorAlpha" ] = 0.2 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundImage" ] = TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundAlign" ] = appBackgroundAlign ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundAlpha" ] = appBackgroundAlpha ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundBlur" ] = 0 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appBackgroundLive" ] = appBackgroundLive ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appFontFace" ] = appFontFace ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appFontSize" ] = appFontSize ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appFontColorBright" ] = "D4BEBD" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appFontColorMid" ] = "B5CFD5" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appFontColorDark" ] = "FCFCFC" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appFontColorRand" ] = appFontColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appFontColorToBackground" ] = appFontColorToBackground ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appFontBold" ] = true ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_1 ] [ "appFontItalic" ] = false ;
      appBackgroundImages [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] = "aaaaaaaaaaaaaaaaaa14" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] = new Array ( ) ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appLineThickness" ] = 1 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appMargin" ] = 12 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appPadding" ] = 10 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appRadius" ] = 6 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBoxCorner" ] = 2 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBoxFrame" ] = application . getTexts ( ) . BOX_FRAME_HORIZONTAL ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundColorRand" ] = appBackgroundColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundColorToFont" ] = appBackgroundColorToFont ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundColorDark" ] = "DED4E5" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundColorMid" ] = "DC8F93" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundColorBright" ] = "D6D6FF" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundColorAlpha" ] = 0.18 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundImage" ] = TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundAlign" ] = appBackgroundAlign ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundAlpha" ] = appBackgroundAlpha ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundBlur" ] = 4 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appBackgroundLive" ] = appBackgroundLive ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appFontFace" ] = appFontFace ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appFontSize" ] = appFontSize ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appFontColorBright" ] = "430029" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appFontColorMid" ] = "7D151A" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appFontColorDark" ] = "856898" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appFontColorRand" ] = appFontColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appFontColorToBackground" ] = appFontColorToBackground ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appFontBold" ] = false ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_2 ] [ "appFontItalic" ] = false ;
      appBackgroundImages [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] = "aaaaaaaaaaaaaaaaaa15" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] = new Array ( ) ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appLineThickness" ] = 2 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appMargin" ] = 5 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appPadding" ] = 10 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appRadius" ] = 0 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBoxCorner" ] = 7 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBoxFrame" ] = application . getTexts ( ) . BOX_FRAME_NONE ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundColorRand" ] = appBackgroundColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundColorToFont" ] = appBackgroundColorToFont ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundColorDark" ] = "7393A5" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundColorMid" ] = "02456E" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundColorBright" ] = "004571" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundColorAlpha" ] = 0.3 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundImage" ] = TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundAlign" ] = appBackgroundAlign ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundAlpha" ] = appBackgroundAlpha ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundBlur" ] = 0 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appBackgroundLive" ] = appBackgroundLive ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appFontFace" ] = appFontFace ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appFontSize" ] = appFontSize ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appFontColorBright" ] = "FCFCFC" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appFontColorMid" ] = "E8E2DE" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appFontColorDark" ] = "FFF6F2" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appFontColorRand" ] = appFontColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appFontColorToBackground" ] = appFontColorToBackground ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appFontBold" ] = false ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_3 ] [ "appFontItalic" ] = false ;
      appBackgroundImages [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] = "aaaaaaaaaaaaaaaaaa16" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] = new Array ( ) ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appLineThickness" ] = 0 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appMargin" ] = 12 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appPadding" ] = 8 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appRadius" ] = 8 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBoxCorner" ] = 8 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBoxFrame" ] = application . getTexts ( ) . BOX_FRAME_FULL ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundColorRand" ] = appBackgroundColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundColorToFont" ] = appBackgroundColorToFont ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundColorDark" ] = "99AF8B" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundColorMid" ] = "917770" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundColorBright" ] = "A4AA84" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundColorAlpha" ] = 0.42 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundImage" ] = TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundAlign" ] = appBackgroundAlign ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundAlpha" ] = appBackgroundAlpha ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundBlur" ] = 8 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appBackgroundLive" ] = appBackgroundLive ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appFontFace" ] = appFontFace ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appFontSize" ] = appFontSize ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appFontColorBright" ] = "DEE4E5" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appFontColorMid" ] = "DEDCE4" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appFontColorDark" ] = "E6D9FF" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appFontColorRand" ] = appFontColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appFontColorToBackground" ] = appFontColorToBackground ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appFontBold" ] = false ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_4 ] [ "appFontItalic" ] = false ;
      appBackgroundImages [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] = "aaaaaaaaaaaaaaaaaa22" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] = new Array ( ) ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appLineThickness" ] = 1 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appMargin" ] = 12 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appPadding" ] = 9 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appRadius" ] = 8 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBoxCorner" ] = 11 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBoxFrame" ] = application . getTexts ( ) . BOX_FRAME_HORIZONTAL ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundColorRand" ] = appBackgroundColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundColorToFont" ] = appBackgroundColorToFont ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundColorDark" ] = "CDAA8A" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundColorMid" ] = "925D47" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundColorBright" ] = "7F4026" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundColorAlpha" ] = 0.37 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundImage" ] = TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundAlign" ] = appBackgroundAlign ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundAlpha" ] = appBackgroundAlpha ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundBlur" ] = 2 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appBackgroundLive" ] = appBackgroundLive ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appFontFace" ] = appFontFace ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appFontSize" ] = appFontSize ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appFontColorBright" ] = "FAF9F8" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appFontColorMid" ] = "CEAF7C" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appFontColorDark" ] = "411F1D" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appFontColorRand" ] = appFontColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appFontColorToBackground" ] = appFontColorToBackground ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appFontBold" ] = false ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_5 ] [ "appFontItalic" ] = false ;
      appBackgroundImages [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] = "aaaaaaaaaaaaaaaaaa23" ;
      appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] = new Array ( ) ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appLineThickness" ] = 1 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appMargin" ] = 10 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appPadding" ] = 10 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appRadius" ] = 3 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBoxCorner" ] = 0 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBoxFrame" ] = application . getTexts ( ) . BOX_FRAME_VERTICAL ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundColorRand" ] = appBackgroundColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundColorToFont" ] = appBackgroundColorToFont ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundColorDark" ] = "F1E7A8" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundColorMid" ] = "EEE7B7" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundColorBright" ] = "B19350" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundColorAlpha" ] = 0.42 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundImage" ] = TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundAlign" ] = appBackgroundAlign ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundAlpha" ] = appBackgroundAlpha ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundBlur" ] = 0 ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appBackgroundLive" ] = appBackgroundLive ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appFontFace" ] = appFontFace ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appFontSize" ] = appFontSize ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appFontColorBright" ] = "4E6CAF" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appFontColorMid" ] = "111848" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appFontColorDark" ] = "0E1857" ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appFontColorRand" ] = appFontColorRand ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appFontColorToBackground" ] = appFontColorToBackground ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appFontBold" ] = false ;
        appDisplayingStyles [ TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_6 ] [ "appFontItalic" ] = true ;
    }
  }
}
