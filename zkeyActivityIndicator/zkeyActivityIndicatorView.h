//
//  zkeyActivityIndicatorView.h
//  FenHongForIOS
//
//  Created by zkey on 6/13/15.
//  Copyright (c) 2015 GuoXinTech. All rights reserved.
//

/*
 * you should generally make zkeyActivityIndicatorView cover on the superView directly
 * which means zkeyActivityIndicatorView.frame.size should be equal with superView.bounds.size
 * and zkeyActivityIndicatorView.frame.origin should be equal with CGPointZero
 * the visible part of zkeyActivityIndicatorView will be setted in the center of superView
 * what's more, you can show different alert message by change the title(method setTitle:) without alloc other instance.
 */


#import <UIKit/UIKit.h>

@interface zkeyActivityIndicatorView : UIView

/*
 * there is no more work to do if you use the following initializer to get an instance.
 */
- (nonnull instancetype)initWithFrame:(CGRect)frame title:(nonnull NSString *)title;


/*
 * 1. Use this method to set alert title if you use system initializer(eg. initwithFrame:)
 * 2. Change the title when you needed, the layout of subview will auto fit according to the title.
 */
- (void)setTitle:(nonnull NSString *)title;

@end
