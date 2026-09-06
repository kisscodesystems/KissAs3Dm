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
 * QuickUIDemoUnitTest
 * Checks the QuickUIDemo itself: the screen this application builds of the components.
 *
 * MAIN FEATURES:
 * - this application builds one of every component of the ui package and it calls every
 *   publicly reachable method of every one of them, all of that inside its constructor:
 *   so the components standing on the screen when this suite runs are the proof that
 *   every one of those calls has gone through
 * - every component of that package has to stand there, and no more of any of them than
 *   this application builds: a component that is built twice or not at all is a mistake
 *   of the very example this application is
 * - every one of them has to be visible, to have a size and to stand inside the stage:
 *   the positions themselves are not checked, those are the composition of the screen and
 *   they are moved around whenever a component is added to it
 * - the components themselves are checked by the suites of the framework, see
 *   com.kisscodesystems.KissAs3Fw.ApplicationUnitTest: this run checks the screen this
 *   application makes of them
 */
package com.kisscodesystems.KissAs3Dm.suite
{
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.base.BaseSprite;
  import com.kisscodesystems.KissAs3Fw.ui.Board;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonBar;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonText;
  import com.kisscodesystems.KissAs3Fw.ui.Camera;
  import com.kisscodesystems.KissAs3Fw.ui.ColorPanel;
  import com.kisscodesystems.KissAs3Fw.ui.ColorPicker;
  import com.kisscodesystems.KissAs3Fw.ui.ContentMultiple;
  import com.kisscodesystems.KissAs3Fw.ui.ContentSingle;
  import com.kisscodesystems.KissAs3Fw.ui.DatePanel;
  import com.kisscodesystems.KissAs3Fw.ui.DatePicker;
  import com.kisscodesystems.KissAs3Fw.ui.Icon;
  import com.kisscodesystems.KissAs3Fw.ui.Image;
  import com.kisscodesystems.KissAs3Fw.ui.ListPanel;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.More;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Rater;
  import com.kisscodesystems.KissAs3Fw.ui.SoundPlayer;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextArea;
  import com.kisscodesystems.KissAs3Fw.ui.TextBox;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import com.kisscodesystems.KissAs3Fw.ui.VideoPlayer;
  import com.kisscodesystems.KissAs3Fw.ui.Watch;
  import com.kisscodesystems.KissAs3Fw.ui.Widget;
  import com.kisscodesystems.KissAs3Fw.ui.XmlLister;
  import com.kisscodesystems.KissAs3Ut.BaseUnitTest;
  import com.kisscodesystems.KissAs3Ut.UnitTestReport;
  import flash.display.DisplayObject;
  import flash.utils.getQualifiedClassName;
  public class QuickUIDemoUnitTest extends BaseUnitTest
  {
    // the number of the components this application builds: every one of them stands
    // right on the application, so this is the number of the objects of the framework
    // standing there. The tracer of the framework is not one of them: that one is built
    // of flash primitives, so it is no object of this kind at all.
    private static const NUM_OF_COMPONENTS:int = 29;
    /**
     * Constructs the suite.
     * @param applicationRef the main application reference
     * @param reportRef the report every assertion result goes into
     */
    public function QuickUIDemoUnitTest(applicationRef:Application, reportRef:UnitTestReport):void
    {
      super(applicationRef, reportRef);
    }
    /**
     * Returns the name of this suite.
     */
    override public function getName():String
    {
      return "QuickUIDemo";
    }
    /**
     * Runs the assertions of this suite.
     */
    override public function run():void
    {
      runSizeTests();
      runComponentTests();
      runPlacementTests();
    }
    /**
     * This application wears the size of the stage and none of its own setters can change
     * that: every one of those does nothing on purpose.
     */
    private function runSizeTests():void
    {
      assertNotNull("the stage of this application", application.stage);
      assertEquals("the width of this application is the one of the stage"
        , int(Math.max(application.getComponentsConfig().getAppSizeMinWidth()
          , application.stage.stageWidth)), application.getDw());
      assertEquals("the height of this application is the one of the stage"
        , int(Math.max(application.getComponentsConfig().getAppSizeMinHeight()
          , application.stage.stageHeight)), application.getDh());
      const dw:int = application.getDw();
      const dh:int = application.getDh();
      application.setDw(dw + 100);
      assertEquals("the width of this application can not be set", dw, application.getDw());
      application.setDh(dh + 100);
      assertEquals("the height of this application can not be set", dh, application.getDh());
      application.setDwh(dw + 100, dh + 100);
      assertEquals("the width of this application can not be set with the pair of them"
        , dw, application.getDw());
      assertEquals("the height of this application can not be set with the pair of them"
        , dh, application.getDh());
    }
    /**
     * One of every component of the ui package stands on this application, and no more of
     * any of them than this application builds.
     */
    private function runComponentTests():void
    {
      // the class of every component and the number of the objects of it standing on this
      // application: a component extending another one is one of that other one as well,
      // so the switcher counts as a button link and the text area counts as a text box
      const components:Array = [[Icon, 1], [TextLabel, 2], [ButtonText, 1], [ButtonLink, 2]
        , [Switcher, 1], [TextInput, 1], [SoundPlayer, 1], [Image, 1], [VideoPlayer, 1]
        , [Camera, 1], [TextBox, 2], [TextArea, 1], [ButtonBar, 1], [ContentSingle, 1]
        , [ContentMultiple, 1], [Widget, 1], [ListPanel, 1], [ListPicker, 1], [ColorPanel, 1]
        , [ColorPicker, 1], [Watch, 1], [More, 1], [Rater, 1], [Potmeter, 1], [DatePicker, 1]
        , [XmlLister, 1], [DatePanel, 1], [Board, 1]];
      for (var i:int = 0; i < components.length; i++)
      {
        const componentClass:Class = components[i][0] as Class;
        assertEquals("the number of the " + nameOfTheClass(componentClass)
          + " objects standing on this application", int(components[i][1])
          , numOfChildrenOf(componentClass));
      }
      assertEquals("the number of the components standing on this application"
        , NUM_OF_COMPONENTS, numOfChildrenOf(BaseSprite));
      components.splice(0);
    }
    /**
     * Every component standing on this application is visible, it has a size of its own
     * and it stands inside the stage.
     */
    private function runPlacementTests():void
    {
      for (var i:int = 0; i < application.numChildren; i++)
      {
        const child:DisplayObject = application.getChildAt(i);
        if (!(child is BaseSprite))
        {
          continue;
        }
        const component:BaseSprite = BaseSprite(child);
        const name:String = nameOfTheClass(component);
        assertTrue("the " + name + " of this application is visible", component.visible);
        assertTrue("the " + name + " of this application has a width", component.getDw() > 0);
        assertTrue("the " + name + " of this application has a height", component.getDh() > 0);
        assertTrue("the " + name + " of this application stands inside the stage"
          , component.getCx() >= 0 && component.getCy() >= 0
          && component.getCx() < application.stage.stageWidth
          && component.getCy() < application.stage.stageHeight);
      }
    }
    /**
     * Returns the number of the children of this application that are objects of the
     * given class.
     * @param componentClass the class the children are counted by
     */
    private function numOfChildrenOf(componentClass:Class):int
    {
      var numOfThem:int = 0;
      for (var i:int = 0; i < application.numChildren; i++)
      {
        if (application.getChildAt(i) is componentClass)
        {
          numOfThem++;
        }
      }
      return numOfThem;
    }
    /**
     * Returns the name of the class of the given object or of the given class itself,
     * without the package standing in front of it. The assertions of this suite are named
     * after the components they are about, and the components themselves are handed over
     * as classes here, so this is the one place their names come from.
     * @param classOrObject the class or the object the name is asked of
     */
    private function nameOfTheClass(classOrObject:Object):String
    {
      const qualifiedName:String = getQualifiedClassName(classOrObject);
      return qualifiedName.substr(qualifiedName.lastIndexOf(":") + 1);
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
