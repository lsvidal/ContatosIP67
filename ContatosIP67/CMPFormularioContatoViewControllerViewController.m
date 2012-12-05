//
//  CMPFormularioContatoViewControllerViewController.m
//  ContatosIP67
//
//  Created by ios3109 on 04/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CMPFormularioContatoViewControllerViewController.h"

@interface CMPFormularioContatoViewControllerViewController ()

@end

@implementation CMPFormularioContatoViewControllerViewController
@synthesize txtIdade;

@synthesize txtNome, txtEmail, txtEndereco, txtTelefone, txtSite;

-(IBAction)pegaDadosDoFormulario:(id)sender {
    NSMutableDictionary *dadosDoContato = [[NSMutableDictionary alloc] init];
    [dadosDoContato setObject:[txtNome text] forKey:@"nome"];
    [dadosDoContato setObject:[txtEmail text] forKey:@"email"];
    [dadosDoContato setObject:[txtTelefone text] forKey:@"telefone"];
    [dadosDoContato setObject:[txtEndereco text] forKey:@"endereco"];
    [dadosDoContato setObject:[txtSite text] forKey:@"site"];
    [dadosDoContato setObject:[txtIdade text] forKey:@"idade"];
    NSLog(@"dados: %@", dadosDoContato);
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTxtIdade:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
