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
 * ImageWidget.
 * The widget of the Image component of the framework.
 *
 * MAIN FEATURES:
 * - the example picture stands on the top of the content and every row below works
 *   on it, the way every other widget of this application does it
 * - the pictures of the picker of the urls are the sample files of the site of this
 *   framework, one of every usual resolution, so the shrinking into the box and the
 *   loading of a real picture can be tried on all of them
 * - the picture embedded into this application is offered as well, so a picture the
 *   application already holds is seen without a loading at all
 * - the rows of the reactions are the ones of the base class this component shares
 *   with the TextLabel: emojis can be stuck onto a picture the very same way
 * - the fullscreen of the picture is opened and closed from here as well, and the row of
 *   it displays whether that fullscreen is opened at the moment, so the button standing
 *   on the picture is followed by this widget too
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumEmojisDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEmojis;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.Image;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextInput;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class ImageWidget extends PropertyWidget
  {
    // the folder of the sample pictures of the site of this framework and the resolution
    // of every one of them: the name of a file is the prefix, the resolution and the
    // extension written after each other
    private const SAMPLES_URL:String = "https://app1.kisscodesystems.com/kcsops/samples/";
    private const SAMPLES_PREFIX:String = "sample_";
    private const SAMPLES_EXTENSION:String = ".png";
    // the range and the starting value of the box the example picture is drawn inside
    private var boxMIN:int = 0;
    private var boxMAX:int = 600;
    private var boxINC:int = 20;
    private var boxINI:int = 240;
    // the milliseconds the loading of the example picture is delayed by: a real loading
    // is demonstrated by it, so the one using this application sees that it is on its way
    private var loadDelay:int = 500;
    // the resolutions the picker of the urls offers, and the url of the picture belonging
    // to every one of them
    private var resolutionsARR:Array = null;
    private var urlsARR:Array = null;
    // the example picture: the very object the rows of this widget work on
    private var exampleImage:Image = null;
    // the elements changing the properties of that picture
    private var urlOBJ:ListPicker = null;
    private var loadOBJ:ButtonLink = null;
    private var embeddedOBJ:ButtonLink = null;
    private var clearOBJ:ButtonLink = null;
    private var boxDwOBJ:Potmeter = null;
    private var boxDhOBJ:Potmeter = null;
    private var fitToBoxOBJ:Switcher = null;
    private var resizableOBJ:Switcher = null;
    private var inSquareOBJ:Switcher = null;
    private var frameOBJ:Switcher = null;
    private var postDataOBJ:ButtonLink = null;
    private var fullscreenOBJ:Switcher = null;
    private var openFullscreenOBJ:ButtonLink = null;
    private var closeFullscreenOBJ:ButtonLink = null;
    // the elements of the rows of the reactions
    private var reactEnabledOBJ:Switcher = null;
    private var hitUserOBJ:TextInput = null;
    private var hitEmojiOBJ:ListPicker = null;
    private var addHitOBJ:ButtonLink = null;
    private var removeHitOBJ:ButtonLink = null;
    private var clearHitsOBJ:ButtonLink = null;
    private var openPickerOBJ:ButtonLink = null;
    private var closePickerOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that picture answer
    private var urlVAL:TextLabel = null;
    private var pictureVAL:TextLabel = null;
    private var loadingVAL:TextLabel = null;
    private var bitmapDimensionsVAL:TextLabel = null;
    private var boxDimensionsVAL:TextLabel = null;
    private var fitToBoxVAL:TextLabel = null;
    private var resizableVAL:TextLabel = null;
    private var inSquareVAL:TextLabel = null;
    private var frameVAL:TextLabel = null;
    private var postDataVAL:TextLabel = null;
    private var fullscreenVAL:TextLabel = null;
    private var reactEnabledVAL:TextLabel = null;
    private var hitUserVAL:TextLabel = null;
    private var hitEmojiVAL:TextLabel = null;
    private var hitsVAL:TextLabel = null;
    private var hitListVAL:TextLabel = null;
    private var emojiTypesVAL:TextLabel = null;
    private var pickerVAL:TextLabel = null;
    private var contentDimensionsVAL:TextLabel = null;
    /**
     * Constructs the widget of the Image component.
     * @param applicationRef the main application reference
     */
    public function ImageWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ImageWidget> called.", 4);
      application.trace("<" + this + " ImageWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.IMAGE();
      headerIcon = EnumIcons.file();
      infoCode = EnumTextKeysDemo.WIDGETINFO_IMAGE();
      codeVarName = "image";
      iniSizeWidth = 780;
      iniSizeHeight = 790;
      resolutionsARR = ["426x240", "640x360", "854x480", "1280x720", "1920x1080"
        , "2560x1440", "3840x2160"];
      urlsARR = new Array();
      for (var i:int = 0; i < resolutionsARR.length; i++)
      {
        urlsARR.push(SAMPLES_URL + SAMPLES_PREFIX + resolutionsARR[i] + SAMPLES_EXTENSION);
      }
      application.trace("<" + this + " ImageWidget> constructed.", 4);
    }
    /**
     * Builds the example picture of this widget: it stands inside a box of a square, it
     * carries a frame, it can be resized by hand and opened in fullscreen, and the picture
     * embedded into this application is displayed in it right away, so this widget holds
     * something to be looked at without a single loading.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " ImageWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleImage = new Image(application);
      setExampleElement(exampleImage);
      exampleImage.setFrame(true);
      exampleImage.setFullscreenEnabled(true);
      exampleImage.setResizable(true);
      exampleImage.setDwh(boxINI, boxINI);
      setEmbeddedPicture();
    }
    /**
     * Builds every row of this widget: the ones of the Image component itself, the ones
     * of the reactions and the ones the base class of it holds.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " ImageWidget createRows> called.", 4);
      super.createRows();
      createPictureRows();
      createBoxRows();
      createFullscreenRows();
      createSpriteRows();
      createReactRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * picture as well: that picture reports every loading of its own by an event, and the
     * one using this application can react to it and open the picker of the emojis by
     * its own elements instead of a row below.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " ImageWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleImage.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_FILE_LOADED(), exampleImageChanged);
      exampleImage.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleImageChanged);
      exampleImage.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_OPENED(), exampleImageChanged);
      exampleImage.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLOSED(), exampleImageChanged);
      urlOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), urlChanged);
      loadOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), loadClick);
      embeddedOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), embeddedClick);
      clearOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), clearClick);
      boxDwOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), boxChanged);
      boxDhOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), boxChanged);
      fitToBoxOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), fitToBoxChanged);
      resizableOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), resizableChanged);
      inSquareOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), inSquareChanged);
      frameOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), frameChanged);
      postDataOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), postDataClick);
      fullscreenOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), fullscreenChanged);
      openFullscreenOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), openFullscreenClick);
      closeFullscreenOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), closeFullscreenClick);
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
     * Displays the current value of every property of the example picture.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " ImageWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      urlVAL.setLabel(getShortTextOrNone(exampleImage.getUrl()));
      pictureVAL.setLabel(getYesNoKey(exampleImage.isPictureLoaded()));
      loadingVAL.setLabel(getYesNoKey(exampleImage.isLoading()));
      bitmapDimensionsVAL.setLabel(exampleImage.getBitmapDw() + " x " + exampleImage.getBitmapDh());
      // the box of the picture is resized by hand as well, so the two potmeters of it
      // follow every drag of the handle standing in its corner
      boxDwOBJ.setCurValue(exampleImage.getBoxDw(), false);
      boxDhOBJ.setCurValue(exampleImage.getBoxDh(), false);
      boxDimensionsVAL.setLabel(exampleImage.getBoxDw() + " x " + exampleImage.getBoxDh());
      fitToBoxVAL.setLabel(getYesNoKey(exampleImage.getFitToBox()));
      resizableVAL.setLabel(getYesNoKey(exampleImage.getResizable()));
      inSquareVAL.setLabel(getYesNoKey(exampleImage.getInSquare()));
      frameVAL.setLabel(getYesNoKey(exampleImage.getFrame()));
      postDataVAL.setLabel("" + exampleImage.getNumOfPostData());
      fullscreenVAL.setLabel(getYesNoKey(exampleImage.isFullscreenOpened()));
      reactEnabledVAL.setLabel(getYesNoKey(exampleImage.getReactEnabled()));
      hitUserVAL.setLabel(getYesNoKey(exampleImage.hasHitOfUser(hitUserOBJ.getText()
        , hitEmojiOBJ.getSelectedValue())));
      hitEmojiVAL.setLabel("" + exampleImage.getNumOfHitsOfEmoji(hitEmojiOBJ.getSelectedValue()));
      hitsVAL.setLabel("" + exampleImage.getNumOfHits());
      hitListVAL.setLabel(getHitsText());
      emojiTypesVAL.setLabel(getEmojiTypesText());
      pickerVAL.setLabel(getYesNoKey(exampleImage.isPickerOpened()));
      contentDimensionsVAL.setLabel(exampleImage.getContentDw() + " x " + exampleImage.getContentDh());
    }
    /**
     * Returns the code writing the example picture the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new picture. The bitmap data of an embedded resource is no line
     * of code at all, so a picture that has been given one carries the comment telling
     * exactly that, and every class the code below names is collected into the imports
     * while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " ImageWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("Image", imports);
      if (!exampleImage.getFitToBox())
      {
        code += codeVarName + ".setFitToBox(false);\n";
      }
      if (exampleImage.getResizable())
      {
        code += codeVarName + ".setResizable(true);\n";
      }
      if (exampleImage.getInSquare())
      {
        code += codeVarName + ".setInSquare(true);\n";
      }
      if (exampleImage.getFrame())
      {
        code += codeVarName + ".setFrame(true);\n";
      }
      if (exampleImage.getFullscreenEnabled())
      {
        code += codeVarName + ".setFullscreenEnabled(true);\n";
      }
      if (exampleImage.getBoxDw() > 0 || exampleImage.getBoxDh() > 0)
      {
        code += codeVarName + ".setDwh(" + exampleImage.getBoxDw()
          + ", " + exampleImage.getBoxDh() + ");\n";
      }
      if (exampleImage.getNumOfPostData() > 0)
      {
        code += codeVarName + ".setPostData([\"user\", \"fileurl\"]\n"
          + "    , [application.getUser().getUsername(), \"" + getSelectedFileName() + "\"]);\n";
      }
      if (exampleImage.getUrl() != "")
      {
        code += codeVarName + ".loadUrl(\"" + exampleImage.getUrl() + "\", " + loadDelay + ");\n";
      }
      else if (exampleImage.isPictureLoaded())
      {
        code += "// the picture below is the embedded background image of the framework\n"
          + codeVarName + ".setBitmapData(application.getBackgroundManager()"
          + ".getEmbeddedBackgroundBitmap().bitmapData);\n";
      }
      code += getSpritePropertiesCode(imports);
      if (exampleImage.getReactEnabled())
      {
        code += codeVarName + ".setReactEnabled(true);\n";
      }
      code += getHitsCode(imports);
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the picture itself: the url it is asked for from, the loading of
     * it, the dimensions it has arrived with and the variables of the post request. The
     * three links of the second row are the ones a picture is taken and dropped with.
     */
    private function createPictureRows():void
    {
      application.trace("<" + this + " ImageWidget createPictureRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_IMAGE_URL());
      urlOBJ = createListPicker(cellIndex + 1, resolutionsARR.concat(), urlsARR.concat());
      urlOBJ.setSelectedIndex(1, false);
      urlVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_PICTURE());
      loadOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_LOAD());
      embeddedOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_EMBEDDED());
      clearOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLEAR());
      pictureVAL = createValueLabel(cellIndex + 2);
      // the loading of a picture is a state and not a property, so this row has nothing
      // to change it with
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_LOADING());
      loadingVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_BITMAP_DIMENSIONS());
      bitmapDimensionsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_POST_DATA());
      postDataOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SET_POST_DATA());
      postDataVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the box the picture is drawn inside: the dimensions of that box,
     * the fitting into it, the resizing by hand, the square and the frame. The two
     * potmeters of the dimensions share one cell, so they stand next to each other, and
     * they follow every drag of the handle of the resizing as well.
     */
    private function createBoxRows():void
    {
      application.trace("<" + this + " ImageWidget createBoxRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_BOX_DIMENSIONS());
      boxDwOBJ = createPotmeter(cellIndex + 1, boxMIN, boxMAX, boxINC);
      boxDhOBJ = createPotmeter(cellIndex + 1, boxMIN, boxMAX, boxINC);
      boxDwOBJ.setCurValue(exampleImage.getBoxDw(), false);
      boxDhOBJ.setCurValue(exampleImage.getBoxDh(), false);
      boxDimensionsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_FIT_TO_BOX());
      fitToBoxOBJ = createSwitcher(cellIndex + 1, exampleImage.getFitToBox());
      fitToBoxVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_RESIZABLE());
      resizableOBJ = createSwitcher(cellIndex + 1, exampleImage.getResizable());
      resizableVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_IN_SQUARE());
      inSquareOBJ = createSwitcher(cellIndex + 1, exampleImage.getInSquare());
      inSquareVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_FRAME());
      frameOBJ = createSwitcher(cellIndex + 1, exampleImage.getFrame());
      frameVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the row of the fullscreen of the picture: the switcher of the feature itself
     * and the two links opening and closing it.
     */
    private function createFullscreenRows():void
    {
      application.trace("<" + this + " ImageWidget createFullscreenRows> called.", 4);
      const cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_FULLSCREEN());
      fullscreenOBJ = createSwitcher(cellIndex + 1, exampleImage.getFullscreenEnabled());
      openFullscreenOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_OPEN());
      closeFullscreenOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLOSE());
      fullscreenVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the properties the Image component takes from the BaseReact base
     * class: the react feature itself, the hits of the emojis, the picker of them and the
     * dimensions of the content of the picture. The username and the emoji of the two rows
     * standing on the top of them are the ones every hit is added and removed with.
     */
    private function createReactRows():void
    {
      application.trace("<" + this + " ImageWidget createReactRows> called.", 4);
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
     * Gives the embedded picture of this application to the example one: the background
     * image of the background manager, the very mosaic tile that stands behind this
     * whole application. It is displayed without a loading at all.
     */
    private function setEmbeddedPicture():void
    {
      application.trace("<" + this + " ImageWidget setEmbeddedPicture> called.", 4);
      if (application.getBackgroundManager().getEmbeddedBackgroundBitmap() == null)
      {
        application.trace("<" + this + " ImageWidget setEmbeddedPicture> this application embeds no picture at all!", 6);
        return;
      }
      exampleImage.setBitmapData(application.getBackgroundManager().getEmbeddedBackgroundBitmap().bitmapData);
    }
    /**
     * Returns the name of the sample file the picker of the urls stands on: the last part
     * of the url of it, the one a server asking for the file of a post request needs.
     */
    private function getSelectedFileName():String
    {
      return SAMPLES_PREFIX + urlOBJ.getText() + SAMPLES_EXTENSION;
    }
    /**
     * Returns the hits the example picture has taken, one user and one emoji type per hit,
     * or the text key of the empty value when that picture has taken no hit at all.
     */
    private function getHitsText():String
    {
      application.trace("<" + this + " ImageWidget getHitsText> called.", 4);
      const hits:Array = exampleImage.getHits();
      var text:String = "";
      for (var i:int = 0; i < hits.length; i++)
      {
        text += (i > 0 ? ", " : "") + hits[i].username + " " + hits[i].emojiType;
      }
      hits.splice(0);
      return getTextOrNone(text);
    }
    /**
     * Returns the emoji types the example picture has taken a hit of, in a descending
     * order by the number of their hits, or the text key of the empty value when that
     * picture has taken no hit at all.
     */
    private function getEmojiTypesText():String
    {
      application.trace("<" + this + " ImageWidget getEmojiTypesText> called.", 4);
      const emojiTypes:Array = exampleImage.getEmojiTypesByHits();
      const text:String = emojiTypes.join(", ");
      emojiTypes.splice(0);
      return getTextOrNone(text);
    }
    /**
     * Returns the code of the hits the example picture has taken, one line per hit. The
     * moment of a hit is not displayed by that picture, so every line of them takes the
     * moment it is read back at.
     * @param imports the names of the classes collected so far
     */
    private function getHitsCode(imports:Array):String
    {
      application.trace("<" + this + " ImageWidget getHitsCode> called.", 4);
      application.trace("<" + this + " ImageWidget getHitsCode> imports: " + imports, 3);
      const hits:Array = exampleImage.getHits();
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
     * Displays every value again after the example picture has loaded something, has been
     * reacted to or the picker of the emojis of it has been opened or closed.
     * @param e the file loaded, changed, opened or closed event of that picture
     */
    private function exampleImageChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget exampleImageChanged> called.", 4);
      application.trace("<" + this + " ImageWidget exampleImageChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Loads the picture of the picked resolution right away: a new url is the very thing
     * the picker of it is there for.
     * @param e the changed event of the picker of the urls
     */
    private function urlChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget urlChanged> called.", 4);
      application.trace("<" + this + " ImageWidget urlChanged> e: " + e, 3);
      loadTheSelectedUrl();
    }
    /**
     * Loads the picture of the url the picker of them stands on.
     * @param e the click event of that link
     */
    private function loadClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget loadClick> called.", 4);
      application.trace("<" + this + " ImageWidget loadClick> e: " + e, 3);
      loadTheSelectedUrl();
    }
    /**
     * Displays the picture embedded into this application in the example picture.
     * @param e the click event of that link
     */
    private function embeddedClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget embeddedClick> called.", 4);
      application.trace("<" + this + " ImageWidget embeddedClick> e: " + e, 3);
      setEmbeddedPicture();
      displayEveryCurrentValue();
    }
    /**
     * Drops the picture of the example object.
     * @param e the click event of that link
     */
    private function clearClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget clearClick> called.", 4);
      application.trace("<" + this + " ImageWidget clearClick> e: " + e, 3);
      exampleImage.clear();
      displayEveryCurrentValue();
    }
    /**
     * Starts the loading of the url the picker of them stands on, with the delay of this
     * widget, so the one using this application sees that the picture is on its way.
     */
    private function loadTheSelectedUrl():void
    {
      application.trace("<" + this + " ImageWidget loadTheSelectedUrl> called.", 4);
      exampleImage.loadUrl(urlOBJ.getSelectedValue(), loadDelay);
      displayEveryCurrentValue();
    }
    /**
     * Gives the new box to the example picture. Both potmeters hand both dimensions over
     * at once, so the picture is drawn once whichever of them has been moved.
     * @param e the changed event of one of the potmeters of the box
     */
    private function boxChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget boxChanged> called.", 4);
      application.trace("<" + this + " ImageWidget boxChanged> e: " + e, 3);
      exampleImage.setDwh(int(boxDwOBJ.getCurValue()), int(boxDhOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Tells the example picture whether it has to be shrunk into its box.
     * @param e the changed event of that switcher
     */
    private function fitToBoxChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget fitToBoxChanged> called.", 4);
      application.trace("<" + this + " ImageWidget fitToBoxChanged> e: " + e, 3);
      exampleImage.setFitToBox(fitToBoxOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Tells the example picture whether the box of it can be resized by hand.
     * @param e the changed event of that switcher
     */
    private function resizableChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget resizableChanged> called.", 4);
      application.trace("<" + this + " ImageWidget resizableChanged> e: " + e, 3);
      exampleImage.setResizable(resizableOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Tells the example picture whether it has to stand in the middle of a square.
     * @param e the changed event of that switcher
     */
    private function inSquareChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget inSquareChanged> called.", 4);
      application.trace("<" + this + " ImageWidget inSquareChanged> e: " + e, 3);
      exampleImage.setInSquare(inSquareOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Draws a frame around the example picture or takes that frame away.
     * @param e the changed event of that switcher
     */
    private function frameChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget frameChanged> called.", 4);
      application.trace("<" + this + " ImageWidget frameChanged> e: " + e, 3);
      exampleImage.setFrame(frameOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Gives the variables of a post request to the example picture, or takes them away
     * when there are some already: the session of the one using this application and the
     * name of the sample file the picker of the urls stands on, the very two a server
     * handing out the files of its own asks for.
     * @param e the click event of that link
     */
    private function postDataClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget postDataClick> called.", 4);
      application.trace("<" + this + " ImageWidget postDataClick> e: " + e, 3);
      if (exampleImage.getNumOfPostData() > 0)
      {
        exampleImage.setPostData(null, null);
      }
      else
      {
        exampleImage.setPostData(["user", "fileurl"]
            , [application.getUser().getUsername(), getSelectedFileName()]);
      }
      displayEveryCurrentValue();
    }
    /**
     * Tells the example picture whether it can be opened in fullscreen at all.
     * @param e the changed event of that switcher
     */
    private function fullscreenChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget fullscreenChanged> called.", 4);
      application.trace("<" + this + " ImageWidget fullscreenChanged> e: " + e, 3);
      exampleImage.setFullscreenEnabled(fullscreenOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Opens the example picture in fullscreen.
     * @param e the click event of that link
     */
    private function openFullscreenClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget openFullscreenClick> called.", 4);
      application.trace("<" + this + " ImageWidget openFullscreenClick> e: " + e, 3);
      exampleImage.openFullscreen();
      displayEveryCurrentValue();
    }
    /**
     * Closes the fullscreen of the example picture.
     * @param e the click event of that link
     */
    private function closeFullscreenClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget closeFullscreenClick> called.", 4);
      application.trace("<" + this + " ImageWidget closeFullscreenClick> e: " + e, 3);
      exampleImage.closeFullscreen();
      displayEveryCurrentValue();
    }
    /**
     * Switches the react feature of the example picture on or off.
     * @param e the changed event of that switcher
     */
    private function reactEnabledChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget reactEnabledChanged> called.", 4);
      application.trace("<" + this + " ImageWidget reactEnabledChanged> e: " + e, 3);
      exampleImage.setReactEnabled(reactEnabledOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the username of the hits has been changed: the row
     * of it tells whether that user has hit the emoji of the row below.
     * @param e the changed event of that input
     */
    private function hitUserChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget hitUserChanged> called.", 4);
      application.trace("<" + this + " ImageWidget hitUserChanged> e: " + e, 3);
      displayEveryCurrentValue();
    }
    /**
     * Displays every value again after the emoji of the hits has been picked: the row of
     * it tells how many hits that emoji has taken.
     * @param e the changed event of that picker
     */
    private function hitEmojiChanged(e:Event):void
    {
      application.trace("<" + this + " ImageWidget hitEmojiChanged> called.", 4);
      application.trace("<" + this + " ImageWidget hitEmojiChanged> e: " + e, 3);
      displayEveryCurrentValue();
    }
    /**
     * Takes one hit of the picked emoji on the example picture, in the name of the user of
     * the row of it.
     * @param e the click event of that link
     */
    private function addHitClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget addHitClick> called.", 4);
      application.trace("<" + this + " ImageWidget addHitClick> e: " + e, 3);
      exampleImage.addHit(hitUserOBJ.getText(), hitEmojiOBJ.getSelectedValue(), new Date());
      displayEveryCurrentValue();
    }
    /**
     * Takes the hit of the picked emoji of that user away.
     * @param e the click event of that link
     */
    private function removeHitClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget removeHitClick> called.", 4);
      application.trace("<" + this + " ImageWidget removeHitClick> e: " + e, 3);
      exampleImage.removeHit(hitUserOBJ.getText(), hitEmojiOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Takes every hit of the example picture away.
     * @param e the click event of that link
     */
    private function clearHitsClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget clearHitsClick> called.", 4);
      application.trace("<" + this + " ImageWidget clearHitsClick> e: " + e, 3);
      exampleImage.clearHits();
      displayEveryCurrentValue();
    }
    /**
     * Opens the picker of the emojis of the example picture.
     * @param e the click event of that link
     */
    private function openPickerClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget openPickerClick> called.", 4);
      application.trace("<" + this + " ImageWidget openPickerClick> e: " + e, 3);
      exampleImage.openPicker();
      displayEveryCurrentValue();
    }
    /**
     * Closes the picker of the emojis of the example picture.
     * @param e the click event of that link
     */
    private function closePickerClick(e:Event):void
    {
      application.trace("<" + this + " ImageWidget closePickerClick> called.", 4);
      application.trace("<" + this + " ImageWidget closePickerClick> e: " + e, 3);
      exampleImage.closePicker();
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
      application.trace("<" + this + " ImageWidget destroy> called.", 4);
      application.trace("<" + this + " ImageWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " ImageWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      resolutionsARR.splice(0);
      urlsARR.splice(0);
      application.trace("<" + this + " ImageWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " ImageWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      boxMIN = 0;
      boxMAX = 0;
      boxINC = 0;
      boxINI = 0;
      loadDelay = 0;
      resolutionsARR = null;
      urlsARR = null;
      exampleImage = null;
      urlOBJ = null;
      loadOBJ = null;
      embeddedOBJ = null;
      clearOBJ = null;
      boxDwOBJ = null;
      boxDhOBJ = null;
      fitToBoxOBJ = null;
      resizableOBJ = null;
      inSquareOBJ = null;
      frameOBJ = null;
      postDataOBJ = null;
      fullscreenOBJ = null;
      openFullscreenOBJ = null;
      closeFullscreenOBJ = null;
      reactEnabledOBJ = null;
      hitUserOBJ = null;
      hitEmojiOBJ = null;
      addHitOBJ = null;
      removeHitOBJ = null;
      clearHitsOBJ = null;
      openPickerOBJ = null;
      closePickerOBJ = null;
      urlVAL = null;
      pictureVAL = null;
      loadingVAL = null;
      bitmapDimensionsVAL = null;
      boxDimensionsVAL = null;
      fitToBoxVAL = null;
      resizableVAL = null;
      inSquareVAL = null;
      frameVAL = null;
      postDataVAL = null;
      fullscreenVAL = null;
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
