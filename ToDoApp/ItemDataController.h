//
//  ItemDataController.h
//  ToDoApp
//
//  Created by Pamela Ocampo on 10/16/13.
//  Copyright (c) 2013 Pamela Ocampo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ItemCell;
@interface ItemDataController : NSObject
@property (nonatomic, copy) NSMutableArray *itemsList;
- (void)initializeDefaultDataList;
- (NSUInteger)countOfList;
- (ItemCell *)objectInListAtIndex:(NSUInteger)index;
- (void)addItem:(ItemCell *)item;
@end

