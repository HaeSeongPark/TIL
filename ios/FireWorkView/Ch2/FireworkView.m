//
//  FireworkView.m
//  Firework
//
//  Created by kunii on 10/07/18.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FireworkView.h"

@interface Firework : NSObject {
	CGPoint			center;		//	불꽃의 중심좌표
	double			radius;		//	불꽃의 반경
	NSTimer*		livetimer;	//	불꽃의 크기를 변화시키는 타이머
	NSMutableArray*	owner;		//	자신을 등록하는 배열 
	UIView*			view;		//	자신이 그려질 UIView
	NSTimeInterval	start;		//	시작시간 
}
@end

@implementation Firework 

//	초기화 
-(id)initWithCenter:(CGPoint)point owner:(NSMutableArray*)inOwner view:(UIView*)inView {
	if (self == [super init]) {
		owner = inOwner;
		view = inView;
		center = point;
		radius = 1.0;
		start = [[NSDate date] timeIntervalSince1970];	//	시작 시간을 기억  
		livetimer = [NSTimer scheduledTimerWithTimeInterval:0.1 
			target:self selector:@selector(step:) userInfo:nil repeats:YES];
	}
	return self;
}

//	하나의 불똥을 그린다
-(void)drawOne:(double)x y:(double)y {
	CGContextRef context = UIGraphicsGetCurrentContext();
	[[UIColor colorWithRed:0.5 green:0.5 blue:1.0 alpha:1.0] setFill];
	CGContextSetBlendMode(context, kCGBlendModePlusLighter);
	CGRect rect = CGRectMake(x, y, 3, 3);
	CGContextFillRect(context, rect);
}

//	불꽃을 그린다 
-(void)draw {
	#define PAI 3.14
	#define FIRE_COUNT 20		//	20개의 불똥을 사용한다
	for (int i = 0; i < FIRE_COUNT; i++) {
		double angle = 2 * PAI * i / FIRE_COUNT;
		double x = center.x + cos(angle) * radius;
		double y = center.y + sin(angle) * radius;
		[self drawOne:x y:y];
	}
}

//	조금씩 크게 한다 (시작시간부터의 경과로 변경을 결정)
-(void)next {
	NSTimeInterval current = [[NSDate date] timeIntervalSince1970];
	radius = (current - start) * 100/3;
}

//	정지 
-(void)stop {
	[livetimer invalidate];			//	타이머 해제 
	livetimer = nil;				//	dealloc에서 이중으로 타이머 해제하지 않게	
}

//	타이머로부터의 호출. 반경이 100을 넘으면 끝
-(void)step:(NSTimer*)timer {
	[self next];
	if (radius > 100) {
		[self stop];				//	타이머 해제 
		[owner removeObject:self];	//	배열에서 삭제 
	}
}
@end


@implementation FireworkView

//	그리기 
- (void)drawRect:(CGRect)rect {
	for (Firework* f in fireworks) {
		[f draw];
	}
}

//	타이머에서의 호출. 화면을 갱신한다
-(void)requestUpdate:(NSTimer*)timer {
	[self setNeedsDisplay];
}

//	손가락의 시작에 맞춰 Firework를 작성한다 
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if (!updateTimer) {
		//	갱신 타이머 설정 
		updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 
													   target:self 
													 selector:@selector(requestUpdate:) 
													 userInfo:nil 
													  repeats:YES];
	}
	if (!fireworks) {
		//	firework용 배열 준비 
		fireworks = [[NSMutableArray alloc] init];
	}
	//	손가락 위치에 Firework 작성 
	UITouch* t = [touches anyObject];
	CGPoint pt = [t locationInView:self];

	static CGPoint lastpt = {0,0}; 
	double dx = lastpt.x - pt.x; 
	double dy = lastpt.y - pt.y;
	if (sqrt(dx * dx + dy * dy) <= 50) {	//50픽셀이상 떨어지지 않아 만들지 않는다
//		return;
	}
	lastpt = pt;							//	새로운 위치를 설정 
	Firework* f = [[Firework alloc] initWithCenter:pt owner:fireworks view:self];
	[fireworks addObject:f];				//	Firework배열에 등록
}

//	정지 
- (void)stop {
	[updateTimer invalidate];				//	갱신 타이머 해제
	updateTimer = nil;
	//	fireworks배열의 모든 Firework 오브젝트를 정지한다 
	for (Firework* f in fireworks) {
		[f stop];
	}
	fireworks = nil;
}

@end
