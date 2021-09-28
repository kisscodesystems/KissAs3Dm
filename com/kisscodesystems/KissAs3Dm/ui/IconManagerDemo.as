package com . kisscodesystems . KissAs3Dm . ui
{
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . IconManager ;
  import flash . display . Bitmap ;
  import flash . display . BitmapData ;
  import flash . system . System ;
  public class IconManagerDemo extends IconManager
  {
    [ Embed ( source = "../../../../../res/icons1/board.png" ) ]
    private var BoardClass : Class ;
    private var boardBitmap : Bitmap ;
    [ Embed ( source = "../../../../../res/icons1/buttons.png" ) ]
    private var ButtonsClass : Class ;
    private var buttonsBitmap : Bitmap ;
    [ Embed ( source = "../../../../../res/icons1/camera.png" ) ]
    private var CameraClass : Class ;
    private var cameraBitmap : Bitmap ;
    [ Embed ( source = "../../../../../res/icons1/componentusage.png" ) ]
    private var ComponentusageClass : Class ;
    private var componentusageBitmap : Bitmap ;
    [ Embed ( source = "../../../../../res/icons1/others.png" ) ]
    private var OthersClass : Class ;
    private var othersBitmap : Bitmap ;
    [ Embed ( source = "../../../../../res/icons1/pickers.png" ) ]
    private var PickersClass : Class ;
    private var pickersBitmap : Bitmap ;
    [ Embed ( source = "../../../../../res/icons1/texts.png" ) ]
    private var TextsClass : Class ;
    private var textsBitmap : Bitmap ;
    public function IconManagerDemo ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      boardBitmap = new BoardClass ( ) as Bitmap ;
      buttonsBitmap = new ButtonsClass ( ) as Bitmap ;
      cameraBitmap = new CameraClass ( ) as Bitmap ;
      componentusageBitmap = new ComponentusageClass ( ) as Bitmap ;
      othersBitmap = new OthersClass ( ) as Bitmap ;
      pickersBitmap = new PickersClass ( ) as Bitmap ;
      textsBitmap = new TextsClass ( ) as Bitmap ;
    }
    override public function getNewBitmapData ( iconType : String , textType : String , iconSize : int ) : BitmapData
    {
      if ( iconType == "board" )
      {
        return transformBitmapData ( boardBitmap , textType , iconSize ) ;
      }
      else if ( iconType == "buttons" )
      {
        return transformBitmapData ( buttonsBitmap , textType , iconSize ) ;
      }
      else if ( iconType == "camera" )
      {
        return transformBitmapData ( cameraBitmap , textType , iconSize ) ;
      }
      else if ( iconType == "componentusage" )
      {
        return transformBitmapData ( componentusageBitmap , textType , iconSize ) ;
      }
      else if ( iconType == "others" )
      {
        return transformBitmapData ( othersBitmap , textType , iconSize ) ;
      }
      else if ( iconType == "pickers" )
      {
        return transformBitmapData ( pickersBitmap , textType , iconSize ) ;
      }
      else if ( iconType == "texts" )
      {
        return transformBitmapData ( textsBitmap , textType , iconSize ) ;
      }
      else
      {
        return super . getNewBitmapData ( iconType , textType , iconSize ) ;
      }
    }
  }
}
