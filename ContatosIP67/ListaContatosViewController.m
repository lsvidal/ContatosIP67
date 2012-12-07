//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3109 on 05/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "CMPFormularioContatoViewControllerViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController

@synthesize contatos, linhaDestaque;

-(id) init {
    if (self = [super init]) {
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        linhaDestaque = -1;
    }
    return self;
}

-(void) exibeFormulario {
    CMPFormularioContatoViewControllerViewController *form = [[CMPFormularioContatoViewControllerViewController alloc] init];
    form.delegate = self;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
}

-(void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

-(void) viewDidAppear:(BOOL)animated {
    if (linhaDestaque >= 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:linhaDestaque inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        linhaDestaque = -1;
    }
}

//Esse já é a implementação default
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contatos count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contatos removeObjectAtIndex:indexPath.row];
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    CMPFormularioContatoViewControllerViewController *form = [[CMPFormularioContatoViewControllerViewController alloc] initWithContato:contato];
    form.delegate = self;
    
    [self.navigationController pushViewController:form animated:YES];
}

-(void) contatoAtualizado:(Contato *) contato {
    linhaDestaque = [self.contatos indexOfObject:contato];
}

-(void) contatoAdicionado:(Contato *) contato {
    [self.contatos addObject:contato];
    linhaDestaque = [self.contatos indexOfObject:contato];
    [self.tableView reloadData];
}

@end
