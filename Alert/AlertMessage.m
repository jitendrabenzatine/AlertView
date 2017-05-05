//
//  AlertMessage.m
//  LogoEmojis
//
//  Created by Benzatine Infotech on 4/13/17.
//  Copyright © 2017 Benzatine Infotech. All rights reserved.
//

#import "AlertMessage.h"

@implementation AlertMessage

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self customisation];
    self.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return self;
}

-(void)customisation {
    [self setBackgroundColor:[UIColor redColor]];
    btn_dismiss = [[UIButton alloc]initWithFrame:CGRectMake(0, 15, 49, 49)];
    [btn_dismiss setImage:[UIImage imageNamed:@"ic_edit_cancel"] forState:UIControlStateNormal];
    [btn_dismiss addTarget:self action:@selector(btn_click_dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_dismiss];
    
    _lbl_msg = [[UILabel alloc]initWithFrame:CGRectMake(btn_dismiss.frame.size.width, 15, self.frame.size.width - btn_dismiss.frame.size.width  , 49)];
    _lbl_msg.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:14];
    _lbl_msg.textColor = [UIColor whiteColor];
    _lbl_msg.numberOfLines = 0;
    _lbl_msg.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_lbl_msg];
    flt_hide_value = 3.0;
}

-(void)btn_click_dismiss:(UIButton*)sender {
    [self HideAlert];
}

-(void)HideAlert
{
    [timer invalidate];
    timer = nil;
    is_show = NO;
    [UIView animateWithDuration:0.2
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
                     }
                     completion:^(BOOL finished){
                     }];
}

-(void)ShowAlert:(NSString*)msg {
    if(is_show != YES){
        _lbl_msg.text = msg;
        [UIView animateWithDuration:0.2
                              delay:0.1
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
        timer = [NSTimer scheduledTimerWithTimeInterval:flt_hide_value target:self selector:@selector(_timerFired:) userInfo:nil repeats:NO];
        is_show = YES;
    }
}

- (void)_timerFired:(NSTimer *)timer {
    [self HideAlert];
}


//All properties set methods

-(void)set_label_textcolor:(UIColor*)color {
    _lbl_msg.textColor = color;
}

-(void)set_view_backGround_color:(UIColor*)color {
    self.backgroundColor = color;
}

-(void)set_label_font:(UIFont*)font {
    _lbl_msg.font = font;
}

-(void)set_hide_interval:(CGFloat)value {
    flt_hide_value = value;
}

-(void)set_close_button_image:(UIImage*)img {
    [btn_dismiss setImage:img forState:UIControlStateNormal];
}

-(void)set_label_alignment:(NSTextAlignment)alignment { 
    _lbl_msg.textAlignment = alignment;
}

@end
