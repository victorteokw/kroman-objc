//
//  KromanTests.m
//  KromanTests
//
//  Created by Kai Yu on 9/12/15.
//  Copyright © 2015 Zhang Kai Yu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Kroman.h"

@interface KromanTests : XCTestCase

@end

@implementation KromanTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testKroman {
    NSString *result = [Kroman parse:@"희망은 잠들지 않는 꿈"];
    XCTAssertEqualObjects(result, @"heui-mang-eun jam-deur-ji anh-neun ggum");
}

@end
