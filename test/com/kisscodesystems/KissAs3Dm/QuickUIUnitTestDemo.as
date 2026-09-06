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
 * QuickUIUnitTestDemo
 * The application that runs the unit test suites of the KissAs3Dm reference application.
 *
 * MAIN FEATURES:
 * - it is the very QuickUIDemo under test: it extends that application and it adds
 *   nothing but the run of the suites, so the screen the suites look at is the one that
 *   application builds of the components
 * - that application calls every publicly reachable method of every component it builds,
 *   and it builds all of them in one single frame, inside the constructor: so the start
 *   of it is the first assertion of this run, and an error thrown by any of those calls
 *   is reported as a failure by the runner of the suites
 * - the suites are run on the first frame, when the components have already taken the
 *   places and the sizes they are given
 * - the tracing is switched off here: that application switches it on at the end of its
 *   own building, and one single frame of the suites below would produce tens of
 *   thousands of messages neither a human nor the tracer is able to follow
 * - the demo application built of the same components, with the layers and the widgets of
 *   the framework, is checked by com.kisscodesystems.KissAs3Dm.ApplicationUnitTestDemo
 */
package com.kisscodesystems.KissAs3Dm
{
  import com.kisscodesystems.KissAs3Dm.suite.QuickUIDemoUnitTest;
  import com.kisscodesystems.KissAs3Ut.UnitTestRunner;
  import flash.events.Event;
  public class QuickUIUnitTestDemo extends QuickUIDemo
  {
    // the report goes next to the application descriptor, so it is found on every
    // operating system the tests are run on
    private static const RESULT_FILE:String = "KissAs3DmQuickUI-results.txt";
    private static const TITLE:String = "KissAs3Dm QuickUI unit tests";
    private var runner:UnitTestRunner = null;
    /**
     * Constructs the test application and asks for the first frame to run the suites on.
     */
    public function QuickUIUnitTestDemo():void
    {
      try
      {
        // the super call has to come first: it is the one building every component the
        // suites below look at
        super();
        setTraceLevel(9);
        addEventListener(Event.ENTER_FRAME, firstFrame);
      }
      catch (e:*)
      {
        this.trace("<QuickUIUnitTestDemo> main error: " + e, 7);
      }
    }
    /**
     * Runs the suites of the reference application on the first frame, when every
     * component of it stands where it is placed.
     * @param e the enter frame event
     */
    private function firstFrame(e:Event):void
    {
      removeEventListener(Event.ENTER_FRAME, firstFrame);
      runner = new UnitTestRunner(this, TITLE, RESULT_FILE);
      const suitesArray:Array = new Array();
      suitesArray.push(new QuickUIDemoUnitTest(this, runner.getReport()));
      runner.run(suitesArray);
    }
    /**
     * Destroys this object and frees up everything.
     */
    override public function destroy():void
    {
      // 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher()
      removeEventListener(Event.ENTER_FRAME, firstFrame);
      // 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.
      if (runner != null)
      {
        runner.destroy();
      }
      // 3: call the super destroy.
      super.destroy();
      // 4: every reference and value should be reset to null, 0 or false.
      runner = null;
    }
  }
}
