//
//  OZCollectionViewTransition.m
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZCollectionViewTransition.h"

#import "OZViewController.h"
#import "OZDetailViewController.h"
#import "OZAnimalCell.h"

static CGFloat const animationDuration = 0.4;

@implementation OZCollectionViewTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    OZViewController *fromViewController = (OZViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    OZDetailViewController *toViewController = (OZDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    OZAnimalCell *animatedCell = (OZAnimalCell *)[fromViewController.collectionView cellForItemAtIndexPath:[[fromViewController.collectionView indexPathsForSelectedItems] firstObject]];
    
    UIView *animatedCellSnapshot = [animatedCell.imageView snapshotViewAfterScreenUpdates:NO];
    animatedCellSnapshot.frame = [containerView convertRect:animatedCell.imageView.frame
                                                   fromView:animatedCell.imageView.superview];
    animatedCell.imageView.hidden = YES;
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0.0;
    toViewController.imageView.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:animatedCellSnapshot];
    
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         toViewController.view.alpha = 1.0;
                         
                         animatedCellSnapshot.frame = [containerView convertRect:toViewController.imageView.frame fromView:toViewController.view];
                     }
                     completion:^(BOOL finished) {
                         toViewController.imageView.hidden = NO;
                         animatedCell.hidden = NO;
                         [animatedCellSnapshot removeFromSuperview];
                         
                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                         
                     }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return animationDuration;
}

@end
