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
 * DynamicsConfigDemo.
 * The dynamics config of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - it binds the configuration xml of this application to the framework config
 * - the values themselves are in resource/config/KissAs3DmDynamicsConfig.xml
 * - those values are applied on top of the framework ones, so every key that is
 *   missing from that xml keeps the value the framework gives it
 * - it describes every displaying style of this application as well: the framework
 *   brings the default one alone, and iniDisplayingStyles builds the styles of this
 *   application on top of it, every one of them with its own background image
 */
package com.kisscodesystems.KissAs3Dm.config
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumDisplayingStylesDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.config.DynamicsConfig;
  import com.kisscodesystems.KissAs3Fw.enum.EnumBackgroundAligns;
  import com.kisscodesystems.KissAs3Fw.enum.EnumBoxFrames;
  import flash.utils.ByteArray;
  public class DynamicsConfigDemo extends DynamicsConfig
  {
    [Embed(source = "../resource/config/KissAs3DmDynamicsConfig.xml", mimeType = "application/octet-stream")]
    private var EmbeddedDemoConfig:Class;
    private var embeddedDemoConfigByteArray:ByteArray = new EmbeddedDemoConfig() as ByteArray;
    /**
     * Constructs the dynamics config of the KissAs3Dm application.
     * @param applicationRef the main application reference
     */
    public function DynamicsConfigDemo(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " DynamicsConfigDemo> called.", 4);
      application.trace("<" + this + " DynamicsConfigDemo> applicationRef: " + applicationRef, 3);
      application.trace("<" + this + " DynamicsConfigDemo> constructed.", 4);
    }
    /**
     * Applies the configuration xml of this application on top of the framework one.
     */
    override protected function readValuesFromConfigXml():void
    {
      application.trace("<" + this + " DynamicsConfigDemo readValuesFromConfigXml> called.", 4);
      super.readValuesFromConfigXml();
      applyConfigXml(embeddedDemoConfigByteArray.toString());
      embeddedDemoConfigByteArray.clear();
      embeddedDemoConfigByteArray = null;
    }
    /**
     * Builds every displaying style of this application besides the default one of the
     * framework. A style is a copy of that default one, so only the properties differing
     * from it are described here: the colors, the shaping and the background image. Every
     * color of a style is taken from the background image of it, so the whole application
     * wears the tint of the picture it stands on. Every picture of them is scaled to
     * cover the whole stage: the mosaic tile the default style of the framework repeats
     * over that stage is the one picture no style of this application brings.
     */
    override protected function iniDisplayingStyles():void
    {
      application.trace("<" + this + " DynamicsConfigDemo iniDisplayingStyles> called.", 4);
      super.iniDisplayingStyles();
      // the textures: the whole image is one flat surface, so the boxes of the application
      // can wear a frame on it and the picture itself needs no blurring at all
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WOOD_DARK(), "wood-grain-dark-brown.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WOOD_DARK(), "CEC5C0", "0F0703", "080403", "FEFEFE", "F9F8F8", "4B3223");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WOOD_DARK(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 0, EnumBoxFrames.BOX_FRAME_FULL(), 1, 6, 9);
      // this is the style this application is started in, and the planks of it run
      // across the stage, so its boxes wear the horizontal lines of the frame only
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WOOD_LIGHT(), "wood-planks-light-brown.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WOOD_LIGHT(), "CCC7C2", "0D0905", "070503", "FEFEFE", "F9F9F8", "453629");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WOOD_LIGHT(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 0, EnumBoxFrames.BOX_FRAME_HORIZONTAL(), 1, 6, 9);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_PAPER(), "vintage-grunge-paper.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_PAPER(), "D1CDBD", "110D01", "090702", "FEFEFE", "FAF9F8", "53481B");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_PAPER(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 0, EnumBoxFrames.BOX_FRAME_FULL(), 1, 6, 9);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_LEATHER(), "cream-leather-texture.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_LEATHER(), "CBC8C3", "0C0A06", "060504", "FEFEFE", "F9F9F8", "42392C");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_LEATHER(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 0, EnumBoxFrames.BOX_FRAME_FULL(), 1, 6, 9);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_METAL(), "brushed-metal-texture.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_METAL(), "C8C6C6", "0A0908", "050505", "FEFEFE", "F9F9F9", "393534");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_METAL(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 0, EnumBoxFrames.BOX_FRAME_FULL(), 1, 6, 9);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_SLATE(), "dark-slate-stone-texture.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_SLATE(), "C7C7C7", "090909", "050505", "FEFEFE", "F9F9F9", "373737");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_SLATE(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 0, EnumBoxFrames.BOX_FRAME_FULL(), 1, 6, 9);
      // the photos: they are busy pictures, so they get a blur that keeps the texts of the
      // application readable over them, and softer boxes standing on a lining frame
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_AUTUMN(), "autumn-park-woman-reading.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_AUTUMN(), "D3CABB", "110B01", "090601", "FEFEFE", "FAF9F7", "5B4013");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_AUTUMN(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 4, EnumBoxFrames.BOX_FRAME_HORIZONTAL(), 1, 10, 13);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_SUNSET(), "sunset-clouds-over-sea.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_SUNSET(), "CFC7BF", "100902", "080502", "FEFEFE", "FAF9F8", "4D3620");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_SUNSET(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 4, EnumBoxFrames.BOX_FRAME_HORIZONTAL(), 1, 10, 13);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_LAKE(), "lake-balaton-shore.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_LAKE(), "BCCBD2", "010C11", "010709", "FEFEFE", "F7F9FA", "174357");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_LAKE(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 4, EnumBoxFrames.BOX_FRAME_HORIZONTAL(), 1, 10, 13);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_GRASS(), "green-grass-fallen-leaves.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_GRASS(), "C7D2BC", "091101", "050901", "FEFEFE", "F9FAF7", "365816");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_GRASS(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 4, EnumBoxFrames.BOX_FRAME_HORIZONTAL(), 1, 10, 13);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_GARDEN(), "ornamental-grass-garden.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_GARDEN(), "C6CCC2", "080D05", "050703", "FEFEFE", "F8F9F8", "334429");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_GARDEN(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 4, EnumBoxFrames.BOX_FRAME_HORIZONTAL(), 1, 10, 13);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_FLOWERS(), "orange-flowers-dry-grass.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_FLOWERS(), "CECBC0", "0F0D03", "080703", "FEFEFE", "F9F9F8", "4B4422");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_FLOWERS(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 4, EnumBoxFrames.BOX_FRAME_HORIZONTAL(), 1, 10, 13);
      // the technical ones: hard edges, a thicker lining and no rounding, to follow the
      // straight lines of the pictures themselves
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_TECHBLUE(), "blue-tech-abstract.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_TECHBLUE(), "BBC9D3", "010A11", "010609", "FEFEFE", "F7F9FA", "133E5B");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_TECHBLUE(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 0, EnumBoxFrames.BOX_FRAME_VERTICAL(), 2, 3, 5);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_TECHPANEL(), "sci-fi-metal-tech-panel.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_TECHPANEL(), "C5C7C9", "07090B", "040506", "FEFEFE", "F8F9F9", "31373D");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_TECHPANEL(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 0, EnumBoxFrames.BOX_FRAME_VERTICAL(), 2, 3, 5);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_SMOKE(), "red-smoke-abstract.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_SMOKE(), "D3BCBB", "110201", "090101", "FEFEFE", "FAF7F7", "5A1614");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_SMOKE(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 0, EnumBoxFrames.BOX_FRAME_VERTICAL(), 2, 3, 5);
      // the soft ones: pale pictures with no edges in them, so the boxes lose their frames
      // and get the largest rounding of all the styles
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_CLOUDS(), "clouds-from-above-blue-sky.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_CLOUDS(), "BBC9D3", "010A11", "010609", "FEFEFE", "F7F9FA", "133E5B");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_CLOUDS(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 2, EnumBoxFrames.BOX_FRAME_NONE(), 1, 12, 16);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_POND(), "pond-water-lily-pads.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_POND(), "C2CACC", "040C0E", "030607", "FEFEFE", "F8F9F9", "274146");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_POND(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 2, EnumBoxFrames.BOX_FRAME_NONE(), 1, 12, 16);
      addDisplayingStyle(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WAVES(), "pink-white-abstract-waves.jpg");
      setDisplayingStyleColors(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WAVES(), "D3BBC4", "110107", "090104", "FEFEFE", "FAF7F8", "5A132D");
      setDisplayingStyleShaping(EnumDisplayingStylesDemo.DISPLAYING_STYLE_WAVES(), EnumBackgroundAligns.BACKGROUND_ALIGN_CENTER2(), 2, EnumBoxFrames.BOX_FRAME_NONE(), 1, 12, 16);
    }
    /**
     * Destroys this object: it drops the configuration xml embedded into this application
     * and lets the framework free up the values of its own.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " DynamicsConfigDemo destroy> called.", 4);
      if (embeddedDemoConfigByteArray != null)
      {
        embeddedDemoConfigByteArray.clear();
      }
      super.destroy();
      embeddedDemoConfigByteArray = null;
      EmbeddedDemoConfig = null;
    }
  }
}
