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
 * ConfigsDemoUnitTest
 * Checks the three configurations of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - the running application has to carry these three configs and not the ones of the
 *   framework: an application that loses one of those overrides keeps working and only
 *   the values of it turn back into the framework ones, so that is checked here
 * - the values written into the configuration xmls of this application have to arrive,
 *   and the keys those xmls do not mention have to keep the value the framework gives
 *   them: that is the whole contract of those three files
 * - every displaying style of this application has to be described by the dynamics
 *   config and offered by the label manager: those two lists are both built from
 *   EnumDisplayingStylesDemo.getEveryDisplayingStyle, so they can not fall out of step
 * - a fresh instance is built and destroyed here: the one of the running application is
 *   left alone, destroying that one would take the values out of the test itself
 * - no displaying style is switched to: every style of this application carries a
 *   background image of its own, and switching to one of them would load that picture
 *   from the server of the application
 */
package com.kisscodesystems.KissAs3Dm.suite
{
  import com.kisscodesystems.KissAs3Dm.config.ComponentsConfigDemo;
  import com.kisscodesystems.KissAs3Dm.config.DynamicsConfigDemo;
  import com.kisscodesystems.KissAs3Dm.config.PropertiesConfigDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumDisplayingStylesDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.config.ComponentsConfig;
  import com.kisscodesystems.KissAs3Fw.enum.EnumCameraResolutions;
  import com.kisscodesystems.KissAs3Ut.BaseUnitTest;
  import com.kisscodesystems.KissAs3Ut.UnitTestReport;
  public class ConfigsDemoUnitTest extends BaseUnitTest
  {
    // the width a camera of this application is started at, the one value the components
    // config of it overrides: the framework starts a camera at 640 pixels, a picture that
    // does not fit the widget of a camera of this application in mobile mode
    private static const CAMERA_WIDTH_INI:int = 480;
    // the values the dynamics config of this application overrides: the framework
    // calculates the font size from the size of the stage while it stands at zero, and
    // this application asks for that calculation as well, so its xml keeps the zero
    private static const APP_FONT_SIZE:int = 0;
    private static const APP_LINE_THICKNESS:int = 1;
    // the version of this application, the one value of it that is written down twice:
    // the properties config carries it and the connections of the servers send it over
    private static const APPLICATION_VERSION:String = "2.2";
    /**
     * Constructs the suite.
     * @param applicationRef the main application reference
     * @param reportRef the report every assertion result goes into
     */
    public function ConfigsDemoUnitTest(applicationRef:Application, reportRef:UnitTestReport):void
    {
      super(applicationRef, reportRef);
    }
    /**
     * Returns the name of this suite.
     */
    override public function getName():String
    {
      return "ConfigsDemo";
    }
    /**
     * Runs the assertions of this suite.
     */
    override public function run():void
    {
      runConfigsOfTheApplicationTests();
      runPropertiesConfigTests();
      runComponentsConfigTests();
      runDynamicsConfigTests();
    }
    /**
     * The three configs of the running application are the ones of this application.
     */
    private function runConfigsOfTheApplicationTests():void
    {
      assertTrue("the properties config of the running application is the one of this application"
        , application.getPropertiesConfig() is PropertiesConfigDemo);
      assertTrue("the components config of the running application is the one of this application"
        , application.getComponentsConfig() is ComponentsConfigDemo);
      assertTrue("the dynamics config of the running application is the one of this application"
        , application.getDynamicsConfig() is DynamicsConfigDemo);
    }
    /**
     * The properties config of this application: the values of the xml of it arrive and
     * the ones it does not mention are the ones of the framework.
     */
    private function runPropertiesConfigTests():void
    {
      const config:PropertiesConfigDemo = new PropertiesConfigDemo(application);
      assertEquals("the version of this application", APPLICATION_VERSION
        , config.getApplicationVersion());
      assertTrue("the release date of this application is a value"
        , config.getApplicationReleaseDate() != "");
      assertTrue("the store of the device identifier of this application is a value"
        , config.getDeviceIdStoreName() != "");
      assertTrue("the secret of the device identifier of this application is a value"
        , config.getDeviceIdSecret() != "");
      // the name and the identifier of the application are not written into the xml of
      // this application, so those two are the ones the framework gives them
      assertTrue("the name of this application is a value", config.getApplicationName() != "");
      assertTrue("the identifier of this application is a value", config.getApplicationId() != "");
      assertEquals("the texts and the urls of the homepages are of the same length"
        , config.getApplicationSoftwareHomepageTxt().length
        , config.getApplicationSoftwareHomepageUrl().length);
      config.destroy();
    }
    /**
     * The components config of this application: the one value the xml of it overrides
     * arrives, and the width a camera is started at stands inside the range of the aspect
     * ratio it belongs to.
     */
    private function runComponentsConfigTests():void
    {
      const config:ComponentsConfigDemo = new ComponentsConfigDemo(application);
      assertEquals("the width a camera of this application is started at", CAMERA_WIDTH_INI
        , config.getCameraWidthIni());
      const frameworkConfig:ComponentsConfig = new ComponentsConfig(application);
      assertTrue("that width is narrower than the one of the framework"
        , config.getCameraWidthIni() < frameworkConfig.getCameraWidthIni());
      frameworkConfig.destroy();
      // a brand new camera stands in the four by three ratio, so the starting width of it
      // has to be one of the widths a camera device really works in that very ratio in
      const resolution:String = EnumCameraResolutions.CAMERA_RESOLUTION_43();
      assertTrue("that width is not below the smallest one of the television ratio"
        , config.getCameraWidthIni() >= config.getCameraWidthMin(resolution));
      assertTrue("that width is not above the largest one of the television ratio"
        , config.getCameraWidthIni() <= config.getCameraWidthMax(resolution));
      assertEquals("that width stands on a step of the television ratio", 0
        , (config.getCameraWidthIni() - config.getCameraWidthMin(resolution))
          % config.getCameraWidthInc(resolution));
      // the frames of that camera are not written into the xml of this application, so
      // that value is the one of the framework
      assertTrue("the frames of a camera of this application is a positive value"
        , config.getCameraFpsIni() > 0);
      config.destroy();
    }
    /**
     * The dynamics config of this application: the values of the xml of it arrive and it
     * describes every displaying style of this application.
     */
    private function runDynamicsConfigTests():void
    {
      const config:DynamicsConfigDemo = new DynamicsConfigDemo(application);
      assertEquals("the font size this application is started with", APP_FONT_SIZE
        , config.getAppFontSize());
      // and that zero really is the marker of the calculated size: the texts of this
      // application stand on the size belonging to the current size of its stage
      assertEquals("the size of the texts this application is started with"
        , application.calcFontSizeFromStageSize(), int(config.getTextFormatBright().size));
      assertEquals("the line thickness this application is started with", APP_LINE_THICKNESS
        , config.getAppLineThickness());
      // every style of this application is described by this config, and the panel of the
      // settings offers the very same list of them
      const styles:Array = EnumDisplayingStylesDemo.getEveryDisplayingStyle();
      const stylesOffered:Array = application.getLabelManager().getKeysDisplayingStyles();
      assertTrue("this application has more than one displaying style", styles.length > 1);
      assertEquals("the panel of the settings offers every style of this application"
        , styles.length, stylesOffered.length);
      for (var i:int = 0; i < styles.length; i++)
      {
        const style:String = String(styles[i]);
        assertTrue("the style " + style + " is described by the config of this application"
          , config.hasDisplayingStyle(style));
        assertEquals("the style " + style + " is offered in the very same place of the list"
          , style, String(stylesOffered[i]));
      }
      assertFalse("a style this application does not describe is not held either"
        , config.hasDisplayingStyle("[UT_UNKNOWN_DISPLAYING_STYLE]"));
      styles.splice(0);
      stylesOffered.splice(0);
      config.destroy();
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
