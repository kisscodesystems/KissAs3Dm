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
 * ApplicationWidget.
 * The widget of the application itself.
 *
 * MAIN FEATURES:
 * - every other widget of this application demonstrates one component of the ui
 *   package, this one demonstrates the application every one of them stands in
 * - the information about the whole application goes in here: the layers, the
 *   configurations, the managers and the properties of it
 * - this widget builds no elements at all: that whole information is the info text of
 *   the header, so it is opened with that text, and the content standing behind it
 *   carries the sentence pointing at that very text
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  public class ApplicationWidget extends DemoWidget
  {
    /**
     * Constructs the widget of the application itself.
     * @param applicationRef the main application reference
     */
    public function ApplicationWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ApplicationWidget> called.", 4);
      application.trace("<" + this + " ApplicationWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.APPLICATION();
      headerIcon = EnumIconsDemo.application();
      infoCode = EnumTextKeysDemo.WIDGETINFO_APPLICATION();
      emptyCode = EnumTextKeysDemo.WIDGET_SEEINFO();
      infoFirst = true;
      iniSizeWidth = 660;
      iniSizeHeight = 520;
      application.trace("<" + this + " ApplicationWidget> constructed.", 4);
    }
  }
}
