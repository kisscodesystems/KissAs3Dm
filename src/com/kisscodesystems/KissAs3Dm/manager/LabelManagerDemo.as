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
 * LabelManagerDemo.
 * The label manager of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - it binds the label xml of this application to the label manager of the framework
 * - the labels themselves are in resource/label/KissAs3DmLabels.xml
 * - those labels are added to the ones of the framework, so every key of the framework
 *   stays reachable as well
 * - it offers the displaying styles of this application as well: the framework offers
 *   the default one alone, and setKeyArraysToDefault answers the styles of this
 *   application after it, so that the panel of the settings displays every one of them
 */
package com.kisscodesystems.KissAs3Dm.manager
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumDisplayingStylesDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.manager.LabelManager;
  import flash.utils.ByteArray;
  public class LabelManagerDemo extends LabelManager
  {
    [Embed(source = "../resource/label/KissAs3DmLabels.xml", mimeType = "application/octet-stream")]
    private var EmbeddedLabels:Class;
    private var embeddedLabelsByteArray:ByteArray = new EmbeddedLabels() as ByteArray;
    private var xmlLabels:XML = null;
    /**
     * Constructs the label manager of the KissAs3Dm application.
     * @param applicationRef the main application reference
     */
    public function LabelManagerDemo(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " LabelManagerDemo> called.", 4);
      application.trace("<" + this + " LabelManagerDemo> applicationRef: " + applicationRef, 3);
      parseLabels();
      application.trace("<" + this + " LabelManagerDemo> constructed.", 4);
    }
    /**
     * Offers the displaying styles of this application on top of the default one of the
     * framework. The panel of the settings displays the styles this answers, and the
     * dynamics config of this application describes those very styles, so the two of
     * them are both built from EnumDisplayingStylesDemo.getEveryDisplayingStyle.
     */
    override protected function setKeyArraysToDefault():void
    {
      application.trace("<" + this + " LabelManagerDemo setKeyArraysToDefault> called.", 4);
      super.setKeyArraysToDefault();
      keysDisplayingStyles = EnumDisplayingStylesDemo.getEveryDisplayingStyle();
    }
    /**
     * Adds the labels of this application to the ones of the framework.
     */
    private function parseLabels():void
    {
      application.trace("<" + this + " LabelManagerDemo parseLabels> called.", 4);
      try
      {
        xmlLabels = new XML(embeddedLabelsByteArray.toString());
        getLabelsFromXml(xmlLabels);
      }
      catch (e:*)
      {
        application.trace("<" + this + " LabelManagerDemo parseLabels> unable to parse the label xml: " + e, 7);
      }
    }
    /**
     * Destroys this object and frees up everything.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " LabelManagerDemo destroy> called.", 4);
      application.trace("<" + this + " LabelManagerDemo destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.trace("<" + this + " LabelManagerDemo destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      if (embeddedLabelsByteArray != null)
      {
        embeddedLabelsByteArray.clear();
      }
      application.trace("<" + this + " LabelManagerDemo destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " LabelManagerDemo destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      embeddedLabelsByteArray = null;
      xmlLabels = null;
    }
  }
}
