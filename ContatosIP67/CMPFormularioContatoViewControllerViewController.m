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
    }
    return self;
}

-(void) escondeFormulario {
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)pegaDadosDoFormulario:(id)sender {
    Contato *contato = [[Contato alloc] init];
    contato.nome = txtNome.text;
    contato.email = txtEmail.text;
    contato.endereco = txtEndereco.text;
    contato.site = txtSite.text;
    contato.idade = txtIdade.text;
    contato.telefone = txtTelefone.text;
    
    [self.contatos addObject:contato];
    NSLog(@"dados: %@", self.contatos);
    [self.view endEditing:YES];
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
