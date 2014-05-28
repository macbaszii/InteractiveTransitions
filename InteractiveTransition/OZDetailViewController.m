//
//  OZDetailViewController.m
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZDetailViewController.h"
#import "OZAnimal.h"
#import "OZBackToCollectionViewTransition.h"
#import "OZViewController.h"

@interface OZDetailViewController () <UINavigationControllerDelegate>

@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation OZDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.animal.title;
    self.imageView.image = self.animal.image;
    self.descriptionLabel.text = self.animal.description;
    
    UIScreenEdgePanGestureRecognizer *panGesture = [[UIScreenEdgePanGestureRecognizer alloc] init];
    [panGesture addTarget:self action:@selector(handlePanGesture:)];
    panGesture.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:panGesture];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

#pragma mark - Action 

- (void)handlePanGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
    CGFloat progress = [gesture translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        [self.interactiveTransition updateInteractiveTransition:progress];
    }
    else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        if (progress > 0.5) {
            [self.interactiveTransition finishInteractiveTransition];
        }
        else {
            [self.interactiveTransition cancelInteractiveTransition];
        }
        
        self.interactiveTransition = nil;
    }
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if (fromVC == self && [toVC isKindOfClass:OZViewController.class]) {
        return [[OZBackToCollectionViewTransition alloc] init];
    } else {
        return nil;
    }
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    if ([animationController isKindOfClass:[OZBackToCollectionViewTransition class]]) {
        return self.interactiveTransition;
    } else {
        return nil;
    }
}

@end
