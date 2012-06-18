//
//  UIFont+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 06/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UIFont+AGCategory.h"

@implementation UIFont (AGCategory)

+ (NSDictionary *)fontsByFamilyName
{
    NSMutableDictionary *fontsByFamilyName = [NSMutableDictionary dictionary];
    NSMutableString *fontsString = [NSMutableString string];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"self" ascending:YES]];

    NSArray *familyNames = [[UIFont familyNames] sortedArrayUsingDescriptors:sortDescriptors];
    for (NSString *aFamilyName in familyNames)
    {
        NSArray *fontNames = [[UIFont fontNamesForFamilyName:aFamilyName] sortedArrayUsingDescriptors:sortDescriptors];
        [fontsByFamilyName setObject:fontNames forKey:aFamilyName];
        
        [fontsString appendFormat:@"%@\n", aFamilyName];
        for (NSString *aFontName in fontNames) 
        {
            [fontsString appendFormat:@"\t%@\n", aFontName];
        }
        [fontsString appendString:@"\n"];
    }
    return fontsByFamilyName;
}

@end