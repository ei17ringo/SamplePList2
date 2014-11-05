//
//  ViewController.m
//  SamplePList
//
//  Created by Eriko Ichinohe on 2014/11/04.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()
{
    NSArray *_pList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパス（場所）を指定
    NSString *path = [bundle pathForResource:@"FriendsPerArea" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //取得できた配列のデータをメンバ変数に代入
    _pList = [dic objectForKey:@"PrefectureList"];
    
    //_pList = @[@"北海道",@"青森県",@"岩手県"];
    
    self.pListTableView.dataSource = self;
    self.pListTableView.delegate = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _pList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdetifier = @"Cell";
    
    //セルの再利用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdetifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdetifier];
    }
    
    NSDictionary *FriendsWithArea = _pList[indexPath.row];
    
    cell.textLabel.text = [FriendsWithArea objectForKey:@"Name"];
    
    return cell;
    
}

//セルがタップされた時に発動するメソッド
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //画面遷移するViewControllerのカプセル化（インスタンス化）
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    //選択された地域の情報をDetailViewControllerに渡す
    dvc.friendsList = _pList[indexPath.row];
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
