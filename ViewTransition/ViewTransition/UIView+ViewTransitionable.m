//
//  NSObject+ViewTransitionable.m
//  ViewTransition
//
//  Created by Emiaostein on 5/12/16.
//  Copyright © 2016 Emiaostein. All rights reserved.
//

#import "UIView+ViewTransitionable.h"

@implementation UIView (ViewTransitionable)

- (void) transition {
    [self transitionWithDuration:0.3];
}

- (void) transitionWithDuration:(NSTimeInterval)duration {
    [self transitionWithDuration:duration beforeTransition:nil completion:nil];
}

- (void) transitionWithDuration:(NSTimeInterval)duration beforeTransition:(void(^)(void))beforeHandler completion:(void(^)(BOOL finished))completedHandler {
    __block typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *sf = weakSelf;
        UIView *superView = sf.superview;
        if (superView == nil) {
            return;
        }
        beforeHandler();
        BOOL superClipToBounds = superView.clipsToBounds;
        superView.clipsToBounds = YES;
        UIView *snapshot = [superView snapshotViewAfterScreenUpdates:false];
        [superView insertSubview:snapshot atIndex:0];
        sf.transform = CGAffineTransformMakeTranslation(0, superView.bounds.size.height);
        
        [UIView animateWithDuration:duration animations:^{
            
            sf.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            if (finished) {
                [snapshot removeFromSuperview];
                superView.clipsToBounds = superClipToBounds;
                completedHandler(finished);
            }
        }];
    });
}

@end
