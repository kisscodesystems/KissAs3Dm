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
 * DemoWidget.
 * The common base of every widget of the KissAs3Dm application: one widget belongs
 * to one component of the framework and it demonstrates that one component.
 *
 * MAIN FEATURES:
 * - the extenders of this class only tell what they are: the header, the header icon,
 *   the info text, the sentence of the empty content, the content that is displayed
 *   first and the initialization dimensions of the widget they build
 * - everything else is done here: the type, the one single content, the info text of
 *   the header and the label standing in the middle of that content
 * - the widgets that hold no elements at all are the ones changing that sentence: they
 *   are demonstrated by the very objects the elements would stand in, so the whole
 *   description of them is the info text of the header, and that text is the one they
 *   are opened with
 * - createElements is the hook the extenders build the elements of their own in, and
 *   the label of the empty widget has to be dropped by the first one of them
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumTextKeys;
  import com.kisscodesystems.KissAs3Fw.ui.Widget;
  public class DemoWidget extends Widget
  {
    // the header of this widget, an EnumWidgetsDemo value: the widget manager finds
    // this widget by this very string when a menu item is picked
    protected var headerCode:String = EnumTextKeys.WIDGET_HEADER_GENERAL();
    // the icon standing in front of the header, an empty one means no icon at all
    protected var headerIcon:String = "";
    // the text key of the info text the info button of the header displays
    protected var infoCode:String = "";
    // The text key of the label standing in the middle of the content of this widget.
    // The widgets holding no elements at all keep that label and tell here what has to
    // stand in the place of the elements.
    protected var emptyCode:String = EnumTextKeysDemo.WIDGET_EMPTY();
    // The widgets holding no elements at all are described by the info text of their
    // header, so they are opened with that text displayed instead of their content.
    protected var infoFirst:Boolean = false;
    // the index of the one and only content of this widget
    protected var indexBasic:int = -1;
    /**
     * Constructs the widget. Every extender of this class sets the header, the header
     * icon, the info text, the sentence of the empty content, the content to be
     * displayed first and the initialization dimensions of its own right here.
     * @param applicationRef the main application reference
     */
    public function DemoWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " DemoWidget> called.", 4);
      application.trace("<" + this + " DemoWidget> applicationRef: " + applicationRef, 3);
      application.trace("<" + this + " DemoWidget> constructed.", 4);
    }
    /**
     * Builds this widget when it reaches the stage. This widget may reach the stage
     * more than once, so everything below is built only once.
     */
    override protected function onCreate():void
    {
      application.trace("<" + this + " DemoWidget onCreate> called.", 4);
      super.onCreate();
      if (loaded)
      {
        application.trace("<" + this + " DemoWidget onCreate> this widget is already built.", 3);
        return;
      }
      loaded = true;
      setWidgetType(EnumTextKeys.WIDGET_TYPE_GENERAL());
      setWidgetHeaderCode(headerCode);
      setWidgetHeaderIcon(headerIcon);
      indexBasic = addContent(EnumTextKeysDemo.WIDGET_TAB_BASIC());
      if (indexBasic > -1)
      {
        setElementsFix(indexBasic, 0);
        setActiveContent(indexBasic);
      }
      else
      {
        application.trace("<" + this + " DemoWidget onCreate> the content of this widget could not be built!", 6);
      }
      setInfoContent(infoCode);
      setInfoTextLabel(emptyCode);
      createElements();
      // this comes last: the info content is displayed instead of a content that stands
      // ready, so every element of that content has to be built before the swap
      if (infoFirst)
      {
        setInfoContentVisible(true);
      }
    }
    /**
     * Builds the elements of this widget. Every extender of this class overrides this
     * and adds the elements of its own into the content of the index above. The label
     * of the empty widget has to be dropped there by the removeInfoTextLabel.
     */
    protected function createElements():void
    {
      application.trace("<" + this + " DemoWidget createElements> called.", 4);
      application.trace("<" + this + " DemoWidget createElements> the extenders of this class build their elements here.", 3);
    }
    /**
     * Destroys this object and frees up everything.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " DemoWidget destroy> called.", 4);
      application.trace("<" + this + " DemoWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " DemoWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " DemoWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " DemoWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      headerCode = null;
      headerIcon = null;
      infoCode = null;
      emptyCode = null;
      infoFirst = false;
      indexBasic = -1;
    }
  }
}
