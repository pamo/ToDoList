//
//  ItemCell.m
//  ToDoApp
//
//  Created by Pamela Ocampo on 10/9/13.
//  Copyright (c) 2013 Pamela Ocampo. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}
-(IBAction)changeItemText:(id)sender{
    UITextField *textField = sender;
    NSLog(@"Item changed to %@", textField.text);
}
- (IBAction)touchItemField:(id)sender {
    NSLog(@"Textfield touched");
}
@end
