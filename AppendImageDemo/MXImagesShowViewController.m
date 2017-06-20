//
//  MXImagesShowViewController.m
//  AppendImageDemo
//
//  Created by yangshucheng on 2017/6/13.
//  Copyright © 2017年 yangshucheng. All rights reserved.
//

#import "MXImagesShowViewController.h"
#import "MXImageCell.h"
#import "Masonry.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
@interface MXImagesShowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    int collectionViewHeight;
    int imageIndex;
}


@property (nonatomic) UICollectionView *mainCollectionView;
@end

@implementation MXImagesShowViewController
@synthesize images;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"宽=%.f,高=%.f",kScreenWidth,kScreenHeight);
    collectionViewHeight = 160;
    imageIndex = 1;
    self.view.backgroundColor = [UIColor whiteColor];
    if (!images) {
        images = [NSMutableArray array];
    }
//    for (int i = 0; i < 3; i ++) {
//        [images addObject:[UIImage imageNamed:@"123.png"]];
//    }
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addImage)];
    _mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    _mainCollectionView.scrollEnabled = NO;
    _mainCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mainCollectionView];
    [self.mainCollectionView registerClass:[MXImageCell class] forCellWithReuseIdentifier:@"MXImageCell"];
    UIEdgeInsets padding = UIEdgeInsetsMake(8, 8, 8, 8);
    [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.topMargin.equalTo(@(padding.top));
//        make.topMargin.equalTo(@(padding.top));
//        make.topMargin.equalTo(@(padding.top));
        make.left.equalTo(self.view.mas_left).offset(8);
        make.right.equalTo(self.view.mas_right).offset(-8);
        make.top.equalTo(self.view.mas_top).offset(8);
        make.height.equalTo(@(collectionViewHeight));
    }];
    // Do any additional setup after loading the view.
}

-(void)addImage
{
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",imageIndex]];
    [images insertObject:img atIndex:images.count];
//    [images addObject:img];
    int imagesCount = (int)images.count;
    collectionViewHeight = 160 + 160 * ((int)imagesCount / 4) + 2 * ((int)imagesCount / 4);
    [_mainCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(collectionViewHeight));
    }];
    NSInteger index =  [images indexOfObject:img];
    [self.mainCollectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]];
    imageIndex +=1;
}

#pragma mark UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return images.count+1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MXImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MXImageCell" forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[MXImageCell alloc]initWithFrame:CGRectMake(0, 0, (kScreenWidth-16-6)/4, 160)];
//    }
    if (images.count == 0) {
        [cell setLastIncrease];
    }
    else if (indexPath.row == images.count){
        [cell setLastIncrease];
    }
    else{
        [cell setImage:images[indexPath.row]];

    }
    cell.layer.masksToBounds = YES;
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = [UIColor lightTextColor].CGColor;
    cell.layer.cornerRadius = 5;
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (isPad) {
        return CGSizeMake((kScreenWidth-16-10)/6, 200);
    }
    return CGSizeMake((kScreenWidth-16-6)/4, 160);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == images.count) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"%@",action.title);
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"%@",action.title);
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"%@",action.title);
        }]];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
}
@end
