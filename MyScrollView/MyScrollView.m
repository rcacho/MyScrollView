//
//  MyScrollView.m
//  MyScrollView
//
//  Created by ricardo antonio cacho on 2015-07-14.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView




- (instancetype)init {
    self = [super init];
    if (self) {
        _contentSize = CGSizeMake(0, 0);
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
       _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(scroll)];
        [self addGestureRecognizer:_panGestureRecognizer];
        _contentSize = frame.size;
        
    }
    return self;
}

- (void)scroll {
    
    if (self.panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
       self.panStartLocation = [self.panGestureRecognizer locationInView:self];
        NSLog(@"Scroll Starting");
        
    } else if (self.panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        self.panEndLocation = [self.panGestureRecognizer locationInView:self];
        NSLog(@"Scroll Ending");
        [self adjustBounds];
    }
}

- (void)adjustBounds {
    CGRect boundsRect = self.bounds;
     double xDelta = self.panEndLocation.x - self.panStartLocation.x;
     double yDelta = self.panEndLocation.y - self.panStartLocation.y;
    if (xDelta + boundsRect.origin.x < self.contentSize.width) {
        boundsRect.origin.x += xDelta;
    }
    if ((yDelta + boundsRect.origin.y) > 0 && (yDelta + boundsRect.origin.y) < self.contentSize.height) {
        boundsRect.origin.y += yDelta;
    }
   
    [self setBounds:boundsRect];
}


- (void)detect {
    NSLog(@"detected");
}


@end
