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
 * CameraWidget.
 * The widget of the Camera component of the framework.
 *
 * MAIN FEATURES:
 * - the example camera stands on the top of the content and every row below works on
 *   it, the way every other widget of this application does it
 * - the very same properties stand on the settings panel of that camera as well, so
 *   both ways of changing them can be tried, and a change made on that panel is
 *   displayed by the rows of this widget right away
 * - that panel is opened by a press on the picture of the camera and closed by a press
 *   next to it, and the row of it follows both of those presses as well
 * - the picker of the cameras offers every camera device of the machine and the one of
 *   the microphones every microphone device of it, and both of them offer nothing at all
 *   on a machine that holds none of that kind
 * - both devices can be muted from here as well, and the gain of the microphone can be
 *   dragged: the very same buttons stand on the settings panel of that camera too
 * - the ranges of the potmeters come from the configuration of this application, the
 *   very ones the component itself refuses every value outside of
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumCameraResolutions;
  import com.kisscodesystems.KissAs3Fw.enum.EnumEvents;
  import com.kisscodesystems.KissAs3Fw.ui.ButtonLink;
  import com.kisscodesystems.KissAs3Fw.ui.Camera;
  import com.kisscodesystems.KissAs3Fw.ui.ListPicker;
  import com.kisscodesystems.KissAs3Fw.ui.Potmeter;
  import com.kisscodesystems.KissAs3Fw.ui.Switcher;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  public class CameraWidget extends PropertyWidget
  {
    // the example camera: the very object the rows of this widget work on
    private var exampleCamera:Camera = null;
    // the elements changing the properties of that camera
    private var deviceOBJ:ListPicker = null;
    private var videoMutedOBJ:Switcher = null;
    private var microphoneOBJ:ListPicker = null;
    private var soundMutedOBJ:Switcher = null;
    private var soundVolumeOBJ:Potmeter = null;
    private var attachOBJ:ButtonLink = null;
    private var detachOBJ:ButtonLink = null;
    private var resolutionOBJ:ListPicker = null;
    private var resolutionFixedOBJ:Switcher = null;
    private var widthOBJ:Potmeter = null;
    private var fpsOBJ:Potmeter = null;
    private var qualityOBJ:Potmeter = null;
    private var blurOBJ:Potmeter = null;
    private var redOBJ:Potmeter = null;
    private var greenOBJ:Potmeter = null;
    private var blueOBJ:Potmeter = null;
    private var alphaOBJ:Potmeter = null;
    private var settingsOBJ:Switcher = null;
    private var resetOBJ:ButtonLink = null;
    private var takePictureOBJ:ButtonLink = null;
    private var showPictureOBJ:ButtonLink = null;
    private var clearPictureOBJ:ButtonLink = null;
    // the labels of the third column: the values the getters of that camera answer
    private var deviceVAL:TextLabel = null;
    private var videoMutedVAL:TextLabel = null;
    private var microphoneVAL:TextLabel = null;
    private var soundMutedVAL:TextLabel = null;
    private var soundVolumeVAL:TextLabel = null;
    private var attachedVAL:TextLabel = null;
    private var resolutionVAL:TextLabel = null;
    private var resolutionFixedVAL:TextLabel = null;
    private var widthVAL:TextLabel = null;
    private var fpsVAL:TextLabel = null;
    private var qualityVAL:TextLabel = null;
    private var blurVAL:TextLabel = null;
    private var colorsVAL:TextLabel = null;
    private var settingsVAL:TextLabel = null;
    private var pictureVAL:TextLabel = null;
    private var pictureBytesVAL:TextLabel = null;
    /**
     * Constructs the widget of the Camera component.
     * @param applicationRef the main application reference
     */
    public function CameraWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " CameraWidget> called.", 4);
      application.trace("<" + this + " CameraWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.CAMERA();
      headerIcon = EnumIconsDemo.camera();
      infoCode = EnumTextKeysDemo.WIDGETINFO_CAMERA();
      codeVarName = "camera";
      iniSizeWidth = 800;
      iniSizeHeight = 1020;
      application.trace("<" + this + " CameraWidget> constructed.", 4);
    }
    /**
     * Builds the example camera of this widget. It is not filled, so it keeps the
     * dimensions of its own picture, and no device is grabbed here: the one using this
     * application is the one allowing that, on the row of it or on the picture itself.
     */
    override protected function createExampleElement():void
    {
      application.trace("<" + this + " CameraWidget createExampleElement> called.", 4);
      super.createExampleElement();
      exampleCamera = new Camera(application);
      setExampleElement(exampleCamera);
    }
    /**
     * Builds every row of this widget: the ones of the Camera component itself and the
     * ones the base class of it holds. There are no rows of the dimensions at all: those
     * come from the picture of the camera, so the width and the aspect ratio are the ones
     * they are changed by.
     */
    override protected function createRows():void
    {
      application.trace("<" + this + " CameraWidget createRows> called.", 4);
      super.createRows();
      createDeviceRows();
      createPictureRows();
      createFilterRows();
      createPhotoRows();
      createSpriteRows();
      createLastEventRow();
      createCallRows();
    }
    /**
     * Registers the listener of every element of this widget, and the ones of the example
     * camera as well: that camera reports the grabbing and the releasing of the device by
     * two events of its own, every change made on its own settings panel by a third one
     * and a photo taken of it by a fourth, and every one of these can be done by the one
     * using this application instead of a row below.
     */
    override protected function addListenersToElements():void
    {
      application.trace("<" + this + " CameraWidget addListenersToElements> called.", 4);
      super.addListenersToElements();
      exampleCamera.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CAMERA_IS_ATTACHED(), exampleCameraChanged);
      exampleCamera.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CAMERA_IS_DETACHED(), exampleCameraChanged);
      exampleCamera.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), exampleCameraChanged);
      exampleCamera.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_SAVED(), exampleCameraChanged);
      deviceOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), deviceChanged);
      videoMutedOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), videoMutedChanged);
      microphoneOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), microphoneChanged);
      soundMutedOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), soundMutedChanged);
      soundVolumeOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), soundVolumeChanged);
      attachOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), attachClick);
      detachOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), detachClick);
      resolutionOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), resolutionChanged);
      resolutionFixedOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), resolutionFixedChanged);
      widthOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), widthChanged);
      fpsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), fpsChanged);
      qualityOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), qualityChanged);
      blurOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), blurChanged);
      redOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), redChanged);
      greenOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), greenChanged);
      blueOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), blueChanged);
      alphaOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), alphaChanged);
      settingsOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CHANGED(), settingsChanged);
      resetOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), resetClick);
      takePictureOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), takePictureClick);
      showPictureOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), showPictureClick);
      clearPictureOBJ.getBaseEventDispatcher().addEventListener(EnumEvents.EVENT_CLICK(), clearPictureClick);
    }
    /**
     * Displays the current value of every property of the example camera. Every element of
     * this widget is taken to the value of the camera as well, because that camera can be
     * changed on its own settings panel too, and both of them have to tell one and the
     * same thing.
     */
    override protected function displayEveryCurrentValue():void
    {
      application.trace("<" + this + " CameraWidget displayEveryCurrentValue> called.", 4);
      super.displayEveryCurrentValue();
      deviceOBJ.setSelectedIndex(exampleCamera.getSelectedDeviceIndex(), false);
      deviceVAL.setLabel(getDeviceText());
      videoMutedOBJ.setOn(exampleCamera.isVideoMuted(), false);
      videoMutedVAL.setLabel(getYesNoKey(exampleCamera.isVideoMuted()));
      microphoneOBJ.setSelectedIndex(exampleCamera.getSelectedMicrophoneIndex(), false);
      microphoneVAL.setLabel(getMicrophoneText());
      soundMutedOBJ.setOn(exampleCamera.isSoundMuted(), false);
      soundMutedVAL.setLabel(getYesNoKey(exampleCamera.isSoundMuted()));
      soundVolumeOBJ.setCurValue(exampleCamera.getSoundVolume(), false);
      soundVolumeVAL.setLabel("" + exampleCamera.getSoundVolume());
      attachedVAL.setLabel(getYesNoKey(exampleCamera.isCameraAttached()));
      resolutionOBJ.setSelectedIndex(EnumCameraResolutions.getEveryResolution()
        .indexOf(exampleCamera.getCameraResolution()), false);
      resolutionVAL.setLabel(exampleCamera.getCameraResolution());
      resolutionFixedOBJ.setOn(exampleCamera.getResolutionFixed(), false);
      resolutionFixedVAL.setLabel(getYesNoKey(exampleCamera.getResolutionFixed()));
      widthOBJ.setCurValue(exampleCamera.getCameraWidth(), false);
      widthVAL.setLabel(exampleCamera.getCameraWidth() + " x " + exampleCamera.getCameraHeight());
      fpsOBJ.setCurValue(exampleCamera.getCameraFps(), false);
      fpsVAL.setLabel("" + exampleCamera.getCameraFps());
      qualityOBJ.setCurValue(exampleCamera.getCameraQuality(), false);
      qualityVAL.setLabel("" + exampleCamera.getCameraQuality());
      blurOBJ.setCurValue(exampleCamera.getFilterBlur(), false);
      blurVAL.setLabel("" + exampleCamera.getFilterBlur());
      redOBJ.setCurValue(exampleCamera.getFilterRed(), false);
      greenOBJ.setCurValue(exampleCamera.getFilterGreen(), false);
      blueOBJ.setCurValue(exampleCamera.getFilterBlue(), false);
      alphaOBJ.setCurValue(exampleCamera.getFilterAlpha(), false);
      colorsVAL.setLabel(exampleCamera.getFilterRed() + ", " + exampleCamera.getFilterGreen()
        + ", " + exampleCamera.getFilterBlue() + ", " + exampleCamera.getFilterAlpha());
      settingsOBJ.setOn(exampleCamera.getSettingsVisible(), false);
      settingsVAL.setLabel(getYesNoKey(exampleCamera.getSettingsVisible()));
      pictureVAL.setLabel(getTextOrNone(exampleCamera.getPictureName()));
      pictureBytesVAL.setLabel(exampleCamera.getPictureByteArray() == null
        ? EnumTextKeysDemo.WIDGET_VALUE_NONE() : "" + exampleCamera.getPictureByteArray().length);
    }
    /**
     * Returns the code writing the example camera the way it stands at the moment: the
     * import lines it needs, an empty line, and the lines of the properties that are not
     * the ones of a brand new camera. The photo of a camera is taken by the one using the
     * application and not by a line of code, so it is left out, and every class the code
     * below names is collected into the imports while those lines are written.
     */
    override protected function getExampleCode():String
    {
      application.trace("<" + this + " CameraWidget getExampleCode> called.", 4);
      const imports:Array = new Array();
      var code:String = getConstructorCode("Camera", imports);
      if (exampleCamera.getSelectedDeviceIndex() > 0)
      {
        code += codeVarName + ".setSelectedDeviceIndex("
          + exampleCamera.getSelectedDeviceIndex() + ");\n";
      }
      if (exampleCamera.isVideoMuted())
      {
        code += codeVarName + ".setVideoMuted(true);\n";
      }
      if (exampleCamera.getSelectedMicrophoneIndex() > 0)
      {
        code += codeVarName + ".setSelectedMicrophoneIndex("
          + exampleCamera.getSelectedMicrophoneIndex() + ");\n";
      }
      if (exampleCamera.isSoundMuted())
      {
        code += codeVarName + ".setSoundMuted(true);\n";
      }
      if (exampleCamera.getSoundVolume() != application.getComponentsConfig().getCameraSoundVolumeIni())
      {
        code += codeVarName + ".setSoundVolume(" + exampleCamera.getSoundVolume() + ");\n";
      }
      if (exampleCamera.getCameraResolution() != EnumCameraResolutions.CAMERA_RESOLUTION_43())
      {
        pushImport(imports, "com.kisscodesystems.KissAs3Fw.enum.EnumCameraResolutions");
        code += codeVarName + ".setCameraResolution(EnumCameraResolutions."
          + getResolutionCodeName() + "());\n";
      }
      if (exampleCamera.getResolutionFixed())
      {
        code += codeVarName + ".setResolutionFixed(true);\n";
      }
      code += getPropertyCode("setCameraWidth", exampleCamera.getCameraWidth()
          , application.getComponentsConfig().getCameraWidthIni());
      code += getPropertyCode("setCameraFps", exampleCamera.getCameraFps()
          , application.getComponentsConfig().getCameraFpsIni());
      code += getPropertyCode("setCameraQuality", exampleCamera.getCameraQuality()
          , application.getComponentsConfig().getCameraQualityIni());
      code += getPropertyCode("setFilterBlur", exampleCamera.getFilterBlur()
          , application.getComponentsConfig().getCameraBlurMin());
      const channelIni:Number = application.getComponentsConfig().getCameraChannelIni();
      code += getPropertyCode("setFilterRed", exampleCamera.getFilterRed(), channelIni);
      code += getPropertyCode("setFilterGreen", exampleCamera.getFilterGreen(), channelIni);
      code += getPropertyCode("setFilterBlue", exampleCamera.getFilterBlue(), channelIni);
      code += getPropertyCode("setFilterAlpha", exampleCamera.getFilterAlpha(), channelIni);
      code += getSpritePropertiesCode(imports);
      if (exampleCamera.isCameraAttached())
      {
        code += codeVarName + ".attachCamera();\n";
      }
      code += getSpriteStateCode();
      return getImportsCode(imports) + code;
    }
    /**
     * Builds the rows of the devices of the camera: the picker of the camera devices of
     * this machine and the muting of the picture, the picker of the microphone devices of
     * it with the muting and the gain of the sound, and the two links grabbing and
     * releasing the picked pair.
     */
    private function createDeviceRows():void
    {
      application.trace("<" + this + " CameraWidget createDeviceRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_DEVICE());
      const cameraDevices:Array = exampleCamera.getCameraDevices();
      deviceOBJ = createListPicker(cellIndex + 1, cameraDevices.concat(), cameraDevices.concat());
      deviceOBJ.setSelectedIndex(exampleCamera.getSelectedDeviceIndex(), false);
      cameraDevices.splice(0);
      deviceVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_VIDEO_MUTED());
      videoMutedOBJ = createSwitcher(cellIndex + 1, exampleCamera.isVideoMuted());
      videoMutedVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_MICROPHONE());
      const microphoneDevices:Array = exampleCamera.getMicrophoneDevices();
      microphoneOBJ = createListPicker(cellIndex + 1, microphoneDevices.concat()
          , microphoneDevices.concat());
      microphoneOBJ.setSelectedIndex(exampleCamera.getSelectedMicrophoneIndex(), false);
      microphoneDevices.splice(0);
      microphoneVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_SOUND_MUTED());
      soundMutedOBJ = createSwitcher(cellIndex + 1, exampleCamera.isSoundMuted());
      soundMutedVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_SOUND_VOLUME());
      soundVolumeOBJ = createPotmeter(cellIndex + 1
          , application.getComponentsConfig().getCameraSoundVolumeMin()
          , application.getComponentsConfig().getCameraSoundVolumeMax()
          , application.getComponentsConfig().getCameraSoundVolumeInc());
      soundVolumeVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_ATTACHED());
      attachOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_ATTACH());
      detachOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_DETACH());
      attachedVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the picture of the camera: the aspect ratio, the fixing of it,
     * the width, the frames per second and the quality. The value of the width row is the
     * dimensions of the picture: the height comes from the width and from that ratio.
     */
    private function createPictureRows():void
    {
      application.trace("<" + this + " CameraWidget createPictureRows> called.", 4);
      const everyResolution:Array = EnumCameraResolutions.getEveryResolution();
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_RESOLUTION());
      resolutionOBJ = createListPicker(cellIndex + 1, everyResolution.concat(), everyResolution.concat());
      resolutionOBJ.setSelectedIndex(everyResolution.indexOf(exampleCamera.getCameraResolution()), false);
      everyResolution.splice(0);
      resolutionVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_RESOLUTION_FIXED());
      resolutionFixedOBJ = createSwitcher(cellIndex + 1, exampleCamera.getResolutionFixed());
      resolutionFixedVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_WIDTH());
      widthOBJ = createPotmeter(cellIndex + 1, application.getComponentsConfig().getCameraWidthMin()
          , application.getComponentsConfig().getCameraWidthMax()
          , application.getComponentsConfig().getCameraWidthInc());
      widthVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_FPS());
      fpsOBJ = createPotmeter(cellIndex + 1, application.getComponentsConfig().getCameraFpsMin()
          , application.getComponentsConfig().getCameraFpsMax(), 1);
      fpsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_QUALITY());
      qualityOBJ = createPotmeter(cellIndex + 1, application.getComponentsConfig().getCameraQualityMin()
          , application.getComponentsConfig().getCameraQualityMax(), 1);
      qualityVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the filters of the picture: the blur and the four color channels.
     * The four potmeters of the channels share one cell, so they stand next to each other,
     * in the order the value of the row displays them in.
     */
    private function createFilterRows():void
    {
      application.trace("<" + this + " CameraWidget createFilterRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_BLUR());
      blurOBJ = createPotmeter(cellIndex + 1, application.getComponentsConfig().getCameraBlurMin()
          , application.getComponentsConfig().getCameraBlurMax()
          , application.getComponentsConfig().getCameraBlurInc());
      blurVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_CAMERA_COLORS());
      const channelMin:Number = application.getComponentsConfig().getCameraChannelMin();
      const channelMax:Number = application.getComponentsConfig().getCameraChannelMax();
      const channelInc:Number = application.getComponentsConfig().getCameraChannelInc();
      const channelPrecision:int = application.getComponentsConfig().getCameraChannelPrecision();
      redOBJ = createPotmeter(cellIndex + 1, channelMin, channelMax, channelInc, channelPrecision);
      greenOBJ = createPotmeter(cellIndex + 1, channelMin, channelMax, channelInc, channelPrecision);
      blueOBJ = createPotmeter(cellIndex + 1, channelMin, channelMax, channelInc, channelPrecision);
      alphaOBJ = createPotmeter(cellIndex + 1, channelMin
          , application.getComponentsConfig().getCameraChannelAlphaMax(), channelInc, channelPrecision);
      colorsVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Builds the rows of the settings panel of the camera and of the photo taken of it:
     * the panel itself, the reset of every property, and the three links taking, showing
     * and dropping that photo.
     */
    private function createPhotoRows():void
    {
      application.trace("<" + this + " CameraWidget createPhotoRows> called.", 4);
      var cellIndex:int = createRow(EnumTextKeysDemo.WIDGET_PROP_SETTINGS());
      settingsOBJ = createSwitcher(cellIndex + 1, exampleCamera.getSettingsVisible());
      resetOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_RESET());
      settingsVAL = createValueLabel(cellIndex + 2);
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_PICTURE());
      takePictureOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_TAKE_PICTURE());
      showPictureOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_SHOW_PICTURE());
      clearPictureOBJ = createLink(cellIndex + 1, EnumTextKeysDemo.WIDGET_ACTION_CLEAR());
      pictureVAL = createValueLabel(cellIndex + 2);
      // the byte array of a photo is written by the camera itself, so this row has nothing
      // to change it with
      cellIndex = createRow(EnumTextKeysDemo.WIDGET_PROP_PICTURE_BYTES());
      pictureBytesVAL = createValueLabel(cellIndex + 2);
    }
    /**
     * Returns the camera device the example camera stands on: the index of it and the name
     * it is known by, or the text key of the empty value on a machine that holds no camera
     * device at all.
     */
    private function getDeviceText():String
    {
      application.trace("<" + this + " CameraWidget getDeviceText> called.", 4);
      return getDeviceTextOfIndex(exampleCamera.getSelectedDeviceIndex()
          , exampleCamera.getCameraDevices());
    }
    /**
     * Returns the microphone device the example camera stands on: the index of it and the
     * name it is known by, or the text key of the empty value on a machine that holds no
     * microphone device at all.
     */
    private function getMicrophoneText():String
    {
      application.trace("<" + this + " CameraWidget getMicrophoneText> called.", 4);
      return getDeviceTextOfIndex(exampleCamera.getSelectedMicrophoneIndex()
          , exampleCamera.getMicrophoneDevices());
    }
    /**
     * Returns the device of the given index of the given devices: the index of it and the
     * name it is known by, or the text key of the empty value when there is no device of
     * that index at all. The array of the names is a copy handed out by the example
     * camera, so it is freed up right here.
     * @param index the index of the device inside those devices
     * @param devices the names of the devices of one kind of this machine
     */
    private function getDeviceTextOfIndex(index:int, devices:Array):String
    {
      application.trace("<" + this + " CameraWidget getDeviceTextOfIndex> called.", 4);
      application.trace("<" + this + " CameraWidget getDeviceTextOfIndex> index: " + index, 3);
      application.trace("<" + this + " CameraWidget getDeviceTextOfIndex> devices: " + devices, 3);
      if (index < 0 || index >= devices.length)
      {
        devices.splice(0);
        return EnumTextKeysDemo.WIDGET_VALUE_NONE();
      }
      const text:String = index + ": " + devices[index];
      devices.splice(0);
      return text;
    }
    /**
     * Returns the name of the function of the aspect ratio the example camera stands in:
     * the code of the current state names that very function of the enum of the ratios.
     */
    private function getResolutionCodeName():String
    {
      application.trace("<" + this + " CameraWidget getResolutionCodeName> called.", 4);
      if (exampleCamera.getCameraResolution() == EnumCameraResolutions.CAMERA_RESOLUTION_11())
      {
        return "CAMERA_RESOLUTION_11";
      }
      if (exampleCamera.getCameraResolution() == EnumCameraResolutions.CAMERA_RESOLUTION_169())
      {
        return "CAMERA_RESOLUTION_169";
      }
      return "CAMERA_RESOLUTION_43";
    }
    /**
     * Returns the line of the code of the current state that gives the given value to the
     * example camera, or an empty string when that value is the one a brand new camera
     * starts with: such a line would change nothing at all.
     * @param setterName the name of the setter of that property
     * @param value the value that property stands on at the moment
     * @param iniValue the value a brand new camera starts with
     */
    private function getPropertyCode(setterName:String, value:Number, iniValue:Number):String
    {
      application.trace("<" + this + " CameraWidget getPropertyCode> called.", 4);
      application.trace("<" + this + " CameraWidget getPropertyCode> setterName: " + setterName, 3);
      application.trace("<" + this + " CameraWidget getPropertyCode> value: " + value, 3);
      application.trace("<" + this + " CameraWidget getPropertyCode> iniValue: " + iniValue, 3);
      if (value == iniValue)
      {
        return "";
      }
      return codeVarName + "." + setterName + "(" + value + ");\n";
    }
    /**
     * Displays every value again after the example camera has grabbed or released its
     * device, has been changed on its own settings panel or has taken a photo. The row of
     * the last event tells which of the four reports has arrived.
     * @param e the attached, detached, changed or saved event of that camera
     */
    private function exampleCameraChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget exampleCameraChanged> called.", 4);
      application.trace("<" + this + " CameraWidget exampleCameraChanged> e: " + e, 3);
      setLastEvent(e.type);
    }
    /**
     * Takes the picked camera device to the example camera.
     * @param e the changed event of the picker of the devices
     */
    private function deviceChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget deviceChanged> called.", 4);
      application.trace("<" + this + " CameraWidget deviceChanged> e: " + e, 3);
      exampleCamera.setSelectedDeviceIndex(deviceOBJ.getSelectedIndex());
      displayEveryCurrentValue();
    }
    /**
     * Mutes or unmutes the picture of the example camera.
     * @param e the changed event of the switcher of that muting
     */
    private function videoMutedChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget videoMutedChanged> called.", 4);
      application.trace("<" + this + " CameraWidget videoMutedChanged> e: " + e, 3);
      exampleCamera.setVideoMuted(videoMutedOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Takes the picked microphone device to the example camera.
     * @param e the changed event of the picker of the microphones
     */
    private function microphoneChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget microphoneChanged> called.", 4);
      application.trace("<" + this + " CameraWidget microphoneChanged> e: " + e, 3);
      exampleCamera.setSelectedMicrophoneIndex(microphoneOBJ.getSelectedIndex());
      displayEveryCurrentValue();
    }
    /**
     * Mutes or unmutes the microphone of the example camera.
     * @param e the changed event of the switcher of that muting
     */
    private function soundMutedChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget soundMutedChanged> called.", 4);
      application.trace("<" + this + " CameraWidget soundMutedChanged> e: " + e, 3);
      exampleCamera.setSoundMuted(soundMutedOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Takes the dragged gain to the microphone of the example camera.
     * @param e the changed event of the potmeter of that gain
     */
    private function soundVolumeChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget soundVolumeChanged> called.", 4);
      application.trace("<" + this + " CameraWidget soundVolumeChanged> e: " + e, 3);
      exampleCamera.setSoundVolume(int(soundVolumeOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Grabs the camera device of the example camera.
     * @param e the click event of that link
     */
    private function attachClick(e:Event):void
    {
      application.trace("<" + this + " CameraWidget attachClick> called.", 4);
      application.trace("<" + this + " CameraWidget attachClick> e: " + e, 3);
      exampleCamera.attachCamera();
      displayEveryCurrentValue();
    }
    /**
     * Releases the camera device of the example camera.
     * @param e the click event of that link
     */
    private function detachClick(e:Event):void
    {
      application.trace("<" + this + " CameraWidget detachClick> called.", 4);
      application.trace("<" + this + " CameraWidget detachClick> e: " + e, 3);
      exampleCamera.detachCamera();
      displayEveryCurrentValue();
    }
    /**
     * Takes the picked aspect ratio to the example camera.
     * @param e the changed event of the picker of the ratios
     */
    private function resolutionChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget resolutionChanged> called.", 4);
      application.trace("<" + this + " CameraWidget resolutionChanged> e: " + e, 3);
      exampleCamera.setCameraResolution(resolutionOBJ.getSelectedValue());
      displayEveryCurrentValue();
    }
    /**
     * Fixes the aspect ratio of the example camera or lets it be changed again.
     * @param e the changed event of that switcher
     */
    private function resolutionFixedChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget resolutionFixedChanged> called.", 4);
      application.trace("<" + this + " CameraWidget resolutionFixedChanged> e: " + e, 3);
      exampleCamera.setResolutionFixed(resolutionFixedOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Takes the new width of the picture to the example camera.
     * @param e the changed event of the potmeter of the width
     */
    private function widthChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget widthChanged> called.", 4);
      application.trace("<" + this + " CameraWidget widthChanged> e: " + e, 3);
      exampleCamera.setCameraWidth(int(widthOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Takes the new frames per second to the example camera.
     * @param e the changed event of the potmeter of them
     */
    private function fpsChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget fpsChanged> called.", 4);
      application.trace("<" + this + " CameraWidget fpsChanged> e: " + e, 3);
      exampleCamera.setCameraFps(int(fpsOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Takes the new quality to the example camera.
     * @param e the changed event of the potmeter of it
     */
    private function qualityChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget qualityChanged> called.", 4);
      application.trace("<" + this + " CameraWidget qualityChanged> e: " + e, 3);
      exampleCamera.setCameraQuality(int(qualityOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Blurs the picture of the example camera.
     * @param e the changed event of the potmeter of the blur
     */
    private function blurChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget blurChanged> called.", 4);
      application.trace("<" + this + " CameraWidget blurChanged> e: " + e, 3);
      exampleCamera.setFilterBlur(int(blurOBJ.getCurValue()));
      displayEveryCurrentValue();
    }
    /**
     * Multiplies the red channel of the picture of the example camera.
     * @param e the changed event of the potmeter of that channel
     */
    private function redChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget redChanged> called.", 4);
      application.trace("<" + this + " CameraWidget redChanged> e: " + e, 3);
      exampleCamera.setFilterRed(redOBJ.getCurValue());
      displayEveryCurrentValue();
    }
    /**
     * Multiplies the green channel of the picture of the example camera.
     * @param e the changed event of the potmeter of that channel
     */
    private function greenChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget greenChanged> called.", 4);
      application.trace("<" + this + " CameraWidget greenChanged> e: " + e, 3);
      exampleCamera.setFilterGreen(greenOBJ.getCurValue());
      displayEveryCurrentValue();
    }
    /**
     * Multiplies the blue channel of the picture of the example camera.
     * @param e the changed event of the potmeter of that channel
     */
    private function blueChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget blueChanged> called.", 4);
      application.trace("<" + this + " CameraWidget blueChanged> e: " + e, 3);
      exampleCamera.setFilterBlue(blueOBJ.getCurValue());
      displayEveryCurrentValue();
    }
    /**
     * Multiplies the alpha channel of the picture of the example camera: a picture that is
     * not fully opaque takes the background of this application into a photo as well.
     * @param e the changed event of the potmeter of that channel
     */
    private function alphaChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget alphaChanged> called.", 4);
      application.trace("<" + this + " CameraWidget alphaChanged> e: " + e, 3);
      exampleCamera.setFilterAlpha(alphaOBJ.getCurValue());
      displayEveryCurrentValue();
    }
    /**
     * Displays the settings panel of the example camera over the picture of it, or takes
     * it away.
     * @param e the changed event of that switcher
     */
    private function settingsChanged(e:Event):void
    {
      application.trace("<" + this + " CameraWidget settingsChanged> called.", 4);
      application.trace("<" + this + " CameraWidget settingsChanged> e: " + e, 3);
      exampleCamera.setSettingsVisible(settingsOBJ.getOn());
      displayEveryCurrentValue();
    }
    /**
     * Takes every property of the picture of the example camera back to its own default.
     * @param e the click event of that link
     */
    private function resetClick(e:Event):void
    {
      application.trace("<" + this + " CameraWidget resetClick> called.", 4);
      application.trace("<" + this + " CameraWidget resetClick> e: " + e, 3);
      exampleCamera.resetSettings();
      displayEveryCurrentValue();
    }
    /**
     * Takes a photo of the picture of the example camera. That camera releases its device
     * right afterwards, because the photo is the very thing that has been asked for.
     * @param e the click event of that link
     */
    private function takePictureClick(e:Event):void
    {
      application.trace("<" + this + " CameraWidget takePictureClick> called.", 4);
      application.trace("<" + this + " CameraWidget takePictureClick> e: " + e, 3);
      exampleCamera.takePicture();
      displayEveryCurrentValue();
    }
    /**
     * Displays the photo of the example camera over the picture of it again.
     * @param e the click event of that link
     */
    private function showPictureClick(e:Event):void
    {
      application.trace("<" + this + " CameraWidget showPictureClick> called.", 4);
      application.trace("<" + this + " CameraWidget showPictureClick> e: " + e, 3);
      exampleCamera.showPicture();
      displayEveryCurrentValue();
    }
    /**
     * Drops the photo of the example camera.
     * @param e the click event of that link
     */
    private function clearPictureClick(e:Event):void
    {
      application.trace("<" + this + " CameraWidget clearPictureClick> called.", 4);
      application.trace("<" + this + " CameraWidget clearPictureClick> e: " + e, 3);
      exampleCamera.clearPicture();
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
      application.trace("<" + this + " CameraWidget destroy> called.", 4);
      application.trace("<" + this + " CameraWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " CameraWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " CameraWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " CameraWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      exampleCamera = null;
      deviceOBJ = null;
      videoMutedOBJ = null;
      microphoneOBJ = null;
      soundMutedOBJ = null;
      soundVolumeOBJ = null;
      attachOBJ = null;
      detachOBJ = null;
      resolutionOBJ = null;
      resolutionFixedOBJ = null;
      widthOBJ = null;
      fpsOBJ = null;
      qualityOBJ = null;
      blurOBJ = null;
      redOBJ = null;
      greenOBJ = null;
      blueOBJ = null;
      alphaOBJ = null;
      settingsOBJ = null;
      resetOBJ = null;
      takePictureOBJ = null;
      showPictureOBJ = null;
      clearPictureOBJ = null;
      deviceVAL = null;
      videoMutedVAL = null;
      microphoneVAL = null;
      soundMutedVAL = null;
      soundVolumeVAL = null;
      attachedVAL = null;
      resolutionVAL = null;
      resolutionFixedVAL = null;
      widthVAL = null;
      fpsVAL = null;
      qualityVAL = null;
      blurVAL = null;
      colorsVAL = null;
      settingsVAL = null;
      pictureVAL = null;
      pictureBytesVAL = null;
    }
  }
}
