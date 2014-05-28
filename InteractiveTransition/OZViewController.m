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

@interface OZViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *animals;

@end

@implementation OZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animals = [OZAnimal exampleAnimals];
    self.title = @"Oozou Zoo";
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"OZCollectionViewToDetail"]) {
        OZDetailViewController *detailVC = (OZDetailViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathForCell:sender];
        detailVC.animal = self.animals[selectedIndexPath.row];
    }
}

@end
