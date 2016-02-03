//
//  tourokuViewController.m
//  Genka!
//
//  Created by tgaiacontentsdev on 2016/01/29.
//  Copyright © 2016年 tgaiacontentsdev. All rights reserved.
//

#import "TourokuViewController.h"

@interface TourokuViewController()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSMutableArray *zairyouArray;
@property(weak,nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (nonatomic)NSMutableArray *meisyouArray;
@property (nonatomic)NSMutableArray *taniArray;
@property (nonatomic)NSMutableArray *kakakuArray;
@property (nonatomic)NSMutableArray *imageArray;

//@property (strong,nonatomic)NSMutableArray *zairyouIchiran;
    

@end

@implementation TourokuViewController

-(void)viewWillAppear:(BOOL)animated{
    //[super viewDidLoad];
    
    _barButton.enabled = NO;
    
   // NSMutableArray *zairyouIchiran = [NSMutableArray array ];
   // [zairyouIchiran addObject:@"新規登録"];
    
    _meisyouArray = [NSMutableArray array];
    _taniArray = [NSMutableArray array];
    _kakakuArray = [NSMutableArray array];
    _imageArray = [NSMutableArray array];
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    _meisyouArray = [nd objectForKey:@"meisyou"];
    _taniArray = [nd objectForKey:@"tani"];
    _kakakuArray = [nd objectForKey:@"kakaku"];
    _imageArray = [nd objectForKey:@"image"];

    NSLog(@"%lu",(unsigned long)[_meisyouArray count]);

}

//セクション
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  2;
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return  1;
    }else{
       return [_meisyouArray count];
        
    }
}

//セルの内容
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = @"新規登録";
        cell.imageView.image = [UIImage imageNamed:@"plus.png"];
        
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        
     //   if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
       // }
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.text = @"材料名\n単位";
        cell.detailTextLabel.text = @"価格";
        cell.imageView.image = [UIImage imageNamed:@"plus.png"];
        
        return cell;
    }
}

//セクションタイトル
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"新規登録";
    }else{
        return @"材料一覧（タップで編集）";
    }
}

//選択時の動作
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        [self performSegueWithIdentifier:@"syousaiView" sender:self];
    }
}


@end
