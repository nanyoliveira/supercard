//
//  PlayingCardView.h
//  SuperCard
//
//  Created by SBTUR Principal on 8/20/15.
//  Copyright (c) 2015 SBTUR Principal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSInteger rank;
@property (strong, nonatomic) NSString * suit;
@property (nonatomic) BOOL faceUp;

-(void)recongnizeDrawing:( UIPanGestureRecognizer *) recognizer;

@end

