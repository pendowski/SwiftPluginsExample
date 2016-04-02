//
//  Base64Plugin.swift
//  PluginHost
//
//  Created by Jarosław Pendowski on 02.04.2016.
//  Copyright © 2016 Jarosław Pendowski. All rights reserved.
//

import Foundation


class Base64Plugin : NSObject, PluginInterface
{
    var name = "Text to Base64"
    
    func convertString(string: String?) -> String?
    {
        if let string = string,
            stringData = string.dataUsingEncoding(NSUTF8StringEncoding) {
                return stringData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        }
        
        return string
    }
}