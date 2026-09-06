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
 * IconWidget.
 * The widget of the Icon component of the framework.
 *
 * MAIN FEATURES:
 * - an embedded image drawn in the color of the text type it belongs to
 * - the example icon stands at the top of the content of this widget and every property
 *   of it can be changed right under it
 * - the rows of the icon, of the emoji, of the text type, of the size and of the drawing
 *   are built here, every other one comes from the PropertyWidget base class
 * - the dimensions of that icon come from the drawing of it, so it has no row of a width
 *   and no row of a height at all
 * - the picker of the icons offers the ones of the framework and the ones of this demo
 *   application as well, so the code of the current state names two enums
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
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.Icon;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class IconWidget extends PropertyWidget
  {
    // the range and the starting value of the size the example icon is drawn in
    private var iconSizeMIN:int = 8;
    private var iconSizeMAX:int = 128;
    private var iconSizeINC:int = 8;
    private var iconSizeINI:int = 48;
    // The icon types the picker of the icons offers. The ones of this demo application
    // are held on their own as well: the code of the current state names the enum of
    // this application for those and the one of the framework for every other.
    private var iconTypesARR:Array = null;
    private var iconTypesDemoARR:Array = null;
    // the emoji types the picker of the emojis offers
    private var emojiTypesARR:Array = null;
    // the example icon: the very object the rows of this widget work on
    private var exampleIcon:Icon = null;
    // the elements changing the properties of that icon
    private var iconOBJ:ListPicker = null;
    private var emojiOBJ:ListPicker = null;
    private var textTypeOBJ:ListPicker = null;
    private var iconSizeOBJ:Potmeter = null;
    private var destBitmapDataOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that icon answer
    private var iconVAL:TextLabel = null;
    private var emojiVAL:TextLabel = null;
    private var textTypeVAL:TextLabel = null;
    private var iconSizeVAL:TextLabel = null;
    private var drawingVAL:TextLabel = null;
    /**
     * Constructs the widget of the Icon component.
     * @param applicationRef the main application reference
     */
    public function IconWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " IconWidget> called.", 4);
      application.trace("<" + this + " IconWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.ICON();
      headerIcon = EnumIcons.circlefull();
      infoCode = EnumTextKeysDemo.WIDGETINFO_ICON();
      codeVarName = "icon";
      iniSizeWidth = 770;
      iniSizeHeight = 620;
      iconTypesDemoARR = [EnumIconsDemo.application(), EnumIconsDemo.camera()];
      iconTypesARR = [EnumIcons.info(), EnumIcons.settings(), EnumIcons.starfull()
        , EnumIcons.warning()].concat(iconTypesDemoARR);
      emojiTypesARR = [EnumEmojisDemo.demo(), EnumEmojis.hands_thumbsup()
        , EnumEmojis.hearts_heart(), EnumEmojis.smileys_blush()];
      application.trace("<" + this + " IconWidget> constructed.", 4);
    }
    /**
     * Builds the example icon of this widget and draws an icon of the framework into it.
     * It is not filled, so it keeps the dimensions its own drawing means, and the strip
     * it takes is as tall as it is.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " IconWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleIcon = new Icon(application);
      setExampleElement(exampleIcon);
      exampleIcon.drawBitmapData(EnumIcons.info(), EnumTextTypes.TEXT_TYPE_BRIGHT(), iconSizeINI);
    }
    /**
     * Builds every row of this widget: the ones of the Icon component itself and the ones
     * the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " IconWidget createRows> called.", 4);
      super.createRows();
      createDrawingRows();
      createSpriteRows();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget. The example icon itself is
     * not listened to: it dispatches no event of its own at all, and the dimensions it
     * takes from a new drawing are followed by the base class already.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " IconWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      iconOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), iconChanged);
      emojiOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), emojiChanged);
      textTypeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), textTypeChanged);
      iconSizeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), iconSizeChanged);
      destBitmapDataOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), destBitmapDataClick);
    }
    /**
     * Displays the current value of every property of the example icon. An object that
     * has been freed up keeps the size of the drawing it has held, so that the very same
     * one can be drawn again, but the dimensions of it go back to zero: the width is the
     * one telling whether there is a drawing in it at all.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " IconWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      iconVAL.setLabel(getTextOrNone(exampleIcon.getIconType()));
      emojiVAL.setLabel(getTextOrNone(exampleIcon.getEmojiType()));
      textTypeVAL.setLabel(getTextOrNone(exampleIcon.getTextType()));
      iconSizeVAL.setLabel("" + exampleIcon.getIconSize());
      drawingVAL.setLabel(getYesNoKey(exampleIcon.getDw() > 0));
    }
    /**
     * Returns the code writing the example icon the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new icon. A brand new icon holds no drawing at all, and every
     * class the code below names is collected into the imports while those lines are
     * written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " IconWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("Icon", imports);
      code += getDrawingCode(imports);
      code += getSpritePropertiesCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the properties the Icon component brings of its own: the icon
     * and the emoji that can be drawn into it, the text type an icon of it is colored
     * by, the size of the drawing and the drawing itself. An icon and an emoji are
     * exclusive to each other, and an emoji comes in the colors of its own, so the row
     * of the text type stands empty while there is an emoji in that object.
     */
    private function createDrawingRows():void
    {
      application.trace("<" + this + " IconWidget createDrawingRows> called.", 4);
      const noneKey:String = EnumTextKeysDemo.WIDGET_VALUE_NONE();
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON());
      iconOBJ = createListPicker(cellIndex + 1
          , [noneKey].concat(iconTypesARR)
          , [""].concat(iconTypesARR)
          , [null].concat(iconTypesARR));
      iconOBJ.setSelectedIndex(1, false);
      iconVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_EMOJI());
      emojiOBJ = createListPicker(cellIndex + 1
          , [noneKey].concat(emojiTypesARR)
          , [""].concat(emojiTypesARR));
      emojiOBJ.setSelectedIndex(0, false);
      emojiVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_TEXT_TYPE());
      textTypeOBJ = createListPicker(cellIndex + 1
          , application.getLabelManager().getKeysTextTypes()
          , application.getLabelManager().getKeysTextTypes());
      textTypeOBJ.setSelectedIndex(0, false);
      textTypeVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_ICON_SIZE());
      iconSizeOBJ = createPotmeter(cellIndex + 1, iconSizeMIN, iconSizeMAX, iconSizeINC);
      iconSizeOBJ.setCurValue(iconSizeINI, false);
      iconSizeVAL = createValueLabel(cellIndex + 2);
      // this row has a link freeing the drawing up only: every row above is the one
      // drawing it again, so there is nothing left to draw it with here
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_DRAWING());
      destBitmapDataOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_DEST_BITMAP_DATA());
      drawingVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the line of the drawing of the example icon: the icon of it in the colors
     * of its own text type, or the emoji of it in the colors that emoji arrives in. An
     * object that has been freed up needs no such line at all, and it is the width of it
     * telling that, because the types of the drawing it has held are kept by it.
     * @param imports the names of the classes collected so far
     */
    private function getDrawingCode(imports:Array):String
    {
      application.trace("<" + this + " IconWidget getDrawingCode> called.", 4);
      application.trace("<" + this + " IconWidget getDrawingCode> imports: " + imports, 3);
      if (exampleIcon.getDw() == 0)
      {
        return "";
      }
      if (exampleIcon.getIconType() != "")
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumTextTypes");
        return codeVarName + ".drawBitmapData(" + getIconCode(exampleIcon.getIconType(), imports)
          + ", EnumTextTypes." + getTextKeyName(exampleIcon.getTextType()) + "(), "
          + exampleIcon.getIconSize() + ");\n";
      }
      if (exampleIcon.getEmojiType() != "")
      {
        return codeVarName + ".drawEmojiBitmapData("
          + getEmojiCode(exampleIcon.getEmojiType(), imports) + ", "
          + exampleIcon.getIconSize() + ");\n";
      }
      return "";
    }
    /**
     * Returns the code of the given icon: the icons of this demo application come from
     * the enum of this application and every other one from the enum of the framework.
     * @param iconType the type of the icon, an EnumIcons value
     * @param imports the names of the classes collected so far
     */
    private function getIconCode(iconType:String, imports:Array):String
    {
      application.trace("<" + this + " IconWidget getIconCode> called.", 4);
      application.trace("<" + this + " IconWidget getIconCode> iconType: " + iconType, 3);
      application.trace("<" + this + " IconWidget getIconCode> imports: " + imports, 3);
      if (iconTypesDemoARR.indexOf(iconType) > -1)
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo");
        return "EnumIconsDemo." + iconType + "()";
      }
      pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumIcons");
      return "EnumIcons." + iconType + "()";
    }
    /**
     * Draws the example icon again the way the rows of this widget stand at the moment:
     * the picked icon in the picked text type, or the picked emoji in the colors of its
     * own, both of them in the size of the potmeter. The bitmap data is freed up when
     * neither an icon nor an emoji has been picked at all.
     */
    private function redrawExampleIcon():void
    {
      application.trace("<" + this + " IconWidget redrawExampleIcon> called.", 4);
      const iconSize:int = int(iconSizeOBJ.getCurValue());
      const iconType:String = iconOBJ.getSelectedValue();
      const emojiType:String = emojiOBJ.getSelectedValue();
      if (iconType != "")
      {
        exampleIcon.drawBitmapData(iconType, textTypeOBJ.getSelectedValue(), iconSize);
      }
      else if (emojiType != "")
      {
        exampleIcon.drawEmojiBitmapData(emojiType, iconSize);
      }
      else
      {
        exampleIcon.destBitmapData();
      }
      displayEveryCurrentValue();
    }
    /**
     * Draws the picked icon into the example icon. An icon and an emoji are exclusive to
     * each other in that object, so the picker of the emojis is taken back to its empty
     * item, and the empty item of this picker frees that object up as a whole.
     * @param e the changed event of the picker of the icons
     */
    private function iconChanged(e:Event):void
    {
      application.trace("<" + this + " IconWidget iconChanged> called.", 4);
      application.trace("<" + this + " IconWidget iconChanged> e: " + e, 3);
      emojiOBJ.setSelectedIndex(0, false);
      redrawExampleIcon();
    }
    /**
     * Draws the picked emoji into the example icon. An emoji and an icon are exclusive to
     * each other in that object, so the picker of the icons is taken back to its empty
     * item, and the empty item of this picker frees that object up as a whole.
     * @param e the changed event of the picker of the emojis
     */
    private function emojiChanged(e:Event):void
    {
      application.trace("<" + this + " IconWidget emojiChanged> called.", 4);
      application.trace("<" + this + " IconWidget emojiChanged> e: " + e, 3);
      iconOBJ.setSelectedIndex(0, false);
      redrawExampleIcon();
    }
    /**
     * Draws the example icon again in the colors of the picked text type. An emoji comes
     * in the colors of its own, so a text type changes nothing at all on it.
     * @param e the changed event of the picker of the text types
     */
    private function textTypeChanged(e:Event):void
    {
      application.trace("<" + this + " IconWidget textTypeChanged> called.", 4);
      application.trace("<" + this + " IconWidget textTypeChanged> e: " + e, 3);
      redrawExampleIcon();
    }
    /**
     * Draws the example icon again in the new size: the dimensions of that object come
     * from its own drawing, so this is the very row sizing it.
     * @param e the changed event of the potmeter of the size
     */
    private function iconSizeChanged(e:Event):void
    {
      application.trace("<" + this + " IconWidget iconSizeChanged> called.", 4);
      application.trace("<" + this + " IconWidget iconSizeChanged> e: " + e, 3);
      redrawExampleIcon();
    }
    /**
     * Frees the bitmap data of the example icon up: the dimensions of that object go back
     * to zero and nothing is displayed by it any more. The types of it are kept, so every
     * row above draws it again exactly the way it has stood.
     * @param e the click event of that link
     */
    private function destBitmapDataClick(e:Event):void
    {
      application.trace("<" + this + " IconWidget destBitmapDataClick> called.", 4);
      application.trace("<" + this + " IconWidget destBitmapDataClick> e: " + e, 3);
      exampleIcon.destBitmapData();
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
      application.trace("<" + this + " IconWidget destroy> called.", 4);
      application.trace("<" + this + " IconWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " IconWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      iconTypesARR.splice(0);
      iconTypesDemoARR.splice(0);
      emojiTypesARR.splice(0);
      application.trace("<" + this + " IconWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " IconWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      iconSizeMIN = 0;
      iconSizeMAX = 0;
      iconSizeINC = 0;
      iconSizeINI = 0;
      iconTypesARR = null;
      iconTypesDemoARR = null;
      emojiTypesARR = null;
      exampleIcon = null;
      iconOBJ = null;
      emojiOBJ = null;
      textTypeOBJ = null;
      iconSizeOBJ = null;
      destBitmapDataOBJ = null;
      iconVAL = null;
      emojiVAL = null;
      textTypeVAL = null;
      iconSizeVAL = null;
      drawingVAL = null;
    }
  }
}
