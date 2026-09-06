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
 * ApplicationUnitTestDemo
 * The application that runs the unit test suites of the KissAs3Dm demo application.
 *
 * MAIN FEATURES:
 * - it is the very ApplicationDemo under test: it extends that application and it adds
 *   nothing but the run of the suites, so every value the suites meet is the one the
 *   demo application itself builds, from the configs and the managers of it down to the
 *   widget it opens for itself
 * - so the whole start of that application is the first assertion of this run: an error
 *   thrown while the layers, the menu and the first widget of it are built is reported
 *   as a failure by the runner of the suites
 * - the suites are run on the first frame, when the stage and every layer of the
 *   application are already there
 * - the components themselves are checked by the suites of the framework, see
 *   com.kisscodesystems.KissAs3Fw.ApplicationUnitTest: this run checks what this
 *   application makes of them
 * - the reference application built of the same components on one single screen is
 *   checked by com.kisscodesystems.KissAs3Dm.QuickUIUnitTestDemo
 * - this application talks to the servers of the demo application while it starts: the
 *   api of the active servers and the background image of the displaying style are both
 *   asked over http. Both of them answer in about a second and the refreshing of the
 *   servers only comes back minutes later, so nothing of that is left in flight by the
 *   time this run is over - but a run started with no network at all can be left waiting
 *   for those answers, and that is a hanging run, not a failing one.
 */
package com.kisscodesystems.KissAs3Dm
{
  import com.kisscodesystems.KissAs3Dm.suite.ApplicationDemoUnitTest;
  import com.kisscodesystems.KissAs3Dm.suite.ConfigsDemoUnitTest;
  import com.kisscodesystems.KissAs3Dm.suite.EnumsDemoUnitTest;
  import com.kisscodesystems.KissAs3Dm.suite.ManagersDemoUnitTest;
  import com.kisscodesystems.KissAs3Dm.suite.WidgetsDemoUnitTest;
  import com.kisscodesystems.KissAs3Ut.UnitTestRunner;
  import flash.events.Event;
  public class ApplicationUnitTestDemo extends ApplicationDemo
  {
    // the report goes next to the application descriptor, so it is found on every
    // operating system the tests are run on
    private static const RESULT_FILE:String = "KissAs3Dm-results.txt";
    private static const TITLE:String = "KissAs3Dm unit tests";
    private var runner:UnitTestRunner = null;
    /**
     * Constructs the test application and asks for the first frame to run the suites on.
     */
    public function ApplicationUnitTestDemo():void
    {
      try
      {
        // the super call has to come first: it is the one building the whole application
        // the suites below are run on
        super();
        addEventListener(Event.ENTER_FRAME, firstFrame);
      }
      catch (e:*)
      {
        this.trace("<ApplicationUnitTestDemo> main error: " + e, 7);
      }
    }
    /**
     * Runs the suites of the demo application on the first frame, when the stage and
     * every layer of that application are already there.
     * @param e the enter frame event
     */
    private function firstFrame(e:Event):void
    {
      removeEventListener(Event.ENTER_FRAME, firstFrame);
      runner = new UnitTestRunner(this, TITLE, RESULT_FILE);
      runner.run(getSuites());
    }
    /**
     * Returns every suite of this run, in the order they have to be run in.
     */
    private function getSuites():Array
    {
      const suitesArray:Array = new Array();
      // the enums come first: every class of this application asks its own values from
      // them, and the language of the whole application is switched by this very suite
      suitesArray.push(new EnumsDemoUnitTest(this, runner.getReport()));
      // the configs next: every value of this application is asked from one of the three
      suitesArray.push(new ConfigsDemoUnitTest(this, runner.getReport()));
      // then the managers holding the resources and the servers of this application
      suitesArray.push(new ManagersDemoUnitTest(this, runner.getReport()));
      // the application itself: the layers, the menu and the state it is started in
      suitesArray.push(new ApplicationDemoUnitTest(this, runner.getReport()));
      // the widgets come last: that suite opens every one of them, so it is the heaviest
      // of this run and it leaves the application with no widget open at all
      suitesArray.push(new WidgetsDemoUnitTest(this, runner.getReport()));
      return suitesArray;
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
