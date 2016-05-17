//
//  ViewController.m
//  UICollectionView
//
//  Created by jianfeng on 15/3/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "KFC.h"
#import "Cell.h"

#define kID @"Cell"
#define kItemWidth 100
#define kItemHeight 100

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *collectionView;
    NSArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self initData];
    
}

- (void)initView
{
    /* UICollectionView must be initialized with a non-nil layout parameter
     * UICollectionView必须要用一个非空的布局参数(layout)进行初始化
     */
    
    // layout是UICollectionView的精髓
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 调整每个个子的大小
    layout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
    // 调整每行之间的宽度
    layout.minimumLineSpacing = 20;
    // 调整上下左右的边距
    //    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    CGFloat space = ([UIScreen mainScreen].bounds.size.width - 2 * kItemWidth)/3.0;
    layout.sectionInset = UIEdgeInsetsMake(20, space, 20, space);
    
    collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    // 默认情况下,如果collectionViewCell的个数比较少(没有超过屏幕显示范围)便不会支持竖直方向上的滚动
    // 将alwaysBounceVertical属性设置为yes,表示始终支持竖直方向上的滚动
    // 方便以后添加下拉刷新等功能
    collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:collectionView];
    
    //    collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // bundle传值为空表示在mainBundle中
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle:nil] ;
    // 向collectionView注册一个nib文件(一个类)
    // 告诉collectionView将来需要创建怎样的cell
    // 此方法需要和dequeueReusableCellWithReuseIdentifier:forIndexPath:配对使用
    [collectionView registerNib:nib forCellWithReuseIdentifier:kID];
    
//    [collectionView registerClass:[Cell class] forCellWithReuseIdentifier:kID];
}

- (void)initData
{
    // 从plist里面初始化原始数组(数组里面存放的是字典)
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"KFC.plist" ofType:nil];
    NSArray *orginArray = [NSArray arrayWithContentsOfFile:filePath];
    
    // 将原始的数据转化成模型的数组
    NSMutableArray *modelArray = [NSMutableArray array];
    for (int i = 0; i < orginArray.count; i++) {
        KFC *kfc = [KFC kfcWithDic:orginArray[i]];
        [modelArray addObject:kfc];
    }
    array = modelArray;
}

#pragma mark - UICollectionViewDataSource

// 一共有多少组数据(同UITableView)
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// 展示的格子的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return array.count;
}

// 每个cell的样式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // indexPath.row     表示对应组的第几个item(不是第几行)
    // indexPath.secton  表示第几组
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID forIndexPath:indexPath];
    cell.model = array[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
}



@end
