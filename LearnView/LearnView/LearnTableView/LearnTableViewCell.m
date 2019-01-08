//
//  LearnTableViewCell.m
//  LearnView
//
//  Created by ios on 2019/1/8.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "LearnTableViewCell.h"

@interface LearnTableViewCell()

// 名字文本框
@property(nonatomic,strong)UILabel *nameLabel;

@end

@implementation LearnTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.bounds = CGRectMake(0, 0, 100, 30);
    _nameLabel.center = self.center;
    [self addSubview:_nameLabel];
}

-(void)setName:(NSString *)name {
    _name = name;
    [_nameLabel setText:name];
}

-(void)layoutSubviews {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
@end
