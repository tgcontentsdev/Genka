//
//  tourokuViewController.m
//  Genka!
//
//  Created by tgaiacontentsdev on 2016/01/29.
//  Copyright © 2016年 tgaiacontentsdev. All rights reserved.
//

#import "TourokuViewController.h"

@interface TourokuViewController()<UITableViewDataSource,UITableViewDelegate>
    


//@property (strong,nonatomic)NSMutableArray *zairyouIchiran;
    

@end

@implementation TourokuViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
   // NSMutableArray *zairyouIchiran = [NSMutableArray array ];
   // [zairyouIchiran addObject:@"新規登録"];

    
    
    
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
        return 13;
    }
}

//セルの内容
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = @"新規登録";
        
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = @"材料名\n価格";
        
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
