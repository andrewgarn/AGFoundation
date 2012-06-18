//
//  AGActionSheet.h
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AGActionSheetBlock)(void);

/** `UIActionSheet` extended to support block actions */
@interface AGActionSheet : UIActionSheet <UIActionSheetDelegate>
{

}

/**-------------------------------------------------------------------------------------
 @name Creating Action Sheets
 ---------------------------------------------------------------------------------------
*/

/** Creates and returns a new action sheet with the specified properties.
 @param title A string to display in the title area of the action sheet. Pass nil if you do not want to display any text in the title area.
 @return A newly initialized action sheet.
*/ 
- (AGActionSheet *)initWithTitle:(NSString *)title;

/**-------------------------------------------------------------------------------------
 @name Configuring Buttons
 ---------------------------------------------------------------------------------------
*/

/** Adds a custom button to the action sheet with a block to perform when pressed. 
 @param title The title of the new button.
 @param block The block to be called when the button is pressed.
 @return The index of the new button. Button indices start at 0 and increase in the order they are added.
*/ 
- (NSInteger)addButtonWithTitle:(NSString *)title block:(AGActionSheetBlock)block;

/** Adds a destructive button to the action sheet with a block to perform when pressed. 
 @param title The title of the new button.
 @param block The block to be called when the button is pressed.
 @return The index of the new button. Button indices start at 0 and increase in the order they are added.
*/ 
- (NSInteger)addDestructiveButtonWithTitle:(NSString *)title block:(AGActionSheetBlock)block;

/** Adds a cancel button to the action sheet with a block to perform when pressed. 
 @param title The title of the new button.
 @param block The block to be called when the button is pressed.
 @return The index of the new button. Button indices start at 0 and increase in the order they are added.
*/ 
- (NSInteger)addCancelButtonWithTitle:(NSString *)title block:(AGActionSheetBlock)block;

/** Adds a cancel button to the action sheet. 
 @param title The title of the new button.
 @return The index of the new button. Button indices start at 0 and increase in the order they are added.
*/ 
- (NSInteger)addCancelButtonWithTitle:(NSString *)title;

@end