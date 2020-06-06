//
//  TransObjc.h
//  UESTCDJ
//
//  Created by JLM on 2020/6/6.
//  Copyright © 2020 ccw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TransObjc : NSObject
- (void)tran:(NSData *)data: (NSMutableData*)buffer;
+ (instancetype)shareTool;


//@property (nonatomic, strong) MetalPlayer *playLayer;
//@property (nonatomic, strong) UIImageView *img;
//@property (nonatomic, strong) UIImage *row_img;
//@property (nonatomic, strong) NSData *row_img_data;
//@property (nonatomic, strong) NSMutableData *buffer;
@end

NS_ASSUME_NONNULL_END
