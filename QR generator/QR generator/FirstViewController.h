//
//  FirstViewController.h
//  QR generator
//
//  Created by Alberto Alonso on 22/01/13.
//  Copyright (c) 2013 Alberto Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController



// Methods
@property (weak, nonatomic) IBOutlet UITextField *urlEdit;
-(NSString *) getFilePath;
-(void) saveData;
-(void) loadData;

- (IBAction)SavePrefs:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
