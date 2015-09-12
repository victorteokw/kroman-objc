//
//  Kroman.m
//  Kroman
//
//  Created by Kai Yu on 9/12/15.
//  Copyright © 2015 Zhang Kai Yu. All rights reserved.
//

#import "Kroman.h"

static NSArray *headJamos = nil;

static NSArray *bodyJamos = nil;

static NSArray *tailJamos = nil;

static int headInterval = 588;

static int bodyInterval = 28;

static int ga = 0xac00;

static int hih = 0xd7a3;

@implementation Kroman



+ (nonnull NSString *)parse: (nonnull NSString *)content {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        headJamos = @[@"g", @"gg", @"n", @"d", @"dd", @"r", @"m",
                      @"b", @"bb", @"s", @"ss", @"", @"j", @"jj",
                      @"c", @"k", @"t", @"p", @"h"];
        bodyJamos = @[@"a", @"ae", @"ya", @"yae", @"eo", @"e", @"yeo",
                      @"ye", @"o", @"wa", @"wae", @"oe", @"yo", @"u",
                      @"weo", @"we", @"wi", @"yu", @"eu", @"eui", @"i"];
        tailJamos = @[@"", @"g", @"gg", @"gs", @"n", @"nj", @"nh", @"d",
                      @"r", @"rk", @"rm", @"rb", @"rs", @"rt", @"rp", @"rh",
                      @"m", @"b", @"bs", @"s", @"ss", @"ng", @"j", @"c",
                      @"k", @"t", @"p", @"h"];
    });
    NSMutableString *retval = [[NSMutableString alloc] init];
    BOOL lastCharIsHangul = NO;
    for (int i = 0; i < content.length; i++) {
        unichar chr = [content characterAtIndex:i];
        if ((ga <= chr) && (chr <= hih)) {
            int head = floorf((chr - ga) / (float)headInterval);
            int headl = (chr - ga) % headInterval;
            int body = floorf(headl / (float)bodyInterval);
            int tail = headl % bodyInterval;
            if (lastCharIsHangul) {
                [retval appendString:@"-"];
            }
            [retval appendFormat:@"%@%@%@", headJamos[head],
             bodyJamos[body], tailJamos[tail]];
            lastCharIsHangul = YES;
        } else {
            lastCharIsHangul = NO;
            [retval appendFormat:@"%c", chr];
        }

    }
    return [retval copy];
}

@end
