//
//  AppDelegate.swift
//  PluginHost
//
//  Created by Jarosław Pendowski on 02.04.2016.
//  Copyright © 2016 Jarosław Pendowski. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        let path = NSBundle.mainBundle().bundlePath
        pluginHost.loadPluginsFromPath(path.stringByAppendingString("/../"))
    }

    func applicationWillTerminate(aNotification: NSNotification)
    {
    }


}

