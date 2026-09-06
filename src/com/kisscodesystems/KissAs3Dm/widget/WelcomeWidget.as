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
 * WelcomeWidget.
 * The widget this application is opened with.
 *
 * MAIN FEATURES:
 * - every other widget of this application belongs to one component of the framework,
 *   this one belongs to the application itself: it is the very first item of the menu
 *   and the widget this application opens for itself when it is started
 * - it tells the one using this application what can be read in it: the description of
 *   every single component and the one of the application standing above them
 * - this widget builds no elements at all: that whole telling is the info text of the
 *   header, so it is opened with that text instead of its own content
 * - the content carries the sentence pointing at that info text
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumIconsDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  public class WelcomeWidget extends DemoWidget
  {
    /**
     * Constructs the widget this application is opened with.
     * @param applicationRef the main application reference
     */
    public function WelcomeWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " WelcomeWidget> called.", 4);
      application.trace("<" + this + " WelcomeWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.WELCOME();
      headerIcon = EnumIconsDemo.componentusage();
      infoCode = EnumTextKeysDemo.WIDGETINFO_WELCOME();
      emptyCode = EnumTextKeysDemo.WIDGET_SEEINFO();
      infoFirst = true;
      iniSizeWidth = 700;
      iniSizeHeight = 550;
      application.trace("<" + this + " WelcomeWidget> constructed.", 4);
    }
  }
}
