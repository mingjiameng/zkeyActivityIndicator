//
//  zkeyActivityIndicatorView.m
//  zkeyActivityIndicator
//
//  Created by 梁志鹏 on 12/23/15.
//  Copyright (c) 2015 overcode. All rights reserved.
//

#import "zkeyActivityIndicatorView.h"

#define COVER_VIEW_CORNER_RADIUS 5.0f
#define ACTIVITY_INDICATOR_WIDTH 37.0f
#define ACTIVITY_INDICATOR_HEIGHT 37.0f
#define LEADING_OR_TRAIL_SPACE 15.0f
#define TOP_OR_BOTTOM_SPACE 15.0f
#define VERTICAL_SPACE 10.0f
#define TITLE_LABEL_FONT_SIZE 15.0f

@interface zkeyActivityIndicatorView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UIView *coverView;

@end



@implementation zkeyActivityIndicatorView

- (nonnull instancetype)initWithFrame:(CGRect)frame title:(nonnull NSString *)title
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.coverView];
        
        [self setTitle:title];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // additional initialization
        
        [self addSubview:self.coverView];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    // there is no additional initialization
    
    [self addSubview:self.coverView];
}


- (void)setTitle:(NSString *)title
{
    // calculate the width of cover view according to the title
    // set the coverView in the center and adjust other subviews's layout correspondingly.
    self.coverView.frame = [self frameOfCoverViewWithTitle:title];
    self.activityIndicator.frame = CGRectMake((self.coverView.frame.size.width - ACTIVITY_INDICATOR_WIDTH) / 2.0f, TOP_OR_BOTTOM_SPACE, ACTIVITY_INDICATOR_WIDTH, ACTIVITY_INDICATOR_HEIGHT);
    
    CGSize titleLabelSize = [self sizeForText:title];
    self.titleLabel.frame = CGRectMake((self.coverView.frame.size.width - titleLabelSize.width) / 2.0f, self.activityIndicator.frame.origin.y + ACTIVITY_INDICATOR_HEIGHT + VERTICAL_SPACE, titleLabelSize.width, titleLabelSize.height);
    
    self.titleLabel.text = title;
}

/*
 * performance improvement
 * start animation when the view is added to superView
 * stop the animation when the view is removed from superView
 */
- (void)removeFromSuperview
{
    [super removeFromSuperview];
    
    [self.activityIndicator stopAnimating];
}

- (void)didMoveToSuperview
{
    [self.activityIndicator startAnimating];
}


/*
 * assistant method
 */

- (CGRect)frameOfCoverViewWithTitle:(NSString *)title
{
    CGSize labelSize = [self sizeForText:title];
    
    CGFloat viewWith = MAX(ACTIVITY_INDICATOR_WIDTH, labelSize.width) + 2 * LEADING_OR_TRAIL_SPACE;
    viewWith = MIN(viewWith, self.frame.size.width);
    
    CGFloat viewHeight = ACTIVITY_INDICATOR_HEIGHT + labelSize.height + 2 * TOP_OR_BOTTOM_SPACE + VERTICAL_SPACE;
    viewHeight = MIN(viewHeight, self.frame.size.height);
    
    CGRect frame = CGRectMake((self.frame.size.width - viewWith) / 2.0f, (self.frame.size.height - viewHeight) / 2.0, viewWith, viewHeight);
    
    return frame;
}

- (CGSize)sizeForText:(NSString *)text
{
    CGFloat maxLabelWidth = self.frame.size.width - 2 * LEADING_OR_TRAIL_SPACE;
    CGFloat maxLabelHeight = self.frame.size.height - 2 * TOP_OR_BOTTOM_SPACE - VERTICAL_SPACE - ACTIVITY_INDICATOR_HEIGHT
    ;
    CGSize maxLabelSize = CGSizeMake(maxLabelWidth, maxLabelHeight);
    
    CGSize labelSize = [text boundingRectWithSize:maxLabelSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.titleLabel.font, NSFontAttributeName, nil] context:nil].size;
    
    return labelSize;
}

/*
 * custom getter(initialize)
 */

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:TITLE_LABEL_FONT_SIZE];
            label.numberOfLines = 2.0f;
            
            label;
        });
    }
    
    return _titleLabel;
}

- (UIActivityIndicatorView *)activityIndicator
{
    if (!_activityIndicator) {
        _activityIndicator = ({
            UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            
            indicatorView;
        });
    }
    
    return _activityIndicator;
}

- (UIView *)coverView
{
    if (!_coverView) {
        _coverView = ({
            UIView *view = [[UIView alloc] init];
            
            view.backgroundColor = [UIColor blackColor];
            view.alpha = 0.8;
            view.layer.masksToBounds = YES;
            view.layer.cornerRadius = COVER_VIEW_CORNER_RADIUS;
            
            [view addSubview:self.titleLabel];
            [view addSubview:self.activityIndicator];
            
            view;
        });
    }
    
    return _coverView;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
