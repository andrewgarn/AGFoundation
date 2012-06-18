//
//  AGBlockOperation.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
//  Copyright (c) 2012 Andrew Garn. All rights reserved.
//

/* Modified from original source code from BaseKit by Bruno Wernimont */
/* Original license available at: https://github.com/brunow/BaseKit */

#import <Foundation/Foundation.h>
typedef void (^AGBasicBlock)(void);

/** An `NSObject` subclass to aid in performing block operations */ 
@interface AGBlockOperation : NSObject

/**-------------------------------------------------------------------------------------
 @name Background Blocks
 ---------------------------------------------------------------------------------------
*/ 

/** Perform block in background
 
 Performs a block in the background, then calls the completion block on the main thread.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param backgroundBlock The block to perform in the background.
 @param completionBlock The block to perform on completion.
 @param waitUntilDone A Boolean that specifies whether the current thread blocks until after the specified selector is performed on the receiver on the specified thread. Specify YES to block this thread; otherwise, specify NO to have this method return immediately.
*/ 
+ (void)performBlockInBackground:(AGBasicBlock)backgroundBlock completion:(AGBasicBlock)completionBlock waitUntilDone:(BOOL)waitUntilDone;

/** Perform block in background
 
 Performs a block in the background, then calls the completion block on the main thread.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param backgroundBlock The block to perform in the background.
 @param completionBlock The block to perform on completion.
*/ 
+ (void)performBlockInBackground:(AGBasicBlock)backgroundBlock completion:(AGBasicBlock)completionBlock;

/** Perform block in background
 
 Performs a block in the background, then calls the completion block on the main thread.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param backgroundBlock The block to perform in the background.
*/
+ (void)performBlockInBackground:(AGBasicBlock)backgroundBlock;

/**-------------------------------------------------------------------------------------
 @name Main Thread Blocks
 ---------------------------------------------------------------------------------------
*/

/** Perform block on the main thread.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param block The block to perform.
 @param waitUntilDone A Boolean that specifies whether the current thread blocks until after the specified selector is performed on the receiver on the specified thread. Specify YES to block this thread; otherwise, specify NO to have this method return immediately.
*/ 
+ (void)performBlockInMainThread:(AGBasicBlock)block waitUntilDone:(BOOL)waitUntilDone;

/** Perform block on the main thread.
 
 Code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param block The block to perform.
*/ 
+ (void)performBlockInMainThread:(AGBasicBlock)block;

@end