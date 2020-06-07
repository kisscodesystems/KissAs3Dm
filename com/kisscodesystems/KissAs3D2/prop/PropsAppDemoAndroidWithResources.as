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
** PropsAppDemoAndroidWithResources.
** The extender class of PropsApp. Its variables can have a different value.
**
*/
package com . kisscodesystems . KissAs3D2 . prop
{
  import com . kisscodesystems . KissAs3Ds . prop . PropsAppDemo
  public class PropsAppDemoAndroidWithResources extends PropsAppDemo
  {
/*
** Constructor.
** Simply overwrite here the protected variables of PropsApp,
** or declare here the application level properties you will use in your app.
*/
    public function PropsAppDemoAndroidWithResources ( ) : void
    {
      super ( ) ;
      weightBackgroundPicture = 3 ;
      weightScrollContent = 3 ;
      useEmbedFonts = true ;
    }
  }
}