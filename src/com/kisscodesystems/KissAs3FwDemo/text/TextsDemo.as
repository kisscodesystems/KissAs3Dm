/*
** This class is a part of the KissAs3Fw actionscrip framework.
** See the header comment lines of the
** com . kisscodesystems . KissAs3Fw . Application
** The whole framework is available at:
** https://github.com/kisscodesystems/KissAs3Fw
** Demo applications:
** https://github.com/kisscodesystems/KissAs3FwDemos
**
** DESCRIPTION:
** TextsDemo.
** Additional text codes will be defined here.
*/
package com . kisscodesystems . KissAs3FwDemo . text
{
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . text . Texts ;
  public class TextsDemo extends Texts
  {
// At initialization time, the text code begin and end string contants are not available.
// So, these has to be redefined with the same value as having in Texts.
// (Sorry.)
    private const _BTC : String = "btxtcd" ;
    private const _ETC : String = "etxtcd" ;
// Another language to the application.
    public const LANG_HU : String = _BTC + "LANG_HU" + _ETC ;
// Other background images will be defined.
    public const BACKGROUND_IMAGE_BG2 : String = _BTC + "BACKGROUND_IMAGE_BG2" + _ETC ;
// New displaying styles
    public const DISPLAYING_STYLE_BALATON : String = _BTC + "DISPLAYING_STYLE_BALATON" + _ETC ;
    public const DISPLAYING_STYLE_01 : String = _BTC + "DISPLAYING_STYLE_01" + _ETC ;
    public const DISPLAYING_STYLE_02 : String = _BTC + "DISPLAYING_STYLE_02" + _ETC ;
    public const DISPLAYING_STYLE_03 : String = _BTC + "DISPLAYING_STYLE_03" + _ETC ;
    public const DISPLAYING_STYLE_04 : String = _BTC + "DISPLAYING_STYLE_04" + _ETC ;
    public const DISPLAYING_STYLE_05 : String = _BTC + "DISPLAYING_STYLE_05" + _ETC ;
    public const DISPLAYING_STYLE_06 : String = _BTC + "DISPLAYING_STYLE_06" + _ETC ;
    public const DISPLAYING_STYLE_07 : String = _BTC + "DISPLAYING_STYLE_07" + _ETC ;
    public const DISPLAYING_STYLE_08 : String = _BTC + "DISPLAYING_STYLE_08" + _ETC ;
    public const DISPLAYING_STYLE_09 : String = _BTC + "DISPLAYING_STYLE_09" + _ETC ;
    public const DISPLAYING_STYLE_10 : String = _BTC + "DISPLAYING_STYLE_10" + _ETC ;
    public const DISPLAYING_STYLE_11 : String = _BTC + "DISPLAYING_STYLE_11" + _ETC ;
    public const DISPLAYING_STYLE_12 : String = _BTC + "DISPLAYING_STYLE_12" + _ETC ;
    public const DISPLAYING_STYLE_13 : String = _BTC + "DISPLAYING_STYLE_13" + _ETC ;
    public const DISPLAYING_STYLE_14 : String = _BTC + "DISPLAYING_STYLE_14" + _ETC ;
// Other text codes of this application.
    public const ELEMENT0 : String = _BTC + "ELEMENT0" + _ETC ;
    public const ELEMENT1 : String = _BTC + "ELEMENT1" + _ETC ;
    public const ELEMENT2 : String = _BTC + "ELEMENT2" + _ETC ;
    public const ELEMENT3 : String = _BTC + "ELEMENT3" + _ETC ;
    public const ELEMENT4 : String = _BTC + "ELEMENT4" + _ETC ;
    public const ELEMENT5 : String = _BTC + "ELEMENT5" + _ETC ;
    public const ELEMENT6 : String = _BTC + "ELEMENT6" + _ETC ;
    public const ELEMENT7 : String = _BTC + "ELEMENT7" + _ETC ;
    public const ELEMENT8 : String = _BTC + "ELEMENT8" + _ETC ;
    public const ELEMENT9 : String = _BTC + "ELEMENT9" + _ETC ;
    public const ELEMENT10 : String = _BTC + "ELEMENT10" + _ETC ;
    public const ELEMENT11 : String = _BTC + "ELEMENT11" + _ETC ;
    public const ELEMENT12 : String = _BTC + "ELEMENT12" + _ETC ;
    public const ELEMENT13 : String = _BTC + "ELEMENT13" + _ETC ;
    public const ELEMENT14 : String = _BTC + "ELEMENT14" + _ETC ;
    public const ELEMENT15 : String = _BTC + "ELEMENT15" + _ETC ;
    public const ELEMENT16 : String = _BTC + "ELEMENT16" + _ETC ;
    public const ELEMENT17 : String = _BTC + "ELEMENT17" + _ETC ;
    public const ELEMENT18 : String = _BTC + "ELEMENT18" + _ETC ;
    public const ELEMENT19 : String = _BTC + "ELEMENT19" + _ETC ;
// The headers of the widgets
    public const WIDGET_HEADER_DEMO_COMPONENT_USAGE : String = _BTC + "WIDGET_HEADER_DEMO_COMPONENT_USAGE" + _ETC ;
    public const WIDGET_HEADER_DEMO_SINGLE_LINE_TEXTS : String = _BTC + "WIDGET_HEADER_DEMO_SINGLE_LINE_TEXTS" + _ETC ;
    public const WIDGET_HEADER_DEMO_MULTIPLE_LINE_TEXTS : String = _BTC + "WIDGET_HEADER_DEMO_MULTIPLE_LINE_TEXTS" + _ETC ;
    public const WIDGET_HEADER_DEMO_BUTTONS : String = _BTC + "WIDGET_HEADER_DEMO_BUTTONS" + _ETC ;
    public const WIDGET_HEADER_DEMO_PICKERS : String = _BTC + "WIDGET_HEADER_DEMO_PICKERS" + _ETC ;
    public const WIDGET_PICKERS_COLORS : String = _BTC + "WIDGET_PICKERS_COLORS" + _ETC ;
    public const WIDGET_PICKERS_LISTS : String = _BTC + "WIDGET_PICKERS_LISTS" + _ETC ;
    public const WIDGET_HEADER_DEMO_OTHERS : String = _BTC + "WIDGET_HEADER_DEMO_OTHERS" + _ETC ;
    public const SINGLE_LINE_LABEL_BRIGHT : String = _BTC + "SINGLE_LINE_LABEL_BRIGHT" + _ETC ;
    public const SINGLE_LINE_LABEL_MID_ENABLED_INPUT : String = _BTC + "SINGLE_LINE_LABEL_MID_ENABLED_INPUT" + _ETC ;
    public const SINGLE_LINE_LABEL_DARK_ENABLED_INPUT : String = _BTC + "SINGLE_LINE_LABEL_DARK_ENABLED_INPUT" + _ETC ;
    public const SINGLE_LINE_LABEL_DARK_PASSWORD_INPUT : String = _BTC + "SINGLE_LINE_LABEL_DARK_PASSWORD_INPUT" + _ETC ;
    public const ENABLED_TEXT_INPUT : String = _BTC + "ENABLED_TEXT_INPUT" + _ETC ;
    public const DISABLED_TEXT_INPUT : String = _BTC + "DISABLED_TEXT_INPUT" + _ETC ;
    public const MULTIPLE_LINE_LABEL_TEXT_BOX : String = _BTC + "MULTIPLE_LINE_LABEL_TEXT_BOX" + _ETC ;
    public const TEXT_BOX : String = _BTC + "TEXT_BOX" + _ETC ;
    public const MULTIPLE_LINE_LABEL_TEXT_AREA_ENABLED : String = _BTC + "MULTIPLE_LINE_LABEL_TEXT_AREA_ENABLED" + _ETC ;
    public const TEXT_AREA_ENABLED : String = _BTC + "TEXT_AREA_ENABLED" + _ETC ;
    public const MULTIPLE_LINE_LABEL_TEXT_AREA_DISABLED : String = _BTC + "MULTIPLE_LINE_LABEL_TEXT_AREA_DISABLED" + _ETC ;
    public const TEXT_AREA_DISABLED : String = _BTC + "TEXT_AREA_DISABLED" + _ETC ;
    public const BUTTON_BARS : String = _BTC + "BUTTON_BARS" + _ETC ;
    public const BUTTON_DRAWS : String = _BTC + "BUTTON_DRAWS" + _ETC ;
    public const BUTTON_LINKS : String = _BTC + "BUTTON_LINKS" + _ETC ;
    public const BUTTON_TEXTS : String = _BTC + "BUTTON_TEXTS" + _ETC ;
    public const BUTTON_FILE : String = _BTC + "BUTTON_FILE" + _ETC ;
    public const CLICKED_LINK : String = _BTC + "CLICKED_LINK" + _ETC ;
    public const COLORS : String = _BTC + "COLORS" + _ETC ;
    public const COLOR_PICKERS : String = _BTC + "COLOR_PICKERS" + _ETC ;
    public const LISTS : String = _BTC + "LISTS" + _ETC ;
    public const LIST_PICKERS : String = _BTC + "LIST_PICKERS" + _ETC ;
    public const SWITCHER_UP : String = _BTC + "SWITCHER_UP" + _ETC ;
    public const SWITCHER_DOWN : String = _BTC + "SWITCHER_DOWN" + _ETC ;
    public const POTMETS : String = _BTC + "POTMETS" + _ETC ;
    public const SELECTED_INDEXES : String = _BTC + "SELECTED_INDEXES" + _ETC ;
    public const HAS_BEEN_CLICKED : String = _BTC + "HAS_BEEN_CLICKED" + _ETC ;
    public const XMLLISTER : String = _BTC + "XMLLISTER" + _ETC ;
// For the sample xml
    public const VALUE0 : String = _BTC + "VALUE0" + _ETC ;
    public const VALUE1 : String = _BTC + "VALUE1" + _ETC ;
    public const VALUE2 : String = _BTC + "VALUE2" + _ETC ;
    public const VALUE20 : String = _BTC + "VALUE20" + _ETC ;
    public const VALUE21 : String = _BTC + "VALUE21" + _ETC ;
    public const VALUE22 : String = _BTC + "VALUE22" + _ETC ;
    public const VALUE23 : String = _BTC + "VALUE23" + _ETC ;
    public const VALUE24 : String = _BTC + "VALUE24" + _ETC ;
    public const VALUE240 : String = _BTC + "VALUE240" + _ETC ;
    public const VALUE241 : String = _BTC + "VALUE241" + _ETC ;
    public const VALUE242 : String = _BTC + "VALUE242" + _ETC ;
    public const VALUE243 : String = _BTC + "VALUE243" + _ETC ;
    public const VALUE244 : String = _BTC + "VALUE244" + _ETC ;
    public const VALUE245 : String = _BTC + "VALUE245" + _ETC ;
    public const VALUE246 : String = _BTC + "VALUE246" + _ETC ;
    public const VALUE247 : String = _BTC + "VALUE247" + _ETC ;
    public const VALUE25 : String = _BTC + "VALUE25" + _ETC ;
    public const VALUE26 : String = _BTC + "VALUE26" + _ETC ;
    public const VALUE27 : String = _BTC + "VALUE27" + _ETC ;
    public const VALUE3 : String = _BTC + "VALUE3" + _ETC ;
    public const VALUE4 : String = _BTC + "VALUE4" + _ETC ;
    public const VALUE5 : String = _BTC + "VALUE5" + _ETC ;
    public const VALUE6 : String = _BTC + "VALUE6" + _ETC ;
    public const VALUE7 : String = _BTC + "VALUE7" + _ETC ;
    public const VALUE8 : String = _BTC + "VALUE8" + _ETC ;
    public const VALUE9 : String = _BTC + "VALUE9" + _ETC ;
    public const VALUE90 : String = _BTC + "VALUE90" + _ETC ;
    public const VALUE91 : String = _BTC + "VALUE91" + _ETC ;
    public const VALUE92 : String = _BTC + "VALUE92" + _ETC ;
    public const VALUE93 : String = _BTC + "VALUE93" + _ETC ;
    public const VALUE94 : String = _BTC + "VALUE94" + _ETC ;
    public const VALUE95 : String = _BTC + "VALUE95" + _ETC ;
  }
}