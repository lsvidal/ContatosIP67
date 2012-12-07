//
//  Contato.m
//  ContatosIP67
//
//  Created by ios3109 on 05/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@synthesize nome, email, endereco, telefone, site, idade;

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:nome forKey:@"nome"];
    [aCoder encodeObject:email forKey:@"email"];
    [aCoder encodeObject:endereco forKey:@"endereco"];
    [aCoder encodeObject:telefone forKey:@"telefone"];
    [aCoder encodeObject:site forKey:@"site"];
    [aCoder encodeObject:idade forKey:@"idade"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.nome = [aDecoder decodeObjectForKey:@"nome"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.endereco = [aDecoder decodeObjectForKey:@"endereco"];
        self.telefone = [aDecoder decodeObjectForKey:@"telefone"];
        self.site = [aDecoder decodeObjectForKey:@"site"];
        self.idade = [aDecoder decodeObjectForKey:@"idade"];
    }
    return self;
}

@end
