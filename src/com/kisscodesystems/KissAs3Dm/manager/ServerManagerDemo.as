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
 * ServerManagerDemo.
 * The server manager of the KissAs3Dm application.
 *
 * MAIN FEATURES:
 * - it carries the servers of this application and it is the one single place they are
 *   written down in: app1 and app2, the two machines every connection of this
 *   application is opened to
 * - the managers talking to those servers know the addresses of them from here, so the
 *   http requests and the rtmp connection travel on the very same machine and no name of
 *   a server is written down twice
 * - how an address is turned into a url is the business of those managers: the scheme,
 *   the port and the path of one belong to the kind of connection it stands for
 * - the api answering the servers carrying this application at the moment is the
 *   apiactiveservers of the very same servers, so a machine that is put in front of the
 *   users appears here by itself and one that is taken away disappears
 * - the extenders of this framework put the servers of their own here
 */
package com.kisscodesystems.KissAs3Dm.manager
{
  import com.kisscodesystems.KissAs3Fw.Application;
  import com.kisscodesystems.KissAs3Fw.manager.ServerManager;
  public class ServerManagerDemo extends ServerManager
  {
    // the number of the servers of this application and the parts their addresses are
    // built of: the name of a machine is the key it is known by, so app1 and app2 are the
    // two servers of this application
    private static const SERVER_COUNT:int = 2;
    private static const SERVER_PREFIX:String = "app";
    // the environment of those servers: the production one carries no name at all, the
    // test one is reached by putting "-tst" here
    private static const SERVER_ENV:String = "";
    private static const SERVER_DOMAIN:String = ".kisscodesystems.com";
    // the uri of the api answering the addresses of the servers carrying this application
    // at the moment: this manager asks it every now and then and it follows the answer
    private static const ACTIVE_SERVERS_URI:String = "apiactiveservers";
    /**
     * Constructs the server manager of the KissAs3Dm application.
     * @param applicationRef the main application reference
     */
    public function ServerManagerDemo(applicationRef:Application):void
    {
      super(applicationRef);
      application.trace("<ServerManagerDemo> called.", 4);
      application.trace("<ServerManagerDemo> applicationRef: " + applicationRef, 3);
      application.trace("<ServerManagerDemo> constructed.", 4);
    }
    /**
     * Fills in the servers this application is built with, app1 and app2: every one of
     * them carries the very same application, so any one of them is as good as the other
     * one, and the framework picks the machine to start on at random. The api answering
     * the ones carrying this application at the moment is set here as well, and that is
     * what makes this manager follow the servers of it from now on.
     */
    override protected function initializeServers():void
    {
      application.trace("<ServerManagerDemo initializeServers> called.", 4);
      super.initializeServers();
      activeServersUri = ACTIVE_SERVERS_URI;
      for (var i:int = 1; i <= SERVER_COUNT; i++)
      {
        var serverKey:String = SERVER_PREFIX + i + SERVER_ENV;
        if (!addServer(serverKey, serverKey + SERVER_DOMAIN))
        {
          application.trace("<ServerManagerDemo initializeServers> the server " + serverKey + " cannot be added!", 6);
          continue;
        }
        application.trace("<ServerManagerDemo initializeServers> the server " + serverKey + " is added.", 3);
      }
      application.trace("<ServerManagerDemo initializeServers> the servers of this application are filled in.", 4);
    }
  }
}
