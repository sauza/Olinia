//
//  AyudaViewController.m
//  Olinia
//
//  Created by Christopher Hardy on 3/24/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "AyudaViewController.h"
#import "SWRevealViewController.h"

@interface AyudaViewController ()

@end

@implementation AyudaViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Gesture para el sidebar controller
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    self.title=@"Ayuda";
    
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

@end
