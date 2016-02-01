//
//  syousaiViewController.m
//  Genka!
//
//  Created by tgaiacontentsdev on 2016/01/29.
//  Copyright © 2016年 tgaiacontentsdev. All rights reserved.
//

#import "syousaiViewController.h"

@interface syousaiViewController()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (strong,nonatomic)UIImagePickerController *imagePickerController;
@property (strong,nonatomic) UIImage *zairyouImage;
@property (weak,nonatomic)IBOutlet UIButton *zairyouButton;
-(IBAction)zairyouButtonAction:(id)sender;


@end

@implementation syousaiViewController


-(IBAction)zairyouButtonAction:(id)sender{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.cameraViewTransform = CGAffineTransformTranslate(imagePickerController.cameraViewTransform, 0, 50);
        
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
        
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    _zairyouImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [_zairyouButton setBackgroundImage:_zairyouImage forState:UIControlStateNormal];
     [_imagePickerController dismissViewControllerAnimated:YES completion:nil];
    
}

@end



