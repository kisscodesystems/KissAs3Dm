/**
 * This class is a part of the KissAs3Dm demo application.
 * See the header comment lines of the
 * com.kisscodesystems.KissAs3Fw.Application
 * The whole framework is available at:
 * https://github.com/kisscodesystems/KissAs3Fw
 * Demo applications:
 * https://github.com/kisscodesystems/KissAs3Dm
 *
 * DESCRIPTION:
 * QuickUIDemo.
 * The reference application of this framework: it builds one of every component of
 * the ui package on one single screen, without the layers of the framework, and it
 * calls every publicly reachable method of every one of them.
 *
 * MAIN FEATURES:
 * - it replaces the configurations and the managers of the framework with the ones
 *   of this application, so the embedded icons, sounds, emojis and labels of it
 *   are the ones of the KissAs3Dm resources
 * - every component gets a create method of its own, and those methods are the
 *   working examples of the usage of the components
 * - it shows the components themselves only: the application built of them is the
 *   com.kisscodesystems.KissAs3Dm.ApplicationDemo
 * - the tracing is switched off while the components are built and it is switched
 *   back on at the end, otherwise the log of one single frame would be unreadable
 */
package com.kisscodesystems.KissAs3Dm
{
  import com.kisscodesystems.KissAs3Dm.config.ComponentsConfigDemo;
  import com.kisscodesystems.KissAs3Dm.config.DynamicsConfigDemo;
  import com.kisscodesystems.KissAs3Dm.config.PropertiesConfigDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumSoundsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.manager.IconManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.LabelManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.NetConnectionManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.SoundManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.UrlRequestManagerDemo;
  import com.kisscodesystems.KissAs3Dm.manager.WidgetManagerDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.base.BaseEventDispatcher;
  import com.kisscodesystems.KissAs3Fw.base.BaseScroll;
  import com.kisscodesystems.KissAs3Fw.base.BaseSprite;
  import com.kisscodesystems.KissAs3Fw.base.BaseTextField;
  import com.kisscodesystems.KissAs3Fw.enum.EnumAppEnvs;
  import com.kisscodesystems.KissAs3Fw.enum.EnumBaseShapeTypes;
  import com.kisscodesystems.KissAs3Fw.enum.EnumCameraResolutions;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEmojis;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.enum.EnumOrientations;
  import com.kisscodesystems.KissAs3Fw.enum.EnumSounds;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextKeys;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes;
  import com.kisscodesystems.KissAs3Fw.enum.EnumWidgetModes;
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
  import flash.display.BitmapData;
  import flash.events.Event;
  import flash.utils.ByteArray;
  public class QuickUIDemo extends Application
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
    // the number of the sample items the two list objects are filled up with
    private const LIST_SAMPLE_ITEMS:int = 10;
    [Embed(source = "resource/others/privacyPolicyEN", mimeType = "application/octet-stream")]
    private var privacyPolicyClassEN:Class;
    private var privacyPolicyByteArrayEN:ByteArray = new privacyPolicyClassEN() as ByteArray;
    private var privacyPolicyEN:String = privacyPolicyByteArrayEN.toString();
    [Embed(source = "resource/others/privacyPolicyHU", mimeType = "application/octet-stream")]
    private var privacyPolicyClassHU:Class;
    private var privacyPolicyByteArrayHU:ByteArray = new privacyPolicyClassHU() as ByteArray;
    private var privacyPolicyHU:String = privacyPolicyByteArrayHU.toString();
    private var icon:Icon = null;
    private var textLabel:TextLabel = null;
    private var buttonText:ButtonText = null;
    private var buttonLink:ButtonLink = null;
    private var switcher:Switcher = null;
    private var textInput:TextInput = null;
    private var soundPlayer:SoundPlayer = null;
    private var image:Image = null;
    private var camera:Camera = null;
    private var videoPlayer:VideoPlayer = null;
    private var textBox:TextBox = null;
    private var textArea:TextArea = null;
    private var buttonBar:ButtonBar = null;
    private var contentSingle:ContentSingle = null;
    private var contentMultiple:ContentMultiple = null;
    private var widget:Widget = null;
    private var listPanel:ListPanel = null;
    private var listPicker:ListPicker = null;
    private var textLabelWithReact:TextLabel = null;
    private var colorPanel:ColorPanel = null;
    private var colorPicker:ColorPicker = null;
    private var watch:Watch = null;
    private var more:More = null;
    private var rater:Rater = null;
    private var potmeter:Potmeter = null;
    private var datePicker:DatePicker = null;
    private var xmlLister:XmlLister = null;
    private var datePanel:DatePanel = null;
    private var board:Board = null;
    // the sample items of the two list objects, they are built once and shared by both
    private var listSampleLabels:Array = null;
    private var listSampleValues:Array = null;
    private var listSampleIcons:Array = null;
    private var listSampleTabcnts:Array = null;
    /**
     * Constructs the demo application.
     */
    public function QuickUIDemo():void
    {
      try
      {
        super();
        appEnv = EnumAppEnvs.appEnvDev();
        application.trace("<QuickUIDemo> constructed.", 4);
      }
      catch (e:*)
      {
        this.trace("<QuickUIDemo> main error: " + e, 7);
      }
    }
    /**
     * The width of this application is the one of the stage, so it cannot be set here.
     * @param newdw the new width
     */
    override public function setDw(newdw:int):void
    {
      application.trace("<QuickUIDemo setDw> called.", 4);
      application.trace("<QuickUIDemo setDw> newdw: " + newdw, 3);
      application.trace("<QuickUIDemo setDw> do nothing.", 4);
    }
    /**
     * The height of this application is the one of the stage, so it cannot be set here.
     * @param newdh the new height
     */
    override public function setDh(newdh:int):void
    {
      application.trace("<QuickUIDemo setDh> called.", 4);
      application.trace("<QuickUIDemo setDh> newdh: " + newdh, 3);
      application.trace("<QuickUIDemo setDh> do nothing.", 4);
    }
    /**
     * The dimensions of this application are the ones of the stage, so they cannot be
     * set here.
     * @param newdw the new width
     * @param newdh the new height
     */
    override public function setDwh(newdw:int, newdh:int):void
    {
      application.trace("<QuickUIDemo setDwh> called.", 4);
      application.trace("<QuickUIDemo setDwh> newdw: " + newdw, 3);
      application.trace("<QuickUIDemo setDwh> newdh: " + newdh, 3);
      application.trace("<QuickUIDemo setDwh> do nothing.", 4);
    }
    /**
     * The properties config of this application replaces the one of the framework.
     */
    override protected function initializePropertiesConfig():void
    {
      application.trace("<QuickUIDemo initializePropertiesConfig> called.", 4);
      propertiesConfig = new PropertiesConfigDemo(this);
    }
    /**
     * The components config of this application replaces the one of the framework.
     */
    override protected function initializeComponentsConfig():void
    {
      application.trace("<QuickUIDemo initializeComponentsConfig> called.", 4);
      componentsConfig = new ComponentsConfigDemo(this);
    }
    /**
     * The dynamics config of this application replaces the one of the framework.
     */
    override protected function initializeDynamicsConfig():void
    {
      application.trace("<QuickUIDemo initializeDynamicsConfig> called.", 4);
      dynamicsConfig = new DynamicsConfigDemo(this);
    }
    /**
     * The label manager of this application replaces the one of the framework.
     */
    override protected function initializeLabelManager():void
    {
      application.trace("<QuickUIDemo initializeLabelManager> called.", 4);
      labelManager = new LabelManagerDemo(this);
    }
    /**
     * The widget manager of this application replaces the one of the framework.
     */
    override protected function initializeWidgetManager():void
    {
      application.trace("<QuickUIDemo initializeWidgetManager> called.", 4);
      widgetManager = new WidgetManagerDemo(this);
    }
    /**
     * The url request manager of this application replaces the one of the framework.
     */
    override protected function initializeUrlRequestManager():void
    {
      application.trace("<QuickUIDemo initializeUrlRequestManager> called.", 4);
      urlRequestManager = new UrlRequestManagerDemo(this);
    }
    /**
     * The net connection manager of this application replaces the one of the framework.
     */
    override protected function initializeNetConnectionManager():void
    {
      application.trace("<QuickUIDemo initializeNetConnectionManager> called.", 4);
      netConnectionManager = new NetConnectionManagerDemo(this);
    }
    /**
     * The icon manager of this application replaces the one of the framework.
     */
    override protected function initializeIconManager():void
    {
      application.trace("<QuickUIDemo initializeIconManager> called.", 4);
      iconManager = new IconManagerDemo(this);
    }
    /**
     * The sound manager of this application replaces the one of the framework.
     */
    override protected function initializeSoundManager():void
    {
      application.trace("<QuickUIDemo initializeSoundManager> called.", 4);
      soundManager = new SoundManagerDemo(this);
    }
    /**
     * Builds one of every component of the ui package. Every component has a create
     * method of its own below, and every one of those calls every publicly reachable
     * method of the component it belongs to.
     */
    override protected function createObjects():void
    {
      application.trace("<QuickUIDemo createObjects> called.", 4);
      createIcon();
      createTextLabel();
      // NOTE: the tracing is switched off here and switched back on at the very end of
      // this method. One single frame of the building below produces tens of thousands of
      // messages, and neither a human nor the tracer is able to follow that. Keep in mind
      // that an error thrown by any of the calls below is swallowed by the catch of the
      // constructor of the Application without a single word while this level is nine.
      setTraceLevel(9);
      createButtonText();
      createButtonLink();
      createSwitcher();
      createSoundPlayer();
      createTextBox();
      createTextArea();
      createButtonBar();
      createContentSingle();
      createContentMultiple();
      createWidget();
      createListSamples();
      createListPanel();
      createListPicker();
      createColorPanel();
      createColorPicker();
      createTextLabelWithReact();
      createWatch();
      createMore();
      createRater();
      createPotmeter();
      createDatePicker();
      createXmlLister();
      // these three take their positions from the objects above: the camera stands under
      // the watch, the player under the label that can be reacted to and the picture next
      // to the lister of the xml, so every one of those has to be created before them.
      // The camera is the first of the three because the box of that picture is as wide
      // as the very pixel the picture of this camera ends at
      createCamera();
      createVideoPlayer();
      createImage();
      createTextInput();
      createDatePanel();
      createBoard();
      setTraceLevel(0);
    }
    /**
     * Builds the sample items of the two list objects: ten of them, every second one
     * carrying an icon and every third one being indented by one tabulator.
     */
    private function createListSamples():void
    {
      application.trace("<QuickUIDemo createListSamples> called.", 4);
      listSampleLabels = new Array();
      listSampleValues = new Array();
      listSampleIcons = new Array();
      listSampleTabcnts = new Array();
      for (var i:int = 0; i < LIST_SAMPLE_ITEMS; i++)
      {
        listSampleLabels.push("The item of the index " + i);
        listSampleValues.push("value" + i);
        listSampleIcons.push(i % 2 == 0 ? EnumIconsDemo.board() : "");
        listSampleTabcnts.push(i % 3 == 0 ? i : 0);
      }
    }
    /**
     * Builds and exercises the Icon object: every method of it is called at least once.
     */
    private function createIcon():void
    {
      application.trace("<QuickUIDemo createIcon> called.", 4);
      icon = new Icon(this);
      addChild(icon);
      // as Icon
      icon.destBitmapData();
      icon.drawBitmapData(EnumIconsDemo.buttons(), EnumTextTypes.TEXT_TYPE_BRIGHT(), 70);
      const iconIconType:String = icon.getIconType();
      const iconTextType:String = icon.getTextType();
      const iconIconSize:int = icon.getIconSize();
      application.trace("<QuickUIDemo createIcon> iconIconType: " + iconIconType, 3);
      application.trace("<QuickUIDemo createIcon> iconTextType: " + iconTextType, 3);
      application.trace("<QuickUIDemo createIcon> iconIconSize: " + iconIconSize, 3);
      // as BaseSprite
      icon.mouseDownForScrollingEnabled = true;
      icon.setCx(10);
      icon.setCy(10);
      icon.setCxy(getDynamicsConfig().getAppPadding(), getDynamicsConfig().getAppPadding());
      icon.setDw(200); // do nothing
      icon.setDh(200); // do nothing
      icon.setDwh(200, 200); // do nothing
      icon.updateCxy();
      const iconX:int = icon.getCx();
      const iconY:int = icon.getCy();
      const iconW:int = icon.getDw();
      const iconH:int = icon.getDh();
      // the x coordinate increased by the width, the margin and the padding
      const iconXwmp:int = icon.getCx(true, true, true);
      // the y coordinate increased by the height, the margin and the padding
      const iconYhmp:int = icon.getCy(true, true, true);
      application.trace("<QuickUIDemo createIcon> iconXwmp: " + iconXwmp, 3);
      application.trace("<QuickUIDemo createIcon> iconYhmp: " + iconYhmp, 3);
      icon.setValue(1);
      const iconValue:Object = icon.getValue();
      icon.setEnabled(true);
      const iconEnabled:Boolean = icon.getEnabled();
      icon.toTheLowestDepth();
      icon.toTheHighestDepth();
      icon.setSpriteVisible(false);
      icon.setSpriteVisible(true);
      icon.setEventDispatcherObjectToThis();
      icon.toBeVisible();
      icon.setSoundTypeClick(EnumSounds.button());
      icon.setSoundTypeClick(null);
    }
    /**
     * Builds and exercises the TextLabel object: every method of it is called at least once.
     */
    private function createTextLabel():void
    {
      application.trace("<QuickUIDemo createTextLabel> called.", 4);
      textLabel = new TextLabel(this);
      addChild(textLabel);
      // as TextLabel
      textLabel.setLabel("Asdf " + EnumTextKeysDemo.COMPONENTS_USAGE());
      textLabel.setIcon(EnumIconsDemo.camera());
      textLabel.destIcon();
      textLabel.setIcon(EnumIconsDemo.camera());
      const textLabelIcon:Icon = textLabel.getIcon();
      const textLabelIconType:String = textLabel.getIconType();
      const textLabelBaseTextField:BaseTextField = textLabel.getBaseTextField();
      const textLabelLabel:String = textLabel.getLabel();
      const textLabelType:String = textLabel.getType();
      textLabel.setType(EnumTextTypes.TEXT_TYPE_DARK());
      textLabel.setMaxWidth(120, true);
      // as BaseSprite
      textLabel.setCx(10);
      textLabel.setCy(10);
      textLabel.setCxy(icon.getCx(), icon.getCy(true, true));
      textLabel.setDw(200); // do nothing
      textLabel.setDh(200); // do nothing
      textLabel.setDwh(200, 200); // do nothing
      textLabel.updateCxy();
      const textLabelX:int = textLabel.getCx();
      const textLabelY:int = textLabel.getCy();
      const textLabelW:int = textLabel.getDw();
      const textLabelH:int = textLabel.getDh();
      textLabel.setValue(2);
      const textLabelValue:Object = textLabel.getValue();
      textLabel.setEnabled(true);
      const textLabelEnabled:Boolean = textLabel.getEnabled();
      textLabel.toTheLowestDepth();
      textLabel.toTheHighestDepth();
      textLabel.setSpriteVisible(false);
      textLabel.setSpriteVisible(true);
      textLabel.setEventDispatcherObjectToThis();
      textLabel.toBeVisible();
      textLabel.setSoundTypeClick(EnumSounds.confirm());
      textLabel.setSoundTypeClick(null);
    }
    /**
     * Builds and exercises the ButtonText object: every method of it is called at least once.
     */
    private function createButtonText():void
    {
      application.trace("<QuickUIDemo createButtonText> called.", 4);
      buttonText = new ButtonText(this);
      addChild(buttonText);
      // as ButtonText
      buttonText.setIcon(EnumIconsDemo.board());
      buttonText.setLabel(EnumTextKeys.SETTING_BACKGROUND_ALIGN());
      const buttonTextLabel:String = buttonText.getLabel();
      application.trace("<QuickUIDemo createButtonText> buttonTextLabel: " + buttonTextLabel, 3);
      // as BaseWorkingButton
      buttonText.setCustomEventString(EnumEvents.EVENT_CLICK());
      buttonText.setCustomEventString(null);
      const buttonTextContentSprite:BaseSprite = buttonText.getContentSprite();
      application.trace("<QuickUIDemo createButtonText> buttonTextContentSprite: " + buttonTextContentSprite, 3);
      buttonText.setBaseWorkingButtonVisible(false);
      buttonText.setBaseWorkingButtonVisible(true);
      buttonText.onRollOut();
      // as BaseSprite
      buttonText.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), buttonTextClicked);
      buttonText.setCx(10);
      buttonText.setCy(10);
      buttonText.setCxy(textLabel.getCx(), textLabel.getCy(true, true));
      buttonText.setDw(200); // do nothing
      buttonText.setDh(200); // do nothing
      buttonText.setDwh(200, 200); // do nothing
      buttonText.updateCxy();
      const buttonTextX:int = buttonText.getCx();
      const buttonTextY:int = buttonText.getCy();
      const buttonTextW:int = buttonText.getDw();
      const buttonTextH:int = buttonText.getDh();
      buttonText.setValue(3);
      const buttonTextValue:Object = buttonText.getValue();
      buttonText.setEnabled(true);
      const buttonTextEnabled:Boolean = buttonText.getEnabled();
      buttonText.toTheLowestDepth();
      buttonText.toTheHighestDepth();
      buttonText.setSpriteVisible(false);
      buttonText.setSpriteVisible(true);
      buttonText.setEventDispatcherObjectToThis();
      buttonText.toBeVisible();
      buttonText.setSoundTypeClick(EnumSounds.button());
    }
    /**
     * Builds and exercises the ButtonLink object: every method of it is called at least once.
     */
    private function createButtonLink():void
    {
      application.trace("<QuickUIDemo createButtonLink> called.", 4);
      buttonLink = new ButtonLink(this);
      addChild(buttonLink);
      // as ButtonLink
      buttonLink.setIcon(EnumIconsDemo.pickers());
      buttonLink.destIcon();
      buttonLink.setIcon(EnumIconsDemo.pickers());
      buttonLink.setLabel(EnumTextKeys.BACKGROUND_ALIGN_MOSAIC());
      const buttonLinkIconType:String = buttonLink.getIconType();
      const buttonLinkLabel:String = buttonLink.getLabel();
      buttonLink.setType(EnumBaseShapeTypes.BASE_SHAPE_TYPE_FLAT());
      const buttonLinkType:int = buttonLink.getType();
      buttonLink.onRollOut();
      buttonLink.setUrl("https://index.hu");
      buttonLink.setPostData(null, null);
      buttonLink.setMaxWidth(140, true);
      // as BaseSprite
      buttonLink.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), buttonLinkClicked);
      buttonLink.setCx(10);
      buttonLink.setCy(10);
      buttonLink.setCxy(buttonText.getCx(), buttonText.getCy(true, true));
      buttonLink.setDw(200); // do nothing
      buttonLink.setDh(200); // do nothing
      buttonLink.setDwh(200, 200); // do nothing
      buttonLink.updateCxy();
      const buttonLinkX:int = buttonLink.getCx();
      const buttonLinkY:int = buttonLink.getCy();
      const buttonLinkW:int = buttonLink.getDw();
      const buttonLinkH:int = buttonLink.getDh();
      buttonLink.setValue(4);
      const buttonLinkValue:Object = buttonLink.getValue();
      buttonLink.setEnabled(true);
      const buttonLinkEnabled:Boolean = buttonLink.getEnabled();
      buttonLink.toTheLowestDepth();
      buttonLink.toTheHighestDepth();
      buttonLink.setSpriteVisible(false);
      buttonLink.setSpriteVisible(true);
      buttonLink.setEventDispatcherObjectToThis();
      buttonLink.toBeVisible();
      buttonLink.setSoundTypeClick(EnumSounds.confirm());
      buttonLink.setSoundTypeClick(null);
    }
    /**
     * Builds and exercises the Switcher object: every method of it is called at least once.
     */
    private function createSwitcher():void
    {
      application.trace("<QuickUIDemo createSwitcher> called.", 4);
      switcher = new Switcher(this);
      addChild(switcher);
      // as Switcher
      switcher.setIcons(EnumIcons.switchon(), EnumIcons.switchoff());
      switcher.setLabels(EnumTextKeys.BACKGROUND_ALIGN_CENTER3(), EnumTextKeys.BACKGROUND_ALIGN_NONE());
      switcher.setStates(EnumTextKeys.YN_YES(), EnumTextKeys.YN_NO());
      const switcherObjectState:String = switcher.getObjectState();
      switcher.setObjectState(EnumTextKeys.YN_YES(), false);
      switcher.setOn(false, false);
      switcher.setOn(true, true);
      const switcherOn:Boolean = switcher.getOn();
      // as ButtonLink
      switcher.setIcon("asdf"); // do nothing
      switcher.destIcon(); // do nothing
      switcher.setLabel("asdf"); // do nothing
      const switcherIconType:String = switcher.getIconType();
      const switcherLabel:String = switcher.getLabel();
      switcher.setType(EnumBaseShapeTypes.BASE_SHAPE_TYPE_FLAT());
      const switcherType:int = switcher.getType();
      switcher.onRollOut();
      switcher.setUrl("https://index.hu"); // do nothing
      switcher.setPostData([""], [""]); // do nothing
      switcher.setMaxWidth(100, true);
      // as BaseSprite
      switcher.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), switcherChanged);
      switcher.setCx(10);
      switcher.setCy(10);
      switcher.setCxy(buttonLink.getCx(), buttonLink.getCy(true, true));
      switcher.setDw(200); // do nothing
      switcher.setDh(200); // do nothing
      switcher.setDwh(200, 200); // do nothing
      switcher.updateCxy();
      const switcherX:int = switcher.getCx();
      const switcherY:int = switcher.getCy();
      const switcherW:int = switcher.getDw();
      const switcherH:int = switcher.getDh();
      switcher.setValue(5);
      const switcherValue:Object = switcher.getValue();
      switcher.setEnabled(true);
      const switcherEnabled:Boolean = switcher.getEnabled();
      switcher.toTheLowestDepth();
      switcher.toTheHighestDepth();
      switcher.setSpriteVisible(false);
      switcher.setSpriteVisible(true);
      switcher.setEventDispatcherObjectToThis();
      switcher.toBeVisible();
      switcher.setSoundTypeClick(EnumSounds.confirm());
      switcher.setSoundTypeClick(null);
    }
    /**
     * Builds and exercises the TextInput object: every method of it is called at least once.
     */
    private function createTextInput():void
    {
      application.trace("<QuickUIDemo createTextInput> called.", 4);
      textInput = new TextInput(this);
      addChild(textInput);
      // as TextInput
      textInput.clearHint();
      textInput.setHint("My very and very long hint..");
      textInput.setLabel("Example text");
      textInput.setDisplayAsPassword(true);
      textInput.toFocus();
      const textInputInFocus:Boolean = textInput.isInFocus();
      const textInputText:String = textInput.getText();
      textInput.setTextToUpperCase();
      textInput.setRestrict("[a-z]");
      textInput.setMaxChars(100);
      textInput.setMinChars(3);
      const textInputIsAtLeastLength:Boolean = textInput.getTextIsAtLeastLength();
      textInput.setEnabled(false);
      textInput.setDisplayAsPassword(false);
      // as BaseSprite
      textInput.setCx(10);
      textInput.setCy(10);
      textInput.setCxy(xmlLister.getCx(), xmlLister.getCy(true, true));
      textInput.setDw(200);
      textInput.setDh(200); // do nothing
      textInput.setDwh(200, 200); // do nothing
      textInput.updateCxy();
      const textInputX:int = textInput.getCx();
      const textInputY:int = textInput.getCy();
      const textInputW:int = textInput.getDw();
      const textInputH:int = textInput.getDh();
      textInput.setValue(5);
      const textInputValue:Object = textInput.getValue();
      textInput.setEnabled(true);
      const textInputEnabled:Boolean = textInput.getEnabled();
      textInput.toTheLowestDepth();
      textInput.toTheHighestDepth();
      textInput.setSpriteVisible(false);
      textInput.setSpriteVisible(true);
      textInput.setEventDispatcherObjectToThis();
      textInput.toBeVisible();
      textInput.setSoundTypeClick(EnumSounds.open());
      textInput.setSoundTypeClick(null);
      textInput.addAutoCompleteElements("abcd|aabbccdd|aaabbbcccddd|aaaabbbbccccdddd", "|");
    }
    /**
     * Builds and exercises the SoundPlayer object: every method of it is called at least once.
     */
    private function createSoundPlayer():void
    {
      application.trace("<QuickUIDemo createSoundPlayer> called.", 4);
      soundPlayer = new SoundPlayer(this);
      addChild(soundPlayer);
      // as SoundPlayer
      soundPlayer.setSoundTypeAndName(EnumSoundsDemo.sample(), "My embedded sample sound to play");
      const soundType:String = soundPlayer.getSoundType();
      const soundName:String = soundPlayer.getSoundName();
      const soundLengthMillis:Number = soundPlayer.getSoundLengthMillis();
      const soundLengthBytes:Number = soundPlayer.getSoundLengthBytes();
      const soundMaxSecs:int = soundPlayer.getSoundMaxSecs();
      const soundIsPlaying:Boolean = soundPlayer.isPlaying();
      soundPlayer.play();
      soundPlayer.pause();
      soundPlayer.stop();
      // as BaseSprite
      soundPlayer.setCx(10);
      soundPlayer.setCy(10);
      soundPlayer.setDh(300); // do nothing
      soundPlayer.setDwh(300, 300); // do nothing
      soundPlayer.setCxy(switcher.getCx(), switcher.getCy(true, true));
      soundPlayer.setDw(333);
      soundPlayer.updateCxy();
      const soundPlayerX:int = soundPlayer.getCx();
      const soundPlayerY:int = soundPlayer.getCy();
      const soundPlayerW:int = soundPlayer.getDw();
      const soundPlayerH:int = soundPlayer.getDh();
      soundPlayer.setValue(56);
      const soundPlayerValue:Object = soundPlayer.getValue();
      soundPlayer.setEnabled(true);
      const soundPlayerEnabled:Boolean = soundPlayer.getEnabled();
      soundPlayer.toTheLowestDepth();
      soundPlayer.toTheHighestDepth();
      soundPlayer.setSpriteVisible(false);
      soundPlayer.setSpriteVisible(true);
      soundPlayer.setEventDispatcherObjectToThis();
      soundPlayer.toBeVisible();
      soundPlayer.setSoundTypeClick(null); // do nothing
    }
    /**
     * Builds and exercises the Image object: every method of it is called at least once.
     * The picture of it is the embedded background image of the framework, so it stands
     * there without a loading, and one of the sample pictures of the site of this
     * framework is asked for as well: that one arrives frames later. The box of it ends
     * where the picture of the camera does, so the camera has to be created before it.
     */
    private function createImage():void
    {
      application.trace("<QuickUIDemo createImage> called.", 4);
      image = new Image(this);
      addChild(image);
      // as Image
      image.setBitmapData(getBackgroundManager().getEmbeddedBackgroundBitmap().bitmapData);
      const imageBitmapData:BitmapData = image.getBitmapData();
      const imageBitmapDw:int = image.getBitmapDw();
      const imageBitmapDh:int = image.getBitmapDh();
      application.trace("<QuickUIDemo createImage> imageBitmapData: " + imageBitmapData, 3);
      application.trace("<QuickUIDemo createImage> imageBitmapDw: " + imageBitmapDw, 3);
      application.trace("<QuickUIDemo createImage> imageBitmapDh: " + imageBitmapDh, 3);
      image.setFrame(true);
      image.setFitToBox(true);
      image.setResizable(true);
      image.setInSquare(false);
      const imageFrame:Boolean = image.getFrame();
      const imageFitToBox:Boolean = image.getFitToBox();
      const imageResizable:Boolean = image.getResizable();
      const imageInSquare:Boolean = image.getInSquare();
      application.trace("<QuickUIDemo createImage> imageFrame: " + imageFrame, 3);
      application.trace("<QuickUIDemo createImage> imageFitToBox: " + imageFitToBox, 3);
      application.trace("<QuickUIDemo createImage> imageResizable: " + imageResizable, 3);
      application.trace("<QuickUIDemo createImage> imageInSquare: " + imageInSquare, 3);
      image.setFullscreenEnabled(true);
      image.openFullscreen();
      image.closeFullscreen();
      const imageFullscreenEnabled:Boolean = image.getFullscreenEnabled();
      const imageFullscreenOpened:Boolean = image.isFullscreenOpened();
      application.trace("<QuickUIDemo createImage> imageFullscreenEnabled: " + imageFullscreenEnabled, 3);
      application.trace("<QuickUIDemo createImage> imageFullscreenOpened: " + imageFullscreenOpened, 3);
      image.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_FILE_LOADED(), imageFileLoaded);
      // the sample pictures of the site of this framework, one of every usual resolution:
      // this one arrives frames later, so the picture above is the one that is seen first
      image.setPostData(["user", "fileurl"], [getUser().getUsername(), "sample_640x360.png"]);
      const imageNumOfPostData:int = image.getNumOfPostData();
      application.trace("<QuickUIDemo createImage> imageNumOfPostData: " + imageNumOfPostData, 3);
      image.setPostData(null, null);
      image.loadUrl("https://app1.kisscodesystems.com/kcsops/samples/sample_640x360.png", 500);
      const imageUrl:String = image.getUrl();
      const imageLoading:Boolean = image.isLoading();
      const imagePictureLoaded:Boolean = image.isPictureLoaded();
      application.trace("<QuickUIDemo createImage> imageUrl: " + imageUrl, 3);
      application.trace("<QuickUIDemo createImage> imageLoading: " + imageLoading, 3);
      application.trace("<QuickUIDemo createImage> imagePictureLoaded: " + imagePictureLoaded, 3);
      // as BaseReact
      image.setReactEnabled(true);
      image.addHit("anna", EnumEmojis.hands_thumbsup(), new Date());
      image.addHit("bela", EnumEmojis.hands_thumbsup(), new Date());
      image.removeHit("bela", EnumEmojis.hands_thumbsup());
      const imageNumOfHits:int = image.getNumOfHits();
      const imageHits:Array = image.getHits();
      const imageNumOfHitsOfEmoji:int = image.getNumOfHitsOfEmoji(EnumEmojis.hands_thumbsup());
      const imageEmojiTypesByHits:Array = image.getEmojiTypesByHits();
      const imageHasHitOfUser:Boolean = image.hasHitOfUser("anna", EnumEmojis.hands_thumbsup());
      application.trace("<QuickUIDemo createImage> imageNumOfHits: " + imageNumOfHits, 3);
      application.trace("<QuickUIDemo createImage> imageHits: " + imageHits, 3);
      application.trace("<QuickUIDemo createImage> imageNumOfHitsOfEmoji: " + imageNumOfHitsOfEmoji, 3);
      application.trace("<QuickUIDemo createImage> imageEmojiTypesByHits: " + imageEmojiTypesByHits, 3);
      application.trace("<QuickUIDemo createImage> imageHasHitOfUser: " + imageHasHitOfUser, 3);
      image.openPicker();
      const imagePickerOpened:Boolean = image.isPickerOpened();
      application.trace("<QuickUIDemo createImage> imagePickerOpened: " + imagePickerOpened, 3);
      image.closePicker();
      image.clearHits();
      const imageReactEnabled:Boolean = image.getReactEnabled();
      application.trace("<QuickUIDemo createImage> imageReactEnabled: " + imageReactEnabled, 3);
      // as BaseSprite
      image.setCx(10);
      image.setCy(10);
      image.setCxy(xmlLister.getCx(true, true), xmlLister.getCy());
      // the dimensions given to a picture are the box it is drawn inside, and this box
      // ends at the very pixel the picture of the camera does: it is as wide as the space
      // between the lister of the xml and that ending, and it is a square one
      const imageBoxDwh:int = camera.getCx(true) - image.getCx();
      image.setDw(200);
      image.setDh(200);
      image.setDwh(imageBoxDwh, imageBoxDwh);
      const imageBoxDw:int = image.getBoxDw();
      const imageBoxDh:int = image.getBoxDh();
      application.trace("<QuickUIDemo createImage> imageBoxDw: " + imageBoxDw, 3);
      application.trace("<QuickUIDemo createImage> imageBoxDh: " + imageBoxDh, 3);
      image.updateCxy();
      const imageX:int = image.getCx();
      const imageY:int = image.getCy();
      const imageW:int = image.getDw();
      const imageH:int = image.getDh();
      const imageContentDw:int = image.getContentDw();
      const imageContentDh:int = image.getContentDh();
      application.trace("<QuickUIDemo createImage> imageX: " + imageX, 3);
      application.trace("<QuickUIDemo createImage> imageY: " + imageY, 3);
      application.trace("<QuickUIDemo createImage> imageW: " + imageW, 3);
      application.trace("<QuickUIDemo createImage> imageH: " + imageH, 3);
      application.trace("<QuickUIDemo createImage> imageContentDw: " + imageContentDw, 3);
      application.trace("<QuickUIDemo createImage> imageContentDh: " + imageContentDh, 3);
      image.setValue(11);
      const imageValue:Object = image.getValue();
      application.trace("<QuickUIDemo createImage> imageValue: " + imageValue, 3);
      image.setEnabled(true);
      const imageEnabled:Boolean = image.getEnabled();
      application.trace("<QuickUIDemo createImage> imageEnabled: " + imageEnabled, 3);
      image.toTheLowestDepth();
      image.toTheHighestDepth();
      image.setSpriteVisible(false);
      image.setSpriteVisible(true);
      image.setEventDispatcherObjectToThis();
      image.toBeVisible();
      image.setSoundTypeClick(EnumSounds.button());
      image.setSoundTypeClick(null);
    }
    /**
     * Builds and exercises the VideoPlayer object: every method of it is called at least
     * once. The chapters of it are the sample videos of the site of this framework, so
     * the picture of the first one arrives frames later, and the playing is stopped right
     * away: this application demonstrates that every call can be made and it watches
     * nothing at all.
     */
    private function createVideoPlayer():void
    {
      application.trace("<QuickUIDemo createVideoPlayer> called.", 4);
      videoPlayer = new VideoPlayer(this);
      addChild(videoPlayer);
      // as VideoPlayer
      videoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_PLAYED_BY_HAND(), videoPlayerPlayed);
      videoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_PLAYED_BY_OUTSIDE(), videoPlayerPlayed);
      videoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_STOPPED_BY_END(), videoPlayerStopped);
      videoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_STOPPED_BY_HAND(), videoPlayerStopped);
      videoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), videoPlayerChanged);
      videoPlayer.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHAPTER_CHANGED(), videoPlayerChapterChanged);
      videoPlayer.setFrame(true);
      const videoPlayerFrame:Boolean = videoPlayer.getFrame();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerFrame: " + videoPlayerFrame, 3);
      videoPlayer.setResizable(true);
      const videoPlayerResizable:Boolean = videoPlayer.getResizable();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerResizable: " + videoPlayerResizable, 3);
      videoPlayer.setAutoContinue(true);
      const videoPlayerAutoContinue:Boolean = videoPlayer.getAutoContinue();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerAutoContinue: " + videoPlayerAutoContinue, 3);
      videoPlayer.setPreview(true);
      const videoPlayerPreview:Boolean = videoPlayer.getPreview();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerPreview: " + videoPlayerPreview, 3);
      videoPlayer.setFullscreenEnabled(true);
      videoPlayer.openFullscreen();
      videoPlayer.closeFullscreen();
      const videoPlayerFullscreenEnabled:Boolean = videoPlayer.getFullscreenEnabled();
      const videoPlayerFullscreenOpened:Boolean = videoPlayer.isFullscreenOpened();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerFullscreenEnabled: " + videoPlayerFullscreenEnabled, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerFullscreenOpened: " + videoPlayerFullscreenOpened, 3);
      videoPlayer.setChapterListEnabled(true);
      videoPlayer.openChapterList();
      videoPlayer.closeChapterList();
      const videoPlayerChapterListEnabled:Boolean = videoPlayer.getChapterListEnabled();
      const videoPlayerChapterListOpened:Boolean = videoPlayer.isChapterListOpened();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerChapterListEnabled: " + videoPlayerChapterListEnabled, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerChapterListOpened: " + videoPlayerChapterListOpened, 3);
      // the name of the chapter and the controls of the player stand on the picture of the
      // video, and the layer of them is taken off that picture and displayed again here:
      // the inactivity of the mouse over the video is the one taking it off by itself
      videoPlayer.setControlsVisible(false);
      videoPlayer.setControlsVisible(true);
      const videoPlayerControlsVisible:Boolean = videoPlayer.getControlsVisible();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerControlsVisible: " + videoPlayerControlsVisible, 3);
      // the chapters can be dropped at any moment: a player of no chapter at all displays
      // no picture and it plays nothing, and this one is empty here, so this only proves
      // that the call can be made before the real chapters are handed over below
      videoPlayer.clearChapters();
      const videoPlayerNumOfChaptersCleared:int = videoPlayer.getNumOfChapters();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerNumOfChaptersCleared: " + videoPlayerNumOfChaptersCleared, 3);
      videoPlayer.setChapters(["The opening", "The middle of it", "The closing"]
          , ["https://app1.kisscodesystems.com/kcsops/samples/sample_426x240.flv"
          , "https://app1.kisscodesystems.com/kcsops/samples/sample_640x360.flv"
          , "https://app1.kisscodesystems.com/kcsops/samples/sample_854x480.flv"]);
      const videoPlayerNumOfChapters:int = videoPlayer.getNumOfChapters();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerNumOfChapters: " + videoPlayerNumOfChapters, 3);
      videoPlayer.setSelectedChapterIndex(1);
      videoPlayer.nextChapter();
      videoPlayer.prevChapter();
      videoPlayer.prevChapter();
      const videoPlayerChapterIndex:int = videoPlayer.getSelectedChapterIndex();
      const videoPlayerChapterName:String = videoPlayer.getChapterName(videoPlayerChapterIndex);
      const videoPlayerChapterUrl:String = videoPlayer.getChapterUrl(videoPlayerChapterIndex);
      const videoPlayerChapterSecs:int = videoPlayer.getChapterSecs(videoPlayerChapterIndex);
      const videoPlayerTotalSecs:int = videoPlayer.getTotalSecs();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerChapterIndex: " + videoPlayerChapterIndex, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerChapterName: " + videoPlayerChapterName, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerChapterUrl: " + videoPlayerChapterUrl, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerChapterSecs: " + videoPlayerChapterSecs, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerTotalSecs: " + videoPlayerTotalSecs, 3);
      // the playing is started, paused and stopped right away: this application only
      // demonstrates that every one of these can be called, it watches no video at all
      videoPlayer.play();
      videoPlayer.pause();
      const videoPlayerPaused:Boolean = videoPlayer.isPaused();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerPaused: " + videoPlayerPaused, 3);
      videoPlayer.play();
      const videoPlayerPlaying:Boolean = videoPlayer.isPlaying();
      const videoPlayerProgressSecs:int = videoPlayer.getProgressSecs();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerPlaying: " + videoPlayerPlaying, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerProgressSecs: " + videoPlayerProgressSecs, 3);
      videoPlayer.stop();
      // as BaseSprite
      videoPlayer.setCx(10);
      videoPlayer.setCy(10);
      videoPlayer.setCxy(textLabelWithReact.getCx() - 30, textLabelWithReact.getCy(true, true));
      // the dimensions given to a player are the box the picture is drawn inside, and this
      // box reaches almost to the beginning of the widget standing on the right of it: one
      // margin of the application is the only thing that is left between the two of them.
      // Every sample chapter above is a widescreen one, so the box is as high as such a
      // picture needs to fill that whole width: a picture is shrunk into its box keeping
      // its own aspect ratio, so a box that is too low leaves it narrower than that box is
      const videoPlayerFrameDelta:int = getDynamicsConfig().getAppPadding();
      const videoPlayerBoxDwToSet:int = widget.getCx()
          - getDynamicsConfig().getAppMargin() - videoPlayer.getCx();
      const videoPlayerBoxDhToSet:int = 2 * videoPlayerFrameDelta
          + int((videoPlayerBoxDwToSet - 2 * videoPlayerFrameDelta) * 9 / 16);
      videoPlayer.setDw(310);
      videoPlayer.setDh(220);
      videoPlayer.setDwh(videoPlayerBoxDwToSet, videoPlayerBoxDhToSet);
      const videoPlayerBoxDw:int = videoPlayer.getBoxDw();
      const videoPlayerBoxDh:int = videoPlayer.getBoxDh();
      const videoPlayerVideoDw:int = videoPlayer.getVideoDw();
      const videoPlayerVideoDh:int = videoPlayer.getVideoDh();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerBoxDw: " + videoPlayerBoxDw, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerBoxDh: " + videoPlayerBoxDh, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerVideoDw: " + videoPlayerVideoDw, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerVideoDh: " + videoPlayerVideoDh, 3);
      const videoPlayerMinDw:int = videoPlayer.getMinDw();
      const videoPlayerMinDh:int = videoPlayer.getMinDh();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerMinDw: " + videoPlayerMinDw, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerMinDh: " + videoPlayerMinDh, 3);
      videoPlayer.updateCxy();
      const videoPlayerX:int = videoPlayer.getCx();
      const videoPlayerY:int = videoPlayer.getCy();
      const videoPlayerW:int = videoPlayer.getDw();
      const videoPlayerH:int = videoPlayer.getDh();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerX: " + videoPlayerX, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerY: " + videoPlayerY, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerW: " + videoPlayerW, 3);
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerH: " + videoPlayerH, 3);
      videoPlayer.setValue(13);
      const videoPlayerValue:Object = videoPlayer.getValue();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerValue: " + videoPlayerValue, 3);
      videoPlayer.setEnabled(true);
      const videoPlayerEnabled:Boolean = videoPlayer.getEnabled();
      application.trace("<QuickUIDemo createVideoPlayer> videoPlayerEnabled: " + videoPlayerEnabled, 3);
      videoPlayer.toTheLowestDepth();
      videoPlayer.toTheHighestDepth();
      videoPlayer.setSpriteVisible(false);
      videoPlayer.setSpriteVisible(true);
      videoPlayer.setEventDispatcherObjectToThis();
      videoPlayer.toBeVisible();
      videoPlayer.setSoundTypeClick(null); // do nothing
      // the panel of the color picker and the emoji picker of the label that can be
      // reacted to both open downwards, right onto this player, so this player steps out
      // of the way of them and it comes back as soon as both of them are gone. These two
      // are listened to here and not where they are created, because this player is
      // created after them and it has to be there when the listeners are registered
      colorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), hideVideoPlayer);
      colorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), showVideoPlayer);
      textLabelWithReact.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), hideVideoPlayer);
      textLabelWithReact.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), showVideoPlayer);
    }
    /**
     * Hides the VideoPlayer object: a panel has been opened above it.
     * @param e the opened event of the color picker or of the label with the reactions
     */
    private function hideVideoPlayer(e:Event):void
    {
      application.trace("<QuickUIDemo hideVideoPlayer> called.", 4);
      application.trace("<QuickUIDemo hideVideoPlayer> e: " + e, 3);
      videoPlayer.setSpriteVisible(false);
    }
    /**
     * Displays the VideoPlayer object again as soon as both of the panels standing above
     * it are gone: either of the two can be closed while the other one is still open.
     * @param e the closed event of the color picker or of the label with the reactions
     */
    private function showVideoPlayer(e:Event):void
    {
      application.trace("<QuickUIDemo showVideoPlayer> called.", 4);
      application.trace("<QuickUIDemo showVideoPlayer> e: " + e, 3);
      if (!colorPicker.isOpened() && !textLabelWithReact.isPickerOpened())
      {
        videoPlayer.setSpriteVisible(true);
      }
    }
    /**
     * Builds and exercises the Camera object: every method of it is called at least once.
     * The camera device is not grabbed here on purpose: the one using this application is
     * the one allowing that, on the settings panel of this very object.
     */
    private function createCamera():void
    {
      application.trace("<QuickUIDemo createCamera> called.", 4);
      camera = new Camera(this);
      addChild(camera);
      // as Camera
      camera.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CAMERA_IS_ATTACHED(), cameraIsAttached);
      camera.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CAMERA_IS_DETACHED(), cameraIsDetached);
      camera.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), cameraChanged);
      camera.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_SAVED(), cameraPictureTaken);
      const cameraDevices:Array = camera.getCameraDevices();
      application.trace("<QuickUIDemo createCamera> cameraDevices: " + cameraDevices, 3);
      camera.setSelectedDeviceIndex(0);
      const cameraSelectedDeviceIndex:int = camera.getSelectedDeviceIndex();
      application.trace("<QuickUIDemo createCamera> cameraSelectedDeviceIndex: " + cameraSelectedDeviceIndex, 3);
      camera.setCameraResolution(EnumCameraResolutions.CAMERA_RESOLUTION_169());
      const cameraResolution:String = camera.getCameraResolution();
      application.trace("<QuickUIDemo createCamera> cameraResolution: " + cameraResolution, 3);
      camera.setResolutionFixed(true);
      camera.setResolutionFixed(false);
      const cameraResolutionFixed:Boolean = camera.getResolutionFixed();
      application.trace("<QuickUIDemo createCamera> cameraResolutionFixed: " + cameraResolutionFixed, 3);
      camera.setCameraFps(30);
      camera.setCameraQuality(90);
      const cameraFps:int = camera.getCameraFps();
      const cameraQuality:int = camera.getCameraQuality();
      application.trace("<QuickUIDemo createCamera> cameraFps: " + cameraFps, 3);
      application.trace("<QuickUIDemo createCamera> cameraQuality: " + cameraQuality, 3);
      camera.setFilterBlur(2);
      camera.setFilterRed(1.2);
      camera.setFilterGreen(0.9);
      camera.setFilterBlue(0.8);
      camera.setFilterAlpha(0.9);
      const cameraFilterBlur:int = camera.getFilterBlur();
      const cameraFilterRed:Number = camera.getFilterRed();
      const cameraFilterGreen:Number = camera.getFilterGreen();
      const cameraFilterBlue:Number = camera.getFilterBlue();
      const cameraFilterAlpha:Number = camera.getFilterAlpha();
      application.trace("<QuickUIDemo createCamera> cameraFilterBlur: " + cameraFilterBlur, 3);
      application.trace("<QuickUIDemo createCamera> cameraFilterRed: " + cameraFilterRed, 3);
      application.trace("<QuickUIDemo createCamera> cameraFilterGreen: " + cameraFilterGreen, 3);
      application.trace("<QuickUIDemo createCamera> cameraFilterBlue: " + cameraFilterBlue, 3);
      application.trace("<QuickUIDemo createCamera> cameraFilterAlpha: " + cameraFilterAlpha, 3);
      camera.resetSettings();
      // the width is asked for after the resetting on purpose: that call takes every
      // setting of this camera back to the initial one of the configuration, so the
      // smallest picture has to be asked for after it and not before it. This demo
      // displays every component on one single screen, and the smallest width a camera
      // can be asked for is 480 of the framework, the very one the config xml of this
      // application starts a camera at as well
      camera.setCameraWidth(getComponentsConfig().getCameraWidthMin());
      const cameraWidth:int = camera.getCameraWidth();
      const cameraHeight:int = camera.getCameraHeight();
      application.trace("<QuickUIDemo createCamera> cameraWidth: " + cameraWidth, 3);
      application.trace("<QuickUIDemo createCamera> cameraHeight: " + cameraHeight, 3);
      camera.setSettingsVisible(true);
      const cameraSettingsVisible:Boolean = camera.getSettingsVisible();
      application.trace("<QuickUIDemo createCamera> cameraSettingsVisible: " + cameraSettingsVisible, 3);
      camera.setSettingsVisible(false);
      // there is nothing to be taken, shown or dropped without a camera device grabbed
      camera.takePicture();
      camera.showPicture();
      camera.clearPicture();
      const cameraPictureName:String = camera.getPictureName();
      const cameraPictureByteArray:ByteArray = camera.getPictureByteArray();
      const cameraBitmapData:BitmapData = camera.getBitmapData();
      application.trace("<QuickUIDemo createCamera> cameraPictureName: " + cameraPictureName, 3);
      application.trace("<QuickUIDemo createCamera> cameraPictureByteArray: " + cameraPictureByteArray, 3);
      application.trace("<QuickUIDemo createCamera> cameraBitmapData: " + cameraBitmapData, 3);
      // the camera device is grabbed and released right away: this application only
      // demonstrates that both of these can be called, it displays no stream at all, and
      // a device that is left grabbed would be taken away from everything else
      camera.attachCamera();
      camera.detachCamera();
      // the camera device itself is not typed here: the name of that class of the runtime
      // is the very name of this component, so only the fully qualified one would tell
      // them apart, and a type annotation can not be written that way
      const cameraAttached:Boolean = camera.isCameraAttached();
      application.trace("<QuickUIDemo createCamera> the camera device: " + camera.getCamera(), 3);
      application.trace("<QuickUIDemo createCamera> cameraAttached: " + cameraAttached, 3);
      // as BaseSprite
      camera.setCx(10);
      camera.setCy(10);
      // the watch is as tall as the watch and the panel of it together while that panel
      // is open, so the closed state of it is the one this camera stands under
      camera.setCxy(watch.getCx(), watch.getCy(true, true));
      camera.setDw(300); // do nothing, the picture of the camera gives the width
      camera.setDh(300); // do nothing, the width and the aspect ratio give the height
      camera.setDwh(300, 300); // do nothing at all
      camera.updateCxy();
      const cameraX:int = camera.getCx();
      const cameraY:int = camera.getCy();
      const cameraW:int = camera.getDw();
      const cameraH:int = camera.getDh();
      application.trace("<QuickUIDemo createCamera> cameraX: " + cameraX, 3);
      application.trace("<QuickUIDemo createCamera> cameraY: " + cameraY, 3);
      application.trace("<QuickUIDemo createCamera> cameraW: " + cameraW, 3);
      application.trace("<QuickUIDemo createCamera> cameraH: " + cameraH, 3);
      camera.setValue(12);
      const cameraValue:Object = camera.getValue();
      application.trace("<QuickUIDemo createCamera> cameraValue: " + cameraValue, 3);
      camera.setEnabled(true);
      const cameraEnabled:Boolean = camera.getEnabled();
      application.trace("<QuickUIDemo createCamera> cameraEnabled: " + cameraEnabled, 3);
      camera.toTheLowestDepth();
      camera.toTheHighestDepth();
      camera.setSpriteVisible(false);
      camera.setSpriteVisible(true);
      camera.setEventDispatcherObjectToThis();
      camera.toBeVisible();
      camera.setSoundTypeClick(EnumSounds.button());
      camera.setSoundTypeClick(null);
      // this camera is created after the watch, because it takes its position from it, so
      // it stands under that watch while the panel of the watch opens downwards, right
      // onto this camera. The two of them are swapped here to let that panel be the upper one
      const watchIndex:int = getChildIndex(watch);
      setChildIndex(watch, getChildIndex(camera));
      setChildIndex(camera, watchIndex);
      // the panel of that watch opens onto this camera, so this camera steps out of the
      // way of it, exactly the way the video player steps out of the way of the two
      // panels opening above it
      watch.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), hideCamera);
      watch.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), showCamera);
    }
    /**
     * Hides the Camera object: the panel of the watch has been opened above it.
     * @param e the opened event of that watch
     */
    private function hideCamera(e:Event):void
    {
      application.trace("<QuickUIDemo hideCamera> called.", 4);
      application.trace("<QuickUIDemo hideCamera> e: " + e, 3);
      camera.setSpriteVisible(false);
    }
    /**
     * Displays the Camera object again: the panel of the watch is gone.
     * @param e the closed event of that watch
     */
    private function showCamera(e:Event):void
    {
      application.trace("<QuickUIDemo showCamera> called.", 4);
      application.trace("<QuickUIDemo showCamera> e: " + e, 3);
      camera.setSpriteVisible(true);
    }
    /**
     * Builds and exercises the TextBox object: every method of it is called at least once.
     */
    private function createTextBox():void
    {
      application.trace("<QuickUIDemo createTextBox> called.", 4);
      textBox = new TextBox(this);
      addChild(textBox);
      // as BaseSprite
      textBox.setCx(10);
      textBox.setCy(10);
      textBox.setCxy(soundPlayer.getCx(true, true), icon.getCy());
      textBox.setDw(20);
      textBox.setDh(20);
      textBox.setDwh(200, 200);
      textBox.updateCxy();
      const textBoxX:int = textBox.getCx();
      const textBoxY:int = textBox.getCy();
      const textBoxW:int = textBox.getDw();
      const textBoxH:int = textBox.getDh();
      application.trace("<QuickUIDemo createTextBox> x: " + textBoxX, 3);
      application.trace("<QuickUIDemo createTextBox> y: " + textBoxY, 3);
      application.trace("<QuickUIDemo createTextBox> w: " + textBoxW, 3);
      application.trace("<QuickUIDemo createTextBox> h: " + textBoxH, 3);
      textBox.setValue(9);
      const textBoxValue:Object = textBox.getValue();
      application.trace("<QuickUIDemo createTextBox> textBoxValue: " + textBoxValue, 3);
      textBox.setEnabled(true);
      const textBoxEnabled:Boolean = textBox.getEnabled();
      application.trace("<QuickUIDemo createTextBox> textBoxEnabled: " + textBoxEnabled, 3);
      textBox.toTheLowestDepth();
      textBox.toTheHighestDepth();
      textBox.setSpriteVisible(false);
      textBox.setSpriteVisible(true);
      textBox.setEventDispatcherObjectToThis();
      textBox.toBeVisible();
      textBox.setSoundTypeClick(EnumSounds.open());
      textBox.setSoundTypeClick(null);
      // as TextBox
      textBox.setType(EnumTextTypes.TEXT_TYPE_DARK());
      textBox.setHtml(true);
      textBox.setHtml(false);
      textBox.setLabel(
                 "01 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "02 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "03 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "04 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "05 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "06 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "07 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "08 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "09 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "10 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "11 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "12 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "13 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "14 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "15 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "16 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "17 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "18 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "19 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "20 this is my first label to show in a textbox..this is my first label to show in a textbox..this is my first label to show in a textbox..this is my first label to show in a textbox..20"
        );
      textBox.appendText("\n" + "21 this line has been appended to the end of the text of this textbox..");
      textBox.setWordWrap(true);
      const textBoxWordWrap:Boolean = textBox.getWordWrap();
      application.trace("<QuickUIDemo createTextBox> textBoxWordWrap: " + textBoxWordWrap, 3);
      textBox.setResizable(true);
      const textBoxResizable:Boolean = textBox.getResizable();
      application.trace("<QuickUIDemo createTextBox> textBoxResizable: " + textBoxResizable, 3);
    }
    /**
     * Builds and exercises the TextArea object: every method of it is called at least once.
     */
    private function createTextArea():void
    {
      application.trace("<QuickUIDemo createTextArea> called.", 4);
      textArea = new TextArea(this);
      addChild(textArea);
      // as BaseSprite
      textArea.setCx(10);
      textArea.setCy(10);
      textArea.setCxy(textBox.getCx(true, true), textBox.getCy());
      textArea.setDw(20);
      textArea.setDh(20);
      textArea.setDwh(200, 200);
      textArea.updateCxy();
      const textAreaX:int = textArea.getCx();
      const textAreaY:int = textArea.getCy();
      const textAreaW:int = textArea.getDw();
      const textAreaH:int = textArea.getDh();
      application.trace("<QuickUIDemo createTextArea> x: " + textAreaX, 3);
      application.trace("<QuickUIDemo createTextArea> y: " + textAreaY, 3);
      application.trace("<QuickUIDemo createTextArea> w: " + textAreaW, 3);
      application.trace("<QuickUIDemo createTextArea> h: " + textAreaH, 3);
      textArea.setValue(10);
      const textAreaValue:Object = textArea.getValue();
      application.trace("<QuickUIDemo createTextArea> textAreaValue: " + textAreaValue, 3);
      textArea.setEnabled(true);
      const textAreaEnabled:Boolean = textArea.getEnabled();
      application.trace("<QuickUIDemo createTextArea> textAreaEnabled: " + textAreaEnabled, 3);
      textArea.toTheLowestDepth();
      textArea.toTheHighestDepth();
      textArea.setSpriteVisible(false);
      textArea.setSpriteVisible(true);
      textArea.setEventDispatcherObjectToThis();
      textArea.toBeVisible();
      textArea.setSoundTypeClick(EnumSounds.open());
      textArea.setSoundTypeClick(null);
      // as TextBox
      textArea.setType(EnumTextTypes.TEXT_TYPE_DARK());
      textArea.setHtml(true); // do nothing
      textArea.setLabel(
                 "01 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "02 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "03 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "04 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "05 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "06 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "07 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "08 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "09 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "10 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "11 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "12 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "13 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "14 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "15 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "16 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "17 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "18 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "19 this is my first label to show in a textbox..this is my first label to show in a textbox.."
        + "\n" + "20 this is my first label to show in a textbox..this is my first label to show in a textbox..this is my first label to show in a textbox..this is my first label to show in a textbox..20"
        );
      var strToTextArea:String = "";
      for (var l:int = 0; l < 1800; l ++)
      {
        strToTextArea += "" + l + " . line to see if a long content is still available to display.\n";
      }
      strToTextArea += "last line.";
      textArea.setLabel(strToTextArea);
      textArea.appendText("\n" + "21 this line has been appended to the end of the text of this textarea..");
      textArea.setWordWrap(true);
      const textAreaWordWrap:Boolean = textArea.getWordWrap();
      application.trace("<QuickUIDemo createTextArea> textAreaWordWrap: " + textAreaWordWrap, 3);
      textArea.setResizable(true);
      const textAreaResizable:Boolean = textArea.getResizable();
      application.trace("<QuickUIDemo createTextArea> textAreaResizable: " + textAreaResizable, 3);
      // as TextArea
      textArea.setRestrict("[a-zA-Z0-9 \\n\\.]");
      textArea.setRestrict(null);
      textArea.setMinChars(3);
      textArea.setMaxChars(4000);
      const textAreaTextIsAtLeastLength:Boolean = textArea.getTextIsAtLeastLength();
      application.trace("<QuickUIDemo createTextArea> textAreaTextIsAtLeastLength: " + textAreaTextIsAtLeastLength, 3);
      const textAreaText:String = textArea.getText();
      application.trace("<QuickUIDemo createTextArea> textAreaText: " + textAreaText, 3);
      textArea.toFocus();
    }
    /**
     * Builds and exercises the ButtonBar object: every method of it is called at least once.
     */
    private function createButtonBar():void
    {
      application.trace("<QuickUIDemo createButtonBar> called.", 4);
      buttonBar = new ButtonBar(this);
      addChild(buttonBar);
      // as BaseSprite
      buttonBar.setCx(10);
      buttonBar.setCy(10);
      buttonBar.setCxy(textBox.getCx(), textBox.getCy(true, true));
      buttonBar.setDw(20); // Does nothing
      buttonBar.setDh(20); // Does nothing
      buttonBar.setDwh(200, 200); // Does nothing
      buttonBar.updateCxy();
      const buttonBarX:int = buttonBar.getCx();
      const buttonBarY:int = buttonBar.getCy();
      const buttonBarW:int = buttonBar.getDw();
      const buttonBarH:int = buttonBar.getDh();
      application.trace("<QuickUIDemo createButtonBar> x: " + buttonBarX, 3);
      application.trace("<QuickUIDemo createButtonBar> y: " + buttonBarY, 3);
      application.trace("<QuickUIDemo createButtonBar> w: " + buttonBarW, 3);
      application.trace("<QuickUIDemo createButtonBar> h: " + buttonBarH, 3);
      buttonBar.setValue(11);
      const buttonBarValue:Object = buttonBar.getValue();
      application.trace("<QuickUIDemo createButtonBar> buttonBarValue: " + buttonBarValue, 3);
      buttonBar.setEnabled(true);
      const buttonBarEnabled:Boolean = buttonBar.getEnabled();
      application.trace("<QuickUIDemo createButtonBar> buttonBarEnabled: " + buttonBarEnabled, 3);
      buttonBar.toTheLowestDepth();
      buttonBar.toTheHighestDepth();
      buttonBar.setSpriteVisible(false);
      buttonBar.setSpriteVisible(true);
      buttonBar.setEventDispatcherObjectToThis();
      buttonBar.toBeVisible();
      buttonBar.setSoundTypeClick(EnumSounds.button());
      buttonBar.setSoundTypeClick(null);
      // as ButtonBar
      buttonBar.setMaxWidth(textBox.getDw());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_0());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_1());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_2());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_3());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_4());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_5());
      const buttonIndex:int = buttonBar.getIndexByLabel(EnumTextKeysDemo.BUTTON_BAR_4());
      application.trace("<QuickUIDemo createButtonBar> buttonIndex: " + buttonIndex, 3);
      buttonBar.removeButton(buttonIndex);
      application.trace("<QuickUIDemo createButtonBar> removed button: " + buttonIndex, 3);
      buttonBar.removeAllButtons();
      application.trace("<QuickUIDemo createButtonBar> removed all buttons", 3);
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_0());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_1(), EnumIconsDemo.camera());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_2());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_3());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_4());
      buttonBar.addButton(EnumTextKeysDemo.BUTTON_BAR_5());
      buttonBar.destIcon(0);
      buttonBar.destIcon(1);
      buttonBar.setIcon(3, EnumIconsDemo.buttons());
      buttonBar.setIconIfNotActive(4, EnumIconsDemo.board());
      buttonBar.removeButton(5);
      buttonBar.setActiveIndex(1);
      const buttonBarActiveIndex:int = buttonBar.getActiveIndex();
      application.trace("<QuickUIDemo createButtonBar> buttonBarActiveIndex: " + buttonBarActiveIndex, 3);
      const buttonBarActiveLabel:String = buttonBar.getActiveLabel();
      application.trace("<QuickUIDemo createButtonBar> buttonBarActiveLabel: " + buttonBarActiveLabel, 3);
      const buttonBarMaxWidth:int = buttonBar.getMaxWidth();
      application.trace("<QuickUIDemo createButtonBar> buttonBarMaxWidth: " + buttonBarMaxWidth, 3);
    }
    /**
     * Builds and exercises the ContentSingle object: every method of it is called at least once.
     */
    private function createContentSingle():void
    {
      application.trace("<QuickUIDemo createContentSingle> called.", 4);
      contentSingle = new ContentSingle(this);
      addChild(contentSingle);
      // as BaseSprite
      contentSingle.setCx(10);
      contentSingle.setCy(10);
      contentSingle.setCxy(buttonBar.getCx(), buttonBar.getCy(true, true));
      contentSingle.setDw(20);
      contentSingle.setDh(20);
      contentSingle.setDwh(200, 200);
      contentSingle.updateCxy();
      const contentSingleX:int = contentSingle.getCx();
      const contentSingleY:int = contentSingle.getCy();
      const contentSingleW:int = contentSingle.getDw();
      const contentSingleH:int = contentSingle.getDh();
      application.trace("<QuickUIDemo createContentSingle> contentSingleX: " + contentSingleX, 3);
      application.trace("<QuickUIDemo createContentSingle> contentSingleY: " + contentSingleY, 3);
      application.trace("<QuickUIDemo createContentSingle> contentSingleW: " + contentSingleW, 3);
      application.trace("<QuickUIDemo createContentSingle> contentSingleH: " + contentSingleH, 3);
      contentSingle.setValue(12);
      const contentSingleValue:Object = contentSingle.getValue();
      application.trace("<QuickUIDemo createContentSingle> contentSingleValue: " + contentSingleValue, 3);
      contentSingle.setEnabled(true);
      const contentSingleEnabled:Boolean = contentSingle.getEnabled();
      application.trace("<QuickUIDemo createContentSingle> contentSingleEnabled: " + contentSingleEnabled, 3);
      contentSingle.toTheLowestDepth();
      contentSingle.toTheHighestDepth();
      contentSingle.setSpriteVisible(false);
      contentSingle.setSpriteVisible(true);
      contentSingle.setEventDispatcherObjectToThis();
      contentSingle.toBeVisible();
      contentSingle.setSoundTypeClick(EnumSounds.button());
      contentSingle.setSoundTypeClick(null);
      // as ContentSingle
      const contentSingleBaseScroll:BaseScroll = contentSingle.getBaseScroll();
      const contentSingleBaseSprite:BaseSprite = contentSingle.getBaseSprite();
      application.trace("<QuickUIDemo createContentSingle> contentSingleBaseScroll: " + contentSingleBaseScroll, 3);
      application.trace("<QuickUIDemo createContentSingle> contentSingleBaseSprite: " + contentSingleBaseSprite, 3);
      contentSingle.enableScrollingFromOthers = true;
      contentSingle.setDwhContent(1000, 1000);
      const contentSingleContentW:int = contentSingle.getDwContent();
      const contentSingleContentH:int = contentSingle.getDhContent();
      application.trace("<QuickUIDemo createContentSingle> contentSingleContentW: " + contentSingleContentW, 3);
      application.trace("<QuickUIDemo createContentSingle> contentSingleContentH: " + contentSingleContentH, 3);
      contentSingle.setContentPosition(-20, -20, true);
      contentSingle.setOrientation(EnumOrientations.ORIENTATION_MANUAL());
      contentSingle.setOrientation(EnumOrientations.ORIENTATION_HORIZONTAL());
      contentSingle.setOrientation(EnumOrientations.ORIENTATION_VERTICAL());
      const contentSingleOrientation:String = contentSingle.getOrientation();
      application.trace("<QuickUIDemo createContentSingle> contentSingleOrientation: " + contentSingleOrientation, 3);
      contentSingle.setElementsFix(2);
      const contentSingleElementsFix:int = contentSingle.getElementsFix();
      application.trace("<QuickUIDemo createContentSingle> contentSingleElementsFix: " + contentSingleElementsFix, 3);
      const contentSingleAutomaticPositioning:Boolean = contentSingle.getAutomaticPositioning();
      application.trace("<QuickUIDemo createContentSingle> contentSingleAutomaticPositioning: " + contentSingleAutomaticPositioning, 3);
      const contentSingleLabel0:TextLabel = new TextLabel(this);
      contentSingleLabel0.setLabel(EnumTextKeysDemo.BUTTON_BAR_0());
      const contentSingleLabel1:TextLabel = new TextLabel(this);
      contentSingleLabel1.setLabel(EnumTextKeysDemo.BUTTON_BAR_1());
      const contentSingleLabel2:TextLabel = new TextLabel(this);
      contentSingleLabel2.setLabel(EnumTextKeysDemo.BUTTON_BAR_2());
      contentSingle.addToContent(contentSingleLabel0, 0);
      contentSingle.addToContent(contentSingleLabel1, 1, false);
      contentSingle.addToContent(contentSingleLabel2, 2, true, true);
      for (var i:int = 3; i < 100; i++)
      {
        const contentSingleLabels:TextLabel = new TextLabel(this);
        contentSingleLabels.setLabel("This is a label i have added to test the scrolling capabilities of this content object " + i);
        contentSingle.addToContent(contentSingleLabels, i);
      }
      const contentSingleCellIndex:int = contentSingle.getCellIndex(contentSingleLabel2);
      application.trace("<QuickUIDemo createContentSingle> contentSingleCellIndex: " + contentSingleCellIndex, 3);
      contentSingle.changeCellIndex(contentSingleLabel2, 3);
      contentSingle.removeFromContent(contentSingleLabel1);
      contentSingleLabel1.destroy();
      contentSingle.contentDimensionsRecalculation();
      contentSingle.toBottom();
      contentSingle.toTop();
      contentSingle.toRight();
      contentSingle.toLeft();
    }
    /**
     * Builds and exercises the ContentMultiple object: every method of it is called at least once.
     */
    private function createContentMultiple():void
    {
      application.trace("<QuickUIDemo createContentMultiple> called.", 4);
      contentMultiple = new ContentMultiple(this);
      addChild(contentMultiple);
      // as BaseSprite
      contentMultiple.setCx(10);
      contentMultiple.setCy(10);
      contentMultiple.setCxy(buttonBar.getCx(true, true), buttonBar.getCy());
      contentMultiple.setDw(20);
      contentMultiple.setDh(20);
      contentMultiple.setDwh(textArea.getDw(), contentSingle.getCy(true) - contentMultiple.getCy());
      contentMultiple.updateCxy();
      const contentMultipleX:int = contentMultiple.getCx();
      const contentMultipleY:int = contentMultiple.getCy();
      const contentMultipleW:int = contentMultiple.getDw();
      const contentMultipleH:int = contentMultiple.getDh();
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleX: " + contentMultipleX, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleY: " + contentMultipleY, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleW: " + contentMultipleW, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleH: " + contentMultipleH, 3);
      contentMultiple.setValue(13);
      const contentMultipleValue:Object = contentMultiple.getValue();
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleValue: " + contentMultipleValue, 3);
      contentMultiple.setEnabled(true);
      const contentMultipleEnabled:Boolean = contentMultiple.getEnabled();
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleEnabled: " + contentMultipleEnabled, 3);
      contentMultiple.toTheLowestDepth();
      contentMultiple.toTheHighestDepth();
      contentMultiple.setSpriteVisible(false);
      contentMultiple.setSpriteVisible(true);
      contentMultiple.setEventDispatcherObjectToThis();
      contentMultiple.toBeVisible();
      contentMultiple.setSoundTypeClick(EnumSounds.button());
      contentMultiple.setSoundTypeClick(null);
      // as ContentMultiple
      contentMultiple.setDefaultContent();
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleDefaultContents: " + contentMultiple.getNumOfContents(), 3);
      contentMultiple.removeAllContents();
      contentMultiple.setButtonBarVisible(true);
      const contentMultipleIndex0:int = contentMultiple.addContent(EnumTextKeysDemo.BUTTON_BAR_0());
      const contentMultipleIndex1:int = contentMultiple.addContent(EnumTextKeysDemo.BUTTON_BAR_1(), EnumIconsDemo.camera());
      const contentMultipleIndex2:int = contentMultiple.addContent(EnumTextKeysDemo.BUTTON_BAR_2());
      const contentMultipleIndex3:int = contentMultiple.addContent(EnumTextKeysDemo.BUTTON_BAR_3());
      const contentMultipleIndexAgain:int = contentMultiple.addContent(EnumTextKeysDemo.BUTTON_BAR_3());
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleIndex0: " + contentMultipleIndex0, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleIndex1: " + contentMultipleIndex1, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleIndex2: " + contentMultipleIndex2, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleIndex3: " + contentMultipleIndex3, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleIndexAgain: " + contentMultipleIndexAgain, 3);
      const contentMultipleNumOfContents:int = contentMultiple.getNumOfContents();
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleNumOfContents: " + contentMultipleNumOfContents, 3);
      contentMultiple.destIcon(1);
      contentMultiple.setIcon(2, EnumIconsDemo.buttons());
      contentMultiple.setIconIfNotActive(3, EnumIconsDemo.board());
      contentMultiple.removeContent(3);
      // the emojis stand in the very same slots the icons above do, so these calls give
      // the menu of this object the symbols telling what its contents are about, the very
      // same ones the menu of the widget below stands with
      contentMultiple.setEmoji(contentMultipleIndex0, EnumEmojis.symbols_number_1());
      contentMultiple.setEmoji(contentMultipleIndex1, EnumEmojis.people_bust());
      contentMultiple.setEmojiIfNotActive(contentMultipleIndex2, EnumEmojis.mail_envelope());
      const contentMultipleContentIndex:int = contentMultiple.getContentIndexByLabel(EnumTextKeysDemo.BUTTON_BAR_2());
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleContentIndex: " + contentMultipleContentIndex, 3);
      contentMultiple.setActiveIndex(-1);
      contentMultiple.setActiveIndex(0);
      const contentMultipleActiveIndex:int = contentMultiple.getActiveIndex();
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleActiveIndex: " + contentMultipleActiveIndex, 3);
      const contentMultipleButtonBarCyAndHeight:int = contentMultiple.getButtonBarCyAndHeight();
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleButtonBarCyAndHeight: " + contentMultipleButtonBarCyAndHeight, 3);
      const contentMultipleContentDw:int = contentMultiple.getContentDw();
      const contentMultipleContentDh:int = contentMultiple.getContentDh();
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleContentDw: " + contentMultipleContentDw, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleContentDh: " + contentMultipleContentDh, 3);
      const contentMultipleContentSingle:ContentSingle = contentMultiple.getContentSingle(0);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleContentSingle: " + contentMultipleContentSingle, 3);
      const contentMultipleBaseScroll:BaseScroll = contentMultiple.getBaseScroll(0);
      const contentMultipleBaseSprite:BaseSprite = contentMultiple.getBaseSprite(0);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleBaseScroll: " + contentMultipleBaseScroll, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleBaseSprite: " + contentMultipleBaseSprite, 3);
      contentMultiple.setDwhContent(0, 1000, 1000);
      const contentMultipleContentW:int = contentMultiple.getDwContent(0);
      const contentMultipleContentH:int = contentMultiple.getDhContent(0);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleContentW: " + contentMultipleContentW, 3);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleContentH: " + contentMultipleContentH, 3);
      contentMultiple.setContentPosition(0, -20, -20, true);
      contentMultiple.setOrientation(0, EnumOrientations.ORIENTATION_MANUAL());
      contentMultiple.setOrientation(0, EnumOrientations.ORIENTATION_HORIZONTAL());
      contentMultiple.setOrientation(0, EnumOrientations.ORIENTATION_VERTICAL());
      contentMultiple.setElementsFix(0, 2);
      const contentMultipleElementsFix:int = contentMultiple.getElementsFix(0);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleElementsFix: " + contentMultipleElementsFix, 3);
      const contentMultipleLabel0:TextLabel = new TextLabel(this);
      contentMultipleLabel0.setLabel(EnumTextKeysDemo.BUTTON_BAR_0());
      const contentMultipleLabel1:TextLabel = new TextLabel(this);
      contentMultipleLabel1.setLabel(EnumTextKeysDemo.BUTTON_BAR_1());
      const contentMultipleLabel2:TextLabel = new TextLabel(this);
      contentMultipleLabel2.setLabel(EnumTextKeysDemo.BUTTON_BAR_2());
      contentMultiple.addToContent(0, contentMultipleLabel0, 0);
      contentMultiple.addToContent(0, contentMultipleLabel1, 1, false);
      contentMultiple.addToContent(0, contentMultipleLabel2, 2, true, true);
      for (var j:int = 3; j < 100; j++)
      {
        const contentMultipleLabels:TextLabel = new TextLabel(this);
        contentMultipleLabels.setLabel("This is a label i have added to test the scrolling capabilities of this multiple content object " + j);
        contentMultiple.addToContent(0, contentMultipleLabels, j);
      }
      const contentMultipleCellIndex:int = contentMultiple.getCellIndex(0, contentMultipleLabel2);
      application.trace("<QuickUIDemo createContentMultiple> contentMultipleCellIndex: " + contentMultipleCellIndex, 3);
      contentMultiple.changeCellIndex(0, contentMultipleLabel2, 3);
      contentMultiple.removeFromContent(0, contentMultipleLabel1);
      contentMultipleLabel1.destroy();
      contentMultiple.getContentSingle(0).contentDimensionsRecalculation();
      contentMultiple.getContentSingle(0).toBottom();
      contentMultiple.getContentSingle(0).toTop();
      contentMultiple.getContentSingle(0).toRight();
      contentMultiple.getContentSingle(0).toLeft();
    }
    /**
     * Builds and exercises the Widget object: every method of it is called at least once.
     */
    private function createWidget():void
    {
      application.trace("<QuickUIDemo createWidget> called.", 4);
      // a widget takes its dimensions in desktop mode only, every setter returns without
      // doing anything in mobile mode, so the widget mode has to be the desktop one here
      getDynamicsConfig().setAppWidgetMode(EnumWidgetModes.WIDGET_MODE_DESKTOP());
      const appWidgetMode:String = getDynamicsConfig().getAppWidgetMode();
      application.trace("<QuickUIDemo createWidget> appWidgetMode: " + appWidgetMode, 3);
      widget = new Widget(this);
      addChild(widget);
      // as BaseSprite
      widget.setCx(10);
      widget.setCy(10);
      widget.setDw(20); // the minimal widget width instead
      widget.setDh(20); // the minimal widget height instead
      widget.setDwh(20, 20); // the minimal widget dimensions instead
      widget.setCxy(textArea.getCx(true, true), stage.stageHeight - 336);
      widget.updateCxy();
      widget.setValue(14);
      const widgetValue:Object = widget.getValue();
      application.trace("<QuickUIDemo createWidget> widgetValue: " + widgetValue, 3);
      widget.setEnabled(true);
      const widgetEnabled:Boolean = widget.getEnabled();
      application.trace("<QuickUIDemo createWidget> widgetEnabled: " + widgetEnabled, 3);
      widget.toTheLowestDepth();
      widget.toTheHighestDepth();
      widget.setSpriteVisible(false);
      widget.setSpriteVisible(true);
      widget.setEventDispatcherObjectToThis();
      widget.toBeVisible();
      widget.setSoundTypeClick(EnumSounds.button());
      widget.setSoundTypeClick(null);
      // as Widget
      widget.setWidgetId(1);
      widget.setWidgetId(2); // do nothing, the id is set only once
      const widgetId:int = widget.getWidgetId();
      application.trace("<QuickUIDemo createWidget> widgetId: " + widgetId, 3);
      widget.setContentId(0);
      const widgetContentId:int = widget.getContentId();
      application.trace("<QuickUIDemo createWidget> widgetContentId: " + widgetContentId, 3);
      widget.setWidgetType("demoWidget");
      widget.setWidgetType("otherWidget"); // do nothing, the type is set only once
      const widgetType:String = widget.getWidgetType();
      application.trace("<QuickUIDemo createWidget> widgetType: " + widgetType, 3);
      widget.setWidgetHeaderCode(EnumTextKeysDemo.COMPONENTS_USAGE());
      const widgetHeader:String = widget.getWidgetHeader();
      application.trace("<QuickUIDemo createWidget> widgetHeader: " + widgetHeader, 3);
      widget.setWidgetHeaderIcon(EnumIconsDemo.board());
      widget.setWidgetHeaderEmoji(EnumEmojis.computer_desktop_computer());
      widget.setButtonsVisible(true, true, true);
      widget.setButtonMoveEventPossible(true);
      widget.setButtonMoveVisible(true);
      widget.setButtonClosEventPossible(true);
      widget.setButtonClosVisible(true);
      widget.setInfoContent(EnumTextKeysDemo.COMPONENTS_USAGE());
      widget.clearInfoContent();
      widget.setInfoContent("<b>this is the info content of this widget</b>", true);
      // a minimized widget shows its header only and reports the height of that header
      widget.setHidden(true);
      const widgetHiddenDh:int = widget.getDh();
      application.trace("<QuickUIDemo createWidget> widgetHiddenDh: " + widgetHiddenDh, 3);
      const widgetHidden:Boolean = widget.getHidden();
      application.trace("<QuickUIDemo createWidget> widgetHidden: " + widgetHidden, 3);
      widget.setHidden(false);
      // these dimensions come from the single content holding this widget, there is none here
      const widgetDwFromParentContent:int = widget.getDwFromParentContent();
      const widgetDhFromParentContent:int = widget.getDhFromParentContent();
      application.trace("<QuickUIDemo createWidget> widgetDwFromParentContent: " + widgetDwFromParentContent, 3);
      application.trace("<QuickUIDemo createWidget> widgetDhFromParentContent: " + widgetDhFromParentContent, 3);
      widget.setMobileSizes();
      widget.setDesktopSizes();
      widget.setIniSizes();
      widget.safePlace();
      // the default content has no button bar above it, the three tabs below need one
      widget.setDefaultContent();
      application.trace("<QuickUIDemo createWidget> widgetDefaultContentActiveIndex: " + widget.getActiveIndex(), 3);
      widget.removeContent(0);
      widget.setButtonBarVisible(true);
      const widgetTab0:int = widget.addContent(EnumTextKeysDemo.BUTTON_BAR_0());
      const widgetTab1:int = widget.addContent(EnumTextKeysDemo.BUTTON_BAR_1(), EnumIconsDemo.camera());
      const widgetTab2:int = widget.addContent(EnumTextKeysDemo.BUTTON_BAR_2());
      const widgetTabAgain:int = widget.addContent(EnumTextKeysDemo.BUTTON_BAR_2());
      application.trace("<QuickUIDemo createWidget> widgetTab0: " + widgetTab0, 3);
      application.trace("<QuickUIDemo createWidget> widgetTab1: " + widgetTab1, 3);
      application.trace("<QuickUIDemo createWidget> widgetTab2: " + widgetTab2, 3);
      application.trace("<QuickUIDemo createWidget> widgetTabAgain: " + widgetTabAgain, 3);
      widget.destIcon(1);
      widget.setIcon(1, EnumIconsDemo.camera());
      widget.setIconIfNotActive(2, EnumIconsDemo.board());
      // the emojis stand in the very same slots the icons above do, so these calls give
      // the menu of this widget the symbols telling what its contents are about
      widget.setEmoji(widgetTab0, EnumEmojis.symbols_number_1());
      widget.setEmoji(widgetTab1, EnumEmojis.people_bust());
      widget.setEmojiIfNotActive(widgetTab2, EnumEmojis.mail_envelope());
      widget.setActiveContent(2);
      widget.setActiveContent(0);
      const widgetActiveIndex:int = widget.getActiveIndex();
      application.trace("<QuickUIDemo createWidget> widgetActiveIndex: " + widgetActiveIndex, 3);
      const widgetContentBaseEventDispatcher:BaseEventDispatcher = widget.getContentBaseEventDispatcher();
      application.trace("<QuickUIDemo createWidget> widgetContentBaseEventDispatcher: " + widgetContentBaseEventDispatcher, 3);
      // the elements of the first tab, the same way as they have been added to the contents above
      widget.setOrientation(0, EnumOrientations.ORIENTATION_MANUAL());
      widget.setOrientation(0, EnumOrientations.ORIENTATION_HORIZONTAL());
      widget.setOrientation(0, EnumOrientations.ORIENTATION_VERTICAL());
      widget.setElementsFix(0, 2);
      const widgetElementsFix:int = widget.getElementsFix(0);
      application.trace("<QuickUIDemo createWidget> widgetElementsFix: " + widgetElementsFix, 3);
      const widgetLabel0:TextLabel = new TextLabel(this);
      widgetLabel0.setLabel(EnumTextKeysDemo.BUTTON_BAR_0());
      const widgetLabel1:TextLabel = new TextLabel(this);
      widgetLabel1.setLabel(EnumTextKeysDemo.BUTTON_BAR_1());
      const widgetLabel2:TextLabel = new TextLabel(this);
      widgetLabel2.setLabel(EnumTextKeysDemo.BUTTON_BAR_2());
      widget.addToContent(0, widgetLabel0, 0);
      widget.addToContent(0, widgetLabel1, 1, false);
      widget.addToContent(0, widgetLabel2, 2, true, true);
      widget.setDwhContent(0, 1000, 1000);
      for (var k:int = 3; k < 100; k++)
      {
        const widgetLabels:TextLabel = new TextLabel(this);
        widgetLabels.setLabel("This is a label i have added to test the scrolling capabilities of the first tab of this widget " + k);
        widget.addToContent(0, widgetLabels, k);
      }
      const widgetCellIndex:int = widget.getCellIndex(0, widgetLabel2);
      application.trace("<QuickUIDemo createWidget> widgetCellIndex: " + widgetCellIndex, 3);
      widget.changeCellIndex(0, widgetLabel2, 3);
      widget.removeFromContent(0, widgetLabel1);
      widgetLabel1.destroy();
      const widgetContentW:int = widget.getDwContent(0);
      const widgetContentH:int = widget.getDhContent(0);
      application.trace("<QuickUIDemo createWidget> widgetContentW: " + widgetContentW, 3);
      application.trace("<QuickUIDemo createWidget> widgetContentH: " + widgetContentH, 3);
      widget.setContentPosition(0, -20, -20, true);
      // no widget layer is listening here, so this only dispatches the closed event
      const widgetOnClose:Boolean = widget.onClose();
      application.trace("<QuickUIDemo createWidget> widgetOnClose: " + widgetOnClose, 3);
      // the final dimensions, everything inside the widget follows them
      widget.setDwh(400, 300);
      const widgetX:int = widget.getCx();
      const widgetY:int = widget.getCy();
      const widgetW:int = widget.getDw();
      const widgetH:int = widget.getDh();
      application.trace("<QuickUIDemo createWidget> widgetX: " + widgetX, 3);
      application.trace("<QuickUIDemo createWidget> widgetY: " + widgetY, 3);
      application.trace("<QuickUIDemo createWidget> widgetW: " + widgetW, 3);
      application.trace("<QuickUIDemo createWidget> widgetH: " + widgetH, 3);
      const widgetContentCx:int = widget.getContentCx();
      const widgetContentCy:int = widget.getContentCy();
      const widgetContentDw:int = widget.getContentDw();
      const widgetContentDh:int = widget.getContentDh();
      application.trace("<QuickUIDemo createWidget> widgetContentCx: " + widgetContentCx, 3);
      application.trace("<QuickUIDemo createWidget> widgetContentCy: " + widgetContentCy, 3);
      application.trace("<QuickUIDemo createWidget> widgetContentDw: " + widgetContentDw, 3);
      application.trace("<QuickUIDemo createWidget> widgetContentDh: " + widgetContentDh, 3);
      const widgetButtonBarCyAndHeight:int = widget.getButtonBarCyAndHeight();
      application.trace("<QuickUIDemo createWidget> widgetButtonBarCyAndHeight: " + widgetButtonBarCyAndHeight, 3);
    }
    /**
     * Builds and exercises the ListPanel object: every method of it is called at least once.
     */
    private function createListPanel():void
    {
      application.trace("<QuickUIDemo createListPanel> called.", 4);
      listPanel = new ListPanel(this);
      addChild(listPanel);
      // as BaseSprite
      listPanel.setCx(10);
      listPanel.setCy(10);
      listPanel.setCxy(soundPlayer.getCx(), soundPlayer.getCy(true, true) + 34);
      listPanel.setDh(100); // do nothing, the number of the displayed elements gives the height
      listPanel.setDwh(100, 100); // do nothing, only the width would be taken
      listPanel.setDw(soundPlayer.getDw());
      listPanel.updateCxy();
      listPanel.setValue(15);
      const listPanelValue:Object = listPanel.getValue();
      application.trace("<QuickUIDemo createListPanel> listPanelValue: " + listPanelValue, 3);
      listPanel.setEnabled(true);
      const listPanelEnabled:Boolean = listPanel.getEnabled();
      application.trace("<QuickUIDemo createListPanel> listPanelEnabled: " + listPanelEnabled, 3);
      listPanel.toTheLowestDepth();
      listPanel.toTheHighestDepth();
      listPanel.setSpriteVisible(false);
      listPanel.setSpriteVisible(true);
      listPanel.setEventDispatcherObjectToThis();
      listPanel.toBeVisible();
      listPanel.setSoundTypeClick(EnumSounds.button());
      listPanel.setSoundTypeClick(null);
      // as ListPanel
      const listPanelTextType:String = listPanel.getTextType();
      application.trace("<QuickUIDemo createListPanel> listPanelTextType: " + listPanelTextType, 3);
      listPanel.setMultiple(true);
      const listPanelMultiple:Boolean = listPanel.getMultiple();
      application.trace("<QuickUIDemo createListPanel> listPanelMultiple: " + listPanelMultiple, 3);
      listPanel.setCanBeEmpty(true);
      const listPanelCanBeEmpty:Boolean = listPanel.getCanBeEmpty();
      application.trace("<QuickUIDemo createListPanel> listPanelCanBeEmpty: " + listPanelCanBeEmpty, 3);
      listPanel.setAlwaysDispatchSelectedEvent(true);
      listPanel.setAlwaysDispatchSelectedEvent(false);
      const listPanelAlwaysDispatch:Boolean = listPanel.getAlwaysDispatchSelectedEvent();
      application.trace("<QuickUIDemo createListPanel> listPanelAlwaysDispatch: " + listPanelAlwaysDispatch, 3);
      // four displayed elements out of the ten items, so this list is a scrollable one
      listPanel.setNumOfElements(4);
      listPanel.setArrays(listSampleLabels, listSampleValues, listSampleIcons, listSampleTabcnts);
      const listPanelNumOfElements:int = listPanel.getNumOfElements();
      application.trace("<QuickUIDemo createListPanel> listPanelNumOfElements: " + listPanelNumOfElements, 3);
      const listPanelArrayLabels:Array = listPanel.getArrayLabels();
      const listPanelArrayValues:Array = listPanel.getArrayValues();
      const listPanelArrayIcons:Array = listPanel.getArrayIcons();
      const listPanelArrayTabcnts:Array = listPanel.getArrayTabcnts();
      application.trace("<QuickUIDemo createListPanel> listPanelArrayLabels: " + listPanelArrayLabels, 3);
      application.trace("<QuickUIDemo createListPanel> listPanelArrayValues: " + listPanelArrayValues, 3);
      application.trace("<QuickUIDemo createListPanel> listPanelArrayIcons: " + listPanelArrayIcons, 3);
      application.trace("<QuickUIDemo createListPanel> listPanelArrayTabcnts: " + listPanelArrayTabcnts, 3);
      listPanel.refreshItem(3, "The refreshed item of the index 3", "value3refreshed", EnumIconsDemo.camera(), 0);
      listPanel.setSelectedIndexes([1, 3]);
      const listPanelSelectedIndexes:Array = listPanel.getSelectedIndexes();
      application.trace("<QuickUIDemo createListPanel> listPanelSelectedIndexes: " + listPanelSelectedIndexes, 3);
      listPanel.clearSelectedIndexes();
      application.trace("<QuickUIDemo createListPanel> listPanelSelectedIndexesCleared: " + listPanel.getSelectedIndexes(), 3);
      listPanel.setSelectedIndexes([2]);
      listPanel.setStartIndex(6);
      listPanel.setStartIndex(0);
    }
    /**
     * Builds and exercises the ListPicker object: every method of it is called at least once.
     */
    private function createListPicker():void
    {
      application.trace("<QuickUIDemo createListPicker> called.", 4);
      listPicker = new ListPicker(this);
      addChild(listPicker);
      // as BaseSprite
      listPicker.setCx(10);
      listPicker.setCy(10);
      listPicker.setCxy(listPanel.getCx(), listPanel.getCy(true, true));
      listPicker.setDh(100); // do nothing, the label or the open list gives the height
      listPicker.setDwh(100, 100); // do nothing, only the width would be taken
      listPicker.setDw(soundPlayer.getDw());
      listPicker.updateCxy();
      listPicker.setValue(16);
      const listPickerValue:Object = listPicker.getValue();
      application.trace("<QuickUIDemo createListPicker> listPickerValue: " + listPickerValue, 3);
      listPicker.setEnabled(true);
      const listPickerEnabled:Boolean = listPicker.getEnabled();
      application.trace("<QuickUIDemo createListPicker> listPickerEnabled: " + listPickerEnabled, 3);
      listPicker.toTheLowestDepth();
      listPicker.toTheHighestDepth();
      listPicker.setSpriteVisible(false);
      listPicker.setSpriteVisible(true);
      listPicker.setEventDispatcherObjectToThis();
      listPicker.toBeVisible();
      listPicker.setSoundTypeClick(EnumSounds.button());
      listPicker.setSoundTypeClick(null);
      // as ListPicker
      listPicker.setAlwaysDispatchSelectedEvent(true);
      listPicker.setAlwaysDispatchSelectedEvent(false);
      // the very same sample items, but its own copies of them, so that the refreshItem of
      // the one above does not reach into the items of this picker
      listPicker.setNumOfElements(4);
      listPicker.setArrays(listSampleLabels.slice(), listSampleValues.slice(), listSampleIcons.slice());
      const listPickerArrayLabels:Array = listPicker.getArrayLabels();
      const listPickerArrayValues:Array = listPicker.getArrayValues();
      application.trace("<QuickUIDemo createListPicker> listPickerArrayLabels: " + listPickerArrayLabels, 3);
      application.trace("<QuickUIDemo createListPicker> listPickerArrayValues: " + listPickerArrayValues, 3);
      listPicker.setSelectedIndex(2);
      const listPickerSelectedIndex:int = listPicker.getSelectedIndex();
      const listPickerSelectedValue:String = listPicker.getSelectedValue();
      application.trace("<QuickUIDemo createListPicker> listPickerSelectedIndex: " + listPickerSelectedIndex, 3);
      application.trace("<QuickUIDemo createListPicker> listPickerSelectedValue: " + listPickerSelectedValue, 3);
      const listPickerTextType:String = listPicker.getTextType();
      const listPickerText:String = listPicker.getText();
      application.trace("<QuickUIDemo createListPicker> listPickerTextType: " + listPickerTextType, 3);
      application.trace("<QuickUIDemo createListPicker> listPickerText: " + listPickerText, 3);
      listPicker.open();
      const listPickerOpened:Boolean = listPicker.isOpened();
      application.trace("<QuickUIDemo createListPicker> listPickerOpened: " + listPickerOpened, 3);
      listPicker.close();
      application.trace("<QuickUIDemo createListPicker> listPickerClosed: " + listPicker.isOpened(), 3);
      listPicker.clearSelectedIndex();
      application.trace("<QuickUIDemo createListPicker> listPickerSelectedIndexCleared: " + listPicker.getSelectedIndex(), 3);
      listPicker.setSelectedIndex(0);
      const listPickerX:int = listPicker.getCx();
      const listPickerY:int = listPicker.getCy();
      const listPickerW:int = listPicker.getDw();
      const listPickerH:int = listPicker.getDh();
      application.trace("<QuickUIDemo createListPicker> listPickerX: " + listPickerX, 3);
      application.trace("<QuickUIDemo createListPicker> listPickerY: " + listPickerY, 3);
      application.trace("<QuickUIDemo createListPicker> listPickerW: " + listPickerW, 3);
      application.trace("<QuickUIDemo createListPicker> listPickerH: " + listPickerH, 3);
    }
    /**
     * Builds and exercises the TextLabel object with react enabled: every method the
     * BaseReact base class brings into it is called at least once.
     */
    private function createTextLabelWithReact():void
    {
      application.trace("<QuickUIDemo createTextLabelWithReact> called.", 4);
      textLabelWithReact = new TextLabel(this);
      addChild(textLabelWithReact);
      textLabelWithReact.setCxy(colorPicker.getCx(true, true), colorPicker.getCy(false, false, true));
      textLabelWithReact.setLabel(EnumTextKeysDemo.COMPONENTS_USAGE());
      textLabelWithReact.setMaxWidth(200, true);
      // as BaseReact: the emojis can be stuck onto this label as soon as this is on
      textLabelWithReact.setReactEnabled(true);
      const textLabelWithReactEnabled:Boolean = textLabelWithReact.getReactEnabled();
      textLabelWithReact.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), textLabelWithReactChanged);
      // two hits of two other users, the way they are loaded back from a server
      textLabelWithReact.addHit("anna", EnumEmojis.hands_thumbsup(), new Date());
      textLabelWithReact.addHit("bela", EnumEmojis.hands_thumbsup(), new Date());
      textLabelWithReact.addHit("bela", EnumEmojis.hearts_heart(), new Date());
      textLabelWithReact.removeHit("bela", EnumEmojis.hearts_heart());
      const textLabelWithReactNumOfHits:int = textLabelWithReact.getNumOfHits();
      const textLabelWithReactHits:Array = textLabelWithReact.getHits();
      const textLabelWithReactNumOfThumbsups:int = textLabelWithReact.getNumOfHitsOfEmoji(EnumEmojis.hands_thumbsup());
      const textLabelWithReactEmojiTypes:Array = textLabelWithReact.getEmojiTypesByHits();
      const textLabelWithReactHasHit:Boolean = textLabelWithReact.hasHitOfUser("anna", EnumEmojis.hands_thumbsup());
      const textLabelWithReactContentDw:int = textLabelWithReact.getContentDw();
      const textLabelWithReactContentDh:int = textLabelWithReact.getContentDh();
      application.trace("<QuickUIDemo createTextLabelWithReact> textLabelWithReactEnabled: " + textLabelWithReactEnabled, 3);
      application.trace("<QuickUIDemo createTextLabelWithReact> textLabelWithReactNumOfHits: " + textLabelWithReactNumOfHits, 3);
      application.trace("<QuickUIDemo createTextLabelWithReact> textLabelWithReactHits: " + textLabelWithReactHits.length, 3);
      application.trace("<QuickUIDemo createTextLabelWithReact> textLabelWithReactNumOfThumbsups: " + textLabelWithReactNumOfThumbsups, 3);
      application.trace("<QuickUIDemo createTextLabelWithReact> textLabelWithReactEmojiTypes: " + textLabelWithReactEmojiTypes, 3);
      application.trace("<QuickUIDemo createTextLabelWithReact> textLabelWithReactHasHit: " + textLabelWithReactHasHit, 3);
      application.trace("<QuickUIDemo createTextLabelWithReact> textLabelWithReactContentDw: " + textLabelWithReactContentDw, 3);
      application.trace("<QuickUIDemo createTextLabelWithReact> textLabelWithReactContentDh: " + textLabelWithReactContentDh, 3);
      // the picker is opened and closed once, the user opens it by the button of the row
      textLabelWithReact.openPicker();
      const textLabelWithReactPickerOpened:Boolean = textLabelWithReact.isPickerOpened();
      application.trace("<QuickUIDemo createTextLabelWithReact> textLabelWithReactPickerOpened: " + textLabelWithReactPickerOpened, 3);
      textLabelWithReact.closePicker();
      // this label is created after the color picker, because it takes its position from it,
      // so it stands over that picker while the panel of the picker opens downwards, right
      // onto this label. The two of them are swapped here to let that panel be the upper one
      const colorPickerIndex:int = getChildIndex(colorPicker);
      setChildIndex(colorPicker, getChildIndex(textLabelWithReact));
      setChildIndex(textLabelWithReact, colorPickerIndex);
    }
    /**
     * Displays what the user has hit on the label that can be reacted to.
     * @param e the changed event of that label
     */
    private function textLabelWithReactChanged(e:Event):void
    {
      application.trace("<QuickUIDemo textLabelWithReactChanged> called.", 4);
      application.trace("<QuickUIDemo textLabelWithReactChanged> e: " + e, 3);
      application.trace("<QuickUIDemo textLabelWithReactChanged> number of the hits: " + textLabelWithReact.getNumOfHits(), 3);
      application.trace("<QuickUIDemo textLabelWithReactChanged> the hit emojis: " + textLabelWithReact.getEmojiTypesByHits(), 3);
    }
    /**
     * Builds and exercises the ColorPanel object: every method of it is called at least once.
     */
    private function createColorPanel():void
    {
      application.trace("<QuickUIDemo createColorPanel> called.", 4);
      colorPanel = new ColorPanel(this);
      addChild(colorPanel);
      // as BaseSprite
      colorPanel.setCx(10);
      colorPanel.setCy(10);
      colorPanel.setCxy(listPicker.getCx(), listPicker.getCy(true, true) + 66);
      colorPanel.setDw(100); // do nothing, the size of the color squares gives the width
      colorPanel.setDh(100); // do nothing, the size of the color squares gives the height
      colorPanel.setDwh(100, 100); // do nothing at all
      colorPanel.updateCxy();
      colorPanel.setEnabled(true);
      const colorPanelEnabled:Boolean = colorPanel.getEnabled();
      application.trace("<QuickUIDemo createColorPanel> colorPanelEnabled: " + colorPanelEnabled, 3);
      colorPanel.toTheLowestDepth();
      colorPanel.toTheHighestDepth();
      colorPanel.setSpriteVisible(false);
      colorPanel.setSpriteVisible(true);
      colorPanel.setEventDispatcherObjectToThis();
      colorPanel.toBeVisible();
      colorPanel.setSoundTypeClick(EnumSounds.button());
      colorPanel.setSoundTypeClick(null);
      // as ColorPanel
      colorPanel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), colorPanelChanged);
      // no setValue here on purpose: the value of this panel is the committed color itself,
      // so it is the setRGBColor below that has to write it
      colorPanel.setRGBColor("3366CC");
      const colorPanelRGBColor:String = colorPanel.getRGBColor();
      const colorPanelValue:Object = colorPanel.getValue();
      application.trace("<QuickUIDemo createColorPanel> colorPanelRGBColor: " + colorPanelRGBColor, 3);
      application.trace("<QuickUIDemo createColorPanel> colorPanelValue: " + colorPanelValue, 3);
      const colorPanelX:int = colorPanel.getCx();
      const colorPanelY:int = colorPanel.getCy();
      const colorPanelW:int = colorPanel.getDw();
      const colorPanelH:int = colorPanel.getDh();
      application.trace("<QuickUIDemo createColorPanel> colorPanelX: " + colorPanelX, 3);
      application.trace("<QuickUIDemo createColorPanel> colorPanelY: " + colorPanelY, 3);
      application.trace("<QuickUIDemo createColorPanel> colorPanelW: " + colorPanelW, 3);
      application.trace("<QuickUIDemo createColorPanel> colorPanelH: " + colorPanelH, 3);
    }
    /**
     * Builds and exercises the ColorPicker object: every method of it is called at least once.
     */
    private function createColorPicker():void
    {
      application.trace("<QuickUIDemo createColorPicker> called.", 4);
      colorPicker = new ColorPicker(this);
      addChild(colorPicker);
      // as BaseSprite
      colorPicker.setCx(10);
      colorPicker.setCy(10);
      colorPicker.setCxy(listPicker.getCx(true, true), listPicker.getCy());
      colorPicker.setDw(100); // do nothing, the button or the open panel gives the width
      colorPicker.setDh(100); // do nothing, the button or the open panel gives the height
      colorPicker.setDwh(100, 100); // do nothing at all
      colorPicker.updateCxy();
      colorPicker.setValue(17);
      const colorPickerValue:Object = colorPicker.getValue();
      application.trace("<QuickUIDemo createColorPicker> colorPickerValue: " + colorPickerValue, 3);
      colorPicker.setEnabled(true);
      const colorPickerEnabled:Boolean = colorPicker.getEnabled();
      application.trace("<QuickUIDemo createColorPicker> colorPickerEnabled: " + colorPickerEnabled, 3);
      colorPicker.toTheLowestDepth();
      colorPicker.toTheHighestDepth();
      colorPicker.setSpriteVisible(false);
      colorPicker.setSpriteVisible(true);
      colorPicker.setEventDispatcherObjectToThis();
      colorPicker.toBeVisible();
      colorPicker.setSoundTypeClick(EnumSounds.button());
      colorPicker.setSoundTypeClick(null);
      // as ColorPicker
      colorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), colorPickerChanged);
      colorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_COLOR_STEAL_FROM_STAGE_START(), colorPickerStealStarted);
      colorPicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_COLOR_STEAL_FROM_STAGE_STOP(), colorPickerStealStopped);
      // this commits the color in the panel of the picker, so it closes that picker and
      // dispatches the changed event of it as well
      colorPicker.setRGBColor("CC3366");
      const colorPickerRGBColor:String = colorPicker.getRGBColor();
      const colorPickerColorTextType:String = colorPicker.getTextType();
      application.trace("<QuickUIDemo createColorPicker> colorPickerRGBColor: " + colorPickerRGBColor, 3);
      application.trace("<QuickUIDemo createColorPicker> colorPickerColorTextType: " + colorPickerColorTextType, 3);
      colorPicker.open();
      const colorPickerOpened:Boolean = colorPicker.isOpened();
      application.trace("<QuickUIDemo createColorPicker> colorPickerOpened: " + colorPickerOpened, 3);
      colorPicker.close();
      application.trace("<QuickUIDemo createColorPicker> colorPickerClosed: " + colorPicker.isOpened(), 3);
      const colorPickerX:int = colorPicker.getCx();
      const colorPickerY:int = colorPicker.getCy();
      const colorPickerW:int = colorPicker.getDw();
      const colorPickerH:int = colorPicker.getDh();
      application.trace("<QuickUIDemo createColorPicker> colorPickerX: " + colorPickerX, 3);
      application.trace("<QuickUIDemo createColorPicker> colorPickerY: " + colorPickerY, 3);
      application.trace("<QuickUIDemo createColorPicker> colorPickerW: " + colorPickerW, 3);
      application.trace("<QuickUIDemo createColorPicker> colorPickerH: " + colorPickerH, 3);
    }
    /**
     * Builds and exercises the Watch object: every method of it is called at least once.
     */
    private function createWatch():void
    {
      application.trace("<QuickUIDemo createWatch> called.", 4);
      watch = new Watch(this);
      addChild(watch);
      // as BaseSprite
      watch.setCx(10);
      watch.setCy(10);
      watch.setDw(100); // do nothing, the elements of the watch give the width
      watch.setDh(100); // do nothing, the elements of the watch give the height
      watch.setDwh(100, 100); // do nothing at all
      watch.setCxy(widget.getCx(true, true), widget.getCy() - 43);
      watch.updateCxy();
      watch.setValue(23);
      application.trace("<QuickUIDemo createWatch> watchValue: " + watch.getValue(), 3);
      watch.setEnabled(true);
      application.trace("<QuickUIDemo createWatch> watchEnabled: " + watch.getEnabled(), 3);
      watch.toTheLowestDepth();
      watch.toTheHighestDepth();
      watch.setSpriteVisible(false);
      watch.setSpriteVisible(true);
      watch.setEventDispatcherObjectToThis();
      watch.toBeVisible();
      watch.setSoundTypeClick(EnumSounds.button());
      watch.setSoundTypeClick(null);
      // as Watch: the watch reports its own changing onto the dispatcher of the
      // application, so that the state of it can be saved outside
      getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_WATCH_CHANGED(), watchChanged);
      getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_WATCH_REPOSITIONED(), watchRepositioned);
      application.trace("<QuickUIDemo createWatch> watchTypeIni: " + watch.getWatchType(), 3);
      watch.setWatchType(EnumTextKeys.WATCH_TYPE_ANALOG());
      application.trace("<QuickUIDemo createWatch> watchTypeAnalog: " + watch.getWatchType(), 3);
      watch.setWatchType(EnumTextKeys.WATCH_TYPE_BINARY());
      application.trace("<QuickUIDemo createWatch> watchTypeBinary: " + watch.getWatchType(), 3);
      watch.setWatchType("this is not a watch type"); // do nothing
      watch.setWatchType(EnumTextKeys.WATCH_TYPE_DIGITAL());
      application.trace("<QuickUIDemo createWatch> watchTypeDigital: " + watch.getWatchType(), 3);
      watch.setWatchSecs(false);
      application.trace("<QuickUIDemo createWatch> watchSecsOff: " + watch.getWatchSecs(), 3);
      watch.setWatchSecs(true);
      application.trace("<QuickUIDemo createWatch> watchSecsOn: " + watch.getWatchSecs(), 3);
      // the panel of the watch is opened and closed once, the one using this application
      // opens it by a click on the watch itself
      watch.open();
      const watchOpened:Boolean = watch.isOpened();
      application.trace("<QuickUIDemo createWatch> watchOpened: " + watchOpened, 3);
      watch.close();
      application.trace("<QuickUIDemo createWatch> watchClosed: " + !watch.isOpened(), 3);
      application.trace("<QuickUIDemo createWatch> watchShapeFgFrameX: " + watch.getShapeFgFrameX(), 3);
      application.trace("<QuickUIDemo createWatch> watchX: " + watch.getCx(), 3);
      application.trace("<QuickUIDemo createWatch> watchY: " + watch.getCy(), 3);
      application.trace("<QuickUIDemo createWatch> watchW: " + watch.getDw(), 3);
      application.trace("<QuickUIDemo createWatch> watchH: " + watch.getDh(), 3);
    }
    /**
     * Builds and exercises the More object: every method of it is called at least once.
     */
    private function createMore():void
    {
      application.trace("<QuickUIDemo createMore> called.", 4);
      more = new More(this);
      addChild(more);
      // as BaseSprite
      more.setCx(10);
      more.setCy(10);
      more.setDw(100); // do nothing, the button or the open panel gives the width
      more.setDh(100); // do nothing, the button or the open panel gives the height
      more.setDwh(100, 100); // do nothing at all
      more.setCxy(buttonText.getCx(true, true), buttonText.getCy());
      more.updateCxy();
      more.setValue(24);
      application.trace("<QuickUIDemo createMore> moreValue: " + more.getValue(), 3);
      more.setEnabled(true);
      application.trace("<QuickUIDemo createMore> moreEnabled: " + more.getEnabled(), 3);
      more.toTheLowestDepth();
      more.toTheHighestDepth();
      more.setSpriteVisible(false);
      more.setSpriteVisible(true);
      more.setEventDispatcherObjectToThis();
      more.toBeVisible();
      more.setSoundTypeClick(EnumSounds.button());
      more.setSoundTypeClick(null);
      // as More
      more.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), moreOpened);
      more.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), moreClosed);
      application.trace("<QuickUIDemo createMore> moreTextLabel: " + more.getTextLabel().getLabel(), 3);
      // the elements of the panel are created here and are given to the panel: those
      // become children of it, so the panel frees them in its own destroy
      const moreButtonLink:ButtonLink = new ButtonLink(this);
      moreButtonLink.setLabel(EnumTextKeys.SETTING_LANGUAGE());
      moreButtonLink.setIcon(EnumIcons.settings());
      more.addToContent(moreButtonLink);
      more.addToContent(moreButtonLink); // do nothing, it is inside already
      const moreTextLabel:TextLabel = new TextLabel(this);
      moreTextLabel.setLabel(EnumTextKeys.DEFAULT_CONTENT());
      more.addToContent(moreTextLabel);
      more.removeFromContent(moreTextLabel);
      more.addToContent(moreTextLabel);
      more.open();
      application.trace("<QuickUIDemo createMore> moreOpened: " + more.isOpened(), 3);
      more.close();
      application.trace("<QuickUIDemo createMore> moreClosed: " + more.isOpened(), 3);
      application.trace("<QuickUIDemo createMore> moreX: " + more.getCx(), 3);
      application.trace("<QuickUIDemo createMore> moreY: " + more.getCy(), 3);
      application.trace("<QuickUIDemo createMore> moreW: " + more.getDw(), 3);
      application.trace("<QuickUIDemo createMore> moreH: " + more.getDh(), 3);
    }
    /**
     * Builds and exercises the Rater object: every method of it is called at least once.
     */
    private function createRater():void
    {
      application.trace("<QuickUIDemo createRater> called.", 4);
      rater = new Rater(this);
      addChild(rater);
      // as BaseSprite
      rater.setCx(10);
      rater.setCy(10);
      rater.setDw(100); // do nothing, the number and the size of the stars give the width
      rater.setDh(100); // do nothing, the size of the stars gives the height
      rater.setDwh(100, 100); // do nothing at all
      rater.setCxy(soundPlayer.getCx(true) - rater.getDw(), icon.getCy());
      rater.updateCxy();
      rater.setValue(25);
      application.trace("<QuickUIDemo createRater> raterValue: " + rater.getValue(), 3);
      rater.setEnabled(true);
      application.trace("<QuickUIDemo createRater> raterEnabled: " + rater.getEnabled(), 3);
      rater.toTheLowestDepth();
      rater.toTheHighestDepth();
      rater.setSpriteVisible(false);
      rater.setSpriteVisible(true);
      rater.setEventDispatcherObjectToThis();
      rater.toBeVisible();
      rater.setSoundTypeClick(EnumSounds.button());
      rater.setSoundTypeClick(null);
      // as Rater
      rater.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), raterChanged);
      application.trace("<QuickUIDemo createRater> raterReadonlyIni: " + rater.getReadonly(), 3);
      // a rater has to be taken out of the readonly state to be clickable at all
      rater.setReadonly(false);
      application.trace("<QuickUIDemo createRater> raterReadonly: " + rater.getReadonly(), 3);
      // a half star is displayed for a half rate
      rater.setRate(3.5);
      application.trace("<QuickUIDemo createRater> raterRate: " + rater.getRate(), 3);
      application.trace("<QuickUIDemo createRater> raterX: " + rater.getCx(), 3);
      application.trace("<QuickUIDemo createRater> raterY: " + rater.getCy(), 3);
      application.trace("<QuickUIDemo createRater> raterW: " + rater.getDw(), 3);
      application.trace("<QuickUIDemo createRater> raterH: " + rater.getDh(), 3);
    }
    /**
     * Builds and exercises the Potmeter object: every method of it is called at least once.
     */
    private function createPotmeter():void
    {
      application.trace("<QuickUIDemo createPotmeter> called.", 4);
      potmeter = new Potmeter(this);
      addChild(potmeter);
      // as BaseSprite
      potmeter.setCx(10);
      potmeter.setCy(10);
      potmeter.setDw(100); // do nothing, the label and the padding give the width
      potmeter.setDh(100); // do nothing, the label and the padding give the height
      potmeter.setDwh(100, 100); // do nothing at all
      potmeter.setCxy(buttonText.getCx(true, true), textLabel.getCy());
      potmeter.updateCxy();
      potmeter.setValue(26);
      application.trace("<QuickUIDemo createPotmeter> potmeterValue: " + potmeter.getValue(), 3);
      potmeter.setEnabled(true);
      application.trace("<QuickUIDemo createPotmeter> potmeterEnabled: " + potmeter.getEnabled(), 3);
      potmeter.toTheLowestDepth();
      potmeter.toTheHighestDepth();
      potmeter.setSpriteVisible(false);
      potmeter.setSpriteVisible(true);
      potmeter.setEventDispatcherObjectToThis();
      potmeter.toBeVisible();
      potmeter.setSoundTypeClick(EnumSounds.button());
      potmeter.setSoundTypeClick(null);
      // as Potmeter
      potmeter.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), potmeterChanged);
      // the difference of the maximum and the minimum has to be a multiply of the
      // increment, every other range is dropped
      // the frame of a potmeter can be taken away: one standing between the icons of a
      // player carries no frame of its own at all
      potmeter.setFrame(false);
      potmeter.setFrame(true);
      application.trace("<QuickUIDemo createPotmeter> potmeterFrame: " + potmeter.getFrame(), 3);
      potmeter.setMinMaxIncValues(0, 10, 3); // do nothing
      potmeter.setMinMaxIncValues(-5, 5, 0.5);
      potmeter.setDecimalPrecision(1);
      application.trace("<QuickUIDemo createPotmeter> potmeterDecimalPrecision: " + potmeter.getDecimalPrecision(), 3);
      potmeter.setCurValue(2.5);
      // also as BaseSprite while it has the final sizes at this point
      potmeter.setCxy(buttonText.getCx(true, true), textLabel.getCy());
      application.trace("<QuickUIDemo createPotmeter> potmeterCurValue: " + potmeter.getCurValue(), 3);
      potmeter.setCurValue(17); // do nothing, it is out of the range
      application.trace("<QuickUIDemo createPotmeter> potmeterCurValueKept: " + potmeter.getCurValue(), 3);
      application.trace("<QuickUIDemo createPotmeter> potmeterX: " + potmeter.getCx(), 3);
      application.trace("<QuickUIDemo createPotmeter> potmeterY: " + potmeter.getCy(), 3);
      application.trace("<QuickUIDemo createPotmeter> potmeterW: " + potmeter.getDw(), 3);
      application.trace("<QuickUIDemo createPotmeter> potmeterH: " + potmeter.getDh(), 3);
    }
    /**
     * Builds and exercises the DatePicker object: every method of it is called at least once.
     */
    private function createDatePicker():void
    {
      application.trace("<QuickUIDemo createDatePicker> called.", 4);
      datePicker = new DatePicker(this);
      addChild(datePicker);
      // as BaseSprite
      datePicker.setCx(10);
      datePicker.setCy(10);
      datePicker.setCxy(textArea.getCx(true, true), textArea.getCy());
      datePicker.setDw(300);
      datePicker.setDh(100); // do nothing, the label or the open panel gives the height
      datePicker.setDwh(100, 100); // do nothing at all
      datePicker.updateCxy();
      datePicker.setValue(27);
      application.trace("<QuickUIDemo createDatePicker> datePickerValue: " + datePicker.getValue(), 3);
      datePicker.setEnabled(true);
      application.trace("<QuickUIDemo createDatePicker> datePickerEnabled: " + datePicker.getEnabled(), 3);
      datePicker.toTheLowestDepth();
      datePicker.toTheHighestDepth();
      datePicker.setSpriteVisible(false);
      datePicker.setSpriteVisible(true);
      datePicker.setEventDispatcherObjectToThis();
      datePicker.toBeVisible();
      datePicker.setSoundTypeClick(EnumSounds.button());
      datePicker.setSoundTypeClick(null);
      // as DatePicker
      datePicker.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), datePickerChanged);
      // the hours and the minutes are selectable on this one, so the format of the
      // displayed date holds those as well
      datePicker.setHoursAndMinutes(true);
      application.trace("<QuickUIDemo createDatePicker> datePickerHoursAndMinutes: " + datePicker.getHoursAndMinutes(), 3);
      application.trace("<QuickUIDemo createDatePicker> datePickerDateFormat: " + datePicker.getDateFormat(), 3);
      datePicker.setSelectedDate(new Date());
      application.trace("<QuickUIDemo createDatePicker> datePickerSelectedDate: " + datePicker.getSelectedDate(), 3);
      application.trace("<QuickUIDemo createDatePicker> datePickerSelectedDateObject: " + datePicker.getSelectedDateObject(), 3);
      application.trace("<QuickUIDemo createDatePicker> datePickerDisplayedDate: " + datePicker.getDisplayedDate(), 3);
      application.trace("<QuickUIDemo createDatePicker> datePickerText: " + datePicker.getText(), 3);
      datePicker.open();
      application.trace("<QuickUIDemo createDatePicker> datePickerOpened: " + datePicker.isOpened(), 3);
      datePicker.close();
      application.trace("<QuickUIDemo createDatePicker> datePickerClosed: " + datePicker.isOpened(), 3);
      application.trace("<QuickUIDemo createDatePicker> datePickerX: " + datePicker.getCx(), 3);
      application.trace("<QuickUIDemo createDatePicker> datePickerY: " + datePicker.getCy(), 3);
      application.trace("<QuickUIDemo createDatePicker> datePickerW: " + datePicker.getDw(), 3);
      application.trace("<QuickUIDemo createDatePicker> datePickerH: " + datePicker.getDh(), 3);
    }
    /**
     * Builds and exercises the XmlLister object: every method of it is called at least once.
     */
    private function createXmlLister():void
    {
      application.trace("<QuickUIDemo createXmlLister> called.", 4);
      xmlLister = new XmlLister(this);
      addChild(xmlLister);
      // as BaseSprite
      xmlLister.setCx(10);
      xmlLister.setCy(10);
      xmlLister.setCxy(datePicker.getCx(true, true), datePicker.getCy());
      xmlLister.setDw(260);
      xmlLister.setDh(100); // do nothing, the number of the displayed items gives the height
      xmlLister.setDwh(100, 100); // do nothing at all
      xmlLister.updateCxy();
      xmlLister.setValue(28);
      application.trace("<QuickUIDemo createXmlLister> xmlListerValue: " + xmlLister.getValue(), 3);
      xmlLister.setEnabled(true);
      application.trace("<QuickUIDemo createXmlLister> xmlListerEnabled: " + xmlLister.getEnabled(), 3);
      xmlLister.toTheLowestDepth();
      xmlLister.toTheHighestDepth();
      xmlLister.setSpriteVisible(false);
      xmlLister.setSpriteVisible(true);
      xmlLister.setEventDispatcherObjectToThis();
      xmlLister.toBeVisible();
      xmlLister.setSoundTypeClick(EnumSounds.button());
      xmlLister.setSoundTypeClick(null);
      // as XmlLister
      xmlLister.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), xmlListerChanged);
      xmlLister.setAlwaysDispatchSelectedEvent(true);
      xmlLister.setAlwaysDispatchSelectedEvent(false);
      xmlLister.setNumOfElements(4);
      application.trace("<QuickUIDemo createXmlLister> xmlListerNumOfElements: " + xmlLister.getNumOfElements(), 3);
      // an open branch displays the items under it, a closed one hides those, and a
      // click on a branch opens and closes it
      xmlLister.setXmlAsString("<items>"
        + "<item value=\"the open branch\" opened=\"1\">"
        + "<item value=\"the first leaf of it\"/>"
        + "<item value=\"the second leaf of it\"/>"
        + "</item>"
        + "<item value=\"the closed branch\" opened=\"0\">"
        + "<item value=\"the hidden leaf of it\"/>"
        + "</item>"
        + "<item value=\"one single leaf\"/>"
        + "</items>");
      xmlLister.setStartIndex(0);
      application.trace("<QuickUIDemo createXmlLister> xmlListerTextType: " + xmlLister.getTextType(), 3);
      application.trace("<QuickUIDemo createXmlLister> xmlListerSelectedItem: " + xmlLister.getSelectedItem(), 3);
      application.trace("<QuickUIDemo createXmlLister> xmlListerX: " + xmlLister.getCx(), 3);
      application.trace("<QuickUIDemo createXmlLister> xmlListerY: " + xmlLister.getCy(), 3);
      application.trace("<QuickUIDemo createXmlLister> xmlListerW: " + xmlLister.getDw(), 3);
      application.trace("<QuickUIDemo createXmlLister> xmlListerH: " + xmlLister.getDh(), 3);
    }
    /**
     * Builds and exercises the DatePanel object: every method of it is called at least once.
     */
    private function createDatePanel():void
    {
      application.trace("<QuickUIDemo createDatePanel> called.", 4);
      datePanel = new DatePanel(this);
      addChild(datePanel);
      // as BaseSprite
      datePanel.setCx(10);
      datePanel.setCy(10);
      datePanel.setCxy(datePicker.getCx(), soundPlayer.getCy(true, true));
      datePanel.setDw(100); // do nothing, the calendar view gives the width
      datePanel.setDh(100); // do nothing, the calendar view gives the height
      datePanel.setDwh(100, 100); // do nothing at all
      datePanel.updateCxy();
      datePanel.setValue(29);
      application.trace("<QuickUIDemo createDatePanel> datePanelValue: " + datePanel.getValue(), 3);
      datePanel.setEnabled(true);
      application.trace("<QuickUIDemo createDatePanel> datePanelEnabled: " + datePanel.getEnabled(), 3);
      datePanel.toTheLowestDepth();
      datePanel.toTheHighestDepth();
      datePanel.setSpriteVisible(false);
      datePanel.setSpriteVisible(true);
      datePanel.setEventDispatcherObjectToThis();
      datePanel.toBeVisible();
      datePanel.setSoundTypeClick(EnumSounds.button());
      datePanel.setSoundTypeClick(null);
      // as DatePanel
      datePanel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), datePanelChanged);
      application.trace("<QuickUIDemo createDatePanel> datePanelHoursAndMinutes: " + datePanel.getHoursAndMinutes(), 3);
      datePanel.setDateFormat(getComponentsConfig().getDatePanelDateFormat());
      application.trace("<QuickUIDemo createDatePanel> datePanelDateFormat: " + datePanel.getDateFormat(), 3);
      datePanel.setSelectedDate(null); // a null date means the current one
      application.trace("<QuickUIDemo createDatePanel> datePanelSelectedDate: " + datePanel.getSelectedDate(), 3);
      application.trace("<QuickUIDemo createDatePanel> datePanelSelectedDateObject: " + datePanel.getSelectedDateObject(), 3);
      application.trace("<QuickUIDemo createDatePanel> datePanelDisplayedDate: " + datePanel.getDisplayedDate(), 3);
      datePanel.reposStaticContent();
      application.trace("<QuickUIDemo createDatePanel> datePanelX: " + datePanel.getCx(), 3);
      application.trace("<QuickUIDemo createDatePanel> datePanelY: " + datePanel.getCy(), 3);
      application.trace("<QuickUIDemo createDatePanel> datePanelW: " + datePanel.getDw(), 3);
      application.trace("<QuickUIDemo createDatePanel> datePanelH: " + datePanel.getDh(), 3);
    }
    /**
     * Builds and exercises the Board object: every method of it is called at least once.
     */
    private function createBoard():void
    {
      application.trace("<QuickUIDemo createBoard> called.", 4);
      board = new Board(this);
      addChild(board);
      // as BaseSprite
      board.setCx(10);
      board.setCy(10);
      board.setCxy(datePanel.getCx(true, true), datePanel.getCy() - 30);
      board.updateCxy();
      board.setValue(30);
      application.trace("<QuickUIDemo createBoard> boardValue: " + board.getValue(), 3);
      board.setEnabled(true);
      application.trace("<QuickUIDemo createBoard> boardEnabled: " + board.getEnabled(), 3);
      board.toTheLowestDepth();
      board.toTheHighestDepth();
      board.setSpriteVisible(false);
      board.setSpriteVisible(true);
      board.setEventDispatcherObjectToThis();
      board.toBeVisible();
      board.setSoundTypeClick(EnumSounds.button());
      board.setSoundTypeClick(null);
      // as Board
      board.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), boardChanged);
      board.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLEARED(), boardCleared);
      board.setLabel(EnumTextKeys.DRAW());
      application.trace("<QuickUIDemo createBoard> boardLabel: " + board.getLabel(), 3);
      // the drawable area of an empty board can be resized on its own, and the whole
      // board can be resized as well
      board.setDwhContent(360, 170);
      application.trace("<QuickUIDemo createBoard> boardDwContent: " + board.getDwContent(), 3);
      application.trace("<QuickUIDemo createBoard> boardDhContent: " + board.getDhContent(), 3);
      application.trace("<QuickUIDemo createBoard> boardCanvasWidth: " + board.getCanvasWidth(), 3);
      application.trace("<QuickUIDemo createBoard> boardCanvasHeight: " + board.getCanvasHeight(), 3);
      board.setBackgroundRGBColor("EEEEDD");
      application.trace("<QuickUIDemo createBoard> boardBackgroundRGBColor: " + board.getBackgroundRGBColor(), 3);
      board.setLineRGBColor("223344");
      application.trace("<QuickUIDemo createBoard> boardLineRGBColor: " + board.getLineRGBColor(), 3);
      board.setLineThickness(3);
      application.trace("<QuickUIDemo createBoard> boardLineThickness: " + board.getLineThickness(), 3);
      board.setDraw(false); // the rubber
      application.trace("<QuickUIDemo createBoard> boardDrawOff: " + board.getDraw(), 3);
      board.setDraw(true);
      application.trace("<QuickUIDemo createBoard> boardDrawOn: " + board.getDraw(), 3);
      board.setResizeIsPossible(true);
      application.trace("<QuickUIDemo createBoard> boardResizeIsPossible: " + board.getResizeIsPossible(), 3);
      board.setBackgroundEnabled(true);
      application.trace("<QuickUIDemo createBoard> boardBackgroundEnabled: " + board.getBackgroundEnabled(), 3);
      board.setLineEnabled(true);
      board.setLineThicknessEnabled(true);
      board.setDrawEnabled(true);
      board.setUndoEnabled(true);
      board.setRedoEnabled(true);
      board.setClearEnabled(true);
      board.undo();
      application.trace("<QuickUIDemo createBoard> boardMovementsCount: " + board.getMovementsCount(), 3);
      board.redo();
      application.trace("<QuickUIDemo createBoard> boardUndoneMovementsCount: " + board.getUndoneMovementsCount(), 3);
      board.clear();
      application.trace("<QuickUIDemo createBoard> boardContentEmpty: " + board.isContentEmpty(), 3);
      application.trace("<QuickUIDemo createBoard> boardCanvasByteArrayLength: " + board.getCanvasByteArray().length, 3);
      application.trace("<QuickUIDemo createBoard> boardX: " + board.getCx(), 3);
      application.trace("<QuickUIDemo createBoard> boardY: " + board.getCy(), 3);
      application.trace("<QuickUIDemo createBoard> boardW: " + board.getDw(), 3);
      application.trace("<QuickUIDemo createBoard> boardH: " + board.getDh(), 3);
      // the emoji picker of the picture opens downwards, right onto this board, so this
      // board steps out of the way of it and it comes back as soon as that picker is gone,
      // exactly the way the video player steps out of the way of the panels above it. That
      // picture is listened to here and not where it is created, because this board is
      // created after it and it has to be there when the listeners are registered
      image.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), hideBoard);
      image.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), showBoard);
    }
    /**
     * Hides the Board object: the emoji picker of the picture has been opened above it.
     * @param e the opened event of that picture
     */
    private function hideBoard(e:Event):void
    {
      application.trace("<QuickUIDemo hideBoard> called.", 4);
      application.trace("<QuickUIDemo hideBoard> e: " + e, 3);
      board.setSpriteVisible(false);
    }
    /**
     * Displays the Board object again: the emoji picker of the picture is gone.
     * @param e the closed event of that picture
     */
    private function showBoard(e:Event):void
    {
      application.trace("<QuickUIDemo showBoard> called.", 4);
      application.trace("<QuickUIDemo showBoard> e: " + e, 3);
      board.setSpriteVisible(true);
    }
    /**
     * The button of the text has been clicked, so it becomes usable again.
     * @param e the event of that component
     */
    private function buttonTextClicked(e:Event):void
    {
      application.trace("<QuickUIDemo buttonTextClicked> called.", 4);
      application.trace("<QuickUIDemo buttonTextClicked> e: " + e, 3);
      buttonText.setEnabled(true);
    }
    /**
     * The button of the link has been clicked.
     * @param e the event of that component
     */
    private function buttonLinkClicked(e:Event):void
    {
      application.trace("<QuickUIDemo buttonLinkClicked> called.", 4);
      application.trace("<QuickUIDemo buttonLinkClicked> e: " + e, 3);
    }
    /**
     * The switcher has been switched.
     * @param e the event of that component
     */
    private function switcherChanged(e:Event):void
    {
      application.trace("<QuickUIDemo switcherChanged> called.", 4);
      application.trace("<QuickUIDemo switcherChanged> e: " + e, 3);
      application.trace("<QuickUIDemo switcherChanged> objectState: " + switcher.getObjectState(), 3);
    }
    /**
     * Another color has been picked on the panel of the colors.
     * @param e the event of that component
     */
    private function colorPanelChanged(e:Event):void
    {
      application.trace("<QuickUIDemo colorPanelChanged> called.", 4);
      application.trace("<QuickUIDemo colorPanelChanged> e: " + e, 3);
      application.trace("<QuickUIDemo colorPanelChanged> rgbColor: " + colorPanel.getRGBColor(), 3);
    }
    /**
     * Another color has been picked on the picker of the colors.
     * @param e the event of that component
     */
    private function colorPickerChanged(e:Event):void
    {
      application.trace("<QuickUIDemo colorPickerChanged> called.", 4);
      application.trace("<QuickUIDemo colorPickerChanged> e: " + e, 3);
      application.trace("<QuickUIDemo colorPickerChanged> rgbColor: " + colorPicker.getRGBColor(), 3);
    }
    /**
     * The picker of the colors has started to steal a pixel from the stage.
     * @param e the event of that component
     */
    private function colorPickerStealStarted(e:Event):void
    {
      application.trace("<QuickUIDemo colorPickerStealStarted> called.", 4);
      application.trace("<QuickUIDemo colorPickerStealStarted> e: " + e, 3);
    }
    /**
     * The picker of the colors has stopped stealing a pixel from the stage.
     * @param e the event of that component
     */
    private function colorPickerStealStopped(e:Event):void
    {
      application.trace("<QuickUIDemo colorPickerStealStopped> called.", 4);
      application.trace("<QuickUIDemo colorPickerStealStopped> e: " + e, 3);
    }
    /**
     * The type of the watch or the displaying of the seconds has been changed.
     * @param e the event of that component
     */
    private function watchChanged(e:Event):void
    {
      application.trace("<QuickUIDemo watchChanged> called.", 4);
      application.trace("<QuickUIDemo watchChanged> e: " + e, 3);
      application.trace("<QuickUIDemo watchChanged> watchType: " + watch.getWatchType(), 3);
      application.trace("<QuickUIDemo watchChanged> watchSecs: " + watch.getWatchSecs(), 3);
    }
    /**
     * The elements of the watch have been repositioned.
     * @param e the event of that component
     */
    private function watchRepositioned(e:Event):void
    {
      application.trace("<QuickUIDemo watchRepositioned> called.", 4);
      application.trace("<QuickUIDemo watchRepositioned> e: " + e, 3);
      application.trace("<QuickUIDemo watchRepositioned> shapeFgFrameX: " + watch.getShapeFgFrameX(), 3);
    }
    /**
     * The object of the more has been opened.
     * @param e the event of that component
     */
    private function moreOpened(e:Event):void
    {
      application.trace("<QuickUIDemo moreOpened> called.", 4);
      application.trace("<QuickUIDemo moreOpened> e: " + e, 3);
    }
    /**
     * The object of the more has been closed.
     * @param e the event of that component
     */
    private function moreClosed(e:Event):void
    {
      application.trace("<QuickUIDemo moreClosed> called.", 4);
      application.trace("<QuickUIDemo moreClosed> e: " + e, 3);
    }
    /**
     * Another rate has been given on the rater.
     * @param e the event of that component
     */
    private function raterChanged(e:Event):void
    {
      application.trace("<QuickUIDemo raterChanged> called.", 4);
      application.trace("<QuickUIDemo raterChanged> e: " + e, 3);
      application.trace("<QuickUIDemo raterChanged> rate: " + rater.getRate(), 3);
    }
    /**
     * Another value has been given on the potmeter.
     * @param e the event of that component
     */
    private function potmeterChanged(e:Event):void
    {
      application.trace("<QuickUIDemo potmeterChanged> called.", 4);
      application.trace("<QuickUIDemo potmeterChanged> e: " + e, 3);
      application.trace("<QuickUIDemo potmeterChanged> curValue: " + potmeter.getCurValue(), 3);
    }
    /**
     * Another date has been picked on the picker of the dates.
     * @param e the event of that component
     */
    private function datePickerChanged(e:Event):void
    {
      application.trace("<QuickUIDemo datePickerChanged> called.", 4);
      application.trace("<QuickUIDemo datePickerChanged> e: " + e, 3);
      application.trace("<QuickUIDemo datePickerChanged> selectedDate: " + datePicker.getSelectedDate(), 3);
    }
    /**
     * Another item has been picked on the lister of the xml.
     * @param e the event of that component
     */
    private function xmlListerChanged(e:Event):void
    {
      application.trace("<QuickUIDemo xmlListerChanged> called.", 4);
      application.trace("<QuickUIDemo xmlListerChanged> e: " + e, 3);
      application.trace("<QuickUIDemo xmlListerChanged> selectedItem: " + xmlLister.getSelectedItem(), 3);
    }
    /**
     * Another date has been picked on the panel of the dates.
     * @param e the event of that component
     */
    private function datePanelChanged(e:Event):void
    {
      application.trace("<QuickUIDemo datePanelChanged> called.", 4);
      application.trace("<QuickUIDemo datePanelChanged> e: " + e, 3);
      application.trace("<QuickUIDemo datePanelChanged> selectedDate: " + datePanel.getSelectedDate(), 3);
    }
    /**
     * Something has been drawn on the board.
     * @param e the event of that component
     */
    private function boardChanged(e:Event):void
    {
      application.trace("<QuickUIDemo boardChanged> called.", 4);
      application.trace("<QuickUIDemo boardChanged> e: " + e, 3);
      application.trace("<QuickUIDemo boardChanged> contentEmpty: " + board.isContentEmpty(), 3);
    }
    /**
     * The board has been cleared.
     * @param e the event of that component
     */
    private function boardCleared(e:Event):void
    {
      application.trace("<QuickUIDemo boardCleared> called.", 4);
      application.trace("<QuickUIDemo boardCleared> e: " + e, 3);
    }
    /**
     * The loading of the picture of the Image object is over, whatever the result of it
     * has been.
     * @param e the file loaded event of that picture
     */
    private function imageFileLoaded(e:Event):void
    {
      application.trace("<QuickUIDemo imageFileLoaded> called.", 4);
      application.trace("<QuickUIDemo imageFileLoaded> e: " + e, 3);
      application.trace("<QuickUIDemo imageFileLoaded> the picture has arrived: " + image.isPictureLoaded(), 3);
      application.trace("<QuickUIDemo imageFileLoaded> dimensions of the picture: " + image.getBitmapDw() + " x " + image.getBitmapDh(), 3);
    }
    /**
     * The VideoPlayer object has been started, whether by the one using this application
     * or from here.
     * @param e the played by hand or played by outside event of that player
     */
    private function videoPlayerPlayed(e:Event):void
    {
      application.trace("<QuickUIDemo videoPlayerPlayed> called.", 4);
      application.trace("<QuickUIDemo videoPlayerPlayed> e: " + e, 3);
      application.trace("<QuickUIDemo videoPlayerPlayed> the chapter that is playing: " + videoPlayer.getSelectedChapterIndex(), 3);
    }
    /**
     * The VideoPlayer object has been stopped, whether by the one using this application
     * or by the end of the chapter of it.
     * @param e the stopped by hand or stopped by end event of that player
     */
    private function videoPlayerStopped(e:Event):void
    {
      application.trace("<QuickUIDemo videoPlayerStopped> called.", 4);
      application.trace("<QuickUIDemo videoPlayerStopped> e: " + e, 3);
    }
    /**
     * The chapters of the VideoPlayer object, the chapter it stands on or the metadata of
     * that chapter has been changed.
     * @param e the changed event of that player
     */
    private function videoPlayerChanged(e:Event):void
    {
      application.trace("<QuickUIDemo videoPlayerChanged> called.", 4);
      application.trace("<QuickUIDemo videoPlayerChanged> e: " + e, 3);
      application.trace("<QuickUIDemo videoPlayerChanged> the length of the chapter: " + videoPlayer.getChapterSecs(videoPlayer.getSelectedChapterIndex()), 3);
      application.trace("<QuickUIDemo videoPlayerChanged> dimensions of the picture: " + videoPlayer.getVideoDw() + " x " + videoPlayer.getVideoDh(), 3);
    }
    /**
     * The VideoPlayer object stands on another chapter of the video, whether by the two
     * buttons of it, by the list of the chapters or by the automatic continuing.
     * @param e the chapter changed event of that player
     */
    private function videoPlayerChapterChanged(e:Event):void
    {
      application.trace("<QuickUIDemo videoPlayerChapterChanged> called.", 4);
      application.trace("<QuickUIDemo videoPlayerChapterChanged> e: " + e, 3);
      application.trace("<QuickUIDemo videoPlayerChapterChanged> the chapter it stands on: " + videoPlayer.getSelectedChapterIndex(), 3);
      application.trace("<QuickUIDemo videoPlayerChapterChanged> the name of that chapter: " + videoPlayer.getChapterName(videoPlayer.getSelectedChapterIndex()), 3);
    }
    /**
     * The Camera object has grabbed its camera device: an outgoing stream can be fed from
     * that very device from this moment on.
     * @param e the camera is attached event of that camera
     */
    private function cameraIsAttached(e:Event):void
    {
      application.trace("<QuickUIDemo cameraIsAttached> called.", 4);
      application.trace("<QuickUIDemo cameraIsAttached> e: " + e, 3);
      application.trace("<QuickUIDemo cameraIsAttached> the camera device: " + camera.getCamera(), 3);
    }
    /**
     * The Camera object has released its camera device.
     * @param e the camera is detached event of that camera
     */
    private function cameraIsDetached(e:Event):void
    {
      application.trace("<QuickUIDemo cameraIsDetached> called.", 4);
      application.trace("<QuickUIDemo cameraIsDetached> e: " + e, 3);
    }
    /**
     * One property of the picture of the Camera object has been changed, on the settings
     * panel of that camera or from here.
     * @param e the changed event of that camera
     */
    private function cameraChanged(e:Event):void
    {
      application.trace("<QuickUIDemo cameraChanged> called.", 4);
      application.trace("<QuickUIDemo cameraChanged> e: " + e, 3);
      application.trace("<QuickUIDemo cameraChanged> dimensions of the picture: " + camera.getCameraWidth() + " x " + camera.getCameraHeight(), 3);
    }
    /**
     * The Camera object has taken a photo: the png byte array of it is ready to be written
     * into a file or sent to a server.
     * @param e the saved event of that camera
     */
    private function cameraPictureTaken(e:Event):void
    {
      application.trace("<QuickUIDemo cameraPictureTaken> called.", 4);
      application.trace("<QuickUIDemo cameraPictureTaken> e: " + e, 3);
      application.trace("<QuickUIDemo cameraPictureTaken> the name of the photo: " + camera.getPictureName(), 3);
    }
    /**
     * Destroys this object and frees up everything.
     */
    override public function destroy():void
    {
      application.trace("<QuickUIDemo destroy> called.", 4);
      application.trace("<QuickUIDemo destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<QuickUIDemo destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      if (privacyPolicyByteArrayEN != null)
      {
        privacyPolicyByteArrayEN.clear();
      }
      if (privacyPolicyByteArrayHU != null)
      {
        privacyPolicyByteArrayHU.clear();
      }
      if (listSampleLabels != null)
      {
        listSampleLabels.splice(0);
      }
      if (listSampleValues != null)
      {
        listSampleValues.splice(0);
      }
      if (listSampleIcons != null)
      {
        listSampleIcons.splice(0);
      }
      if (listSampleTabcnts != null)
      {
        listSampleTabcnts.splice(0);
      }
      application.trace("<QuickUIDemo destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<QuickUIDemo destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      privacyPolicyByteArrayEN = null;
      privacyPolicyEN = null;
      privacyPolicyByteArrayHU = null;
      privacyPolicyHU = null;
      icon = null;
      textLabel = null;
      buttonText = null;
      buttonLink = null;
      switcher = null;
      textInput = null;
      soundPlayer = null;
      image = null;
      camera = null;
      videoPlayer = null;
      textBox = null;
      textArea = null;
      buttonBar = null;
      contentSingle = null;
      contentMultiple = null;
      widget = null;
      listPanel = null;
      listPicker = null;
      textLabelWithReact = null;
      colorPanel = null;
      colorPicker = null;
      watch = null;
      more = null;
      rater = null;
      potmeter = null;
      datePicker = null;
      xmlLister = null;
      datePanel = null;
      board = null;
      listSampleLabels = null;
      listSampleValues = null;
      listSampleIcons = null;
      listSampleTabcnts = null;
    }
  }
}
