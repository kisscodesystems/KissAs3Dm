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
 * ContentMultipleWidget.
 * The widget of the ContentMultiple component of the framework.
 *
 * MAIN FEATURES:
 * - several single contents behind one button bar, one of them is the active one
 * - this widget builds no elements at all: the content of it is one of these very
 *   objects, so the whole description of them is the info text of the header
 * - so it is opened with that info text, and the content standing behind it carries
 *   the sentence pointing at that very text
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  public class ContentMultipleWidget extends DemoWidget
  {
    /**
     * Constructs the widget of the ContentMultiple component.
     * @param applicationRef the main application reference
     */
    public function ContentMultipleWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " ContentMultipleWidget> called.", 4);
      application.trace("<" + this + " ContentMultipleWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.CONTENTMULTIPLE();
      headerIcon = EnumIconsDemo.contentmultiple();
      infoCode = EnumTextKeysDemo.WIDGETINFO_CONTENTMULTIPLE();
      emptyCode = EnumTextKeysDemo.WIDGET_SEEINFO();
      infoFirst = true;
      iniSizeWidth = 620;
      iniSizeHeight = 480;
      application.trace("<" + this + " ContentMultipleWidget> constructed.", 4);
    }
  }
}
