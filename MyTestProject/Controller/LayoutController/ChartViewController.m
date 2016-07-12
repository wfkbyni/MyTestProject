//
//  ChartViewController.m
//  MyTestProject
//
//  Created by 舒永超 on 16/7/7.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "ChartViewController.h"
#import "PNChart.h"

@interface ChartViewController ()

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"ChartTest";

    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10 color:PNRed],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNBlue description:@"WWDC"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNGreen description:@"GOOL I/O"],
                       ];



    PNPieChart *pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(40.0, 155.0, 240.0, 240.0) items:items];
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:14.0];
    pieChart.shouldHighlightSectorOnTouch = NO;
    pieChart.innerCircleRadius = 3;
    pieChart.outerCircleRadius = 3;
    pieChart.legendStyle = PNLegendItemStyleStacked;
    [pieChart strokeChart];

    [self.view addSubview:pieChart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
