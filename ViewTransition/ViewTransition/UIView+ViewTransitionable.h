//
//  NSObject+ViewTransitionable.h
//  ViewTransition
//
//  Created by Emiaostein on 5/12/16.
//  Copyright © 2016 Emiaostein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (ViewTransitionable)

- (void) transition;
- (void) transitionWithDuration:(NSTimeInterval)duration;
- (void) transitionWithDuration:(NSTimeInterval)duration beforeTransition:(void(^)(void))beforeHandler completion:(void(^)(BOOL finished))completedHandler;

@end
