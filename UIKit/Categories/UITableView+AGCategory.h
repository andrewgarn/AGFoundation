//
//  UITableView+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/06/2012.
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

/** A collection of category extensions for `UITableView` */
@interface UITableView (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Scrolling the Table View
 ---------------------------------------------------------------------------------------
*/

/** Scrolls the receiver to the first row in its first section with animation. */
- (void)scrollToFirstRow_AG;

/** Scrolls the receiver to the first row in its first section.
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
*/
- (void)scrollToFirstRowAnimated_AG:(BOOL)animated;

/** Scrolls the receiver to the last row in its last section with animation. */
- (void)scrollToLastRow_AG;

/** Scrolls the receiver to the last row in its last section.
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
*/
- (void)scrollToLastRowAnimated_AG:(BOOL)animated;

/** Scrolls the receiver to the specified row in the specified section.
 
 The receiver will not be scrolled if the index path constructed from the specified row and section is found to be invalid.
 @param row An index number identifying a row in a section of a table view.
 @param section An index number identifying a section of the table view.
 @return `YES` if the receiving table view will scroll, otherwise `NO`.
*/
- (BOOL)scrollToRow_AG:(NSInteger)row inSection:(NSInteger)section;

/** Scrolls the receiver to the specified row in the specified section.
 
 The receiver will not be scrolled if the index path constructed from the specified row and section is found to be invalid.
 @param row An index number identifying a row in a section of a table view.
 @param section An index number identifying a section of the table view.
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
 @return `YES` if the receiving table view will scroll, otherwise `NO`.
*/
- (BOOL)scrollToRow_AG:(NSInteger)row inSection:(NSInteger)section animated:(BOOL)animated;

/** Scrolls the receiver until the specified row in the specified section is at a particular location on the screen.
 
 The receiver will not be scrolled if the index path constructed from the specified row and section is found to be invalid.
 @param row An index number identifying a row in a section of a table view.
 @param section An index number identifying a section of the table view.
 @param scrollPosition A constant that identifies a relative position in the receiving table view (top, middle, bottom) for row when scrolling concludes.
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
 @return `YES` if the receiving table view will scroll, otherwise `NO`.
*/
- (BOOL)scrollToRow_AG:(NSInteger)row inSection:(NSInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

/**-------------------------------------------------------------------------------------
 @name Managing Selections
 ---------------------------------------------------------------------------------------
*/

/** Deselects the currently selected row */
- (void)deselectSelectedRow_AG;

/** Deselects the currently selected row, with an option to animate the deselection.
 @param animated `YES` if you want to animate the deselection and `NO` if the change should be immediate.
*/
- (void)deselectSelectedRowAnimated_AG:(BOOL)animated;

@end