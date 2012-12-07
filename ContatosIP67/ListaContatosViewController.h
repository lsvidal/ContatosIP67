//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios3109 on 05/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListaContatosProtocol.h"

@interface ListaContatosViewController : UITableViewController<ListaContatosProtocol>

@property(strong) NSMutableArray *contatos;
@property NSInteger linhaDestaque;

@end
