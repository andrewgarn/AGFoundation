//
//  AGAlertView.h
//  AGFoundation
//
//  Created by Andrew Garn on 23/04/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AGAlertViewBlock)(void);

/** `UIAlertView` extended to support block actions */
@interface AGAlertView : UIAlertView
{
    
}

/**-------------------------------------------------------------------------------------
 @name Creating Alert Views
 ---------------------------------------------------------------------------------------
*/

/** Creates and returns a new alert view with the specified properties.
 @param title The string that appears in the receiver’s title bar.
 @param message Descriptive text that provides more details than the title.
 @return Newly initialized alert view.
*/ 
- (AGAlertView *)initWithTitle:(NSString *)title message:(NSString *)message;

/**-------------------------------------------------------------------------------------
 @name Configuring Buttons
 ---------------------------------------------------------------------------------------
*/

/** Adds a custom button to the alert with a block to perform when pressed. 
 @param title The title of the new button.
 @param block The block to be called when the button is pressed.
 @return The index of the new button. Button indices start at 0 and increase in the order they are added.
*/ 
- (NSInteger)addButtonWithTitle:(NSString *)title block:(AGAlertViewBlock)block;

/** Adds a cancel button to the alert with a block to perform when pressed. 
 @param title The title of the new button.
 @param block The block to be called when the button is pressed.
 @return The index of the new button. Button indices start at 0 and increase in the order they are added.
*/ 
- (NSInteger)addCancelButtonWithTitle:(NSString *)title block:(AGAlertViewBlock)block;

/** Adds a cancel button to the alert.. 
 @param title The title of the new button.
 @return The index of the new button. Button indices start at 0 and increase in the order they are added.
*/ 
- (NSInteger)addCancelButtonWithTitle:(NSString *)title;

@end