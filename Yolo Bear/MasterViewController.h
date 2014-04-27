//
//  ViewController.h
//  Yolo Bear
//
//  Created by Dylan Hurd on 4/27/14.
//  Copyright (c) 2014 Because. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "LightManager.h"

@interface MasterViewController : UIViewController

@property (nonatomic, strong) LightManager* lm;
@property (nonatomic, strong) BaseView* view;

@end
