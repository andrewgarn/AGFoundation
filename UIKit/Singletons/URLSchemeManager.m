//
//  URLSchemeManager.m
//  AGFoundation
//
//  Created by Andrew Garn on 31/07/2012.
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

#import "URLSchemeManager.h"
#import "UIApplication+AGCategory.h"

@implementation URLSchemeManager

+ (BOOL)canOpenAppStore
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:AGFoundationApplicationSchemeAppStore]];
}

+ (BOOL)openAppStoreWithAppId:(NSString *)appId
{
    NSString *stringURL = @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=";
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", stringURL, appId]]];
}

+ (BOOL)openAppStoreToGiftAppWithAppId:(NSString *)appId
{
    NSString *stringURL = [NSString stringWithFormat:@"itms-appss://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/giftSongsWizard?gift=1&salableAdamId=%@&productType=C&pricingParameter=STDQ&mt=8&ign-mscache=1", appId];
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringURL]];
}

+ (BOOL)openAppStoreToReviewAppWithAppId:(NSString *)appId
{
    NSString *stringURL = @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=";
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", stringURL, appId]]];
}

+ (BOOL)canOpenSafari
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:AGFoundationApplicationSchemeSafari]];
}

+ (BOOL)openSafariWithURL:(NSURL *)url
{
    return [[UIApplication sharedApplication] openURL:url];
}

#pragma mark -

+ (BOOL)canOpenFacebook
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:AGFoundationApplicationSchemeFacebook]];
}

+ (BOOL)openFacebook
{
    BOOL didOpen = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:AGFoundationApplicationSchemeFacebook]];
    if (!didOpen) didOpen = [self openAppStoreWithAppId:AGFoundationApplicationIdFacebook];
    return didOpen;
}

+ (BOOL)canOpenGoogleChrome
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:AGFoundationApplicationSchemeGoogleChrome]];
}

+ (BOOL)openGoogleChromeWithURL:(NSURL *)url
{
    NSString *chromeScheme = nil;
    if ([url.scheme isEqualToString:@"http"]) {
        chromeScheme = AGFoundationApplicationSchemeGoogleChrome;
    } else if ([url.scheme isEqualToString:@"https"]) {
        chromeScheme = AGFoundationApplicationSchemeGoogleChromes;
    }
    
    if (chromeScheme) {
        NSRange rangeForScheme = [[url absoluteString] rangeOfString:@":"];
        NSString *urlNoScheme =  [[url absoluteString] substringFromIndex:rangeForScheme.location + 1];
        NSString *chromeUrlString = [chromeScheme stringByAppendingString:urlNoScheme];
        NSURL *chromeUrl = [NSURL URLWithString:chromeUrlString];
        
        BOOL didOpen = [[UIApplication sharedApplication] openURL:chromeUrl];
        if (!didOpen) didOpen = [self openAppStoreWithAppId:AGFoundationApplicationIdGoogleChrome];
        return didOpen;
    }
    return NO;
}

+ (BOOL)canOpenTomTom
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:AGFoundationApplicationSchemeTomTom]];
}

+ (BOOL)openTomTom
{
    BOOL didOpen = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:AGFoundationApplicationSchemeTomTom]];
    if (!didOpen) {
        NSString *stringURL = [NSString stringWithFormat:@"http://phobos.apple.com/WebObjects/MZSearch.woa/wa/search?WOURLEncoding=ISO8859_1&lang=1&output=lm&country=US&term=%@&media=software", [@"Tom Tom" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        didOpen = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringURL]];
    }
    return didOpen;
}

+ (BOOL)canOpenTweetbot
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:AGFoundationApplicationSchemeTweetbot]];
}

+ (BOOL)openTweetbot
{
    BOOL didOpen = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:AGFoundationApplicationSchemeTweetbot]];
    if (!didOpen) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            didOpen = [self openAppStoreWithAppId:AGFoundationApplicationIdTweetbotPad];
        } else {
            didOpen = [self openAppStoreWithAppId:AGFoundationApplicationIdTweetbotPhone];
        }
    }
    return didOpen;
}

+ (BOOL)canOpenTwitter
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:AGFoundationApplicationSchemeTwitter]];
}

+ (BOOL)openTwitter
{
    BOOL didOpen = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:AGFoundationApplicationSchemeTwitter]];
    if (!didOpen) didOpen = [self openAppStoreWithAppId:AGFoundationApplicationIdTwitter];
    return didOpen;
}

#pragma mark -

+ (BOOL)canOpenApplicationWithScheme:(NSString *)applicationScheme
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:applicationScheme]];
}

+ (BOOL)openApplicationWithScheme:(NSString *)applicationScheme appId:(NSString *)appId
{
    BOOL didOpen = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:applicationScheme]];
    if (!didOpen) didOpen = [self openAppStoreWithAppId:appId];
    return didOpen;
}

+ (BOOL)openApplicationWithScheme:(NSString *)applicationScheme
{
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:applicationScheme]];
}

/* Apple */
NSString * const AGFoundationApplicationSchemeAppStore = @"itms-apps:";
NSString * const AGFoundationApplicationSchemeSafari = @"http:";

/* Facebook */
NSString * const AGFoundationApplicationSchemeFacebook = @"fb:";
NSString * const AGFoundationApplicationIdFacebook = @"284882215";

/* Google Chrome */
NSString * const AGFoundationApplicationSchemeGoogleChrome = @"googlechrome:";
NSString * const AGFoundationApplicationSchemeGoogleChromes = @"googlechromes:";
NSString * const AGFoundationApplicationIdGoogleChrome = @"535886823";

/* Tom Tom */
NSString * const AGFoundationApplicationSchemeTomTom = @"tomtomhome:";

/* Tweetbot */
NSString * const AGFoundationApplicationSchemeTweetbot = @"tweetbot:";
NSString * const AGFoundationApplicationIdTweetbotPhone = @"428851691";
NSString * const AGFoundationApplicationIdTweetbotPad = @"498801050";

/* Twitter */
NSString * const AGFoundationApplicationSchemeTwitter = @"twitter:";
NSString * const AGFoundationApplicationIdTwitter = @"333903271";

@end