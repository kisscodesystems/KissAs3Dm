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
 * WidgetWidget.
 * The widget of the Widget component of the framework.
 *
 * MAIN FEATURES:
 * - a window of the application that can be moved, resized, minimized and closed, and
 *   that holds one single or several contents with the elements of the application in it
 * - this is the one component of the ui package that is demonstrated by every widget of
 *   this application at the same time: every one of them is built of it, and the contents
 *   of them are the single and the multiple content of the framework
 * - this widget builds no elements at all: it is the very component demonstrated here,
 *   so the whole description of that component is the info text of the header
 * - so it is opened with that info text, and the content standing behind it carries
 *   the sentence pointing at that very text
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  public class WidgetWidget extends DemoWidget
  {
    /**
     * Constructs the widget of the Widget component.
     * @param applicationRef the main application reference
     */
    public function WidgetWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " WidgetWidget> called.", 4);
      application.trace("<" + this + " WidgetWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.WIDGET();
      headerIcon = EnumIconsDemo.widget();
      infoCode = EnumTextKeysDemo.WIDGETINFO_WIDGET();
      emptyCode = EnumTextKeysDemo.WIDGET_SEEINFO();
      infoFirst = true;
      iniSizeWidth = 620;
      iniSizeHeight = 480;
      application.trace("<" + this + " WidgetWidget> constructed.", 4);
    }
  }
}
