//
//  UIWebView+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 11/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIWebView+AGCategory.h"

@implementation UIWebView (AGCategory)

- (void)loadRequestWithURL_AG:(NSURL *)URL
{
    [self loadRequest:[NSURLRequest requestWithURL:URL]];
}

- (void)loadRequestWithFilePath_AG:(NSString *)filePath
{
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
}

@end