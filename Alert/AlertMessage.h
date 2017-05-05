//
//  AlertMessage.h
//  LogoEmojis
//
//  Created by Benzatine Infotech on 4/13/17.
//  Copyright © 2017 Benzatine Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTopAlignedLabel.h"
@interface AlertMessage : UIView{
    UIButton *btn_dismiss;
    NSTimer *timer;
    BOOL is_show;
    CGFloat flt_hide_value;
    BOOL is_from_top;
}
@property (strong, nonatomic) UILabel *lbl_msg;

-(void)HideAlert;
-(void)ShowAlert:(NSString*)msg;


//All properties set methods
-(void)set_label_textcolor:(UIColor*)color;
-(void)set_view_backGround_color:(UIColor*)color;
-(void)set_label_font:(UIFont*)font;
-(void)set_hide_interval:(CGFloat)value ;
-(void)set_close_button_image:(UIImage*)img;
-(void)set_label_alignment:(NSTextAlignment)alignment;
@end
