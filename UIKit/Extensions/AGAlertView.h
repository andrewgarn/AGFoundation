//
//  AGAlertView.h
//  AGFoundation
//
//  Created by Andrew Garn on 23/04/2012.
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