//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3109 on 05/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "CMPFormularioContatoViewControllerViewController.h"

@implementation ListaContatosViewController

@synthesize contatos;

-(id) init {
    if (self = [super init]) {
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
    }
    return self;
}

-(void) exibeFormulario {
    CMPFormularioContatoViewControllerViewController *form = [[CMPFormularioContatoViewControllerViewController alloc] init];
    form.contatos = self.contatos;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
}

-(void) viewWillAppear:(BOOL)animated {
    NSLog(@"Total cadastrado %d", [self.contatos count]);
}

@end
