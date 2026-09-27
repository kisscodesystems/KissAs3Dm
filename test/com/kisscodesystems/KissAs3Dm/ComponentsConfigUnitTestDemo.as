/**
 * This class is a part of the KissAs3Dm application.
 * See the header comment lines of the
 * com.kisscodesystems.KissAs3Fw.Application
 * The whole framework is available at:
 * https://github.com/kisscodesystems/KissAs3Fw
 * Demo applications:
 * https://github.com/kisscodesystems/KissAs3Dm
 *
 * DESCRIPTION:
 * ComponentsConfigUnitTestDemo
 * The components config of the application that runs the unit test suites of the KissAs3Dm
 * demo application.
 *
 * MAIN FEATURES:
 * - it is the very components config of the demo application, with one single value
 *   changed: the pause of the loading alert of the framework is switched off
 * - every suite of that run is run within one single frame, but a widget of the demo
 *   application is built behind that alert, by the timer of Application.runWithLoading:
 *   with the pause on, no widget opened by the application or by a suite would be there
 *   before the whole run is over
 * - with the pause off, Application.runWithLoading does the work right away, so every
 *   widget is standing on the display list as soon as it is asked for
 * - the loading alert itself is checked by the suites of the framework, see
 *   com.kisscodesystems.KissAs3Fw.suite.ForegroundUnitTest
 */
package com.kisscodesystems.KissAs3Dm
{
  import com.kisscodesystems.KissAs3Dm.config.ComponentsConfigDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  public class ComponentsConfigUnitTestDemo extends ComponentsConfigDemo
  {
    /**
     * Constructs the components config of the test application.
     * @param applicationRef the main application reference
     */
    public function ComponentsConfigUnitTestDemo(applicationRef:Application):void
    {
      super(applicationRef);
    }
    /**
     * Reads every value of the demo application, then switches the pause of the loading
     * alert off.
     */
    override protected function readValuesFromConfigXml():void
    {
      super.readValuesFromConfigXml();
      loadingDelay = 0;
    }
  }
}
