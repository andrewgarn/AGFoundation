//
//  UIWebView+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 11/11/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UIWebView` */
@interface UIWebView (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Loading Content
 ---------------------------------------------------------------------------------------
*/

/** Connects to the given URL by initiating an asynchronous client request.
 @param URL The URL for the new request.
*/
- (void)loadRequestWithURL_AG:(NSURL *)URL;

/** Initiates an asynchronous client request to load the specified URL from the main bundle.
 @param filePath The bundle path to the resource that the request should load.
*/
- (void)loadRequestWithFilePath_AG:(NSString *)filePath;

/**-------------------------------------------------------------------------------------
 @name Accessing Web Content Properties
 ---------------------------------------------------------------------------------------
*/

/** Returns the title of the HTML page currently displayed.
 @return The title of the HTML page currently displayed.
*/
- (NSString *)documentTitle_AG;

@end