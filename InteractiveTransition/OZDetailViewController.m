//
//  OZDetailViewController.m
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZDetailViewController.h"
#import "OZAnimal.h"

@interface OZDetailViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;

@end

@implementation OZDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.animal.title;
    self.imageView.image = self.animal.image;
    self.descriptionLabel.text = self.animal.description;
}

@end
