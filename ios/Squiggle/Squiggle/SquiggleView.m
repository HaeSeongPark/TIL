//
//  SquiggleView.m
//  Squiggle
//
//  Created by rhino Q on 13/04/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//  https://stackoverflow.com/questions/25387940/how-to-draw-a-perfect-squiggle-in-set-card-game-with-objective-c

#import "SquiggleView.h"

typedef enum : NSUInteger
{
    solidShading=1,
    stripedShading=2,
    openShading=3,
    numShading=4,
} cardShading;

IB_DESIGNABLE
@implementation SquiggleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [self drawSquiggleInBounds:self.bounds withColor:[UIColor redColor] withShading:3];
    self.transform = CGAffineTransformRotate(self.transform, M_PI/2);
    
}


-(void)drawSquiggleInBounds:(CGRect)bounds withColor:(UIColor *)color withShading:(cardShading)shading
{
    if (shading > 3) {return;}
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [color setStroke];
    
    path.lineWidth = 2;
    
    [path moveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.05, bounds.origin.y + bounds.size.height*0.40)];
    
    [path addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.35, bounds.origin.y + bounds.size.height*0.25)
            controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.09, bounds.origin.y + bounds.size.height*0.15)
            controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.18, bounds.origin.y + bounds.size.height*0.10)];
    
    [path addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.75, bounds.origin.y + bounds.size.height*0.30)
            controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.40, bounds.origin.y + bounds.size.height*0.30)
            controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.60, bounds.origin.y + bounds.size.height*0.45)];

    [path addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.97, bounds.origin.y + bounds.size.height*0.35)
            controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.87, bounds.origin.y + bounds.size.height*0.15)
            controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.98, bounds.origin.y + bounds.size.height*0.00)];

    [path addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.45, bounds.origin.y + bounds.size.height*0.85)
            controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.95, bounds.origin.y + bounds.size.height*1.10)
            controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.50, bounds.origin.y + bounds.size.height*0.95)];

    [path addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.25, bounds.origin.y + bounds.size.height*0.85)
            controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.40, bounds.origin.y + bounds.size.height*0.80)
            controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.35, bounds.origin.y + bounds.size.height*0.75)];

    [path addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.05, bounds.origin.y + bounds.size.height*0.40)
            controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.00, bounds.origin.y + bounds.size.height*1.10)
            controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.005, bounds.origin.y + bounds.size.height*0.60)];
    
    [path closePath];
    
    [self drawShading:shading withColor:color inPath:path];
    
    
//    [path applyTransform:CGAffineTransformRotate(CGAffineTransformIdentity, M_PI/2)];
    [path stroke];
}

#define DISTANCE_BETWEEN_STRIPES 4

-(void)drawShading:(cardShading)shading withColor:(UIColor *)color inPath:(UIBezierPath *)beziePath
{
    switch (shading)
    {
        case 1:
            [color setFill];
            [beziePath fill];
            break;
        case 2:
            [self drawStripedShadingForPath:beziePath];
            break;
        default:
            break;
    }
}

-(void)drawStripedShadingForPath:(UIBezierPath *)pathOfSymbol
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGRect bounds = [pathOfSymbol bounds];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (int i = 0; i < bounds.size.width; i += DISTANCE_BETWEEN_STRIPES)
    {
        [path moveToPoint:CGPointMake(bounds.origin.x + i, bounds.origin.y)];
        [path addLineToPoint:CGPointMake(bounds.origin.x + i, bounds.origin.y + bounds.size.height)];
    }
    
    [pathOfSymbol addClip];
    
    [path stroke];
    
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}

@end

