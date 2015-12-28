//
//  ViewController.m
//  jiuGongGeLayout
//
//  Created by mac on 15/12/28.
//  Copyright © 2015年 A3. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *shopsView;
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(UIButton *)sender {
    /****************一些常用的变量 begin**************/
    //每一行的列数
    NSUInteger colsPerRow = 3;
    //获得当前商品的索引
    NSUInteger index = self.shopsView.subviews.count;
    //商品宽度
    CGFloat shopW=50;
    //商品高度
    CGFloat shopH =50;
    /****************一些常用的变量 end**************/
    
    /****************计算X值**************/
    //求出列号
    NSUInteger col = index % colsPerRow;
    //每一列之间的间距
    CGFloat xMargin = (self.shopsView.frame.size.width - colsPerRow * shopW - 40) / (colsPerRow -1);
    //商品X
    CGFloat shopX=(shopW + xMargin) * col;
    /**************** end **************/
    
    /**************** 计算Y值 **************/
    //求出行值
    NSUInteger row = index / colsPerRow;
    //每一行之间的间距
    CGFloat yMargin =20;
    //商品Y
    CGFloat shopY = (shopW + yMargin) *row;
    /**************** 计算Y值 end**************/
    
    //创建一个商品父控件
    UIView *shopView = [[UIView alloc]init];
    shopView.frame = CGRectMake(shopX, shopY, shopW, shopH);
    //将商品父控件添加到shopView中
    [self.shopsView addSubview:shopView];
    
    /**************** 添加图片 **************/
    //原始添加
    UIImageView *iconView = [[UIImageView alloc] init];
    
    //设置图片大小
    iconView.frame = CGRectMake(20, 0, shopW, shopH);
    [shopView addSubview:iconView];

    
    /**************** 添加数据 end **************/
    /**
     *  添加数据的几种形式1.普通加载
     */
    //添加图片数据
    iconView.image = [UIImage imageNamed:@"add"];

    /** 懒加载*/
    //加载一次就不在加载 建议用plist.
    /**************** 添加数据 end **************/
    
    /**************** 设置按钮状态 **************/
    self.removeBtn.enabled = YES;
    self.addBtn.enabled = (self.shopsView.subviews.count < 9);
}

/**************** 1.移除商品**************/
- (IBAction) remove{
    [self.shopsView.subviews.lastObject removeFromSuperview];
    
    /**************** 设置按钮状态 **************/
    self.addBtn.enabled = YES;
    self.removeBtn.enabled = (self.shopsView.subviews.count > 0);
}


@end
