//
//  Contato.h
//  ContatosIP67
//
//  Created by ios3109 on 05/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject<NSCoding>

@property(strong) NSString *nome;
@property(strong) NSString *telefone;
@property(strong) NSString *email;
@property(strong) NSString *endereco;
@property(strong) NSString *site;
@property(strong) NSString *idade;
          
@end
