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

@synthesize contatos, contatoEdicao;
@synthesize txtNome, txtEmail, txtEndereco, txtTelefone, txtSite, txtIdade;
@synthesize delegate;

-(id) init {
    self = [super init];
    if (self) {
        self.modalTransitionStyle =UIModalTransitionStyleFlipHorizontal;
        
        self.navigationItem.title = @"Cadastro";
        
        UIBarButtonItem *cancela = [[UIBarButtonItem alloc] initWithTitle:@"Cancela" style:UIBarButtonItemStylePlain target:self action:@selector(escondeFormulario)];
        
        self.navigationItem.leftBarButtonItem = cancela;
        
        UIBarButtonItem *adiciona = [[UIBarButtonItem alloc] initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = adiciona;
    }
    return self;
}

-(id) initWithContato:(Contato *)_contato {
    self = [super init];
    if(self) {
        self.contatoEdicao = _contato;
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc] initWithTitle:@"confirmar" style:UIBarButtonItemStylePlain target:self action:@selector(atualizacontato)];
        self.navigationItem.rightBarButtonItem = confirmar;
    }
    return self;
}

-(void) criaContato {
    Contato *contato = [self pegaDadosDoFormulario];
    [self.contatos addObject:[self pegaDadosDoFormulario]];
    NSLog(@"Contato: %@", contato.nome);
    NSLog(@"dados: %d", [self.contatos count]);
    NSLog(@"Contato no array %@",[[self.contatos objectAtIndex:[self.contatos count]-1] nome]);
    [self dismissModalViewControllerAnimated:YES];
    if(self.delegate) {
        [self.delegate contatoAdicionado:contato];
    }
}

-(void) escondeFormulario {
    [self dismissModalViewControllerAnimated:YES];
}

-(Contato *)pegaDadosDoFormulario {
    if (!self.contatoEdicao) {
        self.contatoEdicao = [[Contato alloc] init];
    }
    contatoEdicao.nome = txtNome.text;
    contatoEdicao.email = txtEmail.text;
    contatoEdicao.endereco = txtEndereco.text;
    contatoEdicao.site = txtSite.text;
    contatoEdicao.idade = txtIdade.text;
    contatoEdicao.telefone = txtTelefone.text;
    
    return contatoEdicao;
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

-(void)atualizacontato {
    Contato * contato = [self pegaDadosDoFormulario];
    [self.navigationController popViewControllerAnimated:YES];
    if(self.delegate) {
        [self.delegate contatoAtualizado:contato];
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
    if(self.contatoEdicao) {
        txtNome.text = contatoEdicao.nome;
        txtEmail.text = contatoEdicao.email;
        txtEndereco.text = contatoEdicao.endereco;
        txtTelefone.text = contatoEdicao.telefone;
        txtSite.text = contatoEdicao.site;
        txtIdade.text = contatoEdicao.idade;
    }
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
