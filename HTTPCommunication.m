//
//  HTTPComunication.m
//  HTTPRequest
//
//  Created by Daniel Goncalves on 2015-05-04.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import "HTTPCommunication.h"

@implementation HTTPCommunication

- (void)retrieveURL:(NSURL *)url successBlock:(void (^)(NSData *))successBlock
{
    // Persisting given successBlock for calling it later
    
    self.successBlock = successBlock;
    
    // Creating a request using the given URL
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    // Set a default configuration
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Setup the session
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:nil];
    
    // Preparing the download task
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    
    // Estabilish the connection
    
    [task resume];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    // Getting the download data from the local storage
    
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    // Ensure that you call the successBlock from the main thread by using the dispatch
    
    dispatch_async(dispatch_get_main_queue(),
                   ^{
        
                       // Calling the block stored before as a callback
                       self.successBlock(data);
        
                   });
}


































@end
