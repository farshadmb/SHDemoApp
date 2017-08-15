#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AFHTTPRequestOperationManager+AutoRetry.h"
#import "AFHTTPSessionManager+AutoRetry.h"

FOUNDATION_EXPORT double AFNetworking_AutoRetryVersionNumber;
FOUNDATION_EXPORT const unsigned char AFNetworking_AutoRetryVersionString[];

