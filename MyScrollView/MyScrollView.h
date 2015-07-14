//
//  MyScrollView.h
//  MyScrollView
//
//  Created by ricardo antonio cacho on 2015-07-14.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIView

@property CGSize contentSize;

@property UIPanGestureRecognizer *panGestureRecognizer;

@property CGPoint panStartLocation;

@property CGPoint panEndLocation;


- (void)scroll;

- (void)detect;


@end
