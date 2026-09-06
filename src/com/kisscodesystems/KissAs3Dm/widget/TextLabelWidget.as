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
 * TextLabelWidget.
 * The widget of the TextLabel component of the framework.
 *
 * MAIN FEATURES:
 * - one line of text with an icon or an emoji in front of it
 * - the example label stands at the top of the content of this widget and every
 *   property of it can be changed right under it
 * - the rows of the text, of the leading slot and of the reactions are built here,
 *   every other one comes from the PropertyWidget base class
 * - the dimensions of that label come from its own text, so it has no row of a width
 *   and no row of a height at all
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumEmojisDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEmojis;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class TextLabelWidget extends PropertyWidget
  {
    // the range of the maximum width of the example label
    private var maxWidthMIN:int = 0;
    private var maxWidthMAX:int = 400;
    private var maxWidthINC:int = 20;
    // the example label: the very object the rows of this widget work on
    private var exampleTextLabel:TextLabel = null;
    // the elements changing the properties of that label
    private var labelOBJ:TextInput = null;
    private var iconOBJ:ListPicker = null;
    private var emojiOBJ:ListPicker = null;
    private var textTypeOBJ:ListPicker = null;
    private var maxWidthOBJ:Potmeter = null;
    private var multilineOBJ:Switcher = null;
    private var reactEnabledOBJ:Switcher = null;
    private var hitUserOBJ:TextInput = null;
    private var hitEmojiOBJ:ListPicker = null;
    private var addHitOBJ:ButtonLink = null;
    private var removeHitOBJ:ButtonLink = null;
    private var clearHitsOBJ:ButtonLink = null;
    private var openPickerOBJ:ButtonLink = null;
    private var closePickerOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that label answer
    private var labelVAL:TextLabel = null;
    private var iconVAL:TextLabel = null;
    private var emojiVAL:TextLabel = null;
    private var textTypeVAL:TextLabel = null;
    private var textFieldVAL:TextLabel = null;
    private var iconObjectVAL:TextLabel = null;
    private var reactEnabledVAL:TextLabel = null;
    private var hitUserVAL:TextLabel = null;
    private var hitEmojiVAL:TextLabel = null;
    private var hitsVAL:TextLabel = null;
    private var hitListVAL:TextLabel = null;
    private var emojiTypesVAL:TextLabel = null;
    private var pickerVAL:TextLabel = null;
    private var contentDimensionsVAL:TextLabel = null;
    /**
     * Constructs the widget of the TextLabel component.
     * @param applicationRef the main application reference
     */
    public function TextLabelWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " TextLabelWidget> called.", 4);
      application.trace("<" + this + " TextLabelWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.TEXTLABEL();
      headerIcon = EnumIconsDemo.textlabel();
      infoCode = EnumTextKeysDemo.WIDGETINFO_TEXTLABEL();
      codeVarName = "textLabel";
      iniSizeWidth = 770;
      iniSizeHeight = 840;
      application.trace("<" + this + " TextLabelWidget> constructed.", 4);
    }
    /**
     * Builds the example label of this widget. It is not filled, so it keeps the width its
     * own text and maximum width mean, and the strip it takes is as tall as it is.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " TextLabelWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleTextLabel = new TextLabel(application);
      setExampleElement(exampleTextLabel);
      exampleTextLabel.setLabel(EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT());
      exampleTextLabel.setIcon(EnumIconsDemo.textlabel());
    }
    /**
     * Builds every row of this widget: the ones of the TextLabel component itself, the
     * ones the base class brings and the ones of the reactions in between.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " TextLabelWidget createRows> called.", 4);
      super.createRows();
      createTextRows();
      createSpriteRows();
      createObjectRows();
      createReactRows();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * label as well: that label dispatches its changed event when a hit is taken on it,
     * and its opened and closed events when its picker is opened and closed, and every
     * one of these can be done by the one using this application instead of a row below.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " TextLabelWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleTextLabel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleTextLabelChanged);
      exampleTextLabel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), exampleTextLabelChanged);
      exampleTextLabel.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), exampleTextLabelChanged);
      labelOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), labelChanged);
      iconOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), iconChanged);
      emojiOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), emojiChanged);
      textTypeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), textTypeChanged);
      maxWidthOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), maxWidthChanged);
      multilineOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), multilineChanged);
      reactEnabledOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), reactEnabledChanged);
      hitUserOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), hitUserChanged);
      hitEmojiOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), hitEmojiChanged);
      addHitOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), addHitClick);
      removeHitOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), removeHitClick);
      clearHitsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), clearHitsClick);
      openPickerOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), openPickerClick);
      closePickerOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), closePickerClick);
    }
    /**
     * Displays the current value of every property of the example label.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " TextLabelWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      labelVAL.setLabel(getTextOrNone(exampleTextLabel.getLabel()));
      iconVAL.setLabel(getTextOrNone(exampleTextLabel.getIconType()));
      emojiVAL.setLabel(getTextOrNone(exampleTextLabel.getEmojiType()));
      textTypeVAL.setLabel(exampleTextLabel.getType());
      textFieldVAL.setLabel(exampleTextLabel.getBaseTextField().getDw()
        + " x " + exampleTextLabel.getBaseTextField().getDh());
      iconObjectVAL.setLabel(exampleTextLabel.getIcon() == null
        ? EnumTextKeysDemo.WIDGET_VALUE_NONE() : "" + exampleTextLabel.getIcon().getIconSize());
      reactEnabledVAL.setLabel(getYesNoKey(exampleTextLabel.getReactEnabled()));
      hitUserVAL.setLabel(getYesNoKey(exampleTextLabel.hasHitOfUser(hitUserOBJ.getText()
        , hitEmojiOBJ.getSelectedValue())));
      hitEmojiVAL.setLabel("" + exampleTextLabel.getNumOfHitsOfEmoji(hitEmojiOBJ.getSelectedValue()));
      hitsVAL.setLabel("" + exampleTextLabel.getNumOfHits());
      hitListVAL.setLabel(getHitsText());
      emojiTypesVAL.setLabel(getEmojiTypesText());
      pickerVAL.setLabel(getYesNoKey(exampleTextLabel.isPickerOpened()));
      contentDimensionsVAL.setLabel(exampleTextLabel.getContentDw()
        + " x " + exampleTextLabel.getContentDh());
    }
    /**
     * Returns the code writing the example label the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new label. The properties that have no getter at all are read
     * back from the elements changing them, and every class the code below names is
     * collected into the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " TextLabelWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("TextLabel", imports);
      if (exampleTextLabel.getLabel() != "")
      {
        code += codeVarName + ".setLabel(" + getLabelCode(imports) + ");\n";
      }
      if (exampleTextLabel.getIconType() != "")
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo");
        code += codeVarName + ".setIcon(EnumIconsDemo." + exampleTextLabel.getIconType() + "());\n";
      }
      if (exampleTextLabel.getEmojiType() != "")
      {
        code += codeVarName + ".setEmoji(" + getEmojiCode(exampleTextLabel.getEmojiType(), imports) + ");\n";
      }
      if (exampleTextLabel.getType() != EnumTextTypes.TEXT_TYPE_BRIGHT())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes");
        code += codeVarName + ".setType(EnumTextTypes." + getTextKeyName(exampleTextLabel.getType()) + "());\n";
      }
      const maxWidth:int = int(maxWidthOBJ.getCurValue());
      if (maxWidth > 0)
      {
        code += codeVarName + ".setMaxWidth(" + maxWidth + ", " + multilineOBJ.getOn() + ");\n";
      }
      code += getSpritePropertiesCode(imports);
      if (exampleTextLabel.getReactEnabled())
      {
        code += codeVarName + ".setReactEnabled(true);\n";
      }
      code += getHitsCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the properties the TextLabel component brings of its own: the
     * text, the leading icon or emoji, the text type and the maximum width.
     */
    private function createTextRows():void
    {
      application.trace("<" + this + " TextLabelWidget createTextRows> called.", 4);
      const noneKey:String = EnumTextKeysDemo.WIDGET_VALUE_NONE();
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_LABEL());
      labelOBJ = createTextInput(cellIndex + 1);
      labelVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON());
      iconOBJ = createListPicker(cellIndex + 1
          , [noneKey, EnumIconsDemo.textlabel(), EnumIconsDemo.camera(), EnumIconsDemo.board()
            , EnumIconsDemo.widget(), EnumIconsDemo.application()]
          , ["", EnumIconsDemo.textlabel(), EnumIconsDemo.camera(), EnumIconsDemo.board()
            , EnumIconsDemo.widget(), EnumIconsDemo.application()]
          , [null, EnumIconsDemo.textlabel(), EnumIconsDemo.camera(), EnumIconsDemo.board()
            , EnumIconsDemo.widget(), EnumIconsDemo.application()]);
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
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT_TYPE());
      textTypeOBJ = createListPicker(cellIndex + 1
          , application.getLabelManager().getKeysTextTypes()
          , application.getLabelManager().getKeysTextTypes());
      textTypeOBJ.setSelectedIndex(0, false);
      textTypeVAL = createValueLabel(cellIndex + 2);
      // the maximum width and the multiline flag are the two parameters of one single
      // setter, and that setter has no getter at all, so these two rows display nothing
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MAX_WIDTH());
      maxWidthOBJ = createPotmeter(cellIndex + 1, maxWidthMIN, maxWidthMAX, maxWidthINC);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_MULTILINE());
      multilineOBJ = createSwitcher(cellIndex + 1, false);
    }
    /**
     * Builds the rows of the two objects the example label is built of: its text field and
     * the icon of its leading slot. Both of them are objects of its own, so these two rows
     * have nothing to change them with.
     */
    private function createObjectRows():void
    {
      application.trace("<" + this + " TextLabelWidget createObjectRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT_FIELD());
      textFieldVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON_OBJECT());
      iconObjectVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the properties the TextLabel component takes from the BaseReact
     * base class: the react feature itself, the hits of the emojis, the picker of them
     * and the dimensions of the content of that label. The username and the emoji of the
     * two rows standing on the top of them are the ones every hit is added and removed
     * with.
     */
    private function createReactRows():void
    {
      application.trace("<" + this + " TextLabelWidget createReactRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_REACT_ENABLED());
      reactEnabledOBJ = createSwitcher(cellIndex + 1, false);
      reactEnabledVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_HIT_USER());
      hitUserOBJ = createTextInput(cellIndex + 1);
      hitUserOBJ.setLabel("anna");
      hitUserVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_HIT_EMOJI());
      hitEmojiOBJ = createListPicker(cellIndex + 1
          , [EnumEmojisDemo.demo(), EnumEmojis.hands_thumbsup(), EnumEmojis.hands_clap()
            , EnumEmojis.hearts_heart(), EnumEmojis.smileys_blush()]
          , [EnumEmojisDemo.demo(), EnumEmojis.hands_thumbsup(), EnumEmojis.hands_clap()
            , EnumEmojis.hearts_heart(), EnumEmojis.smileys_blush()]);
      hitEmojiOBJ.setSelectedIndex(1, false);
      hitEmojiVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_HITS());
      addHitOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_ADD_HIT());
      removeHitOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_REMOVE_HIT());
      clearHitsOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLEAR_HITS());
      hitsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_HIT_LIST());
      hitListVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_EMOJI_TYPES_BY_HITS());
      emojiTypesVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_PICKER());
      openPickerOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_OPEN_PICKER());
      closePickerOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLOSE_PICKER());
      pickerVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CONTENT_DIMENSIONS());
      contentDimensionsVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the code of the text of the example label: the text key of the example text
     * when that one is displayed, and the text itself in quotation marks otherwise.
     * @param imports the names of the classes collected so far
     */
    private function getLabelCode(imports:Array):String
    {
      application.trace("<" + this + " TextLabelWidget getLabelCode> called.", 4);
      application.trace("<" + this + " TextLabelWidget getLabelCode> imports: " + imports, 3);
      if (exampleTextLabel.getLabel() == EnumTextKeysDemo.WIDGET_EXAMPLE_TEXT())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo");
        return "EnumTextKeysDemo." + getTextKeyName(exampleTextLabel.getLabel()) + "()";
      }
      return "\"" + exampleTextLabel.getLabel() + "\"";
    }
    /**
     * Returns the code of the hits the example label has taken, one line per hit. The
     * moment of a hit is not displayed by that label, so every line of them takes the
     * moment it is read back at.
     * @param imports the names of the classes collected so far
     */
    private function getHitsCode(imports:Array):String
    {
      application.trace("<" + this + " TextLabelWidget getHitsCode> called.", 4);
      application.trace("<" + this + " TextLabelWidget getHitsCode> imports: " + imports, 3);
      const hits:Array = exampleTextLabel.getHits();
      var code:String = "";
      for (var i:int = 0; i < hits.length; i++)
      {
        code += codeVarName + ".addHit(\"" + hits[i].username + "\", "
          + getEmojiCode(hits[i].emojiType, imports) + ", new Date());\n";
      }
      hits.splice(0);
      return code;
    }
    /**
     * Returns the hits of the example label, one user and one emoji type per hit, or the
     * text key of the empty value when that label has taken no hit at all.
     */
    private function getHitsText():String
    {
      application.trace("<" + this + " TextLabelWidget getHitsText> called.", 4);
      const hits:Array = exampleTextLabel.getHits();
      var text:String = "";
      for (var i:int = 0; i < hits.length; i++)
      {
        text += (i > 0 ? ", " : "") + hits[i].username + " " + hits[i].emojiType;
      }
      hits.splice(0);
      return getTextOrNone(text);
    }
    /**
     * Returns the emoji types the example label has taken a hit of, in a descending order
     * by the number of their hits, or the text key of the empty value when that label has
     * taken no hit at all.
     */
    private function getEmojiTypesText():String
    {
      application.trace("<" + this + " TextLabelWidget getEmojiTypesText> called.", 4);
      const emojiTypes:Array = exampleTextLabel.getEmojiTypesByHits();
      const text:String = emojiTypes.join(", ");
      emojiTypes.splice(0);
      return getTextOrNone(text);
    }
    /**
     * Gives the maximum width and the multiline flag of the two rows of them to the
     * example label. The setter of that label drops every call that does not change the
     * width, so a multiline change of one and the same width would be lost: the width is
     * taken back to zero first to let that call through.
     */
    private function applyMaxWidth():void
    {
      application.trace("<" + this + " TextLabelWidget applyMaxWidth> called.", 4);
      const multiline:Boolean = multilineOBJ.getOn();
      exampleTextLabel.setMaxWidth(0, multiline);
      exampleTextLabel.setMaxWidth(int(maxWidthOBJ.getCurValue()), multiline);
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the one using this application has taken a hit on
     * the example label, or opened or closed the picker of it.
     * @param e the changed, opened or closed event of that label
     */
    private function exampleTextLabelChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget exampleTextLabelChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget exampleTextLabelChanged> e: " + e, 3);
      displayEveryCurrentValue();
    }
    /**
     * Gives the text of the input of the label row to the example label.
     * @param e the changed event of that input
     */
    private function labelChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget labelChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget labelChanged> e: " + e, 3);
      exampleTextLabel.setLabel(labelOBJ.getText());
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked icon to the example label, or frees the leading slot of it up when
     * the empty item has been picked. An icon and an emoji are exclusive to each other in
     * that slot, so the picker of the emojis is taken back to its empty item as well.
     * @param e the changed event of the picker of the icons
     */
    private function iconChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget iconChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget iconChanged> e: " + e, 3);
      const iconType:String = iconOBJ.getSelectedValue();
      if (iconType == "")
      {
        exampleTextLabel.destIcon();
      }
      else
      {
        exampleTextLabel.setIcon(iconType);
      }
      // an icon of that slot drops the emoji standing in it, and the empty item frees
      // that slot up as a whole, so the picker of the emojis is empty either way
      emojiOBJ.setSelectedIndex(0, false);
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked emoji to the example label, or frees the leading slot of it up
     * when the empty item has been picked. An emoji and an icon are exclusive to each
     * other in that slot, so the picker of the icons is taken back to its empty item as
     * well.
     * @param e the changed event of the picker of the emojis
     */
    private function emojiChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget emojiChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget emojiChanged> e: " + e, 3);
      const emojiType:String = emojiOBJ.getSelectedValue();
      if (emojiType == "")
      {
        exampleTextLabel.destIcon();
      }
      else
      {
        exampleTextLabel.setEmoji(emojiType);
      }
      // an emoji of that slot drops the icon standing in it, and the empty item frees
      // that slot up as a whole, so the picker of the icons is empty either way
      iconOBJ.setSelectedIndex(0, false);
      displayEveryCurrentValue();
    }
    /**
     * Gives the picked text type to the example label.
     * @param e the changed event of the picker of the text types
     */
    private function textTypeChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget textTypeChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget textTypeChanged> e: " + e, 3);
      exampleTextLabel.setType(textTypeOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Gives the new maximum width to the example label.
     * @param e the changed event of the potmeter of the maximum width
     */
    private function maxWidthChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget maxWidthChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget maxWidthChanged> e: " + e, 3);
      applyMaxWidth();
    }
    /**
     * Gives the new multiline flag to the example label.
     * @param e the changed event of the switcher of the multiline flag
     */
    private function multilineChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget multilineChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget multilineChanged> e: " + e, 3);
      applyMaxWidth();
    }
    /**
     * Switches the react feature of the example label on or off.
     * @param e the changed event of the switcher of that feature
     */
    private function reactEnabledChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget reactEnabledChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget reactEnabledChanged> e: " + e, 3);
      exampleTextLabel.setReactEnabled(reactEnabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the username of the hits has been changed: the
     * row of that name tells whether that user has hit the emoji of the row below it.
     * @param e the changed event of the input of the username
     */
    private function hitUserChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget hitUserChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget hitUserChanged> e: " + e, 3);
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the emoji of the hits has been changed: the row
     * of that emoji tells how many hits of it the example label has taken.
     * @param e the changed event of the picker of the emojis of the hits
     */
    private function hitEmojiChanged(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget hitEmojiChanged> called.", 4);
      application.trace("<" + this + " TextLabelWidget hitEmojiChanged> e: " + e, 3);
      displayEveryCurrentValue();
    }
    /**
     * Adds the hit of the username and of the emoji of the rows above to the example
     * label, the way a hit taken earlier is loaded back from a server.
     * @param e the click event of that link
     */
    private function addHitClick(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget addHitClick> called.", 4);
      application.trace("<" + this + " TextLabelWidget addHitClick> e: " + e, 3);
      exampleTextLabel.addHit(hitUserOBJ.getText(), hitEmojiOBJ.getSelectedValue(), new Date());
      displayEveryCurrentValue();
    }
    /**
     * Drops the hit of the username and of the emoji of the rows above from the example
     * label.
     * @param e the click event of that link
     */
    private function removeHitClick(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget removeHitClick> called.", 4);
      application.trace("<" + this + " TextLabelWidget removeHitClick> e: " + e, 3);
      exampleTextLabel.removeHit(hitUserOBJ.getText(), hitEmojiOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Drops every hit of the example label.
     * @param e the click event of that link
     */
    private function clearHitsClick(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget clearHitsClick> called.", 4);
      application.trace("<" + this + " TextLabelWidget clearHitsClick> e: " + e, 3);
      exampleTextLabel.clearHits();
      displayEveryCurrentValue();
    }
    /**
     * Opens the emoji picker of the example label. That picker belongs to the react
     * feature, so it stays closed while that feature is switched off.
     * @param e the click event of that link
     */
    private function openPickerClick(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget openPickerClick> called.", 4);
      application.trace("<" + this + " TextLabelWidget openPickerClick> e: " + e, 3);
      exampleTextLabel.openPicker();
      displayEveryCurrentValue();
    }
    /**
     * Closes the emoji picker of the example label.
     * @param e the click event of that link
     */
    private function closePickerClick(e:Event):void
    {
      application.trace("<" + this + " TextLabelWidget closePickerClick> called.", 4);
      application.trace("<" + this + " TextLabelWidget closePickerClick> e: " + e, 3);
      exampleTextLabel.closePicker();
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
      application.trace("<" + this + " TextLabelWidget destroy> called.", 4);
      application.trace("<" + this + " TextLabelWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " TextLabelWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " TextLabelWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " TextLabelWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      maxWidthMIN = 0;
      maxWidthMAX = 0;
      maxWidthINC = 0;
      exampleTextLabel = null;
      labelOBJ = null;
      iconOBJ = null;
      emojiOBJ = null;
      textTypeOBJ = null;
      maxWidthOBJ = null;
      multilineOBJ = null;
      reactEnabledOBJ = null;
      hitUserOBJ = null;
      hitEmojiOBJ = null;
      addHitOBJ = null;
      removeHitOBJ = null;
      clearHitsOBJ = null;
      openPickerOBJ = null;
      closePickerOBJ = null;
      labelVAL = null;
      iconVAL = null;
      emojiVAL = null;
      textTypeVAL = null;
      textFieldVAL = null;
      iconObjectVAL = null;
      reactEnabledVAL = null;
      hitUserVAL = null;
      hitEmojiVAL = null;
      hitsVAL = null;
      hitListVAL = null;
      emojiTypesVAL = null;
      pickerVAL = null;
      contentDimensionsVAL = null;
    }
  }
}
