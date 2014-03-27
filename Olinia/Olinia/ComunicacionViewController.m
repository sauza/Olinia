//
//  ComunicacionViewController.m
//  Olinia
//
//  Created by Christopher Hardy on 3/6/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "ComunicacionViewController.h"
#import "SWRevealViewController.h"

@interface ComunicacionViewController ()

@end

@implementation ComunicacionViewController

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
	
    self.title=@"Comunicación";
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)llamarAqtiva:(id)sender {
    
    NSString *telefono;
    telefono = @"7712025068";
    NSString *phoneStr = [[NSString alloc] initWithFormat:@"tel:%@",telefono];
    NSURL *phoneURL = [[NSURL alloc] initWithString:phoneStr];
    [[UIApplication sharedApplication] openURL:phoneURL];
}

- (IBAction)llamarSCT:(id)sender {
}


- (IBAction)emailAqtiva:(id)sender {
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        //[mailCont setSubject:[[NSString alloc]initWithFormat:@"%@", self.auxGaleria.nombre]];
        
        NSString *temp=@"soporte@aqtiva.mx";
        
        [mailCont setToRecipients:[NSArray arrayWithObject:temp]];
         
        [mailCont setMessageBody:@"" isHTML:NO];
        [self presentViewController:mailCont animated:YES completion:nil];
        
        
    }
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
