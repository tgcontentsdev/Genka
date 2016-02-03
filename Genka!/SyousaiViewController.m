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
@property (weak,nonatomic) UIView *imagePickerView;
@property(weak,nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak,nonatomic)IBOutlet UIButton *cameraButton;
@property(weak,nonatomic)IBOutlet UIButton *albumButton;
@property (strong,nonatomic) UIImage *zairyouImage;
@property (weak,nonatomic)IBOutlet UIButton *zairyouButton;
@property (nonatomic)NSMutableArray *meisyouArray;
@property (nonatomic)NSMutableArray *taniArray;
@property (nonatomic)NSMutableArray *kakakuArray;
@property (nonatomic)NSMutableArray *imageArray;

@property (nonatomic)IBOutlet UIButton *enterButton;
@property (nonatomic)IBOutlet UITextField *meisyouField;
@property (nonatomic)IBOutlet UITextField *taniField;
@property (nonatomic)IBOutlet UITextField *kakakuField;
-(IBAction)zairyouButtonAction:(id)sender;
-(IBAction)cameraButton:(id)sender;
-(IBAction)albumButton:(id)sender;
-(IBAction)enterButtonAction:(id)sender;
-(IBAction)keyExit:(UITextField*)sender;
-(IBAction)keyEnd:(UITapGestureRecognizer*)sender;

@end

@implementation syousaiViewController

-(void)viewDidLoad{
    _imagePickerView.hidden = YES;
    _cameraButton.hidden = YES;
    _albumButton.hidden = YES;
    _barButton.enabled = NO;
    
    _meisyouArray = [NSMutableArray array];
    _taniArray = [NSMutableArray array];
    _kakakuArray = [NSMutableArray array];
    _imageArray = [NSMutableArray array];
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    _meisyouArray = [nd objectForKey:@"meisyou"];
    _taniArray = [nd objectForKey:@"tani"];
    _kakakuArray = [nd objectForKey:@"kakaku"];
    _imageArray = [nd objectForKey:@"image"];
   
    
}

-(IBAction)zairyouButtonAction:(id)sender{
    _imagePickerView.hidden = NO;
    _cameraButton.hidden = NO;
    _albumButton.hidden = NO;
    
}

-(IBAction)cameraButton:(id)sender{

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
    
    _imagePickerView.hidden = YES;
    _cameraButton.hidden = YES;
    _albumButton.hidden = YES;
    
    _zairyouImage = [info objectForKey:UIImagePickerControllerEditedImage];
    [_zairyouButton setBackgroundImage:_zairyouImage forState:UIControlStateNormal];
    [_zairyouButton setImage:nil forState:UIControlStateNormal];
     [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(IBAction)albumButton:(id)sender{
    
    _imagePickerController =[[UIImagePickerController alloc]init];
    _imagePickerController.delegate = self;
    
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _imagePickerController.allowsEditing = YES;
    
      [self presentViewController:_imagePickerController animated:YES completion:nil];
    
}

-(IBAction)enterButtonAction:(id)sender{
    NSString *newMeisyou = _meisyouField.text;
    NSString *newtani = _taniField.text;
    NSString *newKakaku = _kakakuField.text;
    UIImage *newImage = _zairyouImage;
    
    
    
    [_meisyouArray addObject:newMeisyou];
    [_taniArray addObject:newtani];
    [_kakakuArray addObject:newKakaku];
    [_imageArray addObject:newImage];
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setObject:_meisyouArray forKey:@"meisyou"];
    [nd setObject:_taniArray forKey:@"tani"];
    [nd setObject:_kakakuArray forKey:@"kakaku"];
    [nd setObject:_imageArray forKey:@"image"];
    
    [nd synchronize];
    
     NSLog(@"%lu",(unsigned long)[_meisyouArray count]);
     NSLog(@"%lu",(unsigned long)[_taniArray count]);
     NSLog(@"%lu",(unsigned long)[_kakakuArray count]);
     NSLog(@"%lu",(unsigned long)[_imageArray count]);
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)keyExit:(UITextField *)sender{
    [sender resignFirstResponder];
}

-(IBAction)keyEnd:(UITapGestureRecognizer *)sender{
    [self.view endEditing:YES];
}

@end



