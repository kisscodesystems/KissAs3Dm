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
 * BaseUnitTestDemo
 * The base class of the unit test suites of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - it holds what more than one of those suites needs, so no list of this application is
 *   written down in two places: the headers of the widgets are checked by one suite,
 *   looked up in the menu by another one and opened by a third one
 * - everything else comes from the base class every suite of every application of this
 *   project is built on, see com.kisscodesystems.KissAs3Ut.BaseUnitTest
 */
package com.kisscodesystems.KissAs3Dm
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Ut.BaseUnitTest;
  import com.kisscodesystems.KissAs3Ut.UnitTestReport;
  public class BaseUnitTestDemo extends BaseUnitTest
  {
    /**
     * Constructs the suite.
     * @param applicationRef the main application reference
     * @param reportRef the report every assertion result goes into
     */
    public function BaseUnitTestDemo(applicationRef:Application, reportRef:UnitTestReport):void
    {
      super(applicationRef, reportRef);
    }
    /**
     * Returns the header of every widget of this application, in the order the menu of it
     * displays them: the welcome widget stands first, under no topic at all, and the
     * widgets of the components follow it topic by topic.
     */
    protected function getEveryWidgetHeader():Array
    {
      return [EnumWidgetsDemo.WELCOME()
          , EnumWidgetsDemo.TEXTLABEL(), EnumWidgetsDemo.TEXTBOX()
          , EnumWidgetsDemo.TEXTAREA(), EnumWidgetsDemo.TEXTINPUT()
          , EnumWidgetsDemo.BUTTONTEXT(), EnumWidgetsDemo.BUTTONLINK()
          , EnumWidgetsDemo.BUTTONBAR(), EnumWidgetsDemo.SWITCHER()
          , EnumWidgetsDemo.COLORPICKER(), EnumWidgetsDemo.COLORPANEL()
          , EnumWidgetsDemo.DATEPICKER(), EnumWidgetsDemo.DATEPANEL()
          , EnumWidgetsDemo.LISTPICKER(), EnumWidgetsDemo.LISTPANEL()
          , EnumWidgetsDemo.CONTENTSINGLE(), EnumWidgetsDemo.CONTENTMULTIPLE()
          , EnumWidgetsDemo.WIDGET(), EnumWidgetsDemo.APPLICATION()
          , EnumWidgetsDemo.ICON(), EnumWidgetsDemo.IMAGE()
          , EnumWidgetsDemo.SOUNDPLAYER(), EnumWidgetsDemo.VIDEOPLAYER()
          , EnumWidgetsDemo.CAMERA(), EnumWidgetsDemo.BOARD()
          , EnumWidgetsDemo.WATCH(), EnumWidgetsDemo.RATER()
          , EnumWidgetsDemo.POTMETER(), EnumWidgetsDemo.XMLLISTER()
          , EnumWidgetsDemo.MORE(), EnumWidgetsDemo.URLREQUEST()
          , EnumWidgetsDemo.NETCONNECTION()];
    }
    /**
     * Frees everything this suite holds.
     */
    override public function destroy():void
    {
      // 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher()
      // 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.
      // 3: call the super destroy.
      super.destroy();
      // 4: every reference and value should be reset to null, 0 or false.
    }
  }
}
