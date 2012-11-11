//
//  UIWebView+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 11/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (AGCategory)

- (void)loadRequestWithURL_AG:(NSURL *)URL;

- (void)loadRequestWithFilePath_AG:(NSString *)filePath;

@end