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
** PropsAppDemo.
** The extender class of PropsApp. Its variables can have a different value.
**
*/
package com . kisscodesystems . KissAs3FwDemo . prop
{
  import com . kisscodesystems . KissAs3Fw . prop . PropsApp
  public class PropsAppDemo extends PropsApp
  {
/*
** Constructor.
** Simply overwrite here the protected variables of PropsApp,
** or declare here the application level properties you will use in your app.
*/
    public function PropsAppDemo ( ) : void
    {
      super ( ) ;
      applicationName = "Demo application" ;
      applicationVersion = "version: 1.5" ;
      applicationReleaseDate = "released: 07.09.2017" ;
      applicationSoftwareHomepageTxt . push ( "KissAs3Fw Actionscript3 Framework" ) ;
      applicationSoftwareHomepageUrl . push ( "https://github.com/kisscodesystems/KissAs3FwDemos" ) ;
      applicationSoftwareHomepageTxt . push ( "KissCode Systems Kft - opensource" ) ;
      applicationSoftwareHomepageUrl . push ( "https://openso.kisscodesystems.com" ) ;
      weightBackgroundPicture = 5 ;
      weightScrollContent = 5 ;
      useEmbedFonts = true ;
    }
  }
}