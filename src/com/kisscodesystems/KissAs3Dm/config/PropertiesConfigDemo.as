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
 * PropertiesConfigDemo.
 * The properties config of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - it only binds the configuration xml of this application to the framework config
 * - the values themselves are in resource/config/KissAs3DmPropertiesConfig.xml
 * - those values are applied on top of the framework ones, so every key that is
 *   missing from that xml keeps the value the framework gives it
 */
package com.kisscodesystems.KissAs3Dm.config
{
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.config.PropertiesConfig;
  import flash.utils.ByteArray;
  public class PropertiesConfigDemo extends PropertiesConfig
  {
    [Embed(source = "../resource/config/KissAs3DmPropertiesConfig.xml", mimeType = "application/octet-stream")]
    private var EmbeddedDemoConfig:Class;
    private var embeddedDemoConfigByteArray:ByteArray = new EmbeddedDemoConfig() as ByteArray;
    /**
     * Constructs the properties config of the KissAs3Dm application.
     * @param applicationRef the main application reference
     */
    public function PropertiesConfigDemo(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " PropertiesConfigDemo> called.", 4);
      application.trace("<" + this + " PropertiesConfigDemo> applicationRef: " + applicationRef, 3);
      application.trace("<" + this + " PropertiesConfigDemo> constructed.", 4);
    }
    /**
     * Applies the configuration xml of this application on top of the framework one.
     */
    override protected function readValuesFromConfigXml():void
    {
      application.trace("<" + this + " PropertiesConfigDemo readValuesFromConfigXml> called.", 4);
      super.readValuesFromConfigXml();
      applyConfigXml(embeddedDemoConfigByteArray.toString());
      embeddedDemoConfigByteArray.clear();
      embeddedDemoConfigByteArray = null;
    }
    /**
     * Destroys this object: it drops the configuration xml embedded into this application
     * and lets the framework free up the values of its own.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " PropertiesConfigDemo destroy> called.", 4);
      if (embeddedDemoConfigByteArray != null)
      {
        embeddedDemoConfigByteArray.clear();
      }
      super.destroy();
      embeddedDemoConfigByteArray = null;
      EmbeddedDemoConfig = null;
    }
  }
}
