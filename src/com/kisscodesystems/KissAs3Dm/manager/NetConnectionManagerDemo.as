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
 * NetConnectionManagerDemo.
 * The net connection manager of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - the servers of this application stand in the ServerManagerDemo: this one turns an
 *   address of one of them into the url of an rtmp connection and it knows nothing else
 *   of its own, so no name of a machine is written down here at all
 * - those servers stand in one group of the connections, the very machines the http
 *   requests of this application travel on: the connection is opened to the one in use at
 *   the moment, and a failed one is reported to the ServerManager and reopened on the
 *   server it hands out then
 * - these connections carry no client of their own: nothing of this application is called
 *   back on them, so the one of the NetConnectionManager is enough, the one answering the
 *   methods the server calls on the client of a connection by itself
 * - the group follows the ServerManager all along: a server that has just been put in
 *   front of the users is added to it and one that has been taken away is removed, and
 *   the connection is reopened on another machine when the one it stood on is gone
 * - the extenders of this framework put the handling of their own server here
 */
package com.kisscodesystems.KissAs3Dm.manager
{
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.manager.NetConnectionManager;
  public class NetConnectionManagerDemo extends NetConnectionManager
  {
    // the key of the group of the rtmp servers of this application: the ones using it are
    // the classes opening a connection to that application
    public static const CONNECTION_GROUP_KEY:String = "KissAs3Dm";
    // the parts the url of one rtmp connection is built of: the address of the server
    // itself stands between them and it comes from the ServerManagerDemo, and the port and
    // the path are the ones of the rtmp application standing on that machine
    // the scheme is a plain rtmp one on purpose: the runtime does not speak native rtmps
    // at all, it opens an https tunnel instead and the server drops that, so these
    // connections travel on a port of their own, the plain one of the rtmp application
    private static const SERVER_URL_SCHEME:String = "rtmp://";
    private static const SERVER_URL_PORT:String = ":6649";
    private static const SERVER_URL_APP:String = "/kcsops";
    /**
     * Constructs the net connection manager of the KissAs3Dm application.
     * @param applicationRef the main application reference
     */
    public function NetConnectionManagerDemo(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<NetConnectionManagerDemo> called.", 4);
      application.trace("<NetConnectionManagerDemo> applicationRef: " + applicationRef, 3);
      application.trace("<NetConnectionManagerDemo> constructed.", 4);
    }
    /**
     * Builds the group of the rtmp servers of this application: one connection stands for
     * one server the ServerManager holds, and the machine in use there is the default one
     * of the group, the server the connection of this application is opened to. The group
     * is given over to that manager here and it follows it from then on, so this method
     * writes down no server of any kind: it builds the group and hands it over.
     */
    override protected function initializeConnections():void
    {
      application.trace("<NetConnectionManagerDemo initializeConnections> called.", 4);
      super.initializeConnections();
      serverGroupKey = CONNECTION_GROUP_KEY;
      if (addNewConnectionGroup(CONNECTION_GROUP_KEY) == null)
      {
        application.trace("<NetConnectionManagerDemo initializeConnections> the group of the rtmp servers cannot be built!", 6);
        return;
      }
      if (!synchronizeServers())
      {
        application.trace("<NetConnectionManagerDemo initializeConnections> the group of the rtmp servers cannot be filled with the servers of this application!", 6);
        return;
      }
      application.trace("<NetConnectionManagerDemo initializeConnections> the group of the rtmp servers is built.", 4);
      application.trace("<NetConnectionManagerDemo initializeConnections> the server of it in use: " + getDefaultConnectionKey(CONNECTION_GROUP_KEY), 3);
    }
    /**
     * Builds the rtmp connection of one server of this application: the address of that
     * server comes from the ServerManager and this method turns it into the url of an
     * rtmp connection, with the parameters of the connecting, so the settings of a
     * connection of this group stand in this one single place. The connection itself is not
     * opened here: the ones using it are the ones opening it.
     * @param serverKey the name of the machine that server stands on
     * @param serverAddress the address of that server
     */
    override protected function addServerConnection(serverKey:String, serverAddress:String):Boolean
    {
      application.trace("<NetConnectionManagerDemo addServerConnection> called.", 4);
      application.trace("<NetConnectionManagerDemo addServerConnection> serverKey: " + serverKey, 3);
      application.trace("<NetConnectionManagerDemo addServerConnection> serverAddress: " + serverAddress, 3);
      super.addServerConnection(serverKey, serverAddress);
      if (addNewConnection(CONNECTION_GROUP_KEY, serverKey) == null)
      {
        application.trace("<NetConnectionManagerDemo addServerConnection> the connection of the server " + serverKey + " cannot be added!", 6);
        return false;
      }
      setConnectionParam(CONNECTION_GROUP_KEY, serverKey, "url"
        , SERVER_URL_SCHEME + serverAddress + SERVER_URL_PORT + SERVER_URL_APP);
      setConnectionParam(CONNECTION_GROUP_KEY, serverKey, "connectParams"
        , [ application.getPropertiesConfig().getApplicationVersion() ]);
      return true;
    }
  }
}
