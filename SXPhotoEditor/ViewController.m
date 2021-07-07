//
//  ViewController.m
//  SXPhotoEditor
//
//  Created by Ba Ban on 4/8/20.
//  Copyright © 2020 Ba Ban. All rights reserved.
//

#import "ViewController.h"
#import "LFPhotoEditingController.h"

@interface ViewController () <LFPhotoEditingControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addMyButton];
}

- (void)addMyButton {

    UIButton *button= [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Start Photo Editor" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:button];
    [button.widthAnchor constraintEqualToConstant:self.view.frame.size.width/2].active = YES;
    [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}

- (void)buttonClicked:(UIButton*)sender {
    UIImage *image = [UIImage imageNamed:@"A4"];
    [self startPhotoEditor:image];
 }

- (void)startPhotoEditor:(UIImage *)image {
    LFPhotoEditingController *lfPhotoEditVC = [[LFPhotoEditingController alloc] init];
    lfPhotoEditVC.delegate = self;
    [lfPhotoEditVC setEditImage:image durations:nil];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:lfPhotoEditVC];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - LFPhotoEditingControllerDelegate
- (void)lf_PhotoEditingControllerDidCancel:(LFPhotoEditingController *)photoEditingVC {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)lf_PhotoEditingController:(LFPhotoEditingController *)photoEditingVC didFinishPhotoEdit:(LFPhotoEdit *)photoEdit caption:(NSString *)caption {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (photoEdit) {
        // photoEdit.editPreviewImage
    }
}


@end
