//
//  OZViewController.h
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OZAnimalCell;
@class OZAnimal;

@interface OZViewController : UICollectionViewController

- (OZAnimalCell *)collectionViewCellForAnimal:(OZAnimal *)animal;

@end
