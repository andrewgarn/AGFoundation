//
//  UITableView+AGCategory.m
//  AGFoundation
//
//  Created by Andrew Garn on 24/06/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

#import "UITableView+AGCategory.h"

@implementation UITableView (AGCategory)

#pragma mark -

- (void)scrollToFirstRow
{
    [self scrollToFirstRowAnimated:YES];
}

- (void)scrollToFirstRowAnimated:(BOOL)animated
{
    if ([self numberOfSections] > 0 && [self numberOfRowsInSection:0] > 0)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:animated];
    } 
}

- (void)scrollToLastRow
{
    [self scrollToLastRowAnimated:YES];
}

- (void)scrollToLastRowAnimated:(BOOL)animated
{
    if ([self numberOfSections] > 0)
    {
        NSInteger section = [self numberOfSections] - 1;
        NSInteger rowCount = [self numberOfRowsInSection:section];
        
        if (rowCount > 0)
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(rowCount - 1) inSection:section];
            [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:animated];
        }
    }
}

#pragma mark -

- (BOOL)scrollToRow:(NSInteger)row inSection:(NSInteger)section
{
    return [self scrollToRow:row inSection:section animated:YES];
}

- (BOOL)scrollToRow:(NSInteger)row inSection:(NSInteger)section animated:(BOOL)animated
{
    return [self scrollToRow:row inSection:section atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (BOOL)scrollToRow:(NSInteger)row inSection:(NSInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    if ([self numberOfSections] > section)
    {
        if ([self numberOfRowsInSection:section] > row)
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:animated];
            return YES;
        }
    }
    return NO;
}


@end