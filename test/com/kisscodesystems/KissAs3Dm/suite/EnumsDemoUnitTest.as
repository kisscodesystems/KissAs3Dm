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
 * EnumsDemoUnitTest
 * Checks every enum of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - every member of every one of those enums is asked for its value here
 * - a value that is displayed has to be a text key the label manager of this application
 *   knows a label for, and it has to have that label in every language the application
 *   can be switched to: a missing one stands on the screen as the key itself
 * - a value that is never displayed must not be a text key at all: the names of the
 *   resources and the headers of the widgets are the same in every language
 * - no two members of one enum can answer the very same value: such a pair would be a
 *   copy of the other one, and the two of them could never be told apart
 * - the labels are checked in every language in one single pass: switching the language
 *   relabels the whole running application, so this suite does it once per language and
 *   it leaves the application in the language it has found it in
 */
package com.kisscodesystems.KissAs3Dm.suite
{
  import com.kisscodesystems.KissAs3Dm.BaseUnitTestDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumDisplayingStylesDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumEmojisDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumSoundsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Ut.UnitTestReport;
  public class EnumsDemoUnitTest extends BaseUnitTestDemo
  {
    // every text key this suite has met, so the labels of all of them are checked in one
    // single pass per language
    private var textKeysFound:Array = null;
    /**
     * Constructs the suite.
     * @param applicationRef the main application reference
     * @param reportRef the report every assertion result goes into
     */
    public function EnumsDemoUnitTest(applicationRef:Application, reportRef:UnitTestReport):void
    {
      super(applicationRef, reportRef);
    }
    /**
     * Returns the name of this suite.
     */
    override public function getName():String
    {
      return "EnumsDemo";
    }
    /**
     * Runs the assertions of this suite.
     */
    override public function run():void
    {
      textKeysFound = new Array();
      // the displaying styles of this application: every one of them is displayed on the
      // panel of the settings, so every one of them is a text key
      checkTextKeys("EnumDisplayingStylesDemo", EnumDisplayingStylesDemo.getEveryDisplayingStyle());
      // The headers of the widgets: a header is the name of the component the widget
      // belongs to, and the name of a class is the same in every language, so these are
      // plain values. The welcome widget belongs to no component at all, so the header of
      // that one is a text key: it is the only one of this enum that is displayed, and it
      // is the first of the list below, the way the menu displays them.
      const headers:Array = getEveryWidgetHeader();
      assertEquals("the header of the welcome widget stands first", EnumWidgetsDemo.WELCOME()
        , String(headers[0]));
      checkTextKeys("EnumWidgetsDemo", [EnumWidgetsDemo.WELCOME()]);
      checkValues("EnumWidgetsDemo", headers.slice(1));
      headers.splice(0);
      // the names of the embedded resources of this application: the managers of them
      // answer these very strings, so none of them is ever displayed
      checkValues("EnumIconsDemo", [EnumIconsDemo.application(), EnumIconsDemo.board()
        , EnumIconsDemo.buttonbar(), EnumIconsDemo.buttonlink(), EnumIconsDemo.buttons()
        , EnumIconsDemo.buttontext(), EnumIconsDemo.camera(), EnumIconsDemo.colorpanel()
        , EnumIconsDemo.colorpicker(), EnumIconsDemo.componentusage()
        , EnumIconsDemo.contentmultiple(), EnumIconsDemo.contentsingle(), EnumIconsDemo.others()
        , EnumIconsDemo.pickers(), EnumIconsDemo.textarea(), EnumIconsDemo.textbox()
        , EnumIconsDemo.textinput(), EnumIconsDemo.textlabel(), EnumIconsDemo.textmulti()
        , EnumIconsDemo.textsingle(), EnumIconsDemo.widget(), EnumIconsDemo.xmllister()]);
      checkValues("EnumSoundsDemo", [EnumSoundsDemo.sample(), EnumSoundsDemo.signal()]);
      checkValues("EnumEmojisDemo", [EnumEmojisDemo.demo()]);
      // The text keys this application names in its own code: the topics of the menu, the
      // texts of the widgets and the ones of the welcome widget. Every other key of
      // EnumTextKeysDemo is generated from the very label xml the labels are read from,
      // so a key of that kind can never be left without a label of its own.
      checkTextKeys("EnumTextKeysDemo", [EnumTextKeysDemo.COMPONENTS_USAGE()
        , EnumTextKeysDemo.MENU_TEXTS(), EnumTextKeysDemo.MENU_BUTTONS()
        , EnumTextKeysDemo.MENU_PICKERS(), EnumTextKeysDemo.MENU_CONTENTS()
        , EnumTextKeysDemo.MENU_MEDIA(), EnumTextKeysDemo.MENU_OTHERS()
        , EnumTextKeysDemo.MENU_WEB(), EnumTextKeysDemo.WIDGET_EMPTY()
        , EnumTextKeysDemo.WIDGET_SEEINFO(), EnumTextKeysDemo.WIDGET_TAB_BASIC()
        , EnumTextKeysDemo.WIDGET_WELCOME(), EnumTextKeysDemo.WIDGETINFO_WELCOME()]);
      runLabelTests();
    }
    /**
     * Checks the values of one enum that is displayed: every value of it has to be a text
     * key and no two of them can be the same one. The labels themselves are checked by
     * the runLabelTests below, in every language of this application at once.
     * @param enumName the name of the enum the values belong to
     * @param values the value of every member of that enum
     */
    private function checkTextKeys(enumName:String, values:Array):void
    {
      for (var i:int = 0; i < values.length; i++)
      {
        const value:String = String(values[i]);
        assertTrue(enumName + " " + value + " is a text key"
          , value.indexOf("[") == 0 && value.indexOf("]") == value.length - 1);
        assertEquals(enumName + " " + value + " stands in that enum once", i, values.indexOf(value));
        textKeysFound.push(value);
      }
      values.splice(0);
    }
    /**
     * Checks the values of one enum that is never displayed. No value of it can be an
     * empty one or a text key, and no two of them can be the same one.
     * @param enumName the name of the enum the values belong to
     * @param values the value of every member of that enum
     */
    private function checkValues(enumName:String, values:Array):void
    {
      for (var i:int = 0; i < values.length; i++)
      {
        const value:String = String(values[i]);
        assertTrue(enumName + " " + value + " is not an empty value", value != "");
        assertFalse(enumName + " " + value + " is not a text key", value.indexOf("[") == 0);
        assertEquals(enumName + " " + value + " stands in that enum once", i, values.indexOf(value));
      }
      values.splice(0);
    }
    /**
     * Checks the label of every text key this suite has met, in every language this
     * application can be switched to. The language is switched the way the panel of the
     * settings does it, so the whole application follows every step of this, and the
     * language it has been found in is the one it is left in.
     */
    private function runLabelTests():void
    {
      const langCodes:Array = application.getLabelManager().getKeysLang();
      assertTrue("this application knows at least one language", langCodes.length > 0);
      const langCodeOrig:String = application.getLabelManager().getLang();
      for (var i:int = 0; i < langCodes.length; i++)
      {
        const langCode:String = String(langCodes[i]);
        application.getMiddleground().setLangCode(langCode);
        assertEquals("the language of this application after the switch to " + langCode
          , langCode, application.getLabelManager().getLang());
        for (var j:int = 0; j < textKeysFound.length; j++)
        {
          assertTrue(textKeysFound[j] + " has a label in the language " + langCode
            , application.getLabelManager().getLabel(String(textKeysFound[j])) != "");
        }
      }
      application.getMiddleground().setLangCode(langCodeOrig);
      assertEquals("the language this application has been found in is restored"
        , langCodeOrig, application.getLabelManager().getLang());
      langCodes.splice(0);
    }
    /**
     * Frees everything this suite holds.
     */
    override public function destroy():void
    {
      // 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher()
      // 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.
      if (textKeysFound != null)
      {
        textKeysFound.splice(0);
      }
      // 3: call the super destroy.
      super.destroy();
      // 4: every reference and value should be reset to null, 0 or false.
      textKeysFound = null;
    }
  }
}
