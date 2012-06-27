//
//  UITableView+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A collection of category extensions for `UITableView` */
@interface UITableView (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Scrolling the Table View
 ---------------------------------------------------------------------------------------
*/

/** Scrolls the receiver to the first row in its first section with animation. */
- (void)scrollToFirstRow;

/** Scrolls the receiver to the first row in its first section.
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
*/
- (void)scrollToFirstRowAnimated:(BOOL)animated;

/** Scrolls the receiver to the last row in its last section with animation. */
- (void)scrollToLastRow;

/** Scrolls the receiver to the last row in its last section.
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
*/
- (void)scrollToLastRowAnimated:(BOOL)animated;

/** Scrolls the receiver to the specified row in the specified section.
 
 The receiver will not be scrolled if the index path constructed from the specified row and section is found to be invalid.
 @param row An index number identifying a row in a section of a table view.
 @param section An index number identifying a section of the table view.
 @return `YES` if the receiving table view will scroll, otherwise `NO`.
*/
- (BOOL)scrollToRow:(NSInteger)row inSection:(NSInteger)section;

/** Scrolls the receiver to the specified row in the specified section.
 
 The receiver will not be scrolled if the index path constructed from the specified row and section is found to be invalid.
 @param row An index number identifying a row in a section of a table view.
 @param section An index number identifying a section of the table view.
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
 @return `YES` if the receiving table view will scroll, otherwise `NO`.
*/
- (BOOL)scrollToRow:(NSInteger)row inSection:(NSInteger)section animated:(BOOL)animated;

/** Scrolls the receiver until the specified row in the specified section is at a particular location on the screen.
 
 The receiver will not be scrolled if the index path constructed from the specified row and section is found to be invalid.
 @param row An index number identifying a row in a section of a table view.
 @param section An index number identifying a section of the table view.
 @param scrollPosition A constant that identifies a relative position in the receiving table view (top, middle, bottom) for row when scrolling concludes.
 @param animated `YES` if you want to animate the change in position, `NO` if it should be immediate.
 @return `YES` if the receiving table view will scroll, otherwise `NO`.
*/
- (BOOL)scrollToRow:(NSInteger)row inSection:(NSInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

@end