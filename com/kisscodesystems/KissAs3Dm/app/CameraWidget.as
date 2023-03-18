package com . kisscodesystems . KissAs3Dm . app
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . ButtonFile ;
  import com . kisscodesystems . KissAs3Fw . ui . Camera ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  import flash . events . Event ;
  public class CameraWidget extends Widget
  {
    private var camera : Camera = null ;
    private var buttonFileCam : ButtonFile = null ;
    private var indexBasic : int = - 1 ;
    public function CameraWidget ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      iniSizeWidth = 780 ;
      iniSizeHeight = 740 ;
    }
    override protected function onCreate ( ) : void
    {
      if ( ! loaded )
      {
        loaded = true ;
        setWidgetType ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_CAMERA ) ;
        setWidgetHeaderCode ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_CAMERA ) ;
        setButtonBarVisible ( false ) ;
        indexBasic = addContent ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TAB_BASIC ) ;
        setElementsFix ( indexBasic , 0 ) ;
        setActiveContent ( indexBasic ) ;
        setInfoContent ( TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_CAMERA ) ;
        camera = new Camera ( application ) ;
        addToContent ( indexBasic , camera , 0 ) ;
        camera . setCameraSize ( 640 ) ;
        camera . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_SAVED , cameraSaved ) ;
        camera . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_CAMERA_IS_ATTACHED , cameraIsAttached ) ;
        buttonFileCam = new ButtonFile ( application ) ;
        addToContent ( indexBasic , buttonFileCam , 1 ) ;
        buttonFileCam . setFileFilters ( [ buttonFileCam . fileFilterImgs ] ) ;
        buttonFileCam . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_FILE_REFERENCE_BROWSE , fileReferenceDestroyed ) ;
      }
    }
    override public function setDesktopSizes ( ) : void
    {
      super . setDesktopSizes ( ) ;
      if ( widgetMode != application . getTexts ( ) . WIDGET_MODE_DESKTOP )
      {
        setElementsFix ( indexBasic , 0 ) ;
        doSizeChanged ( ) ;
      }
    }
    override public function setMobileSizes ( ) : void
    {
      super . setMobileSizes ( ) ;
      if ( widgetMode != application . getTexts ( ) . WIDGET_MODE_MOBILE )
      {
        setElementsFix ( indexBasic , 0 ) ;
        doSizeChanged ( ) ;
      }
    }
    private function cameraSaved ( e : Event ) : void
    {
      if ( buttonFileCam != null && camera != null )
      {
        buttonFileCam . setFileReference ( camera . getFileReference ( ) ) ;
      }
    }
    private function cameraIsAttached ( e : Event ) : void
    {
      if ( buttonFileCam != null )
      {
        buttonFileCam . setFileReference ( null ) ;
      }
    }
    private function fileReferenceDestroyed ( e : Event ) : void
    {
      if ( camera != null )
      {
        camera . clearLastPicture ( ) ;
      }
    }
    override public function destroy ( ) : void
    {
      super . destroy ( ) ;
      camera = null ;
      buttonFileCam = null ;
    }
  }
}
