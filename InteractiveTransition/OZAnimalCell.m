//
//  OZAnimalCell.m
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZAnimalCell.h"
#import "OZAnimal.h"

@implementation OZAnimalCell

- (void)configureItemWithAnimal:(OZAnimal *)animal {
    self.titleLabel.text = animal.title;
    self.imageView.image = animal.image;
}

@end
