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
 * PropertiesConfigUnitTestDemo
 * The properties config of the applications that run the unit test suites of the KissAs3Dm
 * demo applications.
 *
 * MAIN FEATURES:
 * - it is the very properties config of the demo applications, with one single value
 *   changed: the keeping of the state is switched off
 * - with it on, a state saved when the window of a run loses the focus would be restored
 *   by the next run: the widgets and the language an earlier run has left behind would be
 *   there again, and every count of the widgets would be off
 */
package com.kisscodesystems.KissAs3Dm
{
  import com.kisscodesystems.KissAs3Dm.config.PropertiesConfigDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  public class PropertiesConfigUnitTestDemo extends PropertiesConfigDemo
  {
    /**
     * Constructs the properties config of the test application.
     * @param applicationRef the main application reference
     */
    public function PropertiesConfigUnitTestDemo(applicationRef:Application):void
    {
      super(applicationRef);
    }
    /**
     * Reads every value of the demo application, then switches the keeping of the state off.
     */
    override protected function readValuesFromConfigXml():void
    {
      super.readValuesFromConfigXml();
      stateKeepingEnabled = false;
    }
  }
}
