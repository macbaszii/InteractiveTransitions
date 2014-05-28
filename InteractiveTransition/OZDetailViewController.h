//
//  OZDetailViewController.h
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OZAnimal;

@interface OZDetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, weak) OZAnimal *animal;

@end
