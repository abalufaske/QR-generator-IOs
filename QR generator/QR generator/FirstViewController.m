//
//  FirstViewController.m
//  QR generator
//
//  Created by Alberto Alonso on 22/01/13.
//  Copyright (c) 2013 Alberto Alonso. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize urlEdit;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SavePrefs:(id)sender {
    
    NSLog(@"paso save: ",nil);
    
    // save data here
    NSArray *value = [[NSArray alloc] initWithObjects:[urlEdit text], nil];
    [value writeToFile:[self getFilePath] atomically:YES];
}

- (IBAction)dismissKeyboard:(id)sender {
    
    [urlEdit resignFirstResponder];
}



-(void) saveData {
    NSLog(@"paso save: ",nil);
    // save data here
    NSArray *value = [[NSArray alloc] initWithObjects:[urlEdit text], nil];
    [value writeToFile:[self getFilePath] atomically:YES];
}

- (void) loadData {
    // load data here
    NSLog(@"paso load: ",nil);
    
    NSString *myPath = [self getFilePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    
    if (fileExists) {
        NSArray *values = [[NSArray alloc] initWithContentsOfFile:myPath];
        urlEdit.text = [values objectAtIndex:0];
        
          }
}

- (NSString *) getFilePath {
    // placeholder
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathArray objectAtIndex:0] stringByAppendingPathComponent:@"saved.plist"];
    
}

@end
