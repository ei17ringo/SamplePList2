//
//  DetailViewController.m
//  SamplePList
//
//  Created by Eriko Ichinohe on 2014/11/05.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",self.friendsList);
    
    NSLog(@"%@のお友達",self.friendsList[@"Name"]);
    
    //ナビゲーションコントローラーのタイトルに県名＋”のお友達”という文字列をセット
    [[self navigationItem] setTitle:[NSString stringWithFormat:@"%@のお友達",self.friendsList[@"Name"]]];
    
    //FriendListを配列に保存
    NSArray *friendListforTextView = [self.friendsList objectForKey:@"FriendList"];
    
    //連結した名前を保存する変数の初期化
    NSString *strNameList = @"";
    
    //高速列挙でデータを取り出して文字列変数にセット
    for (NSString *friendName in friendListforTextView) {
        strNameList = [NSString stringWithFormat:@"%@%@",strNameList,friendName];
    }
    
    NSLog(@"%@",strNameList);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
