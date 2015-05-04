//
//  HTTPComunication.h
//  HTTPRequest
//
//  Created by Daniel Goncalves on 2015-05-04.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPCommunication : NSObject <NSURLSessionDownloadDelegate>

/* successBlock will contain the block you're going to call when the requests completed */

@property (copy, nonatomic) void (^successBlock)(NSData *);

// Craft & request using NSURLRequest & NSURLConnection

- (void) retrieveURL: (NSURL *)url successBlock:(void(^)(NSData *))successBlock;

// Task has finished downloading delegate method

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location;

@end
