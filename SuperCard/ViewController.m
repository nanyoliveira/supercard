//
//  ViewController.m
//  SuperCard
//
//  Created by SBTUR Principal on 8/20/15.
//  Copyright (c) 2015 SBTUR Principal. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createTitle];
    
    
}

-(void) createTitle
{
    
    CGRect labelRect = CGRectMake(20, 1, 350, 250);
    
    UILabel * createdText = [[UILabel alloc]initWithFrame:labelRect];
    createdText.text = @"e ae?";
    NSMutableAttributedString * atributeString =  [createdText.attributedText mutableCopy];
    
    UIFont *fontsize = [UIFont fontWithName:@"Palatino-Roman" size:14.0];
    NSAttributedString *attrString = [[NSAttributedString alloc]
                                      initWithString:@"Draw in the white space with your mouse!!"
                                      attributes:@{NSFontAttributeName: fontsize}];
    
    [atributeString setAttributedString:attrString];
    createdText.attributedText = atributeString;
    
    [self.view addSubview:createdText];

}



- (IBAction)panRecongnizer:(id)sender {
  
    UIPanGestureRecognizer * pan = (UIPanGestureRecognizer *)sender;
    [self.drawingView recongnizeDrawing: pan];

    
}


@end
