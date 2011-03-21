//
//  WikiViewController.m
//  PH Leaders
//
//  Created by Earljon Hidalgo on 3/21/11.
//  Copyright 2011 Smugappventures. All rights reserved.
//

#import "WikiViewController.h"


@implementation WikiViewController

@synthesize web, url;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [web release];
    [url release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Wiki Info";
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.web = nil;
    web.delegate = nil;
    self.url = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)webViewDidStartLoad:(UIWebView *) portal {
    UIActivityIndicatorView *busyWheel = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    UIBarButtonItem *busyWheelButton = [[UIBarButtonItem alloc] initWithCustomView:busyWheel];
    
    self.navigationItem.rightBarButtonItem = busyWheelButton;
    
    [busyWheel startAnimating];
    [busyWheelButton release];
    [busyWheel release];
}

-(void)webViewDidFinishLoad:(UIWebView *) portal{
    self.navigationItem.rightBarButtonItem = nil;
}


@end
