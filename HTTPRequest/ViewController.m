//
//  ViewController.m
//  HTTPRequest
//
//  Created by Daniel Goncalves on 2015-05-04.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.http = [[HTTPCommunication alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)getJoke:(id)sender {
    
    // retrieve the jokes using the http communication
    
    NSURL *url = [NSURL URLWithString:@"http://api.icndb.com/jokes/random"];
    [self.http retrieveURL:url successBlock:^(NSData *response)
                                            {
                                                NSError *error = nil;
                                                
                                                // Deserialize the info we get from the API
                                                
                                                NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
                                                
                                                NSLog(@"%@", response);
                                                NSLog(@"%@", data);
                                                
                                                if (!error) {
                                                    
                                                    NSDictionary *value = data[@"value"];
                                                    
                                                    if (value && value[@"joke"]) {
                                                        
                                                        self.responseID = value[@"id"];
                                                        
                                                        // Update the UI with joke
                                                        [self.jokeLabel setText:value[@"joke"]];
                                                        
                                                    }
                                                }
                                                
                                            }];

    
}
@end
