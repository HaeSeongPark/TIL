//
//  FireworkView.h
//  Firework
//
//  Created by kunii on 10/07/18.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FireworkView : UIView {
	NSMutableArray*	fireworks;		//	firework 배열 
	NSTimer*		updateTimer;	//	화면 갱신용 타이머 
}

//	애니메이션 정지 
-(void)stop;
@end
