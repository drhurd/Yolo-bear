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
		
		// Setting up the button
		self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
		[self.btn  setTitle:@"Toggle" forState:UIControlStateNormal];
		[self.btn setFrame:CGRectMake(100, 100, 75, 30)];
		
		
		UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(50, 75, 75, 30)];
		
		
		[self addSubview:self.btn];
    }
    return self;
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
