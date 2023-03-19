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
** PropsAppDemo.
** The extender class of PropsApp. Its variables can have a different value.
**
*/
package com . kisscodesystems . KissAs3Dm . prop
{
  import com . kisscodesystems . KissAs3Fw . prop . PropsApp
  public class PropsAppDemo extends PropsApp
  {
    public function PropsAppDemo ( ) : void
    {
      super ( ) ;
      applicationName = "Kiss Framework Demo" ;
      applicationVersion = "1.13" ;
      applicationReleaseDate = "2023-03-18" ;
      applicationSoftwareHomepageTxt . push ( "Kiss Framework Demo Sources" ) ;
      applicationSoftwareHomepageUrl . push ( "https://github.com/kisscodesystems/KissAs3Dm" ) ;
      applicationSoftwareHomepageTxt . push ( "KissCode Systems Kft - opensource" ) ;
      applicationSoftwareHomepageUrl . push ( "http://kcsopensource.com" ) ;
      weightBackgroundPicture = 6 ;
      weightScrollContent = 6 ;
    }
  }
}
