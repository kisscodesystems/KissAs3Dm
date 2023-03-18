package com . kisscodesystems . KissAs3Dm . app
{
  import com . kisscodesystems . KissAs3Dm . text . TextsDemo ;
  import com . kisscodesystems . KissAs3Fw . Application ;
  import com . kisscodesystems . KissAs3Fw . ui . ColorPanel ;
  import com . kisscodesystems . KissAs3Fw . ui . ColorPicker ;
  import com . kisscodesystems . KissAs3Fw . ui . DatePanel ;
  import com . kisscodesystems . KissAs3Fw . ui . DatePicker ;
  import com . kisscodesystems . KissAs3Fw . ui . ListPanel ;
  import com . kisscodesystems . KissAs3Fw . ui . ListPicker ;
  import com . kisscodesystems . KissAs3Fw . ui . TextLabel ;
  import com . kisscodesystems . KissAs3Fw . ui . Widget ;
  import flash . events . Event ;
  public class PickersWidget extends Widget
  {
    private var textLabelColor : TextLabel = null ;
    private var colorEnabled : ColorPanel = null ;
    private var textLabelColorPicker : TextLabel = null ;
    private var colorPickerEnabled : ColorPicker = null ;
    private var colorPickerDisabled : ColorPicker = null ;
    private var textLabelDate : TextLabel = null ;
    private var dateEnabled : DatePanel = null ;
    private var textLabelDatePicker : TextLabel = null ;
    private var datePickerEnabled : DatePicker = null ;
    private var datePickerDisabled : DatePicker = null ;
    private var textLabelList : TextLabel = null ;
    private var listEnabled : ListPanel = null ;
    private var textLabelListPicker : TextLabel = null ;
    private var listPickerEnabled : ListPicker = null ;
    private var listPickerDisabled : ListPicker = null ;
    private var listMaxElements : int = 5 ;
    private var colorsIndex : int = - 1 ; 
    private var datesIndex : int = - 1 ;
    private var listsIndex : int = - 1 ;
    public function PickersWidget ( applicationRef : Application ) : void
    {
      super ( applicationRef ) ;
      iniSizeWidth = 620 ;
      iniSizeHeight = 680 ;
    }
    override protected function onCreate ( ) : void
    {
      if ( ! loaded )
      {
        loaded = true ;
        setWidgetType ( TextsDemo ( application . getTexts ( ) ) . WIDGET_TYPE_PICKERS ) ;
        setWidgetHeaderCode ( TextsDemo ( application . getTexts ( ) ) . WIDGET_HEADER_PICKERS ) ;
        setInfoContent ( TextsDemo ( application . getTexts ( ) ) . WIDGETINFO_PICKERS ) ;
        colorsIndex = addContent ( TextsDemo ( application . getTexts ( ) ) . WIDGET_PICKERS_COLORS ) ;
        datesIndex = addContent ( TextsDemo ( application . getTexts ( ) ) . WIDGET_PICKERS_DATES ) ;
        listsIndex = addContent ( TextsDemo ( application . getTexts ( ) ) . WIDGET_PICKERS_LISTS ) ;
        setElementsFix ( colorsIndex , 1 ) ;
        setElementsFix ( datesIndex , 1 ) ;
        setElementsFix ( listsIndex , 1 ) ;
        setActiveContent ( colorsIndex ) ;
        textLabelColor = new TextLabel ( application ) ;
        addToContent ( colorsIndex , textLabelColor , 0 ) ;
        textLabelColor . setTextCode ( TextsDemo ( application . getTexts ( ) ) . COLORS ) ;
        colorEnabled = new ColorPanel ( application ) ;
        addToContent ( colorsIndex , colorEnabled , 1 ) ;
        colorEnabled . setRGBColor ( application . getPropsDyn ( ) . getAppBackgroundColorBright ( ) . toString ( 16 ) ) ;
        textLabelColorPicker = new TextLabel ( application ) ;
        addToContent ( colorsIndex , textLabelColorPicker , 2 ) ;
        textLabelColorPicker . setTextCode ( TextsDemo ( application . getTexts ( ) ) . COLOR_PICKERS ) ;
        colorPickerEnabled = new ColorPicker ( application ) ;
        addToContent ( colorsIndex , colorPickerEnabled , 3 ) ;
        colorPickerEnabled . setRGBColor ( application . getPropsDyn ( ) . getAppBackgroundColorDark ( ) . toString ( 16 ) ) ;
        colorPickerDisabled = new ColorPicker ( application ) ;
        addToContent ( colorsIndex , colorPickerDisabled , 5 ) ;
        colorPickerDisabled . setRGBColor ( application . getPropsDyn ( ) . getAppBackgroundColorBright ( ) . toString ( 16 ) ) ;
        colorPickerDisabled . setEnabled ( false ) ;
        textLabelDate = new TextLabel ( application ) ;
        addToContent ( datesIndex , textLabelDate , 0 ) ;
        textLabelDate . setTextCode ( TextsDemo ( application . getTexts ( ) ) . DATES ) ;
        dateEnabled = new DatePanel ( application ) ;
        addToContent ( datesIndex , dateEnabled , 1 ) ;
        dateEnabled . setSelectedDate ( new Date ( ) ) ;
        textLabelDatePicker = new TextLabel ( application ) ;
        addToContent ( datesIndex , textLabelDatePicker , 2 ) ;
        textLabelDatePicker . setTextCode ( TextsDemo ( application . getTexts ( ) ) . DATE_PICKERS ) ;
        datePickerEnabled = new DatePicker ( application ) ;
        addToContent ( datesIndex , datePickerEnabled , 3 ) ;
        datePickerEnabled . setHoursAndMinutes ( true ) ;
        datePickerDisabled = new DatePicker ( application ) ;
        addToContent ( datesIndex , datePickerDisabled , 5 ) ;
        datePickerDisabled . setSelectedDate ( new Date ( ) ) ;
        datePickerDisabled . setEnabled ( false ) ;
        textLabelList = new TextLabel ( application ) ;
        addToContent ( listsIndex , textLabelList , 0 ) ;
        textLabelList . setTextCode ( TextsDemo ( application . getTexts ( ) ) . LISTS ) ;
        listEnabled = new ListPanel ( application ) ;
        addToContent ( listsIndex , listEnabled , 1 ) ;
        listEnabled . setArrays ( [ TextsDemo ( application . getTexts ( ) ) . ELEMENT0 , TextsDemo ( application . getTexts ( ) ) . ELEMENT1 , TextsDemo ( application . getTexts ( ) ) . ELEMENT2 , TextsDemo ( application . getTexts ( ) ) . ELEMENT3 , TextsDemo ( application . getTexts ( ) ) . ELEMENT4 , TextsDemo ( application . getTexts ( ) ) . ELEMENT5 , TextsDemo ( application . getTexts ( ) ) . ELEMENT6 , TextsDemo ( application . getTexts ( ) ) . ELEMENT7 , TextsDemo ( application . getTexts ( ) ) . ELEMENT8 , TextsDemo ( application . getTexts ( ) ) . ELEMENT9 ] , [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 ] ) ;
        listEnabled . setNumOfElements ( listMaxElements ) ;
        listEnabled . setMultiple ( true ) ;
        listEnabled . setSelectedIndexes ( [ 0 , 2 , 3 ] ) ;
        listEnabled . setStartIndex ( 2 ) ;
        listEnabled . getBaseEventDispatcher ( ) . addEventListener ( application . EVENT_CHANGED , listEnabledChanged ) ;
        textLabelListPicker = new TextLabel ( application ) ;
        addToContent ( listsIndex , textLabelListPicker , 2 ) ;
        textLabelListPicker . setTextCode ( TextsDemo ( application . getTexts ( ) ) . LIST_PICKERS ) ;
        listPickerEnabled = new ListPicker ( application ) ;
        addToContent ( listsIndex , listPickerEnabled , 3 ) ;
        listPickerEnabled . setNumOfElements ( listMaxElements ) ;
        listPickerEnabled . setArrays ( [ TextsDemo ( application . getTexts ( ) ) . ELEMENT0 , TextsDemo ( application . getTexts ( ) ) . ELEMENT1 , TextsDemo ( application . getTexts ( ) ) . ELEMENT2 , TextsDemo ( application . getTexts ( ) ) . ELEMENT3 , TextsDemo ( application . getTexts ( ) ) . ELEMENT4 , TextsDemo ( application . getTexts ( ) ) . ELEMENT5 , TextsDemo ( application . getTexts ( ) ) . ELEMENT6 , TextsDemo ( application . getTexts ( ) ) . ELEMENT7 , TextsDemo ( application . getTexts ( ) ) . ELEMENT8 , TextsDemo ( application . getTexts ( ) ) . ELEMENT9 , TextsDemo ( application . getTexts ( ) ) . ELEMENT10 , TextsDemo ( application . getTexts ( ) ) . ELEMENT11 , TextsDemo ( application . getTexts ( ) ) . ELEMENT12 , TextsDemo ( application . getTexts ( ) ) . ELEMENT13 , TextsDemo ( application . getTexts ( ) ) . ELEMENT14 , TextsDemo ( application . getTexts ( ) ) . ELEMENT15 , TextsDemo ( application . getTexts ( ) ) . ELEMENT16 , TextsDemo ( application . getTexts ( ) ) . ELEMENT17 , TextsDemo ( application . getTexts ( ) ) . ELEMENT18 , TextsDemo ( application . getTexts ( ) ) . ELEMENT19 ] , [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 ] ) ;
        listPickerEnabled . setSelectedIndex ( 2 ) ;
        listPickerDisabled = new ListPicker ( application ) ;
        addToContent ( listsIndex , listPickerDisabled , 5 ) ;
        listPickerDisabled . setNumOfElements ( listMaxElements ) ;
        listPickerDisabled . setArrays ( [ TextsDemo ( application . getTexts ( ) ) . ELEMENT0 , TextsDemo ( application . getTexts ( ) ) . ELEMENT1 , TextsDemo ( application . getTexts ( ) ) . ELEMENT2 , TextsDemo ( application . getTexts ( ) ) . ELEMENT3 , TextsDemo ( application . getTexts ( ) ) . ELEMENT4 , TextsDemo ( application . getTexts ( ) ) . ELEMENT5 , TextsDemo ( application . getTexts ( ) ) . ELEMENT6 , TextsDemo ( application . getTexts ( ) ) . ELEMENT7 , TextsDemo ( application . getTexts ( ) ) . ELEMENT8 , TextsDemo ( application . getTexts ( ) ) . ELEMENT9 , TextsDemo ( application . getTexts ( ) ) . ELEMENT10 , TextsDemo ( application . getTexts ( ) ) . ELEMENT11 , TextsDemo ( application . getTexts ( ) ) . ELEMENT12 , TextsDemo ( application . getTexts ( ) ) . ELEMENT13 , TextsDemo ( application . getTexts ( ) ) . ELEMENT14 , TextsDemo ( application . getTexts ( ) ) . ELEMENT15 , TextsDemo ( application . getTexts ( ) ) . ELEMENT16 , TextsDemo ( application . getTexts ( ) ) . ELEMENT17 , TextsDemo ( application . getTexts ( ) ) . ELEMENT18 , TextsDemo ( application . getTexts ( ) ) . ELEMENT19 ] , [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 ] ) ;
        listPickerDisabled . setSelectedIndex ( 3 ) ;
        listPickerDisabled . setEnabled ( false ) ;
        doSizeChanged ( ) ;
      }
    }
    override public function setDesktopSizes ( ) : void
    {
      super . setDesktopSizes ( ) ;
      if ( widgetMode != application . getTexts ( ) . WIDGET_MODE_DESKTOP )
      {
        setElementsFix ( colorsIndex , 1 ) ;
        setElementsFix ( datesIndex , 1 ) ;
        setElementsFix ( listsIndex , 1 ) ;
        doSizeChanged ( ) ;
      }
    }
    override public function setMobileSizes ( ) : void
    {
      super . setMobileSizes ( ) ;
      if ( widgetMode != application . getTexts ( ) . WIDGET_MODE_MOBILE )
      {
        setElementsFix ( colorsIndex , 0 ) ;
        setElementsFix ( datesIndex , 0 ) ;
        setElementsFix ( listsIndex , 0 ) ;
        doSizeChanged ( ) ;
      }
    }
    override protected function doSizeChanged ( ) : void
    {
      super . doSizeChanged ( ) ;
      if ( datePickerEnabled != null )
      {
        datePickerEnabled . setsw ( getContentsw ( ) / 2 ) ;
      }
      if ( datePickerDisabled != null )
      {
        datePickerDisabled . setsw ( getContentsw ( ) / 2 ) ;
      }
      if ( listEnabled != null )
      {
        listEnabled . setsw ( getContentsw ( ) / 2 ) ;
      }
      if ( listPickerEnabled != null )
      {
        listPickerEnabled . setsw ( getContentsw ( ) / 2 ) ;
      }
      if ( listPickerDisabled != null )
      {
        listPickerDisabled . setsw ( getContentsw ( ) / 2 ) ;
      }
    }
    private function listEnabledChanged ( e : Event ) : void
    {
      var uniqueString : String = "" + new Date ( ) . time ;
      var messageString : String = TextsDemo ( application . getTexts ( ) ) . SELECTED_INDEXES + listEnabled . getSelectedIndexes ( ) ;
      var alertOkListEnabled : Function = function ( e : Event ) : void
      {
        application . getBaseEventDispatcher ( ) . removeEventListener ( e . type , alertOkListEnabled ) ;
        application . getForeground ( ) . closeAlert ( uniqueString ) ;
        e . stopImmediatePropagation ( ) ;
      }
      application . getBaseEventDispatcher ( ) . addEventListener ( uniqueString + application . getTexts ( ) . OC_OK , alertOkListEnabled ) ;
      application . getForeground ( ) . createAlert ( messageString , uniqueString , true , false ) ;
    }
    override public function destroy ( ) : void
    {
      super . destroy ( ) ;
      textLabelColor = null ;
      colorEnabled = null ;
      textLabelColorPicker = null ;
      colorPickerEnabled = null ;
      colorPickerDisabled = null ;
      textLabelDate = null ;
      dateEnabled = null ;
      textLabelDatePicker = null ;
      datePickerEnabled = null ;
      datePickerDisabled = null ;
      textLabelList = null ;
      listEnabled = null ;
      textLabelListPicker = null ;
      listPickerEnabled = null ;
      listPickerDisabled = null ;
      listMaxElements = 0 ;
    }
  }
}
