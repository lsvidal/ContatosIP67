//
//  CMPFormularioContatoViewControllerViewController.m
//  ContatosIP67
//
//  Created by ios3109 on 04/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CMPFormularioContatoViewControllerViewController.h"
#import "Contato.h"

@interface CMPFormularioContatoViewControllerViewController ()

@end

@implementation CMPFormularioContatoViewControllerViewController

@synthesize contatos;
@synthesize txtNome, txtEmail, txtEndereco, txtTelefone, txtSite, txtIdade;

-(id) init {
    self = [super init];
    if (self) {
        self.contatos = [[NSMutableArray alloc] init];
        self.modalTransitionStyle =UIModalTransitionStyleFlipHorizontal;
        
        self.navigationItem.title = @"Cadastro";
        
        UIBarButtonItem *cancela = [[UIBarButtonItem alloc] initWithTitle:@"Cancela" style:UIBarButtonItemStylePlain target:self action:@selector(escondeFormulario)];
        
        self.navigationItem.leftBarButtonItem = cancela;
        
        UIBarButtonItem *adiciona = [[UIBarButtonItem alloc] initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = adiciona;
    }
    return self;
}

-(void) criaContato {
    Contato *contato = [self pegaDadosDoFormulario];
    [self.contatos addObject:contato];
    NSLog(@"Contato: %@", contato.nome);
    NSLog(@"dados: %d", [self.contatos count]);
    NSLog(@"Contato no array %@",[[self.contatos objectAtIndex:[self.contatos count]-1] nome]);
    [self dismissModalViewControllerAnimated:YES];
}

-(void) escondeFormulario {
    [self dismissModalViewControllerAnimated:YES];
}

-(Contato *)pegaDadosDoFormulario {
    Contato *contato = [[Contato alloc] init];
    contato.nome = txtNome.text;
    contato.email = txtEmail.text;
    contato.endereco = txtEndereco.text;
    contato.site = txtSite.text;
    contato.idade = txtIdade.text;
    contato.telefone = txtTelefone.text;
    
    return contato;
}

-(IBAction)proximoElemento:(UITextField *) textField {
    NSLog(@"Botão pressionado");
    if (textField == self.txtNome) {
        [self.txtTelefone becomeFirstResponder];
    } else if (textField == self.txtTelefone) {
        [self.txtEmail becomeFirstResponder];
    } else if (textField == self.txtEmail) {
        [self.txtEndereco becomeFirstResponder];
    } else if (textField == self.txtEndereco) {
        [self.txtSite becomeFirstResponder];
    } else if (textField == self.txtSite) {
        [self.txtIdade becomeFirstResponder];
    }
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
