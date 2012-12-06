//
//  CMPFormularioContatoViewControllerViewController.h
//  ContatosIP67
//
//  Created by ios3109 on 04/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMPFormularioContatoViewControllerViewController : UIViewController

@property(nonatomic, weak) IBOutlet UITextField *txtNome;
@property(nonatomic, weak) IBOutlet UITextField *txtTelefone;
@property(nonatomic, weak) IBOutlet UITextField *txtEmail;
@property(nonatomic, weak) IBOutlet UITextField *txtEndereco;
@property(nonatomic, weak) IBOutlet UITextField *txtSite;
@property (weak, nonatomic) IBOutlet UITextField *txtIdade;

@property(strong) NSMutableArray *contatos;

-(IBAction)proximoElemento:(UITextField *) textField;

@end
