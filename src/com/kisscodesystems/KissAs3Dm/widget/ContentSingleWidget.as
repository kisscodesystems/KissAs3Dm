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
 * ContentSingleWidget.
 * The widget of the ContentSingle component of the framework.
 *
 * MAIN FEATURES:
 * - one scrollable area, the elements of it stand in rows or in columns
 * - this widget builds no elements at all: the content of it is one of the very objects
 *   demonstrated here, so the whole description of them is the info text of the header
 * - so it is opened with that info text, and the content standing behind it carries
 *   the sentence pointing at that very text
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  public class ContentSingleWidget extends DemoWidget
  {
    /**
     * Constructs the widget of the ContentSingle component.
     * @param applicationRef the main application reference
     */
    public function ContentSingleWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ContentSingleWidget> called.", 4);
      application.trace("<" + this + " ContentSingleWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.CONTENTSINGLE();
      headerIcon = EnumIconsDemo.contentsingle();
      infoCode = EnumTextKeysDemo.WIDGETINFO_CONTENTSINGLE();
      emptyCode = EnumTextKeysDemo.WIDGET_SEEINFO();
      infoFirst = true;
      iniSizeWidth = 620;
      iniSizeHeight = 480;
      application.trace("<" + this + " ContentSingleWidget> constructed.", 4);
    }
  }
}
