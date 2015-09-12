//
//  Kroman.h
//  Kroman
//
//  Created by Kai Yu on 9/12/15.
//  Copyright © 2015 Zhang Kai Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for Kroman.
FOUNDATION_EXPORT double KromanVersionNumber;

//! Project version string for Kroman.
FOUNDATION_EXPORT const unsigned char KromanVersionString[];

@interface Kroman : NSObject

+ (nonnull NSString *)parse: (nonnull NSString *)content;

@end


