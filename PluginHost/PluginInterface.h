//
//  PluginInterface.h
//  PluginHost
//
//  Created by Jarosław Pendowski on 02.04.2016.
//  Copyright © 2016 Jarosław Pendowski. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PluginInterface <NSObject>

@property (nonatomic, copy, readonly) NSString * _Nonnull name;

- (NSString * _Nullable)convertString:(NSString * _Nullable)string;

@end