//
//  SamplePlugin.swift
//  PluginHost
//
//  Created by Jarosław Pendowski on 02.04.2016.
//  Copyright © 2016 Jarosław Pendowski. All rights reserved.
//

import Foundation


class SamplePlugin : NSObject, PluginInterface
{
    var name = "SamplePlugin"
    
    func convertString(string: String?) -> String?
    {
        if let string = string {
            return string
        }
        
        return nil
    }
}