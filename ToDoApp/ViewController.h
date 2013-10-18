//
//  ViewController.h
//  ToDoApp
//
//  Created by Pamela Ocampo on 10/9/13.
//  Copyright (c) 2013 Pamela Ocampo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate, UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *items;
@end
