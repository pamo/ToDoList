//
//  ItemCell.h
//  ToDoApp
//
//  Created by Pamela Ocampo on 10/9/13.
//  Copyright (c) 2013 Pamela Ocampo. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ItemCell : UITableViewCell
- (IBAction)changeItemText:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *inputField;
@end
