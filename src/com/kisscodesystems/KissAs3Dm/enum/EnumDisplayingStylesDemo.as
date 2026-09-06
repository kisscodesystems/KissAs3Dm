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
 * EnumDisplayingStylesDemo.
 * The displaying styles of the KissAs3Dm application. A style holds every displayed
 * property of it, so switching the style repaints the whole application at once.
 *
 * MAIN FEATURES:
 * - the framework brings the default style alone, and every style named here is built
 *   from that very one: see com.kisscodesystems.KissAs3Fw.enum.EnumDisplayingStyles
 * - every style of this application is named after the background image it displays, and
 *   the colors of it are taken from that very image, so the whole application wears the
 *   tint of it
 * - the styles themselves are described in config/DynamicsConfigDemo, and the panel of
 *   the settings displays them because manager/LabelManagerDemo offers the keys of them
 * - getEveryDisplayingStyle answers all of them in the order a picker has to display
 *   them in, so the label manager and the dynamics config never fall out of step
 * - the labels of these keys are in resource/label/KissAs3DmLabels.xml
 */
package com.kisscodesystems.KissAs3Dm.enum
{
  import com.kisscodesystems.KissAs3Fw.enum.EnumDisplayingStyles;
  public class EnumDisplayingStylesDemo extends EnumDisplayingStyles
  {
    /**
     * Returns the text key of the dark wood displaying style.
     */
    public static function DISPLAYING_STYLE_WOOD_DARK():String
    {
      return "[DISPLAYING_STYLE_WOOD_DARK]";
    }
    /**
     * Returns the text key of the light wood displaying style.
     */
    public static function DISPLAYING_STYLE_WOOD_LIGHT():String
    {
      return "[DISPLAYING_STYLE_WOOD_LIGHT]";
    }
    /**
     * Returns the text key of the vintage paper displaying style.
     */
    public static function DISPLAYING_STYLE_PAPER():String
    {
      return "[DISPLAYING_STYLE_PAPER]";
    }
    /**
     * Returns the text key of the cream leather displaying style.
     */
    public static function DISPLAYING_STYLE_LEATHER():String
    {
      return "[DISPLAYING_STYLE_LEATHER]";
    }
    /**
     * Returns the text key of the brushed metal displaying style.
     */
    public static function DISPLAYING_STYLE_METAL():String
    {
      return "[DISPLAYING_STYLE_METAL]";
    }
    /**
     * Returns the text key of the dark slate displaying style.
     */
    public static function DISPLAYING_STYLE_SLATE():String
    {
      return "[DISPLAYING_STYLE_SLATE]";
    }
    /**
     * Returns the text key of the autumn park displaying style.
     */
    public static function DISPLAYING_STYLE_AUTUMN():String
    {
      return "[DISPLAYING_STYLE_AUTUMN]";
    }
    /**
     * Returns the text key of the sunset displaying style.
     */
    public static function DISPLAYING_STYLE_SUNSET():String
    {
      return "[DISPLAYING_STYLE_SUNSET]";
    }
    /**
     * Returns the text key of the lake shore displaying style.
     */
    public static function DISPLAYING_STYLE_LAKE():String
    {
      return "[DISPLAYING_STYLE_LAKE]";
    }
    /**
     * Returns the text key of the fresh grass displaying style.
     */
    public static function DISPLAYING_STYLE_GRASS():String
    {
      return "[DISPLAYING_STYLE_GRASS]";
    }
    /**
     * Returns the text key of the ornamental garden displaying style.
     */
    public static function DISPLAYING_STYLE_GARDEN():String
    {
      return "[DISPLAYING_STYLE_GARDEN]";
    }
    /**
     * Returns the text key of the orange flowers displaying style.
     */
    public static function DISPLAYING_STYLE_FLOWERS():String
    {
      return "[DISPLAYING_STYLE_FLOWERS]";
    }
    /**
     * Returns the text key of the blue technology displaying style.
     */
    public static function DISPLAYING_STYLE_TECHBLUE():String
    {
      return "[DISPLAYING_STYLE_TECHBLUE]";
    }
    /**
     * Returns the text key of the machine panel displaying style.
     */
    public static function DISPLAYING_STYLE_TECHPANEL():String
    {
      return "[DISPLAYING_STYLE_TECHPANEL]";
    }
    /**
     * Returns the text key of the red smoke displaying style.
     */
    public static function DISPLAYING_STYLE_SMOKE():String
    {
      return "[DISPLAYING_STYLE_SMOKE]";
    }
    /**
     * Returns the text key of the above the clouds displaying style.
     */
    public static function DISPLAYING_STYLE_CLOUDS():String
    {
      return "[DISPLAYING_STYLE_CLOUDS]";
    }
    /**
     * Returns the text key of the water lilies displaying style.
     */
    public static function DISPLAYING_STYLE_POND():String
    {
      return "[DISPLAYING_STYLE_POND]";
    }
    /**
     * Returns the text key of the pink waves displaying style.
     */
    public static function DISPLAYING_STYLE_WAVES():String
    {
      return "[DISPLAYING_STYLE_WAVES]";
    }
    /**
     * Returns every displaying style of this application, in the order a picker of them
     * has to display them in: the default one of the framework first, then the textures,
     * the photos, the technical ones and the soft ones.
     */
    public static function getEveryDisplayingStyle():Array
    {
      return [DISPLAYING_STYLE_DEFAULT()
          , DISPLAYING_STYLE_WOOD_DARK(), DISPLAYING_STYLE_WOOD_LIGHT()
          , DISPLAYING_STYLE_PAPER(), DISPLAYING_STYLE_LEATHER()
          , DISPLAYING_STYLE_METAL(), DISPLAYING_STYLE_SLATE()
          , DISPLAYING_STYLE_AUTUMN(), DISPLAYING_STYLE_SUNSET()
          , DISPLAYING_STYLE_LAKE(), DISPLAYING_STYLE_GRASS()
          , DISPLAYING_STYLE_GARDEN(), DISPLAYING_STYLE_FLOWERS()
          , DISPLAYING_STYLE_TECHBLUE(), DISPLAYING_STYLE_TECHPANEL()
          , DISPLAYING_STYLE_SMOKE(), DISPLAYING_STYLE_CLOUDS()
          , DISPLAYING_STYLE_POND(), DISPLAYING_STYLE_WAVES()];
    }
  }
}
