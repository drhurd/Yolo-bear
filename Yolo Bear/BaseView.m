//
//  BaseView.m
//  Yolo Bear
//
//  Created by Dylan Hurd on 4/27/14.
//  Copyright (c) 2014 Because. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView





- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
        self.lit = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, 300, 300)];
        self.lit.image = [UIImage imageNamed:@"lightbulb_color"];
        self.lit.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:self.lit];
        
        
        self.unlit = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, 300, 300)];
        self.unlit.image = [UIImage imageNamed:@"lightbulb_bw"];
        self.unlit.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:self.unlit];
		
        
		self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
		[self.btn setTitle:@" " forState:UIControlStateNormal];
		[self.btn setFrame:CGRectMake(60, 40, 200, 300)];
        [self.btn addTarget: self action: @selector( displayBulb: ) forControlEvents: UIControlEventTouchDown];

		[self addSubview:self.btn];
    }
    return self;
}

- (void)displayBulb:(UIButton*)sender
{
    if(self.unlit.hidden) {
        self.unlit.hidden = false;
    } else {
        self.unlit.hidden = true;
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
