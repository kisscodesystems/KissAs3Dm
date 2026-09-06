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
 * UrlRequestWidget.
 * The widget of the UrlRequest manager of the framework.
 *
 * MAIN FEATURES:
 * - the manager of the http communication of the application: it sends every message
 *   that goes out to a server over https and it hands back every answer coming from there
 * - the button of this widget sends one single GET request to the apiworks address of the
 *   connection group of this application and displays the answer that comes back
 * - that request travels on the server of the group standing in use at the moment, and
 *   the manager repeats it on another server of that group silently when it fails: the
 *   answer arrives either way, so this widget only ever sees one single request
 * - the server that has answered stands in a row of its own: that is where the repeating
 *   of a request is seen, because the server of the group changes with it
 * - the answer of that address is plain text and no query string of variables at all, and
 *   that is the setting of the very connections it comes from, so nothing of it is left
 *   for this widget to do
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Dm.manager.UrlRequestManagerDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.net.URLRequestMethod;
  public class UrlRequestWidget extends WebWidget
  {
    // the uri of the api of the servers of this application, the one the request is sent to
    private var apiUri:String = "apiworks";
    // the label of the server of the group the last request has travelled on, the second
    // row of the content
    private var serverVAL:TextLabel = null;
    /**
     * Constructs the widget of the UrlRequest manager.
     * @param applicationRef the main application reference
     */
    public function UrlRequestWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " UrlRequestWidget> called.", 4);
      application.trace("<" + this + " UrlRequestWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.URLREQUEST();
      headerIcon = EnumIcons.refresharrow();
      infoCode = EnumTextKeysDemo.WIDGETINFO_URLREQUEST();
      descriptionCode = EnumTextKeysDemo.WIDGET_WEB_DESC_URLREQUEST();
      actionCode = EnumTextKeysDemo.WIDGET_ACTION_SEND_REQUEST();
      iniSizeWidth = 900;
      // this widget stands fifty pixels taller than the rows every one of these widgets
      // has: it carries the row of the server of its connection group on top of them
      iniSizeHeight = 790;
      application.trace("<" + this + " UrlRequestWidget> constructed.", 4);
    }
    /**
     * Builds the row of this widget: the server of the connection group the requests of it
     * travel on, which stands under the description and above the button of the request.
     */
    override protected function createOwnElements():void
    {
      application.trace("<" + this + " UrlRequestWidget createOwnElements> called.", 4);
      super.createOwnElements();
      serverVAL = createRowLabel();
      displayServer();
    }
    /**
     * Sends the request of this widget: one single GET request to the api of this
     * application, on the connection group of it. The manager sends that request to the
     * server standing in use at the moment and it repeats it on another server of that
     * group when it fails, so a request that can not even be started is the only failure
     * this widget has to report by itself.
     */
    override protected function startRequest():void
    {
      application.trace("<" + this + " UrlRequestWidget startRequest> called.", 4);
      super.startRequest();
      if (!application.getUrlRequestManager().loadByConnectionGroup(
          UrlRequestManagerDemo.CONNECTION_GROUP_KEY, apiUri
        , URLRequestMethod.GET, null, urlAnswer))
      {
        application.trace("<" + this + " UrlRequestWidget startRequest> the request could not be started!", 6);
        finishRequest(EnumTextKeysDemo.WIDGET_WEB_FAILED());
      }
    }
    /**
     * Displays the answer of the server and the server that has answered: that one may
     * well be the other one of the group, because a request that has failed is repeated
     * on another server of it.
     * @param answer the answer of the server, or the telling of the failure of the request
     */
    override protected function finishRequest(answer:String):void
    {
      application.trace("<" + this + " UrlRequestWidget finishRequest> called.", 4);
      application.trace("<" + this + " UrlRequestWidget finishRequest> answer: " + answer, 3);
      super.finishRequest(answer);
      displayServer();
    }
    /**
     * Returns the code snippet of the request of this widget: the lines sending it on the
     * connection group of this application and the handler taking the answer of it.
     */
    override protected function getCode():String
    {
      application.trace("<" + this + " UrlRequestWidget getCode> called.", 4);
      return "import com.kisscodesystems.KissAs3Dm.manager.UrlRequestManagerDemo;\n"
        + "import flash.net.URLRequestMethod;\n"
        + "\n"
        + "application.getUrlRequestManager().loadByConnectionGroup(\n"
        + "    UrlRequestManagerDemo.CONNECTION_GROUP_KEY, \"" + apiUri + "\"\n"
        + "  , URLRequestMethod.GET, null, urlAnswer);\n"
        + "\n"
        + "private function urlAnswer(answer:Object):void\n"
        + "{\n"
        + "  if (answer == null)\n"
        + "  {\n"
        + "    trace(\"every server of the group has failed with this request\");\n"
        + "    return;\n"
        + "  }\n"
        + "  trace(\"the answer of the server: \" + answer);\n"
        + "}\n";
    }
    /**
     * Displays the answer of the api. The manager hands over a null answer when every
     * server of the group has failed with this request: that is the one failure of it the
     * one using this application ever gets to see.
     * @param answer the answer of the api, or null when the request could not be sent at all
     */
    private function urlAnswer(answer:Object):void
    {
      application.trace("<" + this + " UrlRequestWidget urlAnswer> called.", 4);
      application.trace("<" + this + " UrlRequestWidget urlAnswer> answer: " + answer, 3);
      if (answer == null)
      {
        application.trace("<" + this + " UrlRequestWidget urlAnswer> every server of the group has failed with this request!", 6);
        finishRequest(EnumTextKeysDemo.WIDGET_WEB_FAILED());
        return;
      }
      finishRequest("" + answer);
    }
    /**
     * Displays the server of the connection group the requests of this widget are sent to
     * at the moment: the key of a connection of that group is the name of the machine the
     * server of it stands on.
     */
    private function displayServer():void
    {
      application.trace("<" + this + " UrlRequestWidget displayServer> called.", 4);
      const connectionKey:String = application.getUrlRequestManager().getDefaultConnectionKey(
        UrlRequestManagerDemo.CONNECTION_GROUP_KEY);
      application.trace("<" + this + " UrlRequestWidget displayServer> connectionKey: " + connectionKey, 3);
      serverVAL.setLabel(EnumTextKeysDemo.WIDGET_WEB_SERVER() + " "
        + (connectionKey == "" ? EnumTextKeysDemo.WIDGET_VALUE_NONE() : connectionKey));
    }
    /**
     * Destroys this object and frees up everything. The connections of the group stand in
     * the manager and they outlive this widget, so the answer handler of them is the one
     * thing to be taken away here: an answer arriving after this moment would reach a
     * widget that has been torn down already.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " UrlRequestWidget destroy> called.", 4);
      application.trace("<" + this + " UrlRequestWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      application.getUrlRequestManager().setConnectionGroupHandler(
        UrlRequestManagerDemo.CONNECTION_GROUP_KEY, null);
      application.trace("<" + this + " UrlRequestWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " UrlRequestWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " UrlRequestWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      apiUri = null;
      serverVAL = null;
    }
  }
}
