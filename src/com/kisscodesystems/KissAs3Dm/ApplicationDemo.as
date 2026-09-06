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
 * ApplicationDemo.
 * The demo application of this framework: it builds the whole application of the
 * framework, the three layers of it, and one widget of every component.
 *
 * MAIN FEATURES:
 * - it replaces the configurations and the managers of the framework with the ones
 *   of this application, so the embedded icons, sounds, emojis and labels of it
 *   are the ones of the KissAs3Dm resources
 * - the menu holds every widget of this application, grouped by the topic the
 *   component of the widget belongs to, and the welcome widget stands above those
 *   topics: that one belongs to no component, it tells what can be read here
 * - a widget is built when the menu item of it is picked the first time, and it can
 *   be moved, resized, minimized, stepped over and closed from there on
 * - every widget of it is empty yet: the elements demonstrating the component of a
 *   widget come later, into the createElements of that widget
 * - the components themselves are shown one by one by the
 *   com.kisscodesystems.KissAs3Dm.QuickUIDemo
 */
package com.kisscodesystems.KissAs3Dm
{
  import com.kisscodesystems.KissAs3Dm.config.ComponentsConfigDemo;
  import com.kisscodesystems.KissAs3Dm.config.DynamicsConfigDemo;
  import com.kisscodesystems.KissAs3Dm.config.PropertiesConfigDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumDisplayingStylesDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumSoundsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Dm.manager.EmojiManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.IconManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.LabelManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.NetConnectionManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.SoundManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.ServerManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.UrlRequestManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.WidgetManagerDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumAppEnvs;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.enum.EnumLanguages;
  import com.kisscodesystems.KissAs3Fw.enum.EnumOkCancel;
  import com.kisscodesystems.KissAs3Fw.enum.EnumOrientations;
  import com.kisscodesystems.KissAs3Fw.enum.EnumSounds;
  import flash.events.ContextMenuEvent;
  import flash.events.Event;
  public class ApplicationDemo extends Application
  {
    /**
     * TRACING LEVELS:
     * 0: framework debug
     * 1: framework info
     * 2: spare
     * 3: application debug
     * 4: application info
     * 5: spare
     * 6: any warning (errors in logic of application)
     * 7: any exception (errors in catch codes)
     * 8: spare
     * 9: no logging
     */
    // the homepage of the developer of this framework, the context menu opens it
    private const HOMEPAGE_URL:String = "http://kcsopensource.com";
    // the widget this application opens for itself, the one of the first menu item
    private const WIDGET_TO_OPEN:String = EnumWidgetsDemo.WELCOME();
    // this object may reach the stage more than once, so the content is built once
    private var contentCreated:Boolean = false;
    /**
     * Constructs the demo application.
     */
    public function ApplicationDemo():void
    {
      try
      {
        super();
        appEnv = EnumAppEnvs.appEnvPrd();
        // the framework messages of one single frame are far too many to be followed,
        // so the debug and the info levels of this application are displayed only
        setTraceLevel(3);
        application.trace("<ApplicationDemo> constructed.", 4);
      }
      catch (e:*)
      {
        this.trace("<ApplicationDemo> main error: " + e, 7);
      }
    }
    /**
     * Opens the widget of the menu item that has been picked. The super of this method
     * is not called on purpose: that one only displays the picked item in an alert,
     * because the framework itself has no widget to open at all.
     * @param selectedItem the menu item that has been picked
     */
    override public function handleMenuSelect(selectedItem:String):void
    {
      application.trace("<ApplicationDemo handleMenuSelect> called.", 4);
      application.trace("<ApplicationDemo handleMenuSelect> selectedItem: " + selectedItem, 3);
      getWidgetManager().handleMenuSelect(selectedItem);
      // this sound is the one of the framework: the sound manager of this application
      // answers with the sounds of its own and it lets the framework answer every other
      getSoundManager().playSound(EnumSounds.menuitem());
    }
    /**
     * The width of this application is the one of the stage, so it cannot be set here.
     * @param newdw the new width
     */
    override public function setDw(newdw:int):void
    {
      application.trace("<ApplicationDemo setDw> called.", 4);
      application.trace("<ApplicationDemo setDw> newdw: " + newdw, 3);
      application.trace("<ApplicationDemo setDw> do nothing.", 4);
    }
    /**
     * The height of this application is the one of the stage, so it cannot be set here.
     * @param newdh the new height
     */
    override public function setDh(newdh:int):void
    {
      application.trace("<ApplicationDemo setDh> called.", 4);
      application.trace("<ApplicationDemo setDh> newdh: " + newdh, 3);
      application.trace("<ApplicationDemo setDh> do nothing.", 4);
    }
    /**
     * The dimensions of this application are the ones of the stage, so they cannot be
     * set here.
     * @param newdw the new width
     * @param newdh the new height
     */
    override public function setDwh(newdw:int, newdh:int):void
    {
      application.trace("<ApplicationDemo setDwh> called.", 4);
      application.trace("<ApplicationDemo setDwh> newdw: " + newdw, 3);
      application.trace("<ApplicationDemo setDwh> newdh: " + newdh, 3);
      application.trace("<ApplicationDemo setDwh> do nothing.", 4);
    }
    /**
     * Builds every layer and every element of this application when it reaches the stage.
     * @param e the added to stage event
     */
    override protected function addedToStage(e:Event):void
    {
      application.trace("<ApplicationDemo addedToStage> called.", 4);
      application.trace("<ApplicationDemo addedToStage> e: " + e, 3);
      super.addedToStage(e);
      inilayers();
      inisetmenu();
      iniupdates();
      inilangcode();
      iniorientation();
      inidisplayingstyle();
      inisettingofapplicationname();
      inicontextmenuitems();
      inicreationofthewholecontent();
    }
    /**
     * The properties config of this application replaces the one of the framework.
     */
    override protected function initializePropertiesConfig():void
    {
      application.trace("<ApplicationDemo initializePropertiesConfig> called.", 4);
      propertiesConfig = new PropertiesConfigDemo(this);
    }
    /**
     * The components config of this application replaces the one of the framework.
     */
    override protected function initializeComponentsConfig():void
    {
      application.trace("<ApplicationDemo initializeComponentsConfig> called.", 4);
      componentsConfig = new ComponentsConfigDemo(this);
    }
    /**
     * The dynamics config of this application replaces the one of the framework.
     */
    override protected function initializeDynamicsConfig():void
    {
      application.trace("<ApplicationDemo initializeDynamicsConfig> called.", 4);
      dynamicsConfig = new DynamicsConfigDemo(this);
    }
    /**
     * The emoji manager of this application replaces the one of the framework.
     */
    override protected function initializeEmojiManager():void
    {
      application.trace("<ApplicationDemo initializeEmojiManager> called.", 4);
      emojiManager = new EmojiManagerDemo(this);
    }
    /**
     * The icon manager of this application replaces the one of the framework.
     */
    override protected function initializeIconManager():void
    {
      application.trace("<ApplicationDemo initializeIconManager> called.", 4);
      iconManager = new IconManagerDemo(this);
    }
    /**
     * The sound manager of this application replaces the one of the framework.
     */
    override protected function initializeSoundManager():void
    {
      application.trace("<ApplicationDemo initializeSoundManager> called.", 4);
      soundManager = new SoundManagerDemo(this);
    }
    /**
     * The label manager of this application replaces the one of the framework.
     */
    override protected function initializeLabelManager():void
    {
      application.trace("<ApplicationDemo initializeLabelManager> called.", 4);
      labelManager = new LabelManagerDemo(this);
    }
    /**
     * The widget manager of this application replaces the one of the framework.
     */
    override protected function initializeWidgetManager():void
    {
      application.trace("<ApplicationDemo initializeWidgetManager> called.", 4);
      widgetManager = new WidgetManagerDemo(this);
    }
    /**
     * The server manager of this application replaces the one of the framework.
     */
    override protected function initializeServerManager():void
    {
      application.trace("<ApplicationDemo initializeServerManager> called.", 4);
      serverManager = new ServerManagerDemo(this);
    }
    /**
     * The url request manager of this application replaces the one of the framework.
     */
    override protected function initializeUrlRequestManager():void
    {
      application.trace("<ApplicationDemo initializeUrlRequestManager> called.", 4);
      urlRequestManager = new UrlRequestManagerDemo(this);
    }
    /**
     * The net connection manager of this application replaces the one of the framework.
     */
    override protected function initializeNetConnectionManager():void
    {
      application.trace("<ApplicationDemo initializeNetConnectionManager> called.", 4);
      netConnectionManager = new NetConnectionManagerDemo(this);
    }
    /**
     * Builds the three layers of the framework: the background, the middleground
     * holding the menu, the settings and the widgets, and the foreground of the alerts.
     */
    protected function inilayers():void
    {
      application.trace("<ApplicationDemo inilayers> called.", 4);
      createLayers();
    }
    /**
     * Builds the menu of this application: every widget of it stands under the topic
     * the component of that widget belongs to, and the welcome widget stands above
     * every one of those topics, under none of them. The value of a leaf item is the
     * header of the widget it opens, that is how the widget manager finds that widget.
     */
    protected function inisetmenu():void
    {
      application.trace("<ApplicationDemo inisetmenu> called.", 4);
      menuxml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
          + "<items>"
          + itemOfTheMenu(EnumWidgetsDemo.WELCOME(), EnumIconsDemo.componentusage())
          + topicOfTheMenu(EnumTextKeysDemo.MENU_TEXTS()
              , [EnumWidgetsDemo.TEXTLABEL(), EnumWidgetsDemo.TEXTBOX()
              , EnumWidgetsDemo.TEXTAREA(), EnumWidgetsDemo.TEXTINPUT()]
              , [EnumIconsDemo.textlabel(), EnumIconsDemo.textbox()
              , EnumIconsDemo.textarea(), EnumIconsDemo.textinput()])
          + topicOfTheMenu(EnumTextKeysDemo.MENU_BUTTONS()
              , [EnumWidgetsDemo.BUTTONTEXT(), EnumWidgetsDemo.BUTTONLINK()
              , EnumWidgetsDemo.BUTTONBAR(), EnumWidgetsDemo.SWITCHER()]
              , [EnumIconsDemo.buttontext(), EnumIconsDemo.buttonlink()
              , EnumIconsDemo.buttonbar(), EnumIcons.switchon()])
          + topicOfTheMenu(EnumTextKeysDemo.MENU_PICKERS()
              , [EnumWidgetsDemo.COLORPICKER(), EnumWidgetsDemo.COLORPANEL()
              , EnumWidgetsDemo.DATEPICKER(), EnumWidgetsDemo.DATEPANEL()
              , EnumWidgetsDemo.LISTPICKER(), EnumWidgetsDemo.LISTPANEL()]
              , [EnumIconsDemo.colorpicker(), EnumIconsDemo.colorpanel()
              , EnumIconsDemo.pickers(), EnumIcons.calendar()
              , EnumIcons.list(), EnumIcons.listing()])
          + topicOfTheMenu(EnumTextKeysDemo.MENU_CONTENTS()
              , [EnumWidgetsDemo.CONTENTSINGLE(), EnumWidgetsDemo.CONTENTMULTIPLE()
              , EnumWidgetsDemo.WIDGET(), EnumWidgetsDemo.APPLICATION()]
              , [EnumIconsDemo.contentsingle(), EnumIconsDemo.contentmultiple()
              , EnumIconsDemo.widget(), EnumIconsDemo.application()])
          + topicOfTheMenu(EnumTextKeysDemo.MENU_MEDIA()
              , [EnumWidgetsDemo.ICON(), EnumWidgetsDemo.IMAGE()
              , EnumWidgetsDemo.SOUNDPLAYER(), EnumWidgetsDemo.VIDEOPLAYER()
              , EnumWidgetsDemo.CAMERA()]
              , [EnumIcons.circlefull(), EnumIcons.file()
              , EnumIcons.playing(), EnumIcons.doublerightarrow()
              , EnumIconsDemo.camera()])
          + topicOfTheMenu(EnumTextKeysDemo.MENU_OTHERS()
              , [EnumWidgetsDemo.BOARD(), EnumWidgetsDemo.WATCH()
              , EnumWidgetsDemo.RATER(), EnumWidgetsDemo.POTMETER()
              , EnumWidgetsDemo.XMLLISTER(), EnumWidgetsDemo.MORE()]
              , [EnumIconsDemo.board(), EnumIcons.watch()
              , EnumIcons.starfull(), EnumIcons.potmeter()
              , EnumIconsDemo.xmllister(), EnumIcons.more()])
          + topicOfTheMenu(EnumTextKeysDemo.MENU_WEB()
              , [EnumWidgetsDemo.URLREQUEST(), EnumWidgetsDemo.NETCONNECTION()]
              , [EnumIcons.refresharrow(), EnumIcons.lightning()])
          + "</items>";
    }
    /**
     * Reloads the languages, the displaying styles and the menu on the panels of the
     * middleground: every one of them is filled up by this application.
     */
    protected function iniupdates():void
    {
      application.trace("<ApplicationDemo iniupdates> called.", 4);
      getMiddleground().updateLangCodes();
      getMiddleground().updateDisplayingStyles();
      getMiddleground().updateMenuxml();
    }
    /**
     * Sets the language this application is started in.
     */
    protected function inilangcode():void
    {
      application.trace("<ApplicationDemo inilangcode> called.", 4);
      getMiddleground().setLangCode(EnumLanguages.EN());
    }
    /**
     * Sets the way the widgets of this application stand next to each other.
     */
    protected function iniorientation():void
    {
      application.trace("<ApplicationDemo iniorientation> called.", 4);
      getDynamicsConfig().setAppOrientation(EnumOrientations.ORIENTATION_VERTICAL());
    }
    /**
     * Sets the displaying style this application is started in and loads the background
     * image belonging to it.
     */
    protected function inidisplayingstyle():void
    {
      application.trace("<ApplicationDemo inidisplayingstyle> called.", 4);
      getDynamicsConfig().setCurrentDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WOOD_LIGHT());
    }
    /**
     * Displays the name of this application with the icon of the components in front of it.
     */
    protected function inisettingofapplicationname():void
    {
      application.trace("<ApplicationDemo inisettingofapplicationname> called.", 4);
      setApplicationNameWithIcon(EnumIconsDemo.componentusage());
    }
    /**
     * Adds the items of this application to the context menu of it: one of them opens
     * the homepage of the developer, the other one is handled here.
     */
    protected function inicontextmenuitems():void
    {
      application.trace("<ApplicationDemo inicontextmenuitems> called.", 4);
      getContextMenuManager().addNewContextMenuItem("Go to developer homepage", HOMEPAGE_URL, null);
      getContextMenuManager().addNewContextMenuItem("Custom handler also works", null, contextMenuItemClicked);
    }
    /**
     * Opens the first widget of this application. This object may reach the stage more
     * than once, so the content of it is built only once.
     */
    protected function inicreationofthewholecontent():void
    {
      application.trace("<ApplicationDemo inicreationofthewholecontent> called.", 4);
      if (contentCreated)
      {
        application.trace("<ApplicationDemo inicreationofthewholecontent> the content is already built.", 3);
        return;
      }
      contentCreated = true;
      createContent();
    }
    /**
     * Builds one single line of the menu standing under no topic at all: it opens the
     * widget of the given header right away.
     * @param header the header of the widget of that item
     * @param icon the icon standing in front of that item
     */
    private function itemOfTheMenu(header:String, icon:String):String
    {
      application.trace("<ApplicationDemo itemOfTheMenu> called.", 4);
      application.trace("<ApplicationDemo itemOfTheMenu> header: " + header, 3);
      application.trace("<ApplicationDemo itemOfTheMenu> icon: " + icon, 3);
      return "<item opened=\"0\" icon=\"" + icon + "\" value=\"" + header + "\"/>";
    }
    /**
     * Builds one line of the menu holding one topic and every widget under it.
     * @param topic the text key of the topic
     * @param headers the headers of the widgets of that topic
     * @param icons the icons of those widgets, one icon of every one of them
     */
    private function topicOfTheMenu(topic:String, headers:Array, icons:Array):String
    {
      application.trace("<ApplicationDemo topicOfTheMenu> called.", 4);
      application.trace("<ApplicationDemo topicOfTheMenu> topic: " + topic, 3);
      application.trace("<ApplicationDemo topicOfTheMenu> headers: " + headers, 3);
      application.trace("<ApplicationDemo topicOfTheMenu> icons: " + icons, 3);
      if (headers == null || icons == null || headers.length != icons.length)
      {
        this.trace("<ApplicationDemo topicOfTheMenu> every widget of a topic needs an icon of its own!", 6);
        return "";
      }
      var items:String = "<item opened=\"0\" value=\"" + topic + "\">";
      for (var i:int = 0; i < headers.length; i++)
      {
        items += "<item opened=\"0\" icon=\"" + icons[i] + "\" value=\"" + headers[i] + "\"/>";
      }
      return items + "</item>";
    }
    /**
     * Opens the widget this application starts with and plays the signal of it.
     */
    private function createContent():void
    {
      application.trace("<ApplicationDemo createContent> called.", 4);
      WidgetManagerDemo(getWidgetManager()).openWidget(WIDGET_TO_OPEN);
      getSoundManager().playSound(EnumSoundsDemo.signal());
    }
    /**
     * An item of the context menu that is handled here has been clicked, so an alert
     * of it is displayed on the foreground.
     * @param e the click event of that context menu item
     */
    private function contextMenuItemClicked(e:ContextMenuEvent):void
    {
      application.trace("<ApplicationDemo contextMenuItemClicked> called.", 4);
      application.trace("<ApplicationDemo contextMenuItemClicked> e: " + e, 3);
      if (getForeground() == null)
      {
        this.trace("<ApplicationDemo contextMenuItemClicked> there is no foreground to display the alert on!", 6);
        return;
      }
      const uniqueString:String = getUtils().getRandomGuid();
      const okType:String = uniqueString + EnumOkCancel.OC_OK();
      const okFunction:Function = function(event:Event):void
      {
        getBaseEventDispatcher().removeEventListener(okType, okFunction);
        getForeground().closeAlert(uniqueString);
        event.stopImmediatePropagation();
      };
      getBaseEventDispatcher().addEventListener(okType, okFunction);
      getForeground().createAlert(EnumTextKeysDemo.COMPONENTS_USAGE(), uniqueString, true, false);
    }
    /**
     * Destroys this object and frees up everything.
     */
    override public function destroy():void
    {
      application.trace("<ApplicationDemo destroy> called.", 4);
      application.trace("<ApplicationDemo destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<ApplicationDemo destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<ApplicationDemo destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<ApplicationDemo destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      contentCreated = false;
    }
  }
}
