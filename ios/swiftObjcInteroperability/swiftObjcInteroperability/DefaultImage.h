//
//  DefaultImage.h
//  swiftObjcInteroperability
//
//  Created by rhino Q on 31/08/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//
// objc파일에서 swift코드 끌어오는 것
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DefaultImage : NSObject
    + (UIImage *)generateDefaultImageOfSize:(CGSize)size;

@end
