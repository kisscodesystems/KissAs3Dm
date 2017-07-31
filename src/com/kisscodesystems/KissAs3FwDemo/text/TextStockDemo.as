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
** TextStockDemo.
** Additional texts will be added in this demo application.
*/
package com . kisscodesystems . KissAs3FwDemo . text
{
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . text . TextStock ;
  public class TextStockDemo extends TextStock
  {
/*
** Constructing the text stock object.
*/
    public function TextStockDemo ( applicationRef : Application ) : void
    {
// This is necessary.
      super ( applicationRef ) ;
// The arrays have to be redefined here.
      langCodes . push ( TextsDemo ( application . getTexts ( ) ) . LANG_HU ) ;
      textCodesBgImagePics . push ( TextsDemo ( application . getTexts ( ) ) . BACKGROUND_IMAGE_BG2 ) ;
// We are gonna add new displaying styles.
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_BALATON ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_01 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_02 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_03 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_04 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_05 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_06 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_07 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_08 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_09 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_10 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_11 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_12 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_13 ) ;
      textCodesDisplayingStyles . push ( TextsDemo ( application . getTexts ( ) ) . DISPLAYING_STYLE_14 ) ;
// And adding the new text codes and values.
      textIni2 ( ) ;
    }
/*
** Adding some new texts.
*/
    private function textIni2 ( ) : void
    {
      texts [ langCodes [ 1 ] ] = [ "Hungarian" , "Magyar" ] ;
      texts [ langCodes [ 0 ] ] . push ( "Angol" ) ;
      texts [ textCodesYesNo [ 0 ] ] . push ( "Igen" ) ;
      texts [ textCodesYesNo [ 1 ] ] . push ( "Nem" ) ;
      texts [ textCodesOkCancel [ 0 ] ] . push ( "OK" ) ;
      texts [ textCodesOkCancel [ 1 ] ] . push ( "Mégse" ) ;
      texts [ textCodesBgImagePics [ 0 ] ] . push ( "Háttér 1" ) ;
      texts [ textCodesBgImagePics [ 1 ] ] = [ "Background 2" , "Háttér 2" ] ;
      texts [ textCodesBgImageAligns [ 0 ] ] . push ( "Nincs" ) ;
      texts [ textCodesBgImageAligns [ 1 ] ] . push ( "Közép 1" ) ;
      texts [ textCodesBgImageAligns [ 2 ] ] . push ( "Közép 2" ) ;
      texts [ textCodesBgImageAligns [ 3 ] ] . push ( "Közép 3" ) ;
      texts [ textCodesBgImageAligns [ 4 ] ] . push ( "Mozaik" ) ;
      texts [ textCodesTextTypes [ 0 ] ] . push ( "Világos" ) ;
      texts [ textCodesTextTypes [ 1 ] ] . push ( "Közép" ) ;
      texts [ textCodesTextTypes [ 2 ] ] . push ( "Sötét" ) ;
      texts [ textCodesWidgetsOrientations [ 0 ] ] . push ( "Manuális" ) ;
      texts [ textCodesWidgetsOrientations [ 1 ] ] . push ( "Függőleges" ) ;
      texts [ textCodesWidgetsOrientations [ 2 ] ] . push ( "Vízszintes" ) ;
      texts [ textCodesDisplayingStyles [ 0 ] ] . push ( "Módosított" ) ;
      texts [ textCodesDisplayingStyles [ 1 ] ] . push ( "Alap" ) ;
      texts [ textCodesDisplayingStyles [ 2 ] ] = [ "Balaton" , "Balaton" ] ;
      texts [ textCodesDisplayingStyles [ 3 ] ] = [ "Style 01" , "Stílus 01" ] ;
      texts [ textCodesDisplayingStyles [ 4 ] ] = [ "Style 02" , "Stílus 02" ] ;
      texts [ textCodesDisplayingStyles [ 5 ] ] = [ "Style 03" , "Stílus 03" ] ;
      texts [ textCodesDisplayingStyles [ 6 ] ] = [ "Style 04" , "Stílus 04" ] ;
      texts [ textCodesDisplayingStyles [ 7 ] ] = [ "Style 05" , "Stílus 05" ] ;
      texts [ textCodesDisplayingStyles [ 8 ] ] = [ "Style 06" , "Stílus 06" ] ;
      texts [ textCodesDisplayingStyles [ 9 ] ] = [ "Style 07" , "Stílus 07" ] ;
      texts [ textCodesDisplayingStyles [ 10 ] ] = [ "Style 08" , "Stílus 08" ] ;
      texts [ textCodesDisplayingStyles [ 11 ] ] = [ "Style 09" , "Stílus 09" ] ;
      texts [ textCodesDisplayingStyles [ 12 ] ] = [ "Style 10" , "Stílus 10" ] ;
      texts [ textCodesDisplayingStyles [ 13 ] ] = [ "Style 11" , "Stílus 11" ] ;
      texts [ textCodesDisplayingStyles [ 14 ] ] = [ "Style 12" , "Stílus 12" ] ;
      texts [ textCodesDisplayingStyles [ 15 ] ] = [ "Style 13" , "Stílus 13" ] ;
      texts [ textCodesDisplayingStyles [ 16 ] ] = [ "Style 14" , "Stílus 14" ] ;
      texts [ application . getTexts ( ) . WIDGET_TYPE_GENERAL ] . push ( "Általános widget típus" ) ;
      texts [ application . getTexts ( ) . WIDGET_HEADER_GENERAL ] . push ( "Widget" ) ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_DEMO_COMPONENT_USAGE ] = [ "Component usage" , "Komponens használat" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_DEMO_SINGLE_LINE_TEXTS ] = [ "Single line texts" , "Egysoros szövegek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_DEMO_MULTIPLE_LINE_TEXTS ] = [ "Multiple line texts" , "Többsoros szövegek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_DEMO_BUTTONS ] = [ "Buttons" , "Gombok" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_DEMO_PICKERS ] = [ "Pickers" , "Választók" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_PICKERS_COLORS ] = [ "Color" , "Szín" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_PICKERS_LISTS ] = [ "List" , "Lista" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_DEMO_OTHERS ] = [ "Others" , "Továbbiak" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_BRIGHT ] = [ "This is a single line label (bright)." , "Ez egy egy soros cimke (világos)." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_MID_ENABLED_INPUT ] = [ "Input field is enabled (mid label):" , "Beviteli mező enabled (közepes cimke):" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_DARK_ENABLED_INPUT ] = [ "Input field is disabled (dark label):" , "Beviteli mező disabled (sötét cimke):" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_DARK_PASSWORD_INPUT ] = [ "Password input field (dark label):" , "Jelszó beviteli mező (sötét cimke):" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ENABLED_TEXT_INPUT ] = [ "I'm enabled." , "Enabled vagyok." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . DISABLED_TEXT_INPUT ] = [ "I'm disabled." , "Disabled vagyok." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_BOX ] = [ "A single multiline text:\n(Its html version is\nin the conponent usage.)" , "Egyszerű többsoros szöveg.\n(Ennek a html verziója van\na komponens használatban.)" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . TEXT_BOX ] = [ "This is a\n.\nmultiline text.\nAfter a left click\nthe content is dragabble\nand all of the text\n.\n..\ncan be seen!\nThis is the end of the text." , "Ez egy\n.\ntöbbsoros szöveg.\nBal klikk\nhatására húzható a szöveg\nés látható\n.\n..\nlesz a teljes szöveg!\nEz a szöveg vége." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_AREA_ENABLED ] = [ "Multiline and editable text:" , "Többsoros szerkeszthető szöveg:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . TEXT_AREA_ENABLED ] = [ "Text area.\n.\nClick here to activate and edit.\n.\n..\nClick anywhere to exit from the edit mode.\n.\n..\n...\nEnd of the text." , "Text area.\n.\nKlikk ide az aktiválásért és a szerkesztésért.\n.\n..\nKlikk máshová az edit módból történő kiléppéshez.\n.\n..\n...\nSzöveg vége." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_AREA_DISABLED ] = [ "Multiline disabled text:" , "Többsoros inaktív szöveg:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . TEXT_AREA_DISABLED ] = [ "This is a disabled text area.\nCan be clicked but doesn't\nenter into the edit mode.\n.\n..\n...\n....\n.....\n......\nEnd of text." , "Ez egy inaktív text area.\nKlikkelhető de nem\nlép szerkesztő módba.\n.\n..\n...\n....\n.....\n......\nSzöveg vége." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . BUTTON_BARS ] = [ "Button bars:" , "Gomb sávok:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . BUTTON_DRAWS ] = [ "Draw buttons:" , "Rajzolt gombok:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . BUTTON_LINKS ] = [ "Link buttons:" , "Link gombok:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . BUTTON_TEXTS ] = [ "Text buttons:" , "Szöveges gombok:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . BUTTON_FILE ] = [ "File button:" , "Fájl gomb:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . CLICKED_LINK ] = [ "Clicked button is: " , "A kattintott gomb: " ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . COLORS ] = [ "Color:" , "Szín:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . COLOR_PICKERS ] = [ "Colorpickers:" , "Színválasztók:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . LISTS ] = [ "Lists:" , "Listák:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . LIST_PICKERS ] = [ "Listpickers:" , "Listaválasztók:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SWITCHER_UP ] = [ "Switcher up!" , "Switcher fel!" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SWITCHER_DOWN ] = [ "Switcher down.." , "Switcher le.." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . POTMETS ] = [ "Potmets.30-100 :2" , "Potmetek.30-100 :2" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SELECTED_INDEXES ] = [ "Selected indexes: " , "Megjelölt indexek: " ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . HAS_BEEN_CLICKED ] = [ " has been clicked." , " volt megklikkelve." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . XMLLISTER ] = [ "Xml lister:" , "Xml listázó:" ] ;
      texts [ application . getTexts ( ) . LISTS_OF_THE_WIDGETS ] . push ( "Klikk a widgetre hogy odanavigálhassunk:" ) ;
      texts [ application . getTexts ( ) . LISTS_OF_THE_CONTENTS_TO_MOVE_INTO ] . push ( "A widget ide költözzön:" ) ;
      texts [ application . getTexts ( ) . SETTINGS_PANEL_GENERAL ] . push ( "Általános" ) ;
      texts [ application . getTexts ( ) . SETTINGS_PANEL_LINING ] . push ( "Vonalzás" ) ;
      texts [ application . getTexts ( ) . SETTINGS_PANEL_COLORING ] . push ( "Színzés" ) ;
      texts [ application . getTexts ( ) . SETTINGS_PANEL_IMAGING ] . push ( "Képzés" ) ;
      texts [ application . getTexts ( ) . SETTINGS_PANEL_FONTING ] . push ( "Fontolás" ) ;
      texts [ application . getTexts ( ) . SETTINGS_PANEL_ABOUT ] . push ( "Névjegy" ) ;
      texts [ application . getTexts ( ) . SETTING_LANGUAGE ] . push ( "Nyelv." ) ;
      texts [ application . getTexts ( ) . SETTING_DISPLAYING_STYLE ] . push ( "Megjelenítés." ) ;
      texts [ application . getTexts ( ) . SETTING_NUM_OF_WIDGETCONTAINERS ] . push ( "Max containerek." ) ;
      texts [ application . getTexts ( ) . SETTING_CURR_WIDGETCONTAINER ] . push ( "Jelen container." ) ;
      texts [ application . getTexts ( ) . SETTING_WIDGET_ORIENTATION ] . push ( "Widget rendezés." ) ;
      texts [ application . getTexts ( ) . SETTING_LINE_THICKNESS ] . push ( "Vonalvastagság." ) ;
      texts [ application . getTexts ( ) . SETTING_MARGIN ] . push ( "Margó." ) ;
      texts [ application . getTexts ( ) . SETTING_PADDING ] . push ( "Kitöltés." ) ;
      texts [ application . getTexts ( ) . SETTING_RADIUS ] . push ( "Sugarak." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_BG_COLOR ] . push ( "Háttérszín." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_FG_COLOR ] . push ( "Előtérszín." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_FILL_ALPHA ] . push ( "Áttetszőség." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_IMAGE ] . push ( "Háttér kép." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_ALIGN ] . push ( "Háttér igazítás." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_ALPHA ] . push ( "Háttér áttetszőség." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_LIVE ] . push ( "A háttér élő." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_FIXED ] . push ( "A háttér fix." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_FACE ] . push ( "Betűtípus." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_SIZE ] . push ( "Betűméret." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_COLORS ] . push ( "Betűszínek." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_BOLD ] . push ( "Félkövér betűk." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_ITALIC ] . push ( "Dőlt betűk." ) ;
      texts [ application . getTexts ( ) . SELECTED_FILE ] . push ( "Kiválasztott fájl: " ) ;
      texts [ application . getTexts ( ) . UPLOADED_FILE ] . push ( "Feltöltött fájl: " ) ;
      texts [ application . getTexts ( ) . BROWSE ] . push ( "tallózás.." ) ;
      texts [ application . getTexts ( ) . FILE_UPLOAD_IN_PROGRESS ] . push ( "Feltöltés: " ) ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT0 ] = [ "Element 0" , "Elem 0" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT1 ] = [ "Element 1" , "Elem 1" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT2 ] = [ "Element 2" , "Elem 2" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT3 ] = [ "Element 3" , "Elem 3" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT4 ] = [ "Element 4" , "Elem 4" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT5 ] = [ "Element 5" , "Elem 5" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT6 ] = [ "Element 6" , "Elem 6" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT7 ] = [ "Element 7" , "Elem 7" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT8 ] = [ "Element 8" , "Elem 8" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT9 ] = [ "Element 9" , "Elem 9" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT10 ] = [ "Element 10" , "Elem 10" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT11 ] = [ "Element 11" , "Elem 11" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT12 ] = [ "Element 12" , "Elem 12" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT13 ] = [ "Element 13" , "Elem 13" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT14 ] = [ "Element 14" , "Elem 14" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT15 ] = [ "Element 15" , "Elem 15" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT16 ] = [ "Element 16" , "Elem 16" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT17 ] = [ "Element 17" , "Elem 17" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT18 ] = [ "Element 18" , "Elem 18" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ELEMENT19 ] = [ "Element 19" , "Elem 19" ] ;
      texts [ application . getTexts ( ) . COMPONENTS_USAGE ] . push ( "<p><b>Üdvözlet a KissAs3Fw framework-ben!</b></p>" + application . EMPTY_HTML_PARAGRAPH + "<p>Alább olvasható a komponens set használata.</p>" + application . EMPTY_HTML_PARAGRAPH + "<p><i>Ha 2 négyzet található egymásban, akkor bal egér gomb nyomvatartással (egy tiszta területen) a tartalom mozgatható.</i></p>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b><u>Fő tartalom<br/>(Application-Middleground-Widgets-contentMultiple)</u></b>" + "<li><u>Terület ahová Widget-eket lehet elhelyezni.</u></li>" + "<li>Az 1.5 verzió óta támogatja a több tartalmas megjelenítést (widget container-ek).</li>" + "<li>A beállítások panelen testreszabható ha ez elérhető az app-ban.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>ButtonBar</b>" + "<li><u>ButtonLink gyűjtemény.</u></li>" + "<li>Egy lehet aktív közülük vagy egyik sem.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>ButtonDraw</b>" + "<li><u>Gomb objektum rajzolt formával.</u></li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>ButtonFile</b>" + "<li><u>Fájl kiválasztó komponens.</u></li>" + "<li>Air context: egy saját tallózható listában jeleníti meg a fájlrendszert.</li>" + "<li>Web context: az operációs rendszer tallózó nézetéből választhatunk fájlt.</li>" + "<li>(Automatikusan kerül eldöntésre, a demo alkalmazások futtathatók webböngészőben vagy android eszközön, ugyanaz a kódbázis van használatban!)</li>" + "<li>Mindkét esetben FileFilter segítségével választható fájlok.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>ButtonLink</b>" + "<li><u>Link objektum amely klikkelhető.</u></li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>ButtonText</b>" + "<li><u>Egyszerű gomb objektum megjelenített szöveggel.</u></li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>Switcher</b>" + "<li><u>2 állású objektum.</u></li>" + "<li>Boolean típusú adat megjelenítésére (igaz vagy hamis: fel- vagy lekapcsolva)</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>Color</b>" + "<li><u>Szín kiválasztó panel.</u></li>" + "<li>Eredeti szín kiválasztása: klikk a default szín formán.</li>" + "<li>Tetszőleges szín a stage-ről: egér le az ideiglenes szín formán és egér húz.</li>" + "<li>Tetszőleges szín RGB-vel: input mezőbe beírni.</li>" + "<li>Előre definiált megadása: klikk a kis négyzeten vagy a színezett sávon.</li>" + "<li>Dupla klikk a föntiekre: szín azonnali véglegesítése.</li>" + "<li>Szín véglegesítése: klikk az OK gombon.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>ColorPicker</b>" + "<li><u>Színt választ a Color objektum segítségével.</u></li>" + "<li>Működtetés: klikk a színezett formán.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>ContentMultiple</b>" + "<li><u>Tartalomkezelő objektum (több lap).</u></li>" + "<li>Például a beállítás panelen.</li>" + "<li>Az 1.5 verzió óta a Widget-ekben és a fő tartalomban.</li>" + "<li>Tartlom választás: klikk a gombsoron.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>ContentSingle</b>" + "<li><u>Tartalomkezelő objektum (1 lap).</u></li>" + "<li>A belsejében automatikus elem pozícionálás.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>List</b>" + "<li><u>Egy vagy több kiválasztható elemek gyűjteménye.</u></li>" + "<li>Kiválaszt: klikk egy elem fölött.</li>" + "<li>Pozícionál: bal egér gomb a listán és húz</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>ListPicker</b>" + "<li><u>Lista egy kiválasztható elemmel, egy sorban.</u></li>" + "<li>(Mint a combobox.)</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>Potmet</b>" + "<li><u>Számok megjelenítése határok között.</u></li>" + "<li>Minimum maximum és növekmény értékek.</li>" + "<li>A pontosság beállítható.</li>" + "<li>Érték változtatás: klikk a potmeten és húz.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>TextArea</b>" + "<li><u>Többsoros szöveg szerkesztésére.</u></li>" + "<li>Pozícionál: bal egér gomb a szövegen és húz</li>" + "<li>Szerkesztő mód: klikk a szövegre.</li>" + "<li>Olvasó mód: klikk máshová.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>TextBox</b>" + "<li><u>Többsoros szöveg megjelenítésére.</u></li>" + "<li>Pozícionál: bal egér gomb a szövegen és húz</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>TextInput</b>" + "<li><u>Egysoros szövegbeviteli mező.</u></li>" + "<li>Jelszó vagy egyszerű szöveg megjelenítés.</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>TextLabel</b>" + "<li><u>Egy vagy többsoros szövegek megjelenítésére.</u></li>" + "<li>3 típus (különböző betűszín)</li>" + application . EMPTY_HTML_PARAGRAPH + "<ul><b>Widget</b>" + "<li><u>Egybetartozó tartalom kezelésére szolgáló felület.</u></li>" + "<li>Többoldalas tartalomkezelés az 1.5 verzió óta!</li>" + "<li><i>     (beépített menü minden egyes Widget-ben.)</i></li>" + "<li>Pozícionál: bal egér gomb a fejlécen és húz</li>" + "<li>Mérezet: bal egér gomb a widget szélén és húz</li>" + "<li>Elrejt - felfed: klikk a fejlécen</li>" + "<li>Navigál: klikk az = ikonra (minden widgeten)</li>" + "<li>Előző vagy következő Widget-re ugrás: ^ vagy ˇ gombok.</li>" + "<li>Widget áthelyezése másik Widget container-be: > gomb.</li>" + "<li>Bezár: dupla klikk a fejléc címkén</li>" + "</ul>" + application . EMPTY_HTML_PARAGRAPH ) ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE0 ] = [ "Value 0" , "Érték 0" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE1 ] = [ "Value 1" , "Érték 1" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE2 ] = [ "Value 2" , "Érték 2" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE20 ] = [ "Value 20" , "Érték 20" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE21 ] = [ "Value 21" , "Érték 21" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE22 ] = [ "Value 22" , "Érték 22" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE23 ] = [ "Value 23" , "Érték 23" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE24 ] = [ "Value 24" , "Érték 24" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE240 ] = [ "Value 240" , "Érték 240" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE241 ] = [ "Value 241" , "Érték 241" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE242 ] = [ "Value 242" , "Érték 242" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE243 ] = [ "Value 243" , "Érték 243" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE244 ] = [ "Value 244" , "Érték 244" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE245 ] = [ "Value 245" , "Érték 245" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE246 ] = [ "Value 246" , "Érték 246" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE247 ] = [ "Value 247" , "Érték 247" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE25 ] = [ "Value 25" , "Érték 25" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE26 ] = [ "Value 26" , "Érték 26" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE27 ] = [ "Value 27" , "Érték 27" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE3 ] = [ "Value 3" , "Érték 3" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE4 ] = [ "Value 4" , "Érték 4" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE5 ] = [ "Value 5" , "Érték 5" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE6 ] = [ "Value 6" , "Érték 6" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE7 ] = [ "Value 7" , "Érték 7" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE8 ] = [ "Value 8" , "Érték 8" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE9 ] = [ "Value 9" , "Érték 9" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE90 ] = [ "Value 90" , "Érték 90" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE91 ] = [ "Value 91" , "Érték 91" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE92 ] = [ "Value 92" , "Érték 92" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE93 ] = [ "Value 93" , "Érték 93" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE94 ] = [ "Value 94" , "Érték 94" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE95 ] = [ "Value 95" , "Érték 95" ] ;
    }
  }
}