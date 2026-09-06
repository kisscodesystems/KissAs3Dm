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
 * NetConnectionWidget.
 * The widget of the NetConnection manager of the framework.
 *
 * MAIN FEATURES:
 * - the manager of the rtmp communication of the application: it opens the socket
 *   connections staying alive and it calls the methods of the server on them
 * - the connection of this widget is the one of the connection group of this application:
 *   it is opened once, while this widget is being built, and it is closed again when this
 *   widget is closed
 * - one server of that group carries that connection at a time, and the manager opens
 *   another one of them silently when it fails: the state of the connection and the
 *   server carrying it stand in two rows of their own, so that failing over is seen
 * - the button of this widget calls one method of the server on that connection, as many
 *   times as it is pressed
 * - that button is switched on by the very connection: it can not be pressed while
 *   there is no connection at all to call anything on
 */
package com.kisscodesystems.KissAs3Dm.widget
{
  import com.kisscodesystems.KissAs3Dm.enum.EnumTextKeysDemo;
  import com.kisscodesystems.KissAs3Dm.enum.EnumWidgetsDemo;
  import com.kisscodesystems.KissAs3Dm.manager.NetConnectionManagerDemo;
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.enum.EnumIcons;
  import com.kisscodesystems.KissAs3Fw.ui.TextLabel;
  import flash.events.Event;
  import flash.events.NetStatusEvent;
  public class NetConnectionWidget extends WebWidget
  {
    // the name of the method of the server this widget calls
    private var callName:String = "callAppWorks";
    // the label of the state of the connection of the group, the second row of the content
    private var stateVAL:TextLabel = null;
    // the label of the server of the group carrying that connection, the third row of it
    private var serverVAL:TextLabel = null;
    // the last status the connection has reported, an empty one before the first of them
    private var lastStatusCode:String = "";
    /**
     * Constructs the widget of the NetConnection manager.
     * @param applicationRef the main application reference
     */
    public function NetConnectionWidget(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<" + this + " NetConnectionWidget> called.", 4);
      application.trace("<" + this + " NetConnectionWidget> applicationRef: " + applicationRef, 3);
      headerCode = EnumWidgetsDemo.NETCONNECTION();
      headerIcon = EnumIcons.lightning();
      infoCode = EnumTextKeysDemo.WIDGETINFO_NETCONNECTION();
      descriptionCode = EnumTextKeysDemo.WIDGET_WEB_DESC_NETCONNECTION();
      actionCode = EnumTextKeysDemo.WIDGET_ACTION_CALL_METHOD();
      iniSizeWidth = 900;
      // this widget stands a hundred pixels taller than the http one: it carries the rows
      // of the state of its connection and of the server of it on top of the rows every
      // one of these widgets has
      iniSizeHeight = 830;
      application.trace("<" + this + " NetConnectionWidget> constructed.", 4);
    }
    /**
     * Builds the elements of this widget and opens the connection of it afterwards: the
     * button of the call is the one being switched on by that connection, so it has to
     * stand ready before the first status of it can arrive.
     */
    override protected function createElements():void
    {
      application.trace("<" + this + " NetConnectionWidget createElements> called.", 4);
      super.createElements();
      openConnection();
    }
    /**
     * Builds the rows of this widget: the state of the connection of the group and the
     * server carrying it, which stand under the description and above the button of the
     * call.
     */
    override protected function createOwnElements():void
    {
      application.trace("<" + this + " NetConnectionWidget createOwnElements> called.", 4);
      super.createOwnElements();
      stateVAL = createRowLabel();
      stateVAL.setLabel(EnumTextKeysDemo.WIDGET_WEB_STATE() + " "
        + EnumTextKeysDemo.WIDGET_WEB_CONNECTING());
      serverVAL = createRowLabel();
      displayServer();
    }
    /**
     * Calls the method of the server on the connection of the group. A call that can not
     * even be started is reported right away: the answer of it would never arrive. The
     * server takes two parameters, the version of this application and the one using it.
     */
    override protected function startRequest():void
    {
      application.trace("<" + this + " NetConnectionWidget startRequest> called.", 4);
      super.startRequest();
      if (!application.getNetConnectionManager().callByConnectionGroup(
          NetConnectionManagerDemo.CONNECTION_GROUP_KEY, callName, netCallBack
        , application.getPropertiesConfig().getApplicationVersion()
        , application.getUser().getUsername()))
      {
        application.trace("<" + this + " NetConnectionWidget startRequest> the call could not be started!", 6);
        finishRequest(EnumTextKeysDemo.WIDGET_WEB_FAILED());
      }
    }
    /**
     * Displays the answer of the server and looks at the connection once more: it may well
     * be gone by the time that answer has arrived, and then there is nothing left to call
     * the method on.
     * @param answer the answer of the server, or the telling of the failure of the call
     */
    override protected function finishRequest(answer:String):void
    {
      application.trace("<" + this + " NetConnectionWidget finishRequest> called.", 4);
      application.trace("<" + this + " NetConnectionWidget finishRequest> answer: " + answer, 3);
      super.finishRequest(answer);
      displayState();
    }
    /**
     * Returns the code snippet of the connection of this widget: the lines opening the
     * connection of the group, calling the method of the server on it and closing it, and
     * the three handlers of the state of it, of the failure of it and of the answer that
     * arrives.
     */
    override protected function getCode():String
    {
      application.trace("<" + this + " NetConnectionWidget getCode> called.", 4);
      return "import com.kisscodesystems.KissAs3Dm.manager.NetConnectionManagerDemo;\n"
        + "import flash.events.Event;\n"
        + "import flash.events.NetStatusEvent;\n"
        + "\n"
        + "application.getNetConnectionManager().setConnectionGroupHandlers(\n"
        + "  NetConnectionManagerDemo.CONNECTION_GROUP_KEY, netStatus, netError);\n"
        + "application.getNetConnectionManager().connectByConnectionGroup(\n"
        + "  NetConnectionManagerDemo.CONNECTION_GROUP_KEY);\n"
        + "\n"
        + "application.getNetConnectionManager().callByConnectionGroup(\n"
        + "    NetConnectionManagerDemo.CONNECTION_GROUP_KEY, \"" + callName + "\"\n"
        + "  , netCallBack, application.getPropertiesConfig().getApplicationVersion()\n"
        + "  , application.getUser().getUsername());\n"
        + "\n"
        + "application.getNetConnectionManager().closeEveryConnections(\n"
        + "  NetConnectionManagerDemo.CONNECTION_GROUP_KEY);\n"
        + "application.getNetConnectionManager().setConnectionGroupHandlers(\n"
        + "  NetConnectionManagerDemo.CONNECTION_GROUP_KEY, null, null);\n"
        + "\n"
        + "private function netStatus(e:NetStatusEvent):void\n"
        + "{\n"
        + "  if (e.info != null)\n"
        + "  {\n"
        + "    trace(\"the state of the connection: \" + e.info.code);\n"
        + "  }\n"
        + "}\n"
        + "\n"
        + "private function netError(e:Event):void\n"
        + "{\n"
        + "  trace(\"the connection has failed: \" + e.type);\n"
        + "}\n"
        + "\n"
        + "private function netCallBack(resultObject:Object):void\n"
        + "{\n"
        + "  trace(\"the answer of the server: \" + resultObject);\n"
        + "}\n";
    }
    /**
     * Opens the connection of this widget: the two handlers below are set on every
     * connection of the group first, because the manager opens another server of it by
     * itself when the one it starts with fails, and then it opens the connection to one of
     * those servers. The client object and the parameters of the connecting are the
     * settings of that group, so they stand in the manager of it.
     */
    private function openConnection():void
    {
      application.trace("<" + this + " NetConnectionWidget openConnection> called.", 4);
      application.getNetConnectionManager().setConnectionGroupHandlers(
        NetConnectionManagerDemo.CONNECTION_GROUP_KEY, netStatus, netError);
      if (!application.getNetConnectionManager().connectByConnectionGroup(
        NetConnectionManagerDemo.CONNECTION_GROUP_KEY))
      {
        application.trace("<" + this + " NetConnectionWidget openConnection> the connection could not be built!", 6);
      }
      displayState();
    }
    /**
     * Closes the connection of this widget: the manager closes every connection of the
     * group and then the two handlers below are taken away from them, so nothing of this
     * widget can be reached on them any more.
     */
    private function closeConnection():void
    {
      application.trace("<" + this + " NetConnectionWidget closeConnection> called.", 4);
      application.getNetConnectionManager().closeEveryConnections(
        NetConnectionManagerDemo.CONNECTION_GROUP_KEY);
      application.getNetConnectionManager().setConnectionGroupHandlers(
        NetConnectionManagerDemo.CONNECTION_GROUP_KEY, null, null);
    }
    /**
     * Displays the state of the connection and switches the button of the call by it: that
     * method can only be called while there is a connection standing open, and while there
     * is no call of it on its way already. The server carrying that connection is displayed
     * as well: the manager may have opened another one of the group in the meantime.
     */
    private function displayState():void
    {
      application.trace("<" + this + " NetConnectionWidget displayState> called.", 4);
      const connected:Boolean = application.getNetConnectionManager().isConnectionGroupConnected(
        NetConnectionManagerDemo.CONNECTION_GROUP_KEY);
      application.trace("<" + this + " NetConnectionWidget displayState> connected: " + connected, 3);
      stateVAL.setLabel(EnumTextKeysDemo.WIDGET_WEB_STATE() + " "
        + (connected ? EnumTextKeysDemo.WIDGET_WEB_CONNECTED() : EnumTextKeysDemo.WIDGET_WEB_NOTCONNECTED())
        + (lastStatusCode == "" ? "" : " (" + lastStatusCode + ")"));
      actionOBJ.setEnabled(connected && !requestPending);
      displayServer();
    }
    /**
     * Displays the server of the connection group carrying the connection at the moment:
     * the key of a connection of that group is the name of the machine the server of it
     * stands on.
     */
    private function displayServer():void
    {
      application.trace("<" + this + " NetConnectionWidget displayServer> called.", 4);
      const connectionKey:String = application.getNetConnectionManager().getDefaultConnectionKey(
        NetConnectionManagerDemo.CONNECTION_GROUP_KEY);
      application.trace("<" + this + " NetConnectionWidget displayServer> connectionKey: " + connectionKey, 3);
      serverVAL.setLabel(EnumTextKeysDemo.WIDGET_WEB_SERVER() + " "
        + (connectionKey == "" ? EnumTextKeysDemo.WIDGET_VALUE_NONE() : connectionKey));
    }
    /**
     * Displays the state of the connection every time it reports a new one: that is how
     * the connecting, the standing connection and the losing of it are seen.
     * @param e the net status event of that connection
     */
    private function netStatus(e:NetStatusEvent):void
    {
      application.trace("<" + this + " NetConnectionWidget netStatus> called.", 4);
      application.trace("<" + this + " NetConnectionWidget netStatus> e: " + e, 3);
      if (e.info != null)
      {
        lastStatusCode = "" + e.info.code;
      }
      displayState();
    }
    /**
     * Displays the failure of the connection: the answer of a call that was on its way at
     * that moment is never going to arrive, so that call is closed here as well.
     * @param e the async error, io error or security error event of that connection
     */
    private function netError(e:Event):void
    {
      application.trace("<" + this + " NetConnectionWidget netError> called.", 4);
      application.trace("<" + this + " NetConnectionWidget netError> e: " + e, 3);
      lastStatusCode = e.type;
      if (requestPending)
      {
        finishRequest(EnumTextKeysDemo.WIDGET_WEB_FAILED() + " " + e.type);
        return;
      }
      displayState();
    }
    /**
     * Displays the answer the method of the server has sent back.
     * @param resultObject the answer of that method
     */
    private function netCallBack(resultObject:Object):void
    {
      application.trace("<" + this + " NetConnectionWidget netCallBack> called.", 4);
      application.trace("<" + this + " NetConnectionWidget netCallBack> resultObject: " + resultObject, 3);
      finishRequest("" + resultObject);
    }
    /**
     * Destroys this object and frees up everything. The connections of the group stand in
     * the manager and they outlive this widget, so the closing of them and the taking away
     * of the handlers of this widget is the very first thing to be done here.
     */
    override public function destroy():void
    {
      application.trace("<" + this + " NetConnectionWidget destroy> called.", 4);
      application.trace("<" + this + " NetConnectionWidget destroy> 1: unregister every event listener added to a dispatcher other than local_var.getBaseEventDispatcher().", 3);
      closeConnection();
      application.trace("<" + this + " NetConnectionWidget destroy> 2: stopImmediatePropagation, bitmapData.dispose(), array.splice(0), etc.", 3);
      application.trace("<" + this + " NetConnectionWidget destroy> 3: calling the super destroy.", 3);
      // the step 4 is logged before the super destroy on purpose: that one clears the
      // application reference of this object, so nothing can be traced after it
      application.trace("<" + this + " NetConnectionWidget destroy> 4: every reference and value should be reset to null, 0 or false.", 3);
      super.destroy();
      callName = null;
      stateVAL = null;
      serverVAL = null;
      lastStatusCode = null;
    }
  }
}
