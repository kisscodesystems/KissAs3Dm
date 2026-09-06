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
 * UrlRequestManagerDemo.
 * The url request manager of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - the servers of this application stand in the ServerManagerDemo: this one turns an
 *   address of one of them into the url of an http connection and it knows nothing else
 *   of its own, so no name of a machine is written down here at all
 * - those servers stand in one group of the connections, and every one of them answers
 *   every request of this application: a request is sent to the machine in use at the
 *   moment, and a failed one is reported to the ServerManager and repeated on the server
 *   it hands out then, so the rtmp connection of this application moves along with it
 * - the group follows the ServerManager all along: a server that has just been put in
 *   front of the users is added to it and one that has been taken away is removed
 * - the addresses this manager hands out are taken from the connection in use, so the
 *   background images of the displaying styles and the api of this application travel on
 *   the very server every other request of it does
 * - the url of the rtmp connections stands in the NetConnectionManagerDemo
 * - the extenders of this framework put the addresses and the answers of their own here
 */
package com.kisscodesystems.KissAs3Dm.manager
{
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.manager.UrlRequestManager;
  import flash.net.URLLoaderDataFormat;
  public class UrlRequestManagerDemo extends UrlRequestManager
  {
    // the key of the group of the http servers of this application: the ones using it are
    // the classes sending a request to that application
    public static const CONNECTION_GROUP_KEY:String = "KissAs3Dm";
    // the parts the url of one http connection is built of: the address of the server
    // itself stands between them and it comes from the ServerManagerDemo
    private static const SERVER_URL_SCHEME:String = "https://";
    private static const SERVER_URL_APP:String = "/kcsops/";
    // the folder of the server the background images of the displaying styles stand in
    private static const SERVER_BACKGROUNDS_FOLDER:String = "backgrounds/";
    /**
     * Constructs the url request manager of the KissAs3Dm application.
     * @param applicationRef the main application reference
     */
    public function UrlRequestManagerDemo(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<UrlRequestManagerDemo> called.", 4);
      application.trace("<UrlRequestManagerDemo> applicationRef: " + applicationRef, 3);
      application.trace("<UrlRequestManagerDemo> constructed.", 4);
    }
    /**
     * Builds the group of the http servers of this application: one connection stands for
     * one server the ServerManager holds, and the machine in use there is the default one
     * of the group, the server every request of this application is sent to. The group is
     * given over to that manager here and it follows it from then on, so this method
     * writes down no server of any kind: it builds the group and hands it over.
     */
    override protected function initializeConnections():void
    {
      application.trace("<UrlRequestManagerDemo initializeConnections> called.", 4);
      super.initializeConnections();
      serverGroupKey = CONNECTION_GROUP_KEY;
      if (addNewConnectionGroup(CONNECTION_GROUP_KEY) == null)
      {
        application.trace("<UrlRequestManagerDemo initializeConnections> the group of the http servers cannot be built!", 6);
        return;
      }
      if (!synchronizeServers())
      {
        application.trace("<UrlRequestManagerDemo initializeConnections> the group of the http servers cannot be filled with the servers of this application!", 6);
        return;
      }
      application.trace("<UrlRequestManagerDemo initializeConnections> the group of the http servers is built.", 4);
      application.trace("<UrlRequestManagerDemo initializeConnections> the server of it in use: " + getDefaultConnectionKey(CONNECTION_GROUP_KEY), 3);
    }
    /**
     * Builds the http connection of one server of this application: the address of that
     * server comes from the ServerManager and this method turns it into the url of an
     * http connection, so the settings of a connection of this group stand in this one
     * single place.
     * @param serverKey the name of the machine that server stands on
     * @param serverAddress the address of that server
     */
    override protected function addServerConnection(serverKey:String, serverAddress:String):Boolean
    {
      application.trace("<UrlRequestManagerDemo addServerConnection> called.", 4);
      application.trace("<UrlRequestManagerDemo addServerConnection> serverKey: " + serverKey, 3);
      application.trace("<UrlRequestManagerDemo addServerConnection> serverAddress: " + serverAddress, 3);
      super.addServerConnection(serverKey, serverAddress);
      if (addNewConnection(CONNECTION_GROUP_KEY, serverKey) == null)
      {
        application.trace("<UrlRequestManagerDemo addServerConnection> the connection of the server " + serverKey + " cannot be added!", 6);
        return false;
      }
      setConnectionParam(CONNECTION_GROUP_KEY, serverKey, "url"
        , SERVER_URL_SCHEME + serverAddress + SERVER_URL_APP);
      // the api of this application answers plain text and no query string of variables
      // at all, so the answers of these servers are read as they arrive
      setConnectionParam(CONNECTION_GROUP_KEY, serverKey, "dataFormat", URLLoaderDataFormat.TEXT);
      return true;
    }
    /**
     * Fills in the addresses of the outside world this application talks to. Both of them
     * are taken from the server this application talks to at the moment, so the background
     * images of the displaying styles and the calls of the api travel on the very server
     * every other request of this application does.
     */
    override protected function initializeUrls():void
    {
      application.trace("<UrlRequestManagerDemo initializeUrls> called.", 4);
      super.initializeUrls();
      const defaultServerUrl:String = "" + getConnectionParam(CONNECTION_GROUP_KEY
        , getDefaultConnectionKey(CONNECTION_GROUP_KEY), "url");
      urlCustom = defaultServerUrl;
      application.trace("<UrlRequestManagerDemo initializeUrls> urlCustom: " + urlCustom, 3);
      urlBackgrounds = defaultServerUrl + SERVER_BACKGROUNDS_FOLDER;
      application.trace("<UrlRequestManagerDemo initializeUrls> urlBackgrounds: " + urlBackgrounds, 3);
    }
  }
}
