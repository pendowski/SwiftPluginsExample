//
//  PluginHost.swift
//  PluginHost
//
//  Created by Jarosław Pendowski on 02.04.2016.
//  Copyright © 2016 Jarosław Pendowski. All rights reserved.
//

import Foundation


class PluginHost
{
    var plugins: [PluginInterface] = []
    
    func loadPluginsFromPath(path: String)
    {
        let fileManager = NSFileManager.defaultManager()
        
        guard let enumerator = fileManager.enumeratorAtURL(NSURL(fileURLWithPath: path), includingPropertiesForKeys: [ NSURLNameKey, NSURLIsDirectoryKey ], options: [ .SkipsHiddenFiles, .SkipsSubdirectoryDescendants ], errorHandler: nil) else {
            
            return
        }
        
        while let item = enumerator.nextObject() as? NSURL {
            do {
            var isDirectory: AnyObject?
                try item.getResourceValue(&isDirectory, forKey: NSURLIsDirectoryKey)
                
                if let urlPath = item.path where urlPath.hasSuffix("bundle"),
                    let isDirectory = isDirectory as? NSNumber where isDirectory.boolValue,
                    let bundle = NSBundle(URL: item) where bundle.load() {
                    
                        if let cls = bundle.principalClass as? NSObject.Type,
                            plugin = cls.init() as? PluginInterface {
                                
                                plugins.append(plugin)
                                
                                print("> Plugin: \(plugin.name) loaded")
                        }
                }
                
            } catch _ { }
        }
    }
}