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
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var pluginsMenu: NSMenu!
    
    let pluginHost = PluginHost()

    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        let path = NSBundle.mainBundle().bundlePath
        
        pluginHost.loadPluginsFromPath(path.stringByAppendingString("/../"))
        

        pluginsMenu.removeAllItems()

        pluginHost.plugins.forEach {
            let menuItem = NSMenuItem(title: $0.name, action: Selector("pluginItemClicked:"), keyEquivalent: "")
            menuItem.representedObject = $0
            
            pluginsMenu.addItem(menuItem)
        }
    }

    func applicationWillTerminate(aNotification: NSNotification)
    {
    }

    func pluginItemClicked(sender: NSMenuItem)
    {
        let selectedRange = textView.selectedRange()
        
        if let plugin = sender.representedObject as? PluginInterface,
            string = textView.string as NSString? {
                
                let selectedString = string.substringWithRange(selectedRange)
                if let convertedString = plugin.convertString(selectedString) {
                    textView.replaceCharactersInRange(selectedRange, withString: convertedString)
                }
                
        }
    }
}

