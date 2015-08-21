//
//  PlayingCardView.m
//  SuperCard
//
//  Created by SBTUR Principal on 8/20/15.
//  Copyright (c) 2015 SBTUR Principal. All rights reserved.
//

#import "PlayingCardView.h"


@interface PlayingCardView()


@property (nonatomic) CGPoint translationPoints;
@property (nonatomic) CGPoint beginTranslationPoints;

@end



@implementation PlayingCardView

#pragma mark : setters and getters



-(void) setRank:(NSInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

-(void) setSuit:(NSString *)suit
{
    _suit = suit;
    [self setNeedsDisplay];
}

-(void) setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}


-(void) setTranslationPoints:(CGPoint)translationPoints
{
    _translationPoints = translationPoints;
    }

-(void) setBeginTranslationPoints:(CGPoint)beginTranslationPoints
{
    _beginTranslationPoints = beginTranslationPoints;
}



-(void)recongnizeDrawing:( UIPanGestureRecognizer *) recognizer
{
    if(recognizer.state == UIGestureRecognizerStateBegan)
    {
        self.beginTranslationPoints = [recognizer translationInView:self] ;
        self.translationPoints =  self.beginTranslationPoints;
    }
    
    if(recognizer.state == UIGestureRecognizerStateChanged)
    {
        self.translationPoints = [recognizer translationInView:self] ;
    }
  
    [self setNeedsDisplay];
    NSLog([NSString stringWithFormat:@"cg point begin %@", NSStringFromCGPoint(self.beginTranslationPoints) ]);
    NSLog([NSString stringWithFormat:@"cg point changed %@", NSStringFromCGPoint(self.translationPoints) ]);


}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath * path  = [[UIBezierPath alloc]init];
    [path moveToPoint: [self getPositiveCGMake:(self.frame.origin.x +self.beginTranslationPoints.x) forYPoint:(self.frame.origin.y + self.beginTranslationPoints.y)]];
    
    [path addLineToPoint: [self getPositiveCGMake:(self.frame.origin.x+ self.translationPoints.x) forYPoint:(self.frame.origin.y + self.translationPoints.y)]];
   
    path.lineWidth = 3;
    [[UIColor purpleColor] setStroke];
    [path fill];
    [path stroke];
}

-(CGPoint)getPositiveCGMake:(double)xPoint forYPoint: (double)yPoint
{
    CGPoint result = CGPointMake(xPoint< 0? xPoint *-1: xPoint, yPoint <0? yPoint*-1: yPoint);
//     CGPoint result = CGPointMake(xPoint, yPoint);
    
//     NSLog([NSString stringWithFormat:@"result %@", NSStringFromCGPoint(result) ]);
    
    return result;
}

-(void)setUp
{
    self.backgroundColor = [UIColor whiteColor];
    self.contentMode = UIViewContentModeRedraw;
    
}


-(void)awakeFromNib
{
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        
    }
    return self;
}


#pragma mark - notes
//  how to deal with UIBezier path creating a circle
//    [self.path addLineToPoint:CGPointMake(30, 300)];
//    [self.path closePath];

//    [[UIColor blueColor] setFill];
//    UIBezierPath * circularPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 90) radius:90 startAngle:45 endAngle:90 clockwise:YES];
//    [circularPath stroke];
//

//UIGestureRecognizer - Began
//UIGestureRecognizer - changed


@end
