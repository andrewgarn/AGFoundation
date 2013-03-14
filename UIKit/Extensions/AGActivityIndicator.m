//
//  AGActivityIndicator.m
//  AGFoundation
//
//  Created by Andrew Garn on 16/05/2012.
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

#import "AGActivityIndicator.h"
#import <QuartzCore/QuartzCore.h>

@implementation AGActivityIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		
        // Set background colour
		[self setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
		
		// Add a gradiated background UIView.
		UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 60, 60)];
		[backgroundView setCenter:CGPointMake(self.center.x, frame.size.height / 3.0f)];
		[backgroundView setBackgroundColor:[UIColor colorWithRed:37.0f/255.0f green:37.0f/255.0f blue:37.0f/255.0f alpha:0.5f]];
		[backgroundView.layer setCornerRadius:5.0f];
		[self addSubview:backgroundView];
		
		// Add the actual UIActivityIndicatorView
		UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] init];
        [activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
		[activityIndicatorView setCenter:CGPointMake(self.center.x, frame.size.height / 3.0f)];
		[activityIndicatorView startAnimating];
		[self addSubview:activityIndicatorView];
    }
    return self;
}

@end