//
//  OZBackToCollectionViewTransition.m
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZBackToCollectionViewTransition.h"

#import "OZViewController.h"
#import "OZDetailViewController.h"
#import "OZAnimalCell.h"

static CGFloat const animationDuration = 0.5;

@implementation OZBackToCollectionViewTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    OZDetailViewController *fromViewController = (OZDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    OZViewController *toViewController = (OZViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *detailImageSnapshot = [fromViewController.imageView snapshotViewAfterScreenUpdates:NO];
    detailImageSnapshot.frame = [containerView convertRect:fromViewController.imageView.frame fromView:fromViewController.imageView.superview];
    fromViewController.imageView.hidden = YES;
    
    OZAnimalCell *cell = [toViewController collectionViewCellForAnimal:fromViewController.animal];
    cell.imageView.hidden = YES;
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    [containerView addSubview:detailImageSnapshot];
    
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         fromViewController.view.alpha = 0.0;
                         
                         detailImageSnapshot.frame = [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
                     }
                     completion:^(BOOL finished) {
                         [detailImageSnapshot removeFromSuperview];
                         fromViewController.imageView.hidden = NO;
                         cell.imageView.hidden = NO;
                         
                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                     }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return animationDuration;
}

@end
