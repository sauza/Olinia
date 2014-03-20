//
//  AppDelegate.m
//  Olinia
//
//  Created by Christopher Hardy on 2/7/14.
//  Copyright (c) 2014 Christopher Hardy. All rights reserved.
//

#import "AppDelegate.h"
#import "loadData.h"
#import "Ruta.h"


@implementation AppDelegate
@synthesize firstTime=_firstTime;
@synthesize rutaCompArray=_rutaCompArray;
static NSMutableArray *rutaTuzobusComp = nil;
static NSMutableArray *rutaMicrobusComp = nil;
static NSMutableArray *rutaCombiComp = nil;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //self.rutaCompArray=[[NSMutableArray alloc]init];
    
    UIImage *navBackgroundImage = [UIImage imageNamed:@"nav_bg"];
    [[UINavigationBar appearance] setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:10.0/255.0 green:10.0/255.0 blue:10.0/255.0 alpha:1.0], UITextAttributeTextColor,
                                                           [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],UITextAttributeTextShadowColor,
                                                           [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
                                                           UITextAttributeTextShadowOffset,
                                                           [UIFont fontWithName:@"Helvetica-Light" size:20.0], UITextAttributeFont, nil]];
    
    
    [self cargaInicial];
    [self performSelectorInBackground:@selector(loadImage) withObject:nil];
    return YES;
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)cargaInicial{
    
    loadData *loader;
    loader=[[loadData alloc]init];
    loader.bandera=0;
    [loader cargaInicial];
    self.rutaCompArray=loader.arrayDatos;
    self.firstTime=TRUE;
    rutaTuzobusComp=self.rutaCompArray;
    
    /*loader.bandera=1;
    [loader cargaInicial];
    self.rutaCompArray=loader.arrayDatos;
    self.firstTime=TRUE;
    rutaMicrobusComp=self.rutaCompArray;

    loader.bandera=2;
    [loader cargaInicial];
    self.rutaCompArray=loader.arrayDatos;
    self.firstTime=TRUE;
    rutaCombiComp=self.rutaCompArray;*/

    
    //    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //    _appDelegate.rutas=loader.arrayDatos;
    //    self.mRutas=_appDelegate.rutas;
    //    self.appDelegate.firstTime=TRUE;
    
}

- (void)loadImage
{
    NSMutableArray *auxArray=[[NSMutableArray alloc]init];
    Ruta *auxRuta;
    for (int i=0; i<[self.rutaCompArray count]; i++) {
        NSURL * url = [NSURL URLWithString:[[self.rutaCompArray objectAtIndex:i]urlImage_Cromatica]];
        NSData * data = [NSData dataWithContentsOfURL:url];
        UIImage * image = [UIImage imageWithData:data];
        
        
        
        url = [NSURL URLWithString:[[self.rutaCompArray objectAtIndex:i]urlImage_Paradas]];
        data = [NSData dataWithContentsOfURL:url];
        UIImage * image2 = [UIImage imageWithData:data];
        auxRuta=[self.rutaCompArray objectAtIndex:i];
        
        if (image && image2)
        {
            auxRuta.imagenCromatica = image;
            auxRuta.imagenParadas = image2;
            [auxArray addObject:auxRuta];
            if (i+1==[self.rutaCompArray count]) {
                self.rutaCompArray = auxArray;
            }
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No se pudo cargar imagen de bus o de paradas" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Ok", nil];
            [alert show];
            break;
            
        }
    }
    [self reloadInputViews];
}
+(NSMutableArray*) getRuta:(int) tipoRuta
{
    int band=0;
    @synchronized(self)
    {
        if(tipoRuta==0){
            return rutaTuzobusComp;
            band=1;
        }
        else if(tipoRuta==1){
            return rutaMicrobusComp;
            band=1;
        }
        else if (tipoRuta==2){
            return rutaCombiComp;
            band=1;
        }
    }
    
    if (band==0) {
        return nil;
    }
    return nil;
}

@end
