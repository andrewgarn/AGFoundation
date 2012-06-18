//
//  AGActivityIndicator.m
//  AGFoundation
//
//  Created by Andrew Garn on 16/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "AGActivityIndicator.h"
#import <QuartzCore/QuartzCore.h>

@implementation AGActivityIndicator

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {		
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