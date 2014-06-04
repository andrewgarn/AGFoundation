//
//  NSData+AGCategory.m
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

#import "NSData+AGCategory.h"

#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <Security/SecRandom.h>
#import <zlib.h>

#ifdef AGFOUNDATION_FRAMEWORK
FIX_CATEGORY_BUG(NSData_AGCategory);
#endif

@implementation NSData (AGCategory)

#pragma mark - Cryptographic Hashing

- (NSData *)MD5Hash_AG
{
    NSMutableData *hashData = [[NSMutableData alloc] initWithLength:CC_MD5_DIGEST_LENGTH];
	CC_MD5([self bytes], (CC_LONG)[self length], [hashData mutableBytes]);
    return [hashData copy];
}

- (NSData *)SHA1Hash_AG
{
    NSMutableData *hashData = [[NSMutableData alloc] initWithLength:CC_SHA1_DIGEST_LENGTH];
    CC_SHA1([self bytes], (CC_LONG)[self length], [hashData mutableBytes]);
    return [hashData copy];
}

- (NSData *)SHA256Hash_AG
{
    NSMutableData *hashData = [[NSMutableData alloc] initWithLength:CC_SHA256_DIGEST_LENGTH];
    CC_SHA256([self bytes], (CC_LONG)[self length], [hashData mutableBytes]);
    return [hashData copy];
}

- (NSData *)SHA512Hash_AG
{
    NSMutableData *hashData = [[NSMutableData alloc] initWithLength:CC_SHA512_DIGEST_LENGTH];
    CC_SHA512([self bytes], (CC_LONG)[self length], [hashData mutableBytes]);
    return [hashData copy];
}

#pragma mark -

- (NSString *)MD5HashString_AG
{
    return [[self MD5Hash_AG] stringWithHexRepresentation_AG];
}

- (NSString *)SHA1HashString_AG
{
    return [[self SHA1Hash_AG] stringWithHexRepresentation_AG];
}

- (NSString *)SHA256HashString_AG
{
    return [[self SHA256Hash_AG] stringWithHexRepresentation_AG];
}

- (NSString *)SHA512HashString_AG
{
    return [[self SHA512Hash_AG] stringWithHexRepresentation_AG];
}

#pragma mark -

- (NSData *)HMACMD5WithKey_AG:(NSData *)key
{
    NSMutableData *hashmac = [[NSMutableData alloc] initWithLength:CC_MD5_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgMD5, [key bytes], [key length], [self bytes], [self length], [hashmac mutableBytes]);
    return [hashmac copy];
}

- (NSData *)HMACSHA1WithKey_AG:(NSData *)key
{
    NSMutableData *hashmac = [[NSMutableData alloc] initWithLength:CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, [key bytes], [key length], [self bytes], [self length], [hashmac mutableBytes]);
    return [hashmac copy];
}

- (NSData *)HMACSHA256WithKey_AG:(NSData *)key
{
    NSMutableData *hashmac = [[NSMutableData alloc] initWithLength:CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, [key bytes], [key length], [self bytes], [self length], [hashmac mutableBytes]);
    return [hashmac copy];
}

- (NSData *)HMACSHA512WithKey_AG:(NSData *)key
{
    NSMutableData *hashmac = [[NSMutableData alloc] initWithLength:CC_SHA512_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA512, [key bytes], [key length], [self bytes], [self length], [hashmac mutableBytes]);
    return [hashmac copy];
}

#pragma mark - Encryption and Decryption

- (NSData *)AES256EncryptWithKey_AG:(NSString *)key
{
	// 'key' should be 32 bytes for AES256, will be null-padded otherwise
	char keyPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
	bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
	
	// fetch key data
	[key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
	
	NSUInteger dataLength = [self length];
	
	// See the doc: For block ciphers, the output size will always be less than or
	// equal to the input size plus the size of one block.
	// That's why we need to add the size of one block here
	size_t bufferSize = dataLength + kCCBlockSizeAES128;
	void *buffer = malloc(bufferSize);
	
	size_t numBytesEncrypted = 0;
	CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES256,
                                          NULL /* initialization vector (optional) */,
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesEncrypted);
	if (cryptStatus == kCCSuccess) {
		// the returned NSData takes ownership of the buffer and will free it on deallocation
		return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
	}
    
	free(buffer);
	return nil;
}

- (NSData *)AES256DecryptWithKey_AG:(NSString *)key
{
	// 'key' should be 32 bytes for AES256, will be null-padded otherwise
	char keyPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
	bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
	
	// fetch key data
	[key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
	
	NSUInteger dataLength = [self length];
	
	// See the doc: For block ciphers, the output size will always be less than or
	// equal to the input size plus the size of one block.
	// That's why we need to add the size of one block here
	size_t bufferSize = dataLength + kCCBlockSizeAES128;
	void *buffer = malloc(bufferSize);
	
	size_t numBytesDecrypted = 0;
	CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES256,
                                          NULL /* initialization vector (optional) */,
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesDecrypted);
	
	if (cryptStatus == kCCSuccess) {
		// the returned NSData takes ownership of the buffer and will free it on deallocation
		return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
	}
	
	free(buffer);
	return nil;
}

#pragma mark - Gzip Compression

+ (NSData *)gzipCompressedDataWithData_AG:(NSData *)data
{
    return [self gzipCompressedDataWithBytes_AG:[data bytes] length:(unsigned)[data length]];
}

+ (NSData *)gzipCompressedDataWithBytes_AG:(const void *)bytes length:(unsigned)length
{
    unsigned long compressedLength = compressBound(length);
    unsigned char* compressedBytes = (unsigned char*) malloc(compressedLength);
    
    if (compressedBytes != NULL && compress(compressedBytes, &compressedLength, bytes, length) == Z_OK) {
        char* resizedCompressedBytes = realloc(compressedBytes, compressedLength);
        if (resizedCompressedBytes != NULL) {
            return [NSData dataWithBytesNoCopy: resizedCompressedBytes length: compressedLength freeWhenDone: YES];
        } else {
            return [NSData dataWithBytesNoCopy: compressedBytes length: compressedLength freeWhenDone: YES];
        }
    } else {
        free(compressedBytes);
        return nil;
    }
}

+ (NSData *)dataWithGzipCompressedData_AG:(NSData *)compressedData
{
    return [self dataWithGzipCompressedBytes_AG:[compressedData bytes] length:(unsigned)[compressedData length]];
}

+ (NSData *)dataWithGzipCompressedBytes_AG:(const void *)bytes length:(unsigned)length
{
    z_stream strm;
    int ret;
    unsigned char out[128 * 1024];
    unsigned char* uncompressedData = NULL;
    unsigned int uncompressedLength = 0;
    
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.avail_in = 0;
    strm.next_in = Z_NULL;
    
    ret = inflateInit(&strm);
    
    if (ret == Z_OK) {
        strm.avail_in = length;
        strm.next_in = (void*) bytes;
        
        do {
            strm.avail_out = sizeof(out);
            strm.next_out = out;
            
            ret = inflate(&strm, Z_NO_FLUSH);
            if (ret != Z_OK && ret != Z_STREAM_END) {
                inflateEnd(&strm);
                if (uncompressedData != NULL) {
                    free(uncompressedData);
                }
                return nil;
            }
            
            unsigned int have = sizeof(out) - strm.avail_out;
            
            if (uncompressedData == NULL) {
                uncompressedData = malloc(have);
                memcpy(uncompressedData, out, have);
                uncompressedLength = have;
            } else {
                unsigned char* resizedUncompressedData = realloc(uncompressedData, uncompressedLength + have);
                if (resizedUncompressedData == NULL) {
                    free(uncompressedData);
                    inflateEnd(&strm);
                    return nil;
                } else {
                    uncompressedData = resizedUncompressedData;
                    memcpy(uncompressedData + uncompressedLength, out, have);
                    uncompressedLength += have;
                }
            }
        } while (strm.avail_out == 0);
    }
    
    if (uncompressedData != NULL) {
        return [NSData dataWithBytesNoCopy: uncompressedData length: uncompressedLength freeWhenDone: YES];
    } else {
        return nil;
    }
}

#pragma mark - String Representation of HEX Data

- (NSString *)stringWithHexRepresentation_AG
{
	static const char digits[] = "0123456789ABCDEF";
	const NSUInteger byteCount = [self length];
	const unsigned char *bytes = [self bytes];
	char *strbuf = (char *)malloc( 2 * byteCount + 1 );
	char *hex = strbuf;
	NSString *hexString = nil;
	
	for ( NSUInteger i = 0 ; i < byteCount ; ++i )
	{
		const unsigned char c = *bytes++;
		*hex = digits[ (c >> 4) & 0xF ]; hex++;
		*hex = digits[ (c >> 0) & 0xF ]; hex++;
	}
	*hex = 0;
	
	hexString = [NSString stringWithUTF8String:strbuf];
	free(strbuf);
    
	return hexString;
}

#pragma mark - Generating Random Data

+ (NSData *)randomDataOfLength_AG:(size_t)length
{
    NSMutableData *data = [NSMutableData dataWithLength:length];
    int result = SecRandomCopyBytes(NULL, length, data.mutableBytes);
    if (result != 0) { // Returns 0 if the function completed successfully and -1 if there was an error
        NSAssert(NO, @"Unable to generate random bytes: %d", errno);
    }
    return data;
}

#pragma mark - Storing Data

- (BOOL)writeToFile_AG:(NSString *)path atomically:(BOOL)useAuxiliaryFile
{
    @try {
        BOOL success = [self writeToFile:path atomically:useAuxiliaryFile];
        if(!success) {
            NSAssert(success, @"Failed to write data to path: %@", path);
            NSLog(@"ERROR: Failed to write data to path: %@", path);
        }
        return success;
    }
    @catch (NSException *exception) {
        NSLog(@"EXCEPTION writing data to path: %@\nException was: %@", path, exception);
    }
    return NO;
}

- (BOOL)writeToFile_AG:(NSString *)path options:(NSDataWritingOptions)writeOptionsMask error:(NSError **)errorPtr
{
    @try {
        BOOL success = [self writeToFile:path options:writeOptionsMask error:errorPtr];
        if(!success) {
            NSAssert(success, @"Failed to write data to path: %@", path);
            NSLog(@"ERROR: Failed to write data to path: %@", path);
        }
        return success;
    }
    @catch (NSException *exception) {
        NSLog(@"EXCEPTION writing data to path: %@\nException was: %@", path, exception);
    }
    return NO;
}

@end