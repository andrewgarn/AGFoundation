//
//  UITableView+AGCategory.m
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

#import "UITableView+AGCategory.h"

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(UITableView_AGCategory);
#endif

@implementation UITableView (AGCategory)

#pragma mark -

- (NSIndexPath *)indexPathForLastCell_AG
{
    NSInteger numberOfSections = [self numberOfSections];
    if (numberOfSections <= 0) {
        return nil;
    }
    
	NSInteger section = numberOfSections - 1;    
	return [self indexPathForLastCellInSection_AG:section];
}

- (NSIndexPath *)indexPathForLastCellInSection_AG:(NSInteger)section
{
    NSInteger numberOfRowsInSection = [self numberOfRowsInSection:section];
    if (numberOfRowsInSection <= 0) {
        return nil;
    }
    
	NSInteger row = numberOfRowsInSection - 1;
	return [NSIndexPath indexPathForRow:row inSection:section];
}

#pragma mark -

- (void)scrollToFirstRow_AG
{
    [self scrollToFirstRowAnimated_AG:YES];
}

- (void)scrollToFirstRowAnimated_AG:(BOOL)animated
{
    if ([self numberOfSections] > 0 && [self numberOfRowsInSection:0] > 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:animated];
    } 
}

- (void)scrollToLastRow_AG
{
    [self scrollToLastRowAnimated_AG:YES];
}

- (void)scrollToLastRowAnimated_AG:(BOOL)animated
{
    if ([self numberOfSections] > 0) {
        NSInteger section = [self numberOfSections] - 1;
        NSInteger rowCount = [self numberOfRowsInSection:section];
        
        if (rowCount > 0) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(rowCount - 1) inSection:section];
            [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:animated];
        }
    }
}

#pragma mark -

- (BOOL)scrollToRow_AG:(NSInteger)row inSection:(NSInteger)section
{
    return [self scrollToRow_AG:row inSection:section animated:YES];
}

- (BOOL)scrollToRow_AG:(NSInteger)row inSection:(NSInteger)section animated:(BOOL)animated
{
    return [self scrollToRow_AG:row inSection:section atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (BOOL)scrollToRow_AG:(NSInteger)row inSection:(NSInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    if ([self numberOfSections] > section) {
        if ([self numberOfRowsInSection:section] > row) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:animated];
            return YES;
        }
    }
    return NO;
}

#pragma mark -

- (void)deselectSelectedRow_AG
{
    [self deselectSelectedRowAnimated_AG:YES];
}

- (void)deselectSelectedRowAnimated_AG:(BOOL)animated
{
    NSIndexPath *indexPath = [self indexPathForSelectedRow];
    [self deselectRowAtIndexPath:indexPath animated:animated];
}

@end