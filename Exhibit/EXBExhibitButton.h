//
//  EXBExhibitButton.h
//  Exhibit
//
//  Created by Andrew Finch on 2/22/14.
//  Copyright (c) 2014 Happy Hour Devs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EXBExhibitButton : UIButton

- (void)expandButtonWithMessage:(NSString *)message;

- (void)startPulsing;
- (void)stopPulsing;

@end
