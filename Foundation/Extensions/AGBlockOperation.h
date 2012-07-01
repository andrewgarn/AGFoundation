//
//  AGBlockOperation.h
//  AGFoundation
//
//  Created by Andrew Garn on 24/05/2012.
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
 
 Includes code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param backgroundBlock The block to perform in the background.
 @param completionBlock The block to perform on completion.
 @param waitUntilDone A Boolean that specifies whether the current thread blocks until after the specified selector is performed on the receiver on the specified thread. Specify YES to block this thread; otherwise, specify NO to have this method return immediately.
*/ 
+ (void)performBlockInBackground:(AGBasicBlock)backgroundBlock completion:(AGBasicBlock)completionBlock waitUntilDone:(BOOL)waitUntilDone;

/** Perform block in background
 
 Performs a block in the background, then calls the completion block on the main thread.
 
 Includes code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param backgroundBlock The block to perform in the background.
 @param completionBlock The block to perform on completion.
*/ 
+ (void)performBlockInBackground:(AGBasicBlock)backgroundBlock completion:(AGBasicBlock)completionBlock;

/** Perform block in background
 
 Performs a block in the background, then calls the completion block on the main thread.
 
 Includes code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param backgroundBlock The block to perform in the background.
*/
+ (void)performBlockInBackground:(AGBasicBlock)backgroundBlock;

/**-------------------------------------------------------------------------------------
 @name Main Thread Blocks
 ---------------------------------------------------------------------------------------
*/

/** Perform block on the main thread.
 
 Includes code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param block The block to perform.
 @param waitUntilDone A Boolean that specifies whether the current thread blocks until after the specified selector is performed on the receiver on the specified thread. Specify YES to block this thread; otherwise, specify NO to have this method return immediately.
*/ 
+ (void)performBlockInMainThread:(AGBasicBlock)block waitUntilDone:(BOOL)waitUntilDone;

/** Perform block on the main thread.
 
 Includes code from the BlocksKit project by Zachary Waldowski. 2012. MIT License: https://github.com/zwaldowski/BlocksKit
 @param block The block to perform.
*/ 
+ (void)performBlockInMainThread:(AGBasicBlock)block;

@end