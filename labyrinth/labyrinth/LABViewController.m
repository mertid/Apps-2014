//
//  LABViewController.m
//  labyrinth
//
//  Created by Merritt Tidwell on 8/14/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "LABViewController.h"
#import "LABGraphView.h"
#import "CoreMotion/CoreMotion.h"

@interface LABViewController ()<UICollisionBehaviorDelegate>

@end

@implementation LABViewController

{
    CMMotionManager * motionManager;
    UIDynamicAnimator * animator;
    UIGravityBehavior * gravityBehavior;
    UICollisionBehavior * collisionBehavior;
    UIDynamicItemBehavior * wallBehavior;
    UIView * finishPoint;

    
    float xRotation;
    float yRotation;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    animator =[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    gravityBehavior =[[UIGravityBehavior alloc]init];
    [animator addBehavior:gravityBehavior];
    
    collisionBehavior = [[UICollisionBehavior alloc]init];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];
    
    wallBehavior =[[UIDynamicItemBehavior alloc]init];
    wallBehavior.density = 10000000000000;
    [animator addBehavior:wallBehavior];
    
    collisionBehavior.collisionDelegate = self;

    [collisionBehavior addBoundaryWithIdentifier:@"finish" fromPoint: CGPointMake(SCREEN_WIDTH +90,460 ) toPoint:CGPointMake(SCREEN_WIDTH + 80, SCREEN_HEIGHT -40)];
    
    
    
    [super viewDidLoad];
   
//    LABGraphView * graphView = [[LABGraphView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
    
    UIView * ball = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30 ,30)];
   // ball.center = self.view.center;
    ball.backgroundColor = [UIColor magentaColor];
    ball.layer.cornerRadius = 15;

    
    [self.view addSubview:ball];
    
    
    [gravityBehavior addItem:ball];
    [collisionBehavior addItem:ball];

    finishPoint = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH +190, SCREEN_HEIGHT-550 , 30, 30)];
    finishPoint.layer.cornerRadius = 15;
    finishPoint.backgroundColor = [UIColor greenColor];
    [self.view addSubview:finishPoint];
   
    
    
    
    UIView * wall = [[UIView alloc]initWithFrame:CGRectMake(70, -10, 50,220)];
    wall.backgroundColor =  [UIColor colorWithRed:0.714f green:0.651f blue:0.490f alpha:1.0f];
    wall.layer.cornerRadius= 15;
    [self.view addSubview:wall];
    

    [collisionBehavior addItem:wall];
    
    
   
    
    UIView * wall2 = [[UIView alloc]initWithFrame:CGRectMake(270, -10, 50,220)];
    wall2.backgroundColor =  [UIColor colorWithRed:0.714f green:0.651f blue:0.490f alpha:1.0f];
    wall2.layer.cornerRadius = 15;
    [self.view addSubview:wall2];
    
    
    [collisionBehavior addItem:wall2];

    UIView * wall3 = [[UIView alloc]initWithFrame:CGRectMake(410, 65, 100,50)];
    wall3.backgroundColor =  [UIColor colorWithRed:0.714f green:0.651f blue:0.490f alpha:1.0f];
    wall3.layer.cornerRadius = 15;
    [self.view addSubview:wall3];
    
    
    [collisionBehavior addItem:wall3];
    
    UIView * wall4 = [[UIView alloc]initWithFrame:CGRectMake(320, 170, 100,50)];
    wall4.backgroundColor =  [UIColor colorWithRed:0.714f green:0.651f blue:0.490f alpha:1.0f];
    wall4.layer.cornerRadius = 15;
    [self.view addSubview:wall4];

    
    [collisionBehavior addItem:wall4];
    
    UIView * wall5 = [[UIView alloc]initWithFrame:CGRectMake(165, 240, 50,100)];
    wall5.backgroundColor =  [UIColor colorWithRed:0.714f green:0.651f blue:0.490f alpha:1.0f];
    wall5.layer.cornerRadius = 15;
    [self.view addSubview:wall5];
    
    
    [collisionBehavior addItem:wall5];
    
    UIView * wall6 = [[UIView alloc]initWithFrame:CGRectMake(165, 120, 50,100)];
    wall6.backgroundColor =  [UIColor colorWithRed:0.714f green:0.651f blue:0.490f alpha:1.0f];
    wall6.layer.cornerRadius = 15;
    [self.view addSubview:wall6];
    
    
    [collisionBehavior addItem:wall6];
    
    
   
    
    
    //
//    [self.view addSubview:graphView];

    
    // Do any additional setup after loading the view.

   motionManager = [[CMMotionManager alloc]init];

   [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
    
       NSLog(@"x %f y %f z %f",motion.rotationRate.x, motion.rotationRate.y, motion.rotationRate.z);

       xRotation += motion.rotationRate.y/30;
       yRotation += motion.rotationRate.x/30;
       
       [self updateGravity];
    
    ////if (graphView.xPlots.count == self.view.frame.size.height/10)
////        
////        
////        {
////            [graphView.xPlots removeObjectAtIndex:0];
////        }
////        
////        [graphView.xPlots addObject:@(motion.rotationRate.x)];
////        [graphView setNeedsDisplay];
//
    
       
    }];
    
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if([@"finish" isEqualToString:(NSString *)identifier])
    {
        UIView * finishPoint2 = (UIView *) item;
        
        [collisionBehavior removeItem:finishPoint2];
        [finishPoint2 removeFromSuperview];
    }
        
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event


{
    xRotation= yRotation = 0;
    [self updateGravity];

}


-(void)updateGravity
{
    gravityBehavior.gravityDirection = CGVectorMake(xRotation, yRotation);
}
    
    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)prefersStatusBarHidden
{
   return YES;
}


@end
