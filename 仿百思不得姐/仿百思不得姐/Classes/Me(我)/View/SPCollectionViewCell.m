//
//  SPCollectionViewCell.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/16.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPCollectionViewCell.h"
#import "UIImageView+SPExtension.h"
#import <UIImageView+WebCache.h>
@interface SPCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@end
@implementation SPCollectionViewCell

- (void)setSquareItem:(SPSquareItem *)squareItem{

    [_imageView sd_setImageWithURL:[NSURL URLWithString:squareItem.icon]];
    self.titlelabel.text = squareItem.name;

}
@end
