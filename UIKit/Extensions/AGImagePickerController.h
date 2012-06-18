//
//  AGImagePickerController.h
//  AGFoundation
//
//  Created by Andrew Garn on 11/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGImagePickerController;
typedef void (^AGImagePickerControllerCompletionBlock)(AGImagePickerController *, NSDictionary *, BOOL cancelled);

/** `UIImagePickerController` extended to support block completion */
@interface AGImagePickerController : UIImagePickerController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

/**
 Sets the block to be called when the receiver finishes.
 @param completionBlock The block to execute when the receiver finishes.
*/
- (void)setCompletionBlock:(AGImagePickerControllerCompletionBlock)completionBlock;

@end