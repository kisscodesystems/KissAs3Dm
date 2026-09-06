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
 * EmojiManagerDemo.
 * Handles emojis that can be used on objects when available.
 * This class is generated so can be overwritten from outside.
 */
package com.kisscodesystems.KissAs3Dm.manager
{
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.manager.EmojiManager;
  import com.kisscodesystems.KissAs3Fw.util.VectorDrawings;
  import flash.utils.ByteArray;
  public class EmojiManagerDemo extends EmojiManager
  {
    private var drawingsDemo:VectorDrawings = null;
    private var files:EmojiManagerDemoFiles = new EmojiManagerDemoFiles();
    /**
     * Constructs this manager and loads every resource embedded into it.
     * @param applicationRef the main application reference
     */
    public function EmojiManagerDemo(applicationRef:Application):void
    {
      super(applicationRef);
      emojiNames["demo"] = new Array();
      drawingsDemo = new VectorDrawings(application, new files.emojisClass() as ByteArray);
      pushEmojiNames();
      markEmojiDrawings();
      application.trace("<EmojiManagerDemo> constructed.", 4);
    }
    /**
     * Puts the name of every embedded emoji into the category of it.
     */
    private function pushEmojiNames():void
    {
      emojiNames["demo"].push("demo");
    }
    /**
     * Binds the drawings of this application to the name of every emoji of it.
     */
    private function markEmojiDrawings():void
    {
      emojiDrawings["demo"] = drawingsDemo;
    }
    /**
     * Destroys this object: it frees up the resources embedded into this application
     * and lets the framework free up the ones of its own.
     */
    override public function destroy():void
    {
      application.trace("<EmojiManagerDemo destroy> called.", 4);
      if (drawingsDemo != null)
      {
        drawingsDemo.destroy();
      }
      super.destroy();
      drawingsDemo = null;
      files = null;
    }
  }
}
class EmojiManagerDemoFiles
{
  [Embed(source = "../resource/emoji/emojis.kvg", mimeType = "application/octet-stream")]
  public var emojisClass:Class;
  /**
   * Constructs the embedded resource holder of this manager.
   */
  public function EmojiManagerDemoFiles():void
  {
  }
}
