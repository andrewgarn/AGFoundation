//
//  AGActionSheet.h
//  AGFoundation
//
//  Created by Andrew Garn on 09/06/2012.
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