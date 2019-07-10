//
//  EmptyDisplayView.h
//  FYTICKET
//
//  Created by pengkang on 16/9/12.
//  Copyright © 2016年 ZXH. All rights reserved.
//

// display preview is default like this:(in this case customview is nil)
/*
                           centerx

                           superview
  -------------------------------------------------------------------------------
                          superInsets.top

                          EmptyDisplayView
                          — - - - - - - - -
   superInsets.left         emptyImageV                      superInsets.right

                            (imageBottomOffset)

                            titleLabel     centery + contentOffset

                            (detailTopOffset)

                            detailLabel

                            (buttonTopOffset)

                            actionbtn
                           — - - - - - - - -

                          superInsets.bottom
 -------------------------------------------------------------------------------


or this:(customview != nil)
                           superview
  ---------------------------------------------------------

                          EmptyDisplayView
                        — - - - - - - - -
                           customView     //use customViewCenterOffset adjust customview center
                        — - - - - - - - -

 ---------------------------------------------------------
*/

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EmptyState) {
    EmptyStateDefault,
    EmptyStateNoData,
    EmptyStateNoNetWork,
};

@interface EmptyDisplayView : UIView

// titleLabel  0 by defaulf
@property(nonatomic,assign) float titleCenterYOffset;

//default 20
@property(nonatomic,assign) float imageBottomOffset;

//default 15
@property(nonatomic,assign) float detailTopOffset;

//default 15
@property(nonatomic,assign) float buttonTopOffset;

//default is 68 *32
@property(nonatomic,assign) CGSize buttonSize;

//titleLabel
@property(nonatomic,strong)UILabel *titleLabel;

//detailLabel
@property(nonatomic,strong)UILabel *detailLabel;

//actionbtn
@property(nonatomic,strong)UIButton *actionbtn;

//properties for subview
@property(nonatomic,copy) NSString *imageName;

@property(nonatomic,copy) NSString *titleText;

@property(nonatomic,copy) NSString *detailText;

@property(nonatomic,strong)UIColor *detailTextColor;

@property(nonatomic,copy) NSString *buttonText;

@property(nonatomic,copy)void(^reloadBlock)(void);

//state
@property(nonatomic,assign) EmptyState state;

/**
 customView. set customview if the above subview is nor satisfied you
 */
@property(nonatomic,strong) UIView *customView;

/**
 offset for customView
 */
@property(nonatomic,assign) CGPoint customViewCenterOffset;

//default is zero
@property(nonatomic,assign) UIEdgeInsets superInsets;
//
-(void)reloadView;

@end

