//
//  TodayViewController.m
//  gomi_alpha
//
//  Created by Naoki on 2014/11/30.
//  Copyright (c) 2014年 vidacomoda. All rights reserved.
//

#import "TodayViewController.h"

@interface TodayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblCurrent;
@property (weak, nonatomic) IBOutlet UIImageView *imgCurrent;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (void)refreshCurrent:(NSDate*) date {
    NSDate* curDate = date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM月dd日(E)";
    NSString *strCurDate = [dateFormatter stringFromDate:curDate];
    
    NSLog(@"Refresh to date= [%@]", strCurDate);
    _lblCurrent.text = strCurDate;
    
}

- (IBAction)doRefresh:(id)sender {
    NSDate* now = [NSDate date];
    [self refreshCurrent:now];
    //_imgCurrent.image = [UIImage imageNamed:@"can.png"];
}

- (UIImage*)getImage:(NSString*)icons {
    
    NSDictionary * dbIcon = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"can.png"        ,@"カン",
                             @"plastic.png"    ,@"プ・油・特",
                             @"petbottole.png" ,@"ペット",
                             @"shigen.png"     ,@"他資源",
                             @"kanen.png"      ,@"可・ビン",
                             @"funen.png"      , @"本・不・商",
                         nil];
    
    NSString * imgName = [dbIcon objectForKey:icons];
    NSLog(@"icons: %@  ->  imgName: %@", icons, imgName);
    return [UIImage imageNamed:imgName];
}

- (IBAction)incIcon:(id)sender {
    NSArray* strIcons = [NSArray arrayWithObjects:
                     @"カン",
                     @"プ・油・特",
                     @"ペット",
                     @"他資源",
                     @"可・ビン",
                     @"本・不・商",
                     nil];
    int iconTypes = [strIcons count];
    
    int rnd = random() % iconTypes;
    NSString* rndStr = [strIcons objectAtIndex:rnd];
    NSLog(@"rndStr: %@", rndStr);
    UIImage * rndImage = [self getImage:rndStr];
    _imgCurrent.image = rndImage;
}
@end
