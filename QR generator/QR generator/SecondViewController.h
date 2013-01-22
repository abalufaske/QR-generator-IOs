//
//  SecondViewController.h
//  QR generator
//
//  Created by Alberto Alonso on 22/01/13.
//  Copyright (c) 2013 Alberto Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) NSString *urlFinal;
@property (weak, nonatomic) NSString *dimensionFinal;
@property (strong, nonatomic) IBOutlet UIWebView *viewWeb;
@property (strong, nonatomic) IBOutlet UILabel *labelurl;
@property (strong, nonatomic) IBOutlet UIView *ViewLarge;

// Methods
-(NSString *) getFilePath;


-(void) loadData;
-(void) refreshWeb;
- (IBAction)saveWeb:(id)sender;

@end
