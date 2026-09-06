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
 * ManagersDemoUnitTest
 * Checks the managers of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - the running application has to carry these managers and not the ones of the
 *   framework: that is what makes the embedded icons, sounds, emojis and labels of this
 *   application reachable at all
 * - every resource of this application has to be answered by the manager of it, and
 *   every resource of the framework has to stay reachable through that very manager: a
 *   manager of this application answers the resources of its own and it lets the
 *   framework answer all the others, so both halves of that chain are checked here
 * - the servers of this application stand in one single place, the server manager, and
 *   the two request managers build the urls of their connections from those addresses:
 *   so the addresses themselves are checked on the manager holding them and the urls are
 *   checked against the very server they are built of
 * - no request is sent and no connection is opened here: the managers are asked for what
 *   they hold, not for what they can fetch
 */
package com.kisscodesystems.KissAs3Dm.suite
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumEmojisDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumSoundsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.manager.EmojiManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.IconManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.LabelManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.NetConnectionManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.ServerManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.SoundManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.UrlRequestManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.WidgetManagerDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEmojis;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.enum.EnumSounds;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextKeys;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes;
  import com.kisscodesystems.KissAs3Ut.BaseUnitTest;
  import com.kisscodesystems.KissAs3Ut.UnitTestReport;
  import flash.display.BitmapData;
  public class ManagersDemoUnitTest extends BaseUnitTest
  {
    // the size the icons and the emojis are asked in: the managers draw a resource in
    // whatever size they are given, so any one of them tells whether that drawing works
    private static const RESOURCE_SIZE:int = 32;
    // the servers of this application and the parts the urls of them are built of
    private static const SERVER_KEYS:Array = ["app1", "app2"];
    private static const SERVER_DOMAIN:String = ".kisscodesystems.com";
    private static const HTTP_URL_SCHEME:String = "https://";
    private static const HTTP_URL_APP:String = "/kcsops/";
    private static const HTTP_BACKGROUNDS_FOLDER:String = "backgrounds/";
    /**
     * Constructs the suite.
     * @param applicationRef the main application reference
     * @param reportRef the report every assertion result goes into
     */
    public function ManagersDemoUnitTest(applicationRef:Application, reportRef:UnitTestReport):void
    {
      super(applicationRef, reportRef);
    }
    /**
     * Returns the name of this suite.
     */
    override public function getName():String
    {
      return "ManagersDemo";
    }
    /**
     * Runs the assertions of this suite.
     */
    override public function run():void
    {
      runManagersOfTheApplicationTests();
      runIconManagerTests();
      runSoundManagerTests();
      runEmojiManagerTests();
      runLabelManagerTests();
      runServerManagerTests();
      runRequestManagerTests();
    }
    /**
     * The managers of the running application are the ones of this application.
     */
    private function runManagersOfTheApplicationTests():void
    {
      assertTrue("the emoji manager of the running application is the one of this application"
        , application.getEmojiManager() is EmojiManagerDemo);
      assertTrue("the icon manager of the running application is the one of this application"
        , application.getIconManager() is IconManagerDemo);
      assertTrue("the sound manager of the running application is the one of this application"
        , application.getSoundManager() is SoundManagerDemo);
      assertTrue("the label manager of the running application is the one of this application"
        , application.getLabelManager() is LabelManagerDemo);
      assertTrue("the widget manager of the running application is the one of this application"
        , application.getWidgetManager() is WidgetManagerDemo);
      assertTrue("the server manager of the running application is the one of this application"
        , application.getServerManager() is ServerManagerDemo);
      assertTrue("the url request manager of the running application is the one of this application"
        , application.getUrlRequestManager() is UrlRequestManagerDemo);
      assertTrue("the net connection manager of the running application is the one of this application"
        , application.getNetConnectionManager() is NetConnectionManagerDemo);
    }
    /**
     * The icon manager of this application: every icon of this application is drawn by
     * it, the icons of the framework stay reachable through it and a name no application
     * knows at all is answered with nothing.
     */
    private function runIconManagerTests():void
    {
      const iconTypes:Array = [EnumIconsDemo.application(), EnumIconsDemo.board()
        , EnumIconsDemo.buttonbar(), EnumIconsDemo.buttonlink(), EnumIconsDemo.buttons()
        , EnumIconsDemo.buttontext(), EnumIconsDemo.camera(), EnumIconsDemo.colorpanel()
        , EnumIconsDemo.colorpicker(), EnumIconsDemo.componentusage()
        , EnumIconsDemo.contentmultiple(), EnumIconsDemo.contentsingle(), EnumIconsDemo.others()
        , EnumIconsDemo.pickers(), EnumIconsDemo.textarea(), EnumIconsDemo.textbox()
        , EnumIconsDemo.textinput(), EnumIconsDemo.textlabel(), EnumIconsDemo.textmulti()
        , EnumIconsDemo.textsingle(), EnumIconsDemo.widget(), EnumIconsDemo.xmllister()
        // the last one is an icon of the framework: the manager of this application
        // answers the icons of its own and it lets the framework answer every other one
        , EnumIcons.info()];
      for (var i:int = 0; i < iconTypes.length; i++)
      {
        const iconType:String = String(iconTypes[i]);
        const bitmapData:BitmapData = application.getIconManager().getNewBitmapData(iconType
          , EnumTextTypes.TEXT_TYPE_DARK(), RESOURCE_SIZE);
        assertNotNull("the icon " + iconType + " is drawn", bitmapData);
        if (bitmapData != null)
        {
          assertEquals("the width of the icon " + iconType, RESOURCE_SIZE, bitmapData.width);
          assertEquals("the height of the icon " + iconType, RESOURCE_SIZE, bitmapData.height);
          bitmapData.dispose();
        }
      }
      assertNull("an icon no application knows is drawn by none of them"
        , application.getIconManager().getNewBitmapData("utUnknownIcon"
          , EnumTextTypes.TEXT_TYPE_DARK(), RESOURCE_SIZE));
      iconTypes.splice(0);
    }
    /**
     * The sound manager of this application: both sounds of this application are held by
     * it, the sounds of the framework stay reachable through it and a name no application
     * knows at all is answered with nothing.
     */
    private function runSoundManagerTests():void
    {
      assertNotNull("the sample sound of this application"
        , application.getSoundManager().getSound(EnumSoundsDemo.sample()));
      assertNotNull("the signal sound of this application"
        , application.getSoundManager().getSound(EnumSoundsDemo.signal()));
      assertFalse("the two sounds of this application are two different ones"
        , application.getSoundManager().getSound(EnumSoundsDemo.sample())
          == application.getSoundManager().getSound(EnumSoundsDemo.signal()));
      assertNotNull("a sound of the framework is reachable through this manager"
        , application.getSoundManager().getSound(EnumSounds.button()));
      assertNull("a sound no application knows is held by none of them"
        , application.getSoundManager().getSound("utUnknownSound"));
    }
    /**
     * The emoji manager of this application: the category and the emoji of this
     * application are offered by it and the emojis of the framework stay reachable
     * through it.
     */
    private function runEmojiManagerTests():void
    {
      const categories:Array = application.getEmojiManager().getCategoryList();
      assertTrue("the category of this application is offered"
        , categories.indexOf(EnumEmojisDemo.demo()) != -1);
      assertTrue("the categories of the framework are offered as well", categories.length > 1);
      const emojis:Array = application.getEmojiManager().getEmojiList(EnumEmojisDemo.demo());
      assertTrue("the emoji of this application stands in the category of it"
        , emojis.indexOf(EnumEmojisDemo.demo()) != -1);
      const bitmapData:BitmapData = application.getEmojiManager().getNewBitmapData(
        EnumEmojisDemo.demo(), RESOURCE_SIZE);
      assertNotNull("the emoji of this application is drawn", bitmapData);
      if (bitmapData != null)
      {
        assertEquals("the width of the emoji of this application", RESOURCE_SIZE, bitmapData.width);
        assertEquals("the height of the emoji of this application", RESOURCE_SIZE, bitmapData.height);
        bitmapData.dispose();
      }
      const bitmapDataFw:BitmapData = application.getEmojiManager().getNewBitmapData(
        EnumEmojis.hearts_heart(), RESOURCE_SIZE);
      assertNotNull("an emoji of the framework is drawn by this manager as well", bitmapDataFw);
      if (bitmapDataFw != null)
      {
        bitmapDataFw.dispose();
      }
      const emojisOfNoCategory:Array = application.getEmojiManager().getEmojiList("utUnknownCategory");
      assertEquals("a category no application knows holds no emoji at all"
        , 0, emojisOfNoCategory.length);
      categories.splice(0);
      emojis.splice(0);
      emojisOfNoCategory.splice(0);
    }
    /**
     * The label manager of this application: the labels of this application are added to
     * the ones of the framework, so both of them are answered by it.
     */
    private function runLabelManagerTests():void
    {
      assertTrue("a label of this application is answered"
        , application.getLabelManager().getLabel(EnumTextKeysDemo.COMPONENTS_USAGE()) != "");
      assertTrue("a label of the framework is answered as well"
        , application.getLabelManager().getLabel(EnumTextKeys.WIDGET_HEADER_GENERAL()) != "");
      assertEquals("a key no application knows has no label at all", ""
        , application.getLabelManager().getLabel("[UT_UNKNOWN_TEXT_KEY]"));
      const styleKeys:Array = application.getLabelManager().getKeysDisplayingStyles();
      const styleLabels:Array = application.getLabelManager().getLabelsDisplayingStyles();
      assertEquals("every displaying style offered by this manager has a label of its own"
        , styleKeys.length, styleLabels.length);
      styleKeys.splice(0);
      styleLabels.splice(0);
    }
    /**
     * The server manager of this application: it is the one single place the servers of
     * this application are written down in. A fresh instance is checked here, so the run
     * touches neither the server the running application talks to nor the refreshing of
     * that list.
     */
    private function runServerManagerTests():void
    {
      const manager:ServerManagerDemo = new ServerManagerDemo(application);
      assertEquals("the number of the servers of this application"
        , SERVER_KEYS.length, manager.getServerCount());
      const serverKeys:Array = manager.getServerKeys();
      for (var i:int = 0; i < SERVER_KEYS.length; i++)
      {
        const serverKey:String = String(SERVER_KEYS[i]);
        assertTrue("the server " + serverKey + " is one of the servers of this application"
          , serverKeys.indexOf(serverKey) != -1);
        assertEquals("the address of the server " + serverKey, serverKey + SERVER_DOMAIN
          , manager.getServerAddress(serverKey));
      }
      assertEquals("a server this application does not have has no address", ""
        , manager.getServerAddress("utUnknownServer"));
      assertTrue("the server in use is one of the servers of this application"
        , serverKeys.indexOf(manager.getServerInUse()) != -1);
      // this application is not handed over to another server here: that would be told to
      // every manager of the running application with the event of it, and the picking
      // itself is checked on the framework by ServerManagerUnitTest
      assertFalse("a server this application does not have can not be picked"
        , manager.setServerInUse("utUnknownServer"));
      serverKeys.splice(0);
      manager.destroy();
      // the manager of the running application holds the very same servers
      assertEquals("the number of the servers of the running application"
        , SERVER_KEYS.length, application.getServerManager().getServerCount());
    }
    /**
     * The two request managers of this application: both of them build the urls of their
     * connections from the addresses the server manager holds, so the url of the http
     * connections is checked against those very addresses here. The url of the rtmp
     * connections is a setting of the connection itself, so the group of it is all that
     * can be asked for from the outside.
     */
    private function runRequestManagerTests():void
    {
      const serverKeys:Array = application.getServerManager().getServerKeys();
      const serverAddresses:Array = new Array();
      for (var i:int = 0; i < serverKeys.length; i++)
      {
        serverAddresses.push(application.getServerManager().getServerAddress(String(serverKeys[i])));
      }
      // the url of this application: the scheme and the path of it are the ones of the
      // http connections and the address between them is one of the servers above
      const urlCustom:String = application.getUrlRequestManager().getUrlCustom();
      assertEquals("the url of this application is an http one", 0
        , urlCustom.indexOf(HTTP_URL_SCHEME));
      assertEquals("the url of this application ends with the path of the application"
        , urlCustom.length - HTTP_URL_APP.length, urlCustom.lastIndexOf(HTTP_URL_APP));
      const addressOfTheUrl:String = urlCustom.substring(HTTP_URL_SCHEME.length
        , urlCustom.length - HTTP_URL_APP.length);
      assertTrue("the url of this application stands on one of the servers of it"
        , serverAddresses.indexOf(addressOfTheUrl) != -1);
      // the background images travel on the very server every other request does
      assertEquals("the url of the background images", urlCustom + HTTP_BACKGROUNDS_FOLDER
        , application.getUrlRequestManager().getUrlBackgrounds());
      // the group of the http connections holds one connection per server, and the
      // default one of it is the server every request of this application is sent to
      assertTrue("the http connection in use stands on one of the servers of this application"
        , serverKeys.indexOf(application.getUrlRequestManager().getDefaultConnectionKey(
          UrlRequestManagerDemo.CONNECTION_GROUP_KEY)) != -1);
      // the group of the rtmp connections holds the very same servers, and no connection
      // of it is opened until a widget of this application asks for one
      assertTrue("the rtmp connection in use stands on one of the servers of this application"
        , serverKeys.indexOf(application.getNetConnectionManager().getDefaultConnectionKey(
          NetConnectionManagerDemo.CONNECTION_GROUP_KEY)) != -1);
      assertFalse("no rtmp connection of this application is open yet"
        , application.getNetConnectionManager().isConnectionGroupConnected(
          NetConnectionManagerDemo.CONNECTION_GROUP_KEY));
      serverKeys.splice(0);
      serverAddresses.splice(0);
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
