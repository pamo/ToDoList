//
//  ItemDataController.m
//  ToDoApp
//
//  Created by Pamela Ocampo on 10/16/13.
//  Copyright (c) 2013 Pamela Ocampo. All rights reserved.
//

#import "ItemDataController.h"
#import "ItemCell.h"

@interface ItemDataController ()
- (void)initializeDefaultDataList;
@end

@implementation ItemDataController
- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}
- (void)initializeDefaultDataList{
    NSMutableArray *itemsList = [[NSMutableArray alloc] init];
    self.itemsList = itemsList;
    
}
- (void)setItemsList:(NSMutableArray *)newList {
    if (_itemsList != newList) {
        _itemsList = [newList mutableCopy];
    }
}
-(NSUInteger) countOfList{
    return [self.itemsList count];
}
-(ItemCell *)objectInListAtIndex:(NSUInteger)index{
    return [self.itemsList objectAtIndex:index];
}
-(void)addItem:(ItemCell *)item{
    [self.itemsList addObject:item];
}
@end
