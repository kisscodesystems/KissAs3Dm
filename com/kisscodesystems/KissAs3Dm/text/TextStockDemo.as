/*
** This class is a part of the KissAs3Fw actionscrip framework.
** See the header comment lines of the
** com . kisscodesystems . KissAs3Fw . Application
** The whole framework is available at:
** https://github.com/kisscodesystems/KissAs3Fw
** Demo applications:
** https://github.com/kisscodesystems/KissAs3Dm
**
** DESCRIPTION:
** TextStockDemo.
** Additional texts will be added in this demo application.
*/
package com . kisscodesystems . KissAs3Dm . text
{
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . text . TextStock ;
  public class TextStockDemo extends TextStock
  {
    public function TextStockDemo ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      langCodes . push ( TextsDemo ( application . getTexts ( ) ) . LANG_HU ) ;
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
      textIni2 ( ) ;
    }
    private function textIni2 ( ) : void
    {
      texts [ langCodes [ 1 ] ] = [ "Hungarian" , "Magyar" ] ;
      texts [ langCodes [ 0 ] ] . push ( "Angol" ) ;
      texts [ textCodesYesNo [ 0 ] ] . push ( "Igen" ) ;
      texts [ textCodesYesNo [ 1 ] ] . push ( "Nem" ) ;
      texts [ textCodesOkCancel [ 0 ] ] . push ( "OK" ) ;
      texts [ textCodesOkCancel [ 1 ] ] . push ( "Mégse" ) ;
      texts [ textCodesBgImageAligns [ 0 ] ] . push ( "Nincs" ) ;
      texts [ textCodesBgImageAligns [ 1 ] ] . push ( "Közép 1" ) ;
      texts [ textCodesBgImageAligns [ 2 ] ] . push ( "Közép 2" ) ;
      texts [ textCodesBgImageAligns [ 3 ] ] . push ( "Közép 3" ) ;
      texts [ textCodesBgImageAligns [ 4 ] ] . push ( "Mozaik" ) ;
      texts [ textCodesTextTypes [ 0 ] ] . push ( "Világos" ) ;
      texts [ textCodesTextTypes [ 1 ] ] . push ( "Közép" ) ;
      texts [ textCodesTextTypes [ 2 ] ] . push ( "Sötét" ) ;
      texts [ textCodesWeekdays [ 0 ] ] . push ( "Hé" ) ;
      texts [ textCodesWeekdays [ 1 ] ] . push ( "Ke" ) ;
      texts [ textCodesWeekdays [ 2 ] ] . push ( "Sze" ) ;
      texts [ textCodesWeekdays [ 3 ] ] . push ( "Cs" ) ;
      texts [ textCodesWeekdays [ 4 ] ] . push ( "Pé" ) ;
      texts [ textCodesWeekdays [ 5 ] ] . push ( "Szo" ) ;
      texts [ textCodesWeekdays [ 6 ] ] . push ( "Va" ) ;
      texts [ textCodesMonths [ 0 ] ] . push ( "Jan" ) ;
      texts [ textCodesMonths [ 1 ] ] . push ( "Feb" ) ;
      texts [ textCodesMonths [ 2 ] ] . push ( "Már" ) ;
      texts [ textCodesMonths [ 3 ] ] . push ( "Ápr" ) ;
      texts [ textCodesMonths [ 4 ] ] . push ( "Máj" ) ;
      texts [ textCodesMonths [ 5 ] ] . push ( "Jún" ) ;
      texts [ textCodesMonths [ 6 ] ] . push ( "Júl" ) ;
      texts [ textCodesMonths [ 7 ] ] . push ( "Aug" ) ;
      texts [ textCodesMonths [ 8 ] ] . push ( "Sze" ) ;
      texts [ textCodesMonths [ 9 ] ] . push ( "Okt" ) ;
      texts [ textCodesMonths [ 10 ] ] . push ( "Nov" ) ;
      texts [ textCodesMonths [ 11 ] ] . push ( "Dec" ) ;
      texts [ textCodesWidgetsOrientations [ 0 ] ] . push ( "Manuális" ) ;
      texts [ textCodesWidgetsOrientations [ 1 ] ] . push ( "Függőleges" ) ;
      texts [ textCodesWidgetsOrientations [ 2 ] ] . push ( "Vízszintes" ) ;
      texts [ textCodesDisplayingStyles [ 0 ] ] . push ( "View" ) ;
      texts [ textCodesDisplayingStyles [ 1 ] ] = [ "Style 01" , "Stílus 01" ] ;
      texts [ textCodesDisplayingStyles [ 2 ] ] = [ "Style 02" , "Stílus 02" ] ;
      texts [ textCodesDisplayingStyles [ 3 ] ] = [ "Style 03" , "Stílus 03" ] ;
      texts [ textCodesDisplayingStyles [ 4 ] ] = [ "Style 04" , "Stílus 04" ] ;
      texts [ textCodesDisplayingStyles [ 5 ] ] = [ "Style 05" , "Stílus 05" ] ;
      texts [ textCodesDisplayingStyles [ 6 ] ] = [ "Style 06" , "Stílus 06" ] ;
      texts [ textCodesDisplayingStyles [ 7 ] ] = [ "Style 07" , "Stílus 07" ] ;
      texts [ textCodesDisplayingStyles [ 8 ] ] = [ "Style 08" , "Stílus 08" ] ;
      texts [ textCodesDisplayingStyles [ 9 ] ] = [ "Style 09" , "Stílus 09" ] ;
      texts [ textCodesDisplayingStyles [ 10 ] ] = [ "Style 10" , "Stílus 10" ] ;
      texts [ textCodesDisplayingStyles [ 11 ] ] = [ "Style 11" , "Stílus 11" ] ;
      texts [ textCodesDisplayingStyles [ 12 ] ] = [ "Style 12" , "Stílus 12" ] ;
      texts [ textCodesDisplayingStyles [ 13 ] ] = [ "Style 13" , "Stílus 13" ] ;
      texts [ textCodesDisplayingStyles [ 14 ] ] = [ "Style 14" , "Stílus 14" ] ;
      texts [ textCodesWidgetModes [ 0 ] ] . push ( "Automatikus" ) ;
      texts [ textCodesWidgetModes [ 1 ] ] . push ( "Asztali" ) ;
      texts [ textCodesWidgetModes [ 2 ] ] . push ( "Mobil" ) ;
      texts [ application . getTexts ( ) . MORE ] . push ( "Több" ) ;
      texts [ application . getTexts ( ) . CAMERA_ON_MOBILE_DEVICES ] . push ( "Mobil eszköz?\nForgasd fekvő nézetbe." ) ;
      texts [ application . getTexts ( ) . WATCH_TYPE_BASIC ] . push ( "Alap" ) ;
      texts [ application . getTexts ( ) . WATCH_TYPE_DIGITAL ] . push ( "Digitális" ) ;
      texts [ application . getTexts ( ) . WATCH_TYPE_ANALOG ] . push ( "Analóg" ) ;
      texts [ application . getTexts ( ) . WATCH_TYPE_BINARY ] . push ( "Bináris" ) ;
      texts [ application . getTexts ( ) . WATCH_SHOW_SECONDS ] . push ( "Másodperc mutató" ) ;
      texts [ application . getTexts ( ) . WATCH_WITHOUT_SECONDS ] . push ( "Másodperc nélkül" ) ;
      texts [ application . getTexts ( ) . TODAY ] . push ( "M" ) ;
      texts [ application . getTexts ( ) . RESET ] . push ( "Reset" ) ;
      texts [ application . getTexts ( ) . LOGOUT_BUTTON ] . push ( "Kilép" ) ;
      texts [ application . getTexts ( ) . WIDGET_TYPE_GENERAL ] . push ( "Általános widget típus" ) ;
      texts [ application . getTexts ( ) . WIDGET_HEADER_GENERAL ] . push ( "Widget" ) ;
      texts [ application . getTexts ( ) . LISTS_OF_THE_WIDGETS ] . push ( "Ugorj ide:" ) ;
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
      texts [ application . getTexts ( ) . SETTING_REALLY_REDUCE_NUM_OF_WIDGET_CONTAINERS ] . push ( "Tényleg csökkenteni szeretnéd a widget containerek számát?" ) ;
      texts [ application . getTexts ( ) . SETTING_CURR_WIDGETCONTAINER ] . push ( "Jelen container." ) ;
      texts [ application . getTexts ( ) . SETTING_WIDGETS_ORIENTATION ] . push ( "Widget rendezés." ) ;
      texts [ application . getTexts ( ) . SETTING_LINE_THICKNESS ] . push ( "Vonalvastagság." ) ;
      texts [ application . getTexts ( ) . SETTING_MARGIN ] . push ( "Margó." ) ;
      texts [ application . getTexts ( ) . SETTING_PADDING ] . push ( "Kitöltés." ) ;
      texts [ application . getTexts ( ) . SETTING_RADIUS ] . push ( "Sugár." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_BG_COLOR ] . push ( "Háttérszín." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_FG_COLOR ] . push ( "Előtérszín." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_BLUR ] . push ( "Háttér maszatolás." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_FILL_ALPHA ] . push ( "Áttetszőség." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_ALIGN ] . push ( "Háttér igazítás." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_ALPHA ] . push ( "Háttér áttetszőség." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_LIVE ] . push ( "A háttér élő." ) ;
      texts [ application . getTexts ( ) . SETTING_BACKGROUND_FIXED ] . push ( "A háttér fix." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_FACE ] . push ( "Betűtípus." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_SIZE ] . push ( "Betűméret." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_COLORS ] . push ( "Betűszínek." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_BOLD ] . push ( "Félkövér betűk." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_ITALIC ] . push ( "Dőlt betűk." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_NORMAL ] . push ( "Normál betűk." ) ;
      texts [ application . getTexts ( ) . SETTING_SOUND_PLAYING_ON ] . push ( "Hangeffektek." ) ;
      texts [ application . getTexts ( ) . SETTING_SOUND_PLAYING_OFF ] . push ( "Hangeffektek." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_THICKNESS ] . push ( "Betűvastagság." ) ;
      texts [ application . getTexts ( ) . SETTING_FONT_SKEWNESS ] . push ( "Betűdőlés." ) ;
      texts [ application . getTexts ( ) . DEFAULT_CONTENT ] . push ( "Default content" ) ;
      texts [ application . getTexts ( ) . CLEAR ] . push ( "Törlés" ) ;
      texts [ application . getTexts ( ) . DRAW ] . push ( "Rajzol" ) ;
      texts [ application . getTexts ( ) . RUBBER ] . push ( "Radír" ) ;
      texts [ application . getTexts ( ) . REALLY_WANT_TO_CLEAR_DRAWN_CONTENT ] . push ( "Tényleg törölni szeretnéd a rajzolt tartalmat?" ) ;
      texts [ application . getTexts ( ) . SETTING_WIDGET_MODE ] . push ( "Widget mód." ) ;
      texts [ application . getTexts ( ) . REQUIRED_PERMISSIONS_ALERT ] . push ( "Ez az akalmazás Kamera, Tárhely és Internet jogosultságokat igényel.\nKérlek, nézz rá a beállításokra, és add meg ezeket a jogosultságokat az appnak a megfelelő működéséhez. Elképzelhető hogy újra kell majd indítani az alkalmazást." ) ;
      texts [ application . getTexts ( ) . COMPONENTS_USAGE ] . push (
      "<p><b>Üdvözlet a KissAs3Fw framework-ben!</b></p>" 
      + application . EMPTY_HTML_PARAGRAPH 
      + "<p>Alább olvasható a komponens set használata.<br/>"
      + "Részben, mert azok a komponensek vannak itt, amelyek az alap<br/>"
      + "program nézetben vannak megjelenítve. A többi komponens a KissAs3Dm<br/>"
      + "alkalmazás többi widget-jében van kifejtve."
      + "</p>" 
      + application . EMPTY_HTML_PARAGRAPH 
      + "<p>Az Application a fő program, ebben a bizonyos ablakban fut előtted. "
      + "Van egy fejléc és egy tartalom része. A fejlécben a következő elemek találhatók:"
      + "</p>" 
      + application . EMPTY_HTML_PARAGRAPH 
      + "<p>Menu gomb<br/>"
      + "<ul><li>az alap felhasználói információkat tartalmazza, és az alkalmazás menüjét</li>" 
      + "</p>" 
      + "<p><b>Applikáció név</b><br/>"
      + "<ul><li>egy label, ami az alkalmazás nevét jeleníti meg</li>" 
      + "</p>" 
      + "<p><b>Watch</b><br/>"
      + "<ul><li>megjeleníti az aktuális kliens rendszeridőt</li>" 
      + "<li>jelenlegi dátum és időzóna a háttéren</li>" 
      + "<li>másodperc kijelzés ki- és bekapcsolható</li>" 
      + "<li>alap, digitális, analóg és bináris idő kijelzés választható</li>" 
      + "</p>" 
      + "<p>Settings gomb<br/>"
      + "<ul><li>megnyit egy panelt hogy az alkalmazást testreszabhassuk</li>" 
      + "<li>nyelv, megjelenítési stílus, widget konténerek, widget igazítás</li>" 
      + "<li>automatikus vagy manuális váltás a mobilos vagy asztali kinézet közül</li>" 
      + "<li>minden más tulajdonsága a megjelenítésnek</li>" 
      + "</p>" 
      + "<ul><b><u>És a tartalom<br/>(Application-Middleground-Widgets-ContentMultiple)</u></b>" 
      + "<li><u>Terület ahová Widget-eket lehet elhelyezni.</u></li>" 
      + "<li>Az 1.5 verzió óta támogatja a több tartalmas megjelenítést (widget container-ek).</li>" 
      + "<li>Az 1.9 verzió óta pedig a mobilos és az asztali megjelenítések közötti egyszerű váltást.</li>" 
      + "<li>A beállítások panelen testreszabható ha ez elérhető az app-ban.</li>" 
      + application . EMPTY_HTML_PARAGRAPH 
      + "<ul><b>ContentMultiple</b>" 
      + "<li><u>Tartalomkezelő objektum (több lap).</u></li>" 
      + "<li>Például a beállítás panelen.</li>" 
      + "<li>Az 1.5 verzió óta a Widget-ekben és a fő tartalomban.</li>" 
      + "<li>Tartlom választás: klikk a gombsoron.</li>" 
      + application . EMPTY_HTML_PARAGRAPH 
      + "<ul><b>ContentSingle</b>" 
      + "<li><u>Tartalomkezelő objektum (1 lap).</u></li>" 
      + "<li>A belsejében automatikus elem pozícionálás.</li>" 
      + application . EMPTY_HTML_PARAGRAPH 
      + "<ul><b>Image</b>" 
      + "<li>Egy képet megjelenítő ogjektum beágyazott forrásból vagy kívülről (web)</li>" 
      + "<li>A példa alkalmazása itt a háttérkép megjelenítése</li>" 
      + application . EMPTY_HTML_PARAGRAPH 
      + "<ul><b>Widget</b>" 
      + "<li><u>Egybetartozó tartalom kezelésére szolgáló felület.</u></li>" 
      + "<li>Többoldalas tartalomkezelés az 1.5 verzió óta!</li>" 
      + "<li><i>     (beépített menü minden egyes Widget-ben.)</i></li>" 
      + "<li>Pozícionál: bal egér gomb a fejlécen és húz</li>" 
      + "<li>Méretez: bal egér gomb a widget szélén és húz</li>" 
      + "<li>További widget akciók: a fejlécben taláható gombokkal.</li>" 
      + "</ul>" 
      + application . EMPTY_HTML_PARAGRAPH 
      + "<ul><b>XmlLister</b>" 
      + "<li>Egy ListPanel komponens ami xml típusú adatot kezel. Itt az alkalmazás menü megjelenítésére van használva.</li>" 
      + "<li>A gyökér objektum az &lt;items&gt; és ez alatt tetszőleges mélységekben lehetnek &lt;item&gt; elemek.</li>" 
      + "<li>Az &lt;item&gt; attribútumai lehetnek: opened (0 vagy 1), icon (sztring), value (sztring).</li>"
      + "<li>Az &lt;item&gt; az lehet nyitott vagy zárt egér klikk vagy tap által, ha vannak további &lt;item&gt; gyerek elemei.</li>" 
      + "</ul>" 
      + application . EMPTY_HTML_PARAGRAPH
      ) ;
      texts [ application . getTexts ( ) . SELECTED_FILE ] . push ( "Kiválasztott fájl: " ) ;
      texts [ application . getTexts ( ) . UPLOADED_FILE ] . push ( "Feltöltött fájl: " ) ;
      texts [ application . getTexts ( ) . BROWSE ] . push ( "tallózás.." ) ;
      texts [ application . getTexts ( ) . FILE_UPLOAD_IN_PROGRESS ] . push ( "Feltöltés: " ) ;
      texts [ application . getTexts ( ) . ACTIVATE_CAMERA ] . push ( "Kamera" ) ;
      texts [ application . getTexts ( ) . RELEASE_CAMERA ] . push ( "Elenged" ) ;
      texts [ application . getTexts ( ) . CAMERA_WIDE_RES ] . push ( "16:9" ) ;
      texts [ application . getTexts ( ) . CAMERA_NORMAL_RES ] . push ( "4:3" ) ;
      texts [ application . getTexts ( ) . CAMERA_SIZE ] . push ( "Méret:" ) ;
      texts [ application . getTexts ( ) . CAMERA_FPS ] . push ( "Fps:" ) ;
      texts [ application . getTexts ( ) . CAMERA_QUALITY ] . push ( "Minőség:" ) ;
      texts [ application . getTexts ( ) . CAMERA_FILTER ] . push ( "Filter:" ) ;
      texts [ application . getTexts ( ) . CAMERA_TAKE_PICTURE ] . push ( "Fényképez!" ) ;
      texts [ application . getTexts ( ) . g ] . push ( "Vendég" ) ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_COMPONENT_USAGE ] = [
      "This widget contains information about how to use this framework." 
      ,
      "Ez a widget információkat tartalmaz a framework használatával kapcsolatban." 
      ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_CAMERA ] = [
        " " 
          + "Camera" 
          + "\n - Camera view with settings." 
          + "\n - Catching and releasing of the camera." 
          + "\n - Chooses camera if multiple camera objects are available." 
          + "\n - Takes and saves photos." 
          + "\n - Can modify the camera view: size, fps, quality, aspect ratio, filters." 
          + "\n - (Filters will not work in gpu rendering mode, for example on Android apps.)" 
          ,
        " " 
          + "Camera" 
          + "\n - Kamera nézet különböző változtatható beállításokkal." 
          + "\n - Kamera elfogás és elengedés." 
          + "\n - Kamera kiválasztása ha több is elérhető." 
          + "\n - Fotó készítése és mentése." 
          + "\n - Kamerakép módosítása: méret, fps, minőség, képarány, filterek." 
          + "\n - (A filterek nem működnek gpu renderelési módban, például Android appokban.)" 
      ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_SINGLE_LINE_TEXTS ] = [
        " " 
          + "TextInput" 
          + "\n - Single line input field." 
          + "\n - Password or default text displaying." 
          + "\n"
          + "\nTextLabel" 
          + "\n - To display single line or multi line texts." 
          + "\n - 3 types (different font colors)." 
          ,
        " " 
          + "TextInput" 
          + "\n - Egysoros szövegbeviteli mező." 
          + "\n - Jelszó vagy egyszerű szöveg megjelenítés." 
          + "\n"
          + "\nTextLabel" 
          + "\n - Egy vagy többsoros szövegek megjelenítésére." 
          + "\n - 3 típus (különböző betűszín)." 
      ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_MULTI_LINE_TEXTS ] = [
        " " 
          + "TextArea" 
          + "\n - To edit multiline texts." 
          + "\n - Position: mouse down on the text area and drag." 
          + "\n - Edit mode: click on the text." 
          + "\n - Read mode: click elsewhere." 
          + "\n"
          + "\nTextBox" 
          + "\n - To display multiline texts." 
          + "\n - Position: mouse down on the text area and drag." 
          ,
        " " 
          + "TextArea" 
          + "\n - Többsoros szöveg szerkesztésére." 
          + "\n - Pozícionál: bal egér gomb a szövegen és húz." 
          + "\n - Szerkesztő mód: klikk a szövegre." 
          + "\n - Olvasó mód: klikk máshová." 
          + "\n"
          + "\nTextBox" 
          + "\n - Többsoros szöveg megjelenítésére." 
          + "\n - Pozícionál: bal egér gomb a szövegen és húz." 
      ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_BUTTONS ] = [
        " " 
          + "ButtonBar" 
          + "\n - A set of ButtonLinks." 
          + "\n - One can be active or none of the buttons." 
          + "\n"
          + "\nButtonFile" 
          + "\n - File browser component." 
          + "\n - Air context: the filesystem is viewed in an own browsable list." 
          + "\n - Web context: we can choose a file from the file browser of the operating system." 
          + "\n - (Decides automatically, try the demo applications in webbrowser and on mobil device, the same codebase has been built.)." 
          + "\n - Choosable files by FileFilter in both cases." 
          + "\n - File or FileReference objects can be set from outside." 
          + "\n"
          + "\nButtonLink" 
          + "\n - A link object which is clickable." 
          + "\n - In opposite to the ButtonText, this remains enabled after a click." 
          + "\n"
          + "\nButtonText" 
          + "\n - Simple button object with displayed text." 
          + "\n - Will be disabled immediately after a click to avoid accidentaly fast second click." 
          ,
        " " 
          + "ButtonBar" 
          + "\n - ButtonLink gyűjtemény." 
          + "\n - Egy lehet aktív közülük vagy egyik sem." 
          + "\n"
          + "\nButtonFile" 
          + "\n - Fájl kiválasztó komponens." 
          + "\n - Air context: egy saját tallózható listában jeleníti meg a fájlrendszert." 
          + "\n - Web context: az operációs rendszer tallózó nézetéből választhatunk fájlt." 
          + "\n - (Automatikusan kerül eldöntésre, a demo alkalmazások futtathatók webböngészőben vagy mobil eszközön, ugyanaz a kódbázis van használatban!)." 
          + "\n - Mindkét esetben FileFilter segítségével választható fájlok." 
          + "\n - A File vagy FileReference objektum kívülről megadható." 
          + "\n"
          + "\nButtonLink" 
          + "\n - Link objektum amely klikkelhető." 
          + "\n - ButtonText-tel ellentétben, ez enabled marad klikk után." 
          + "\n"
          + "\nButtonText" 
          + "\n - Egyszerű gomb objektum megjelenített szöveggel." 
          + "\n - Klikk után disabled lesz azonnal, hogy véletlenül ne tudjuk a klikket gyorsan megismételni." 
      ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_PICKERS ] = [
        " " 
          + "ColorPanel" 
          + "\n - Color chooser panel." 
          + "\n - Selecting the default color: click on the default color shape." 
          + "\n - Get any color from the stage: mouse down on the temporary color shape and mouse drag." 
          + "\n - Specify any color with RGB: type into the input field." 
          + "\n - Selecting predefined color: click on the small rects or on the colored bar." 
          + "\n - Double click on the aboves: commits the color immediately." 
          + "\n - To steal any color from the stage: long tap/click on the actual color and drag." 
          + "\n - Complementer color is also displayed and selectable, modifiable."
          + "\n - Color commit: click on the OK button." 
          + "\n"
          + "\nColorPicker" 
          + "\n - Selects a color with the Color object." 
          + "\n - To get work: click on the colored shape." 
          + "\n"
          + "\nListPanel" 
          + "\n - A set of one or more selectable items." 
          + "\n - Select: click on an item." 
          + "\n - Position: mouse down on the list and drag." 
          + "\n"
          + "\nListPicker" 
          + "\n - List having one selectable item, in one line." 
          + "\n - (Like combobox.)" 
          + "\n"
          + "\nDatePanel" 
          + "\n - A panel that contains the set of days of the current month." 
          + "\n - Hours and minutes can be selected if configured." 
          + "\n - Displays the names of the weekdays and the number of the current week of the year" 
          + "\n - Can be changed to forward or to backward by year or month buttons." 
          + "\n - Today button to show the current date." 
          + "\n"
          + "\nDatePicker" 
          + "\n - A component that picks the selected date (and time) from the Date object." 
          ,
        " " 
          + "ColorPanel" 
          + "\n - Szín kiválasztó panel." 
          + "\n - Eredeti szín kiválasztása: klikk a default szín formán." 
          + "\n - Tetszőleges szín a stage-ről: egér le az ideiglenes szín formán és egér húz." 
          + "\n - Tetszőleges szín RGB-vel: input mezőbe beírni." 
          + "\n - Előre definiált megadása: klikk a kis négyzeten vagy a színezett sávon." 
          + "\n - Dupla klikk a föntiekre: szín azonnali véglegesítése." 
          + "\n - A stage bármely pixelét ellophatod: hosszú tap/klikk az aktuális színre és húzd." 
          + "\n - Komplementer szín is meg van jelenítve, és kiválasztható, módosítható."
          + "\n - Szín véglegesítése: klikk az OK gombon." 
          + "\n"
          + "\nColorPicker" 
          + "\n - Színt választ a Color objektum segítségével." 
          + "\n - Működtetés: klikk a színezett formán." 
          + "\n"
          + "\nListPanel" 
          + "\n - Egy vagy több kiválasztható elemek gyűjteménye." 
          + "\n - Kiválaszt: klikk egy elem fölött." 
          + "\n - Pozícionál: bal egér gomb a listán és húz." 
          + "\n"
          + "\nListPicker" 
          + "\n - Lista egy kiválasztható elemmel, egy sorban." 
          + "\n - (Mint a combobox.)" 
          + "\n"
          + "\nDatePanel" 
          + "\n - Egy panel, amely tartalmazza az adott hónap összes napját." 
          + "\n - Órák és percek is kiválaszthatók ha úgy van beállítva." 
          + "\n - Megjeleníti a napok neveit és a hét sorszámát." 
          + "\n - Előre vagy visszafelé változtathaó hónap és év gombokkal." 
          + "\n - Ma gomb hogy a jelenlegi dátumot mutassa." 
          + "\n"
          + "\nDatePicker" 
          + "\n - Egy komponens ami megjeleníti a DatePanel komponensből a kiválasztott dátumot." 
      ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_BOARD ] = [
        " " 
          + "Board" 
          + "\n - Table component that is possible to draw onto." 
          + "\n - Line thickness, line color and background color are configurable." 
          + "\n - Clearing is possible by a rubber or a whole clearing." 
          + "\n - Background color and the size of the board can be changed if the clear link has been used." 
          + "\n - Save as a base64 encoded byte array will be implemented soon."
          ,
        " " 
          + "Board" 
          + "\n - Tábla komponens, amelyre lehetséges rajzolni." 
          + "\n - Vonal vastagság, vonal szín, háttér szín beállítható." 
          + "\n - Radíttal törlés vagy teljes táblatörlés funkciók." 
          + "\n - Háttérszín és tábla méret akkor változtatható ha a törlés linket használtuk." 
          + "\n - Tartalmának mentése mint base64 enkódolt byte tömb nemsokára implementálva lesz."
      ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_OTHERS ] = [
        " " 
          + "Potmeter" 
          + "\n - Displays numbers between ranges." 
          + "\n - Minimum maximum and increment values." 
          + "\n - Precision can be set." 
          + "\n - Value changing: click on potmeter and drag." 
          + "\n"
          + "\nRater" 
          + "\n - Rating component based on stars and half stars." 
          + "\n"
          + "\nSwitcher" 
          + "\n - Object with 2 states." 
          + "\n - To visualize Boolean data (true or false: turned up or down)." 
          + "\n - Many other components are switchers basically: Marker, Orderer."
          + "\n"
          + "\nSoundPlayer" 
          + "\n - Sound player object that can play embedded sound objects from the ui/SoundManager object." 
          + "\n - The title of the sound can be specified."
          + "\n - Start, pause, stop main features." 
          + "\n - Seek, and displaying in progress and remaining times."
          + "\n"
          + "\nMore" 
          + "\n - A group of hidden objects." 
          + "\n - Every objects are fully functional but can be visible and invisible."
          ,
        " " 
          + "Potmeter" 
          + "\n - Számok megjelenítése határok között." 
          + "\n - Minimum maximum és növekmény értékek." 
          + "\n - A pontosság beállítható." 
          + "\n - Menüpont változtatás: klikk a potmeteren és húz." 
          + "\n"
          + "\nRater" 
          + "\n - Csillagos és félcsillagos jelöléssel működő szavazó komponens." 
          + "\n"
          + "\nSwitcher" 
          + "\n - 2 állású objektum." 
          + "\n - Boolean típusú adat megjelenítésére (igaz vagy hamis: fel- vagy lekapcsolva)." 
          + "\n - További komponensek amelyek lényegében Switcherek: Marker , Orderer." 
          + "\n"
          + "\nSoundPlayer" 
          + "\n - Hang lejátszó objektum, amely a ui/SoundManager-be ágyazott Sound objektumokat lejátszani képes.." 
          + "\n - Zene címe megadható." 
          + "\n - Start, pause, stop alapfunkciók."
          + "\n - Seek, folyamatban és visszamaradó időtartam kijelzés." 
          + "\n"
          + "\nMore" 
          + "\n - Objektumok egy rejtett csoportja." 
          + "\n - Minden objektum teljesen funkcionál, de lehet rejtett és megjelenített."
      ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_COMPONENT_USAGE ] = [ "Component usage" , "Komponens használat" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_SINGLE_LINE_TEXTS ] = [ "Single line texts" , "Egysoros szövegek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_MULTI_LINE_TEXTS ] = [ "Multiple line texts" , "Többsoros szövegek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_TEXTS ] = [ "Texts" , "Szövegek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_BUTTONS ] = [ "Buttons" , "Gombok" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_PICKERS ] = [ "Pickers" , "Választók" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_OTHERS ] = [ "Others" , "Továbbiak" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_CAMERA ] = [ "Camera" , "Kamera" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MENU_ITEM_BOARD ] = [ "Board" , "Tábla" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_COMPONENT_USAGE ] = [ "Component usage" , "Komponens használat" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_SINGLE_LINE_TEXTS ] = [ "Single line texts" , "Egysoros szövegek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_MULTI_LINE_TEXTS ] = [ "Multiple line texts" , "Többsoros szövegek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_BUTTONS ] = [ "Buttons" , "Gombok" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_PICKERS ] = [ "Pickers" , "Választók" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_OTHERS ] = [ "Others" , "Továbbiak" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_CAMERA ] = [ "Camera" , "Kamera" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_BOARD ] = [ "Board" , "Tábla" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_COMPONENT_USAGE ] = [ "Component usage" , "Komponens használat" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_SINGLE_LINE_TEXTS ] = [ "Single line texts" , "Egysoros szövegek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_MULTI_LINE_TEXTS ] = [ "Multiple line texts" , "Többsoros szövegek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_BUTTONS ] = [ "Buttons" , "Gombok" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_PICKERS ] = [ "Pickers" , "Választók" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_PICKERS_COLORS ] = [ "Color" , "Szín" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_PICKERS_DATES ] = [ "Date" , "Dátum" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_PICKERS_LISTS ] = [ "List" , "Lista" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_OTHERS ] = [ "Others" , "Továbbiak" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_CAMERA ] = [ "Camera" , "Kamera" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_BOARD ] = [ "Board" , "Tábla" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . PRIVACY_POLICY ] = [ "Privacy Policy" , "Adatkezelési Irányelvek" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_BRIGHT ] = [ "This is a single line label (bright)." , "Ez egy egy soros cimke (világos)." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_MID_ENABLED_INPUT ] = [ "Input field is enabled (mid label):" , "Beviteli mező enabled (közepes cimke):" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_DARK_ENABLED_INPUT ] = [ "Input field is disabled (dark label):" , "Beviteli mező disabled (sötét cimke):" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SINGLE_LINE_LABEL_DARK_PASSWORD_INPUT ] = [ "Password input field (dark label):" , "Jelszó beviteli mező (sötét cimke):" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . ENABLED_TEXT_INPUT ] = [ "I'm enabled." , "Enabled vagyok." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . DISABLED_TEXT_INPUT ] = [ "I'm disabled." , "Disabled vagyok." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . MULTIPLE_LINE_LABEL_TEXT_BOX ] = [ "A single multiline text:\n(Its html version is\nin the component usage.)" , "Egyszerű többsoros szöveg.\n(Ennek a html verziója van\na komponens használatban.)" ] ;
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
      texts [ TextsDemo ( application . getTexts ( ) ) . COLORS ] = [ "Color panel:" , "Szín panel:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . COLOR_PICKERS ] = [ "Color picker:" , "Színválasztó:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . DATES ] = [ "Date panel:" , "Dátum panel:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . DATE_PICKERS ] = [ "Date picker:" , "Dátumválasztó:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . LISTS ] = [ "List panel:" , "Lista panel:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . LIST_PICKERS ] = [ "List picker:" , "Listaválasztó:" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SWITCHER_UP ] = [ "Switcher marked!" , "Switcher jelölve!" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SWITCHER_DOWN ] = [ "Switcher empty.." , "Switcher üres.." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . SELECTED_INDEXES ] = [ "Selected indexes: " , "Megjelölt indexek: " ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . HAS_BEEN_CLICKED ] = [ " has been clicked." , " volt megklikkelve." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . BOARD_LABEL ] = [ "This is a board." , "Ez egy tábla." ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . BUTTON_IN_MORE ] = [ "More button" , "Több gomb" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . LINK_IN_MORE ] = [ "More link" , "Több link" ] ;
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
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE0 ] = [ "Menu item 0" , "Menüpont 0" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE1 ] = [ "Menu item 1" , "Menüpont 1" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE2 ] = [ "Menu item 2" , "Menüpont 2" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE20 ] = [ "Menu item 20" , "Menüpont 20" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE21 ] = [ "Menu item 21" , "Menüpont 21" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE22 ] = [ "Menu item 22" , "Menüpont 22" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE23 ] = [ "Menu item 23" , "Menüpont 23" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE24 ] = [ "Menu item 24" , "Menüpont 24" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE240 ] = [ "Menu item 240" , "Menüpont 240" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE241 ] = [ "Menu item 241" , "Menüpont 241" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE242 ] = [ "Menu item 242" , "Menüpont 242" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE243 ] = [ "Menu item 243" , "Menüpont 243" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE244 ] = [ "Menu item 244" , "Menüpont 244" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE245 ] = [ "Menu item 245" , "Menüpont 245" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE246 ] = [ "Menu item 246" , "Menüpont 246" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE247 ] = [ "Menu item 247" , "Menüpont 247" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE25 ] = [ "Menu item 25" , "Menüpont 25" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE26 ] = [ "Menu item 26" , "Menüpont 26" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE27 ] = [ "Menu item 27" , "Menüpont 27" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE3 ] = [ "Menu item 3" , "Menüpont 3" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE4 ] = [ "Menu item 4" , "Menüpont 4" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE5 ] = [ "Menu item 5" , "Menüpont 5" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE6 ] = [ "Menu item 6" , "Menüpont 6" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE7 ] = [ "Menu item 7" , "Menüpont 7" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE8 ] = [ "Menu item 8" , "Menüpont 8" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE9 ] = [ "Menu item 9" , "Menüpont 9" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE90 ] = [ "Menu item 90" , "Menüpont 90" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE91 ] = [ "Menu item 91" , "Menüpont 91" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE92 ] = [ "Menu item 92" , "Menüpont 92" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE93 ] = [ "Menu item 93" , "Menüpont 93" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE94 ] = [ "Menu item 94" , "Menüpont 94" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . VALUE95 ] = [ "Menu item 95" , "Menüpont 95" ] ;
      texts [ TextsDemo ( application . getTexts ( ) ) . WIDGET_TAB_BASIC ] = [ "Basic" , "Alap" ] ;
    }
  }
}
