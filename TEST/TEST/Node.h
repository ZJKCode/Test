//
//  Node.h
//  TEST
//
//  Created by zhangjikuan on 2019/4/15.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 二叉树
/**
 在实际使用时会根据链表和有序数组等数据结构的不同优势进行选择。
 有序数组的优势在于二分查找，链表的优势在于数据项的插入和数据项的删除。
 但是在有序数组中插入数据就会很慢，同样在链表中查找数据项效率就很低。
 综合以上情况，二叉树可以利用链表和有序数组的优势，同时可以合并有序数组和链表的优势，二叉树也是一种常用的数据结构。
 */


/// 树节点
@interface Node : NSObject
/// int 数据
@property (nonatomic, assign) int iData;

/// double数据
@property (nonatomic, assign) double dData;

/// 左边节点
@property (nonatomic, strong) Node *leftNode;;

/// 右边节点
@property (nonatomic, strong) Node *rightNode;
@end



NS_ASSUME_NONNULL_END
