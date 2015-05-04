//
//  ViewController.h
//  HTTPRequest
//
//  Created by Daniel Goncalves on 2015-05-04.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPCommunication.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) HTTPCommunication *http;
@property (strong, nonatomic) NSNumber *responseID;

@property (weak, nonatomic) IBOutlet UILabel *jokeLabel;
- (IBAction)getJoke:(id)sender;


@end

