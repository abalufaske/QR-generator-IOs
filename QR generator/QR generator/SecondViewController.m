//
//  SecondViewController.m
//  QR generator
//
//  Created by Alberto Alonso on 22/01/13.
//  Copyright (c) 2013 Alberto Alonso. All rights reserved.
//

#import "SecondViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize urlFinal,dimensionFinal,viewWeb,labelurl,ViewLarge;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self loadData];
    [self refreshWeb];
    
	

    
}

- (void) viewDidAppear:(BOOL)animated
{
    [self refreshWeb];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadData {
    // load data here
    NSLog(@"paso load: ",nil);
    
    NSString *myPath = [self getFilePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    
    if (fileExists) {
        NSArray *values = [[NSArray alloc] initWithContentsOfFile:myPath];
        urlFinal = [values objectAtIndex:0];
        dimensionFinal= @"335";
        labelurl.text =[values objectAtIndex:0];
    }
}

- (NSString *) getFilePath {
    // placeholder
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathArray objectAtIndex:0] stringByAppendingPathComponent:@"saved.plist"];
    
}

- (void) refreshWeb {
    
    NSString *myPath = [self getFilePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    
    if (fileExists) {
        NSArray *values = [[NSArray alloc] initWithContentsOfFile:myPath];
        urlFinal = [values objectAtIndex:0];
        dimensionFinal= @"335";
        labelurl.text =[values objectAtIndex:0];

        // Do any additional setup after loading the view, typically from a nib.
        NSString *urlAddress = @"https://chart.googleapis.com/chart?chs=";
        urlAddress = [urlAddress stringByAppendingString:dimensionFinal];
        urlAddress = [urlAddress stringByAppendingString:@"x"];
        urlAddress = [urlAddress stringByAppendingString:dimensionFinal];
        urlAddress = [urlAddress stringByAppendingString:@"&cht=qr&chl="];
        urlAddress = [urlAddress stringByAppendingString:urlFinal];
        urlAddress = [urlAddress stringByAppendingString:@"&choe=UTF-8"];
        
        //"+width+"x"+height+"&cht=qr&chl="+url+"&choe=UTF-8"
        
        //Create a URL object.
        NSURL *url = [NSURL URLWithString:urlAddress];
        
        //URL Requst Object
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        //Load the request in the UIWebView.
        [viewWeb loadRequest:requestObj];
    }
}

- (IBAction)saveWeb:(id)sender {
    
   /* UIGraphicsBeginImageContext(viewWeb.frame.size);
    [self.viewWeb.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil,nil,nil);
    */
    
    UIGraphicsBeginImageContext(ViewLarge.frame.size);
    [self.ViewLarge.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil,nil,nil);

    
}
- (void)viewDidUnload {
    [self setLabelurl:nil];
    [self setViewLarge:nil];
    [super viewDidUnload];
}
@end
