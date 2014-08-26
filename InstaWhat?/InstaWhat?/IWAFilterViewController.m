//
//  IWAFilterViewController.m
//  InstaWhat?
//
//  Created by Merritt Tidwell on 8/25/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "IWAFilterViewController.h"
#import "IWAImageViewController.h"
@interface IWAFilterViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>


@end

@implementation IWAFilterViewController
{

    UIImageView * imageView;
    UICollectionView * filterCollection;
    NSArray * filters;
    NSMutableArray * filterImages;

}


- (instancetype)init
{
    self = [super init];
    if (self) {
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
        filterImages =[@[]mutableCopy];
        
        
    [self.view addSubview:imageView];
   
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100,100);
        
        
        
        filterCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 320, 320, [UIScreen mainScreen].bounds.size.height -320) collectionViewLayout:layout];
        
        filterCollection.backgroundColor = [UIColor colorWithRed:0.984f green:0.435f blue:0.192f alpha:1.0f];

        
        filterCollection.dataSource = self;
        filterCollection.delegate = self;
        
        [filterCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        [self.view addSubview:filterCollection];
        
    
        filters = @[
                    @"CIColorCrossPolynomial",
                    @"CIColorCube",
                    @"CIColorCubeWithColorSpace",
                    @"CIColorInvert",
//                    @"CIColorMap",
//                    @"CIColorMonochrome",
//                    @"CIColorPosterize",
//                    @"CIFalseColor",
//                    @"CIMaskToAlpha",
//                    @"CIMaximumComponent",
//                    @"CIMinimumComponent",
//                    @"CIPhotoEffectChrome",
//                    @"CIPhotoEffectFade",
//                    @"CIPhotoEffectInstant",
//                    @"CIPhotoEffectMono",
//                    @"CIPhotoEffectNoir",
//                    @"CIPhotoEffectProcess",
//                    @"CIPhotoEffectTonal",
//                    @"CIPhotoEffectTransfer",
//                    @"CISepiaTone",
//                    @"CIVignette",
//                    @"CIVignetteEffect"
                    ];
        
        
        
        
    
    }
    return self;
}
-(void)setOrginalImage:(UIImage *)orginalImage

{
    _orginalImage = orginalImage;
    
    imageView.image = orginalImage;
    


}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{
    return filters.count;


}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{

    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

   
    
    NSString * filterName = filters[indexPath.item];
    
    
    
    UIImageView * filterView = [[UIImageView alloc]initWithFrame:cell.bounds];
    
//    filterView.image = [self filterImageWithFilterName:filterName];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
     
        UIImage * filterImage = [self filterImageWithFilterName:filterName]
        ;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            filterView.image = filterImage;
            [filterImages addObject:filterImage];
        });
   
    
    
    });
    
    [cell addSubview:filterView];
    
    return cell;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIImage *)filterImageWithFilterName:(NSString *)filterName
{

    //turn UI image into CIImage
    
    
    CIImage * ciImage = [CIImage imageWithCGImage:self.orginalImage.CGImage];
    
    // create cifilter with filtername
    
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    //add ciimage to the filter
    
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    
    // get filtered image from the filter
    
    CIImage * ciResult = [filter outputImage];
    
    // setup context to turn ciimage into cgimage
    
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    
    //init uiimage with cgimage
    
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect: [ciResult extent]]];
    



}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    IWAImageViewController * viewImageC = [[IWAImageViewController alloc]init];
   
    
    
    viewImageC.secondImage = filterImages[indexPath.item];

    
    
    [self.navigationController pushViewController:viewImageC animated:YES];

    
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
