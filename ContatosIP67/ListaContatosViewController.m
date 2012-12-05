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
    [self presentModalViewController:form animated:YES];
}

@end
