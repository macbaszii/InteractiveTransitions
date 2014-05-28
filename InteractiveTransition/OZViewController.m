//
//  OZViewController.m
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZViewController.h"
#import "OZAnimal.h"
#import "OZAnimalCell.h"
#import "OZDetailViewController.h"
#import "OZCollectionViewTransition.h"

@interface OZViewController () <UINavigationControllerDelegate>

@property (nonatomic, strong) NSArray *animals;

@end

@implementation OZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animals = [OZAnimal exampleAnimals];
    self.title = @"Oozou Zoo";
    
    self.navigationController.delegate = self;
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"OZCollectionViewToDetail"]) {
        OZDetailViewController *detailVC = (OZDetailViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathForCell:sender];
        detailVC.animal = self.animals[selectedIndexPath.row];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.animals.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *OZAnimalCellIdentifier = @"OZAnimalCell";
    OZAnimalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:OZAnimalCellIdentifier
                                                                   forIndexPath:indexPath];
    [cell configureItemWithAnimal:self.animals[indexPath.row]];
    
    return cell;
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if (fromVC == self && [toVC isKindOfClass:OZDetailViewController.class]) {
        return [[OZCollectionViewTransition alloc] init];
    } else {
        return nil;
    }
}

#pragma mark - Helper method

- (OZAnimalCell *)collectionViewCellForAnimal:(OZAnimal *)animal {
    NSUInteger animalIndex = [self.animals indexOfObject:animal];
    
    if (animalIndex == NSNotFound) {
        return nil;
    }
    
    OZAnimalCell *cell = (OZAnimalCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:animalIndex inSection:0]];
    return cell;
}

@end
