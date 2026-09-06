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
 * ButtonLinkWidget.
 * The widget of the ButtonLink component of the framework.
 *
 * MAIN FEATURES:
 * - a clickable text with an icon or an emoji in front of it, every panel and widget of
 *   the framework is built with these
 * - the example link stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the text, of the shape behind it and of the web address are built here,
 *   every other one comes from the PropertyWidget base class
 * - the dimensions of that link come from its own text, so it has no row of a width and
 *   no row of a height at all
 * - the shape type is changed by the mouse as well, and no event of that change is
 *   dispatched at all, so the row of it answers with the type it was refreshed with
 * - the web address is left empty on purpose: a click on a link carrying one of them
 *   opens a browser window, so that address is given to the example link when it is
 *   asked for and not before
 * - the maximum width, the multiline flag, the address and its data have no getter at
 *   all, so the code of the current state reads them back from their own rows
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumEmojisDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumBaseShapeTypes;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEmojis;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class ButtonLinkWidget extends PropertyWidget
  {
    // the range of the maximum width of the label of the example link
    private var maxWidthMIN:int = 0;
    private var maxWidthMAX:int = 400;
    private var maxWidthINC:int = 20;
    // The data the row of the post data hands over to the example link. These are the
    // very data of a demo and no texts that are read by anybody, so they are no labels
    // of any language.
    private var postDataATTRS:Array = null;
    private var postDataVALS:Array = null;
    // The shape types the background of that link can be drawn with: the labels standing
    // in the picker of them, the names the code of the current state writes them by and
    // the values themselves, all three in the very same order.
    private var shapeTypeKEYS:Array = null;
    private var shapeTypeNAMES:Array = null;
    private var shapeTypeVALUES:Array = null;
    // the example link: the very object the rows of this widget work on
    private var exampleButtonLink:ButtonLink = null;
    // the elements changing the properties of that link
    private var labelOBJ:TextInput = null;
    private var iconOBJ:ListPicker = null;
    private var emojiOBJ:ListPicker = null;
    private var shapeTypeOBJ:ListPicker = null;
    private var maxWidthOBJ:Potmeter = null;
    private var multilineOBJ:Switcher = null;
    private var urlOBJ:TextInput = null;
    private var postDataOBJ:ButtonLink = null;
    private var rollOutOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that link answer
    private var labelVAL:TextLabel = null;
    private var iconVAL:TextLabel = null;
    private var emojiVAL:TextLabel = null;
    private var shapeTypeVAL:TextLabel = null;
    // The web address of that link and the answer of the row of its data. Neither of
    // these is answered by that link, so the code of the current state is written from
    // these very stores.
    private var urlText:String = "";
    private var postDataSet:Boolean = false;
    /**
     * Constructs the widget of the ButtonLink component.
     * @param applicationRef the main application reference
     */
    public function ButtonLinkWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ButtonLinkWidget> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.BUTTONLINK();
      headerIcon = EnumIconsDemo.buttonlink();
      infoCode = EnumTextKeysDemo.WIDGETINFO_BUTTONLINK();
      codeVarName = "buttonLink";
      iniSizeWidth = 770;
      iniSizeHeight = 720;
      postDataATTRS = ["name", "lang"];
      postDataVALS = ["kisscodesystems", "en"];
      shapeTypeKEYS = [EnumTextKeysDemo.WIDGET_VALUE_NONE(), EnumTextKeysDemo.WIDGET_VALUE_SHAPE_FLAT()
        , EnumTextKeysDemo.WIDGET_VALUE_SHAPE_NOT_PRESSED(), EnumTextKeysDemo.WIDGET_VALUE_SHAPE_PRESSED()];
      shapeTypeNAMES = ["BASE_SHAPE_TYPE_NONE", "BASE_SHAPE_TYPE_FLAT"
        , "BASE_SHAPE_TYPE_NOT_PRESSED", "BASE_SHAPE_TYPE_PRESSED"];
      shapeTypeVALUES = [EnumBaseShapeTypes.BASE_SHAPE_TYPE_NONE(), EnumBaseShapeTypes.BASE_SHAPE_TYPE_FLAT()
        , EnumBaseShapeTypes.BASE_SHAPE_TYPE_NOT_PRESSED(), EnumBaseShapeTypes.BASE_SHAPE_TYPE_PRESSED()];
      application.trace("<" + this + " ButtonLinkWidget> constructed.", 4);
    }
    /**
     * Builds the example link of this widget: the one carrying the text of the example and
     * an icon in its leading slot. Its dimensions are left alone on purpose: such a link
     * takes them from its own label and from the padding of the application.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " ButtonLinkWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleButtonLink = new ButtonLink(application);
      setExampleElement(exampleButtonLink);
      exampleButtonLink.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT());
      exampleButtonLink.setIcon(EnumIcons.lightning());
    }
    /**
     * Builds every row of this widget: the ones of the text, of the shape behind it and of
     * the web address, and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " ButtonLinkWidget createRows> called.", 4);
      super.createRows();
      createTextRows();
      createShapeRows();
      createUrlRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the one of the example
     * link as well: that link dispatches its click event on every click it takes, but only
     * when it has really been pressed down on itself first.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " ButtonLinkWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleButtonLink.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), exampleButtonLinkClick);
      labelOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelChanged);
      iconOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), iconChanged);
      emojiOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), emojiChanged);
      shapeTypeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), shapeTypeChanged);
      maxWidthOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), maxWidthChanged);
      multilineOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), multilineChanged);
      urlOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), urlChanged);
      postDataOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), postDataClick);
      rollOutOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), rollOutClick);
    }
    /**
     * Displays the current value of every property of the example link. The shape type is
     * changed by the mouse as well and no event of that is dispatched, so the picker of
     * the types is taken to the one that stands at this very moment.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " ButtonLinkWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      labelVAL.setLabel(getTextOrNone(exampleButtonLink.getLabel()));
      iconVAL.setLabel(getTextOrNone(exampleButtonLink.getIconType()));
      emojiVAL.setLabel(getTextOrNone(exampleButtonLink.getEmojiType()));
      const shapeTypeIndex:int = shapeTypeVALUES.indexOf(exampleButtonLink.getType());
      if (shapeTypeIndex > -1)
      {
        shapeTypeVAL.setLabel("" + shapeTypeKEYS[shapeTypeIndex]);
        shapeTypeOBJ.setSelectedIndex(shapeTypeIndex, false);
      }
      else
      {
        application.trace("<" + this + " ButtonLinkWidget displayEveryCurrentValue> unknown shape type: " + exampleButtonLink.getType(), 6);
      }
    }
    /**
     * Returns the code writing the example link the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new link. The properties that have no getter at all are read
     * back from the elements changing them, and every class the code below names is
     * collected into the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " ButtonLinkWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("ButtonLink", imports);
      if (exampleButtonLink.getLabel() != "")
      {
        code += codeVarName + ".setLabel(" + getLabelCode(imports) + ");\n";
      }
      if (exampleButtonLink.getIconType() != "")
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumIcons");
        code += codeVarName + ".setIcon(EnumIcons." + exampleButtonLink.getIconType() + "());\n";
      }
      if (exampleButtonLink.getEmojiType() != "")
      {
        code += codeVarName + ".setEmoji(" + getEmojiCode(exampleButtonLink.getEmojiType(), imports) + ");\n";
      }
      // the first item of the three arrays of the shape types is the type of a brand new
      // link, the one that is not painted at all, so that one is left out of this code
      const shapeTypeIndex:int = shapeTypeVALUES.indexOf(exampleButtonLink.getType());
      if (shapeTypeIndex > 0)
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumBaseShapeTypes");
        code += codeVarName + ".setType(EnumBaseShapeTypes." + shapeTypeNAMES[shapeTypeIndex] + "());\n";
      }
      const maxWidth:int = int(maxWidthOBJ.getCurValue());
      if (maxWidth > 0)
      {
        code += codeVarName + ".setMaxWidth(" + maxWidth + ", " + multilineOBJ.getOn() + ");\n";
      }
      if (urlText != "")
      {
        code += codeVarName + ".setUrl(\"" + urlText + "\");\n";
      }
      if (postDataSet)
      {
        code += codeVarName + ".setPostData([\"" + postDataATTRS.join("\", \"")
          + "\"], [\"" + postDataVALS.join("\", \"") + "\"]);\n";
      }
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the label of the example link: the text of it and the icon or the
     * emoji standing in front of that text. That leading slot holds one of the two at a
     * time, so the one that arrives drops the one that has been there.
     */
    private function createTextRows():void
    {
      application.trace("<" + this + " ButtonLinkWidget createTextRows> called.", 4);
      const noneKey:String = EnumTextKeysDemo.WIDGET_VALUE_NONE();
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL());
      labelOBJ = createTextInput(cellIndex + 1);
      labelVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON());
      iconOBJ = createListPicker(cellIndex + 1
          , [noneKey, EnumIcons.lightning(), EnumIcons.ok(), EnumIcons.settings()
            , EnumIcons.info(), EnumIcons.logout()]
          , ["", EnumIcons.lightning(), EnumIcons.ok(), EnumIcons.settings()
            , EnumIcons.info(), EnumIcons.logout()]
          , [null, EnumIcons.lightning(), EnumIcons.ok(), EnumIcons.settings()
            , EnumIcons.info(), EnumIcons.logout()]);
      iconOBJ.setSelectedIndex(1, false);
      iconVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_EMOJI());
      emojiOBJ = createListPicker(cellIndex + 1
          , [noneKey, EnumEmojisDemo.demo(), EnumEmojis.hands_thumbsup(), EnumEmojis.hands_clap()
            , EnumEmojis.hearts_heart(), EnumEmojis.smileys_blush()]
          , ["", EnumEmojisDemo.demo(), EnumEmojis.hands_thumbsup(), EnumEmojis.hands_clap()
            , EnumEmojis.hearts_heart(), EnumEmojis.smileys_blush()]);
      emojiOBJ.setSelectedIndex(0, false);
      emojiVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the shape standing behind the example link and of the width its
     * label is kept inside: the shape type, that maximum width and the multiline flag
     * belonging to it. The last two are the parameters of one single setter having no
     * getter at all, so those two rows display nothing.
     */
    private function createShapeRows():void
    {
      application.trace("<" + this + " ButtonLinkWidget createShapeRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_SHAPE_TYPE());
      shapeTypeOBJ = createListPicker(cellIndex + 1, shapeTypeKEYS, shapeTypeNAMES);
      shapeTypeOBJ.setSelectedIndex(0, false);
      shapeTypeVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MAX_WIDTH());
      maxWidthOBJ = createPotmeter(cellIndex + 1, maxWidthMIN, maxWidthMAX, maxWidthINC);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MULTILINE());
      multilineOBJ = createSwitcher(cellIndex + 1, false);
    }
    /**
     * Builds the rows of the web address of the example link, of the data belonging to
     * that address and of the roll out that can be asked for from the outside. None of
     * these is answered by such a link, so these three rows display nothing.
     */
    private function createUrlRows():void
    {
      application.trace("<" + this + " ButtonLinkWidget createUrlRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_URL());
      urlOBJ = createTextInput(cellIndex + 1);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_POST_DATA());
      postDataOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_POST_DATA());
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ROLL_OUT());
      rollOutOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_ROLL_OUT());
    }
    /**
     * Returns the code of the text of the example link: the text key of the example text
     * when that one is displayed, and the text itself in quotation marks otherwise.
     * @param imports the names of the classes collected so far
     */
    private function getLabelCode(imports:Array):String
    {
      application.trace("<" + this + " ButtonLinkWidget getLabelCode> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget getLabelCode> imports: " + imports, 3);
      if (exampleButtonLink.getLabel() == EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        return "EnumTextKeysDemo." + getTextKeyName(exampleButtonLink.getLabel()) + "()";
      }
      return "\"" + exampleButtonLink.getLabel() + "\"";
    }
    /**
     * Gives the maximum width and the multiline flag of the two rows of them to the label
     * of the example link. The setter of that label drops every call that does not change
     * the width, so a multiline change of one and the same width would be lost: the width
     * is taken back to zero first to let that call through.
     */
    private function applyMaxWidth():void
    {
      application.trace("<" + this + " ButtonLinkWidget applyMaxWidth> called.", 4);
      const multiline:Boolean = multilineOBJ.getOn();
      exampleButtonLink.setMaxWidth(0, multiline);
      exampleButtonLink.setMaxWidth(int(maxWidthOBJ.getCurValue()), multiline);
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the example link has been clicked.
     * @param e the click event of that link
     */
    private function exampleButtonLinkClick(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget exampleButtonLinkClick> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget exampleButtonLinkClick> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Gives the text of the input of the label row to the example link.
     * @param e the changed event of that input
     */
    private function labelChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget labelChanged> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget labelChanged> e: " + e, 3);
      exampleButtonLink.setLabel(labelOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked icon to the example link, or frees the leading slot of it up when
     * the empty item has been picked. An icon and an emoji are exclusive to each other in
     * that slot, so the picker of the emojis is taken back to its empty item as well.
     * @param e the changed event of the picker of the icons
     */
    private function iconChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget iconChanged> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget iconChanged> e: " + e, 3);
      const iconType:String = iconOBJ.getSelectedValue();
      if (iconType == "")
      {
        exampleButtonLink.destIcon();
      }
      else
      {
        exampleButtonLink.setIcon(iconType);
      }
      // an icon of that slot drops the emoji standing in it, and the empty item frees
      // that slot up as a whole, so the picker of the emojis is empty either way
      emojiOBJ.setSelectedIndex(0, false);
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked emoji to the example link, or frees the leading slot of it up when
     * the empty item has been picked. An emoji and an icon are exclusive to each other in
     * that slot, so the picker of the icons is taken back to its empty item as well.
     * @param e the changed event of the picker of the emojis
     */
    private function emojiChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget emojiChanged> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget emojiChanged> e: " + e, 3);
      const emojiType:String = emojiOBJ.getSelectedValue();
      if (emojiType == "")
      {
        exampleButtonLink.destIcon();
      }
      else
      {
        exampleButtonLink.setEmoji(emojiType);
      }
      // an emoji of that slot drops the icon standing in it, and the empty item frees
      // that slot up as a whole, so the picker of the icons is empty either way
      iconOBJ.setSelectedIndex(0, false);
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked shape type to the example link. The mouse takes that type over as
     * soon as it arrives above that link, and a roll out takes it back to the type that
     * is not painted at all, so the one picked here is the one standing until then.
     * @param e the changed event of the picker of the shape types
     */
    private function shapeTypeChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget shapeTypeChanged> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget shapeTypeChanged> e: " + e, 3);
      exampleButtonLink.setType(int(shapeTypeVALUES[shapeTypeOBJ.getSelectedIndex()]));
      displayEveryCurrentValue();
    }
    /**
     * Gives the new maximum width to the label of the example link.
     * @param e the changed event of the potmeter of the maximum width
     */
    private function maxWidthChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget maxWidthChanged> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget maxWidthChanged> e: " + e, 3);
      applyMaxWidth();
    }
    /**
     * Gives the new multiline flag to the label of the example link.
     * @param e the changed event of the switcher of the multiline flag
     */
    private function multilineChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget multilineChanged> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget multilineChanged> e: " + e, 3);
      applyMaxWidth();
    }
    /**
     * Gives the typed web address to the example link: a click on it opens that address in
     * a browser window from then on. An emptied row takes that address away as a whole.
     * @param e the changed event of the input of the address
     */
    private function urlChanged(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget urlChanged> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget urlChanged> e: " + e, 3);
      urlText = urlOBJ.getText();
      exampleButtonLink.setUrl(urlText);
      displayEveryCurrentValue();
    }
    /**
     * Gives the data of the example to the example link: those are the ones handed over to
     * the web address of it as soon as that address is opened.
     * @param e the click event of that link
     */
    private function postDataClick(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget postDataClick> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget postDataClick> e: " + e, 3);
      exampleButtonLink.setPostData(postDataATTRS, postDataVALS);
      postDataSet = true;
      displayEveryCurrentValue();
    }
    /**
     * Displays the example link as one the mouse has just been moved away from. This is
     * the call the press of such a link is given up by when a scroll has taken that press
     * over and it has been dragged instead.
     * @param e the click event of that link
     */
    private function rollOutClick(e:Event):void
    {
      application.trace("<" + this + " ButtonLinkWidget rollOutClick> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget rollOutClick> e: " + e, 3);
      exampleButtonLink.onRollOut();
      displayEveryCurrentValue();
    }
    /**
     * Destroys this object and frees up everything. Every element of this widget stands
     * in the content of it, and that content is destroyed by the super destroy below, so
     * the references of them are only cleared here. The listeners registered above are
     * the ones of those very elements, so they are freed up together with them.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " ButtonLinkWidget destroy> called.", 4);
      application.trace("<" + this + " ButtonLinkWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " ButtonLinkWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      postDataATTRS.splice(0);
      postDataVALS.splice(0);
      shapeTypeKEYS.splice(0);
      shapeTypeNAMES.splice(0);
      shapeTypeVALUES.splice(0);
      application.trace("<" + this + " ButtonLinkWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " ButtonLinkWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      maxWidthMIN = 0;
      maxWidthMAX = 0;
      maxWidthINC = 0;
      postDataATTRS = null;
      postDataVALS = null;
      shapeTypeKEYS = null;
      shapeTypeNAMES = null;
      shapeTypeVALUES = null;
      exampleButtonLink = null;
      labelOBJ = null;
      iconOBJ = null;
      emojiOBJ = null;
      shapeTypeOBJ = null;
      maxWidthOBJ = null;
      multilineOBJ = null;
      urlOBJ = null;
      postDataOBJ = null;
      rollOutOBJ = null;
      labelVAL = null;
      iconVAL = null;
      emojiVAL = null;
      shapeTypeVAL = null;
      urlText = null;
      postDataSet = false;
    }
  }
}
