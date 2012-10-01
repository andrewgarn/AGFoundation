//
//  NSData+AGCategory.h
//  AGFoundation
//
//  Created by Andrew Garn on 23/07/2012.
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

/** A collection of category extensions for `NSData` */
@interface NSData (AGCategory)

/**-------------------------------------------------------------------------------------
 @name Cryptographic Hashing
 ---------------------------------------------------------------------------------------
*/

/** Returns the MD5 hash of the receiver.
 @return The MD5 hash of the receiver.
 */
- (NSString *)MD5Hash_AG;

/** Returns the SHA1 hash of the receiver.
 @return The SHA1 hash of the receiver.
 */
- (NSString *)SHA1Hash_AG;

/** Returns the SHA256 hash of the receiver.
 @return The SHA256 hash of the receiver.
 */
- (NSString *)SHA256Hash_AG;

/** Returns the SHA512 hash of the receiver.
 @return The SHA512 hash of the receiver.
 */
- (NSString *)SHA512Hash_AG;

@end