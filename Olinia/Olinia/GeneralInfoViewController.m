//
//  GeneralInfoViewController.m
//  Olinia
//
//  Created by Christopher Hardy on 3/6/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "GeneralInfoViewController.h"
#import "SWRevealViewController.h"

@interface GeneralInfoViewController ()

@end


@implementation GeneralInfoViewController

@synthesize generalInfo=_generalInfo;

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
	
    self.title=@"Información";
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    self.generalInfo.textAlignment = UITextAlignmentCenter;
    
    self.generalInfo.text = @"Copyright © 2013 - Todos los derechos reservados | Aqtiva Hidalgo\n Desarrollado por Christopher Hardy\n Desarrollo de SWRevealViewController por:\n Copyright (c) 2013 Joan Lluch joan.lluch@sweetwilliamsl.com";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
