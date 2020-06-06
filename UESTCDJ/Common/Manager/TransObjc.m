//
//  TransObjc.m
//  UESTCDJ
//
//  Created by JLM on 2020/6/6.
//  Copyright © 2020 ccw. All rights reserved.
//

#import "TransObjc.h"

@implementation TransObjc
static TransObjc * _instance;


+ (instancetype)shareTool {
//    buffer = [[NSMutableData alloc]init];
    return [[self alloc] init];
}

//当调用alloc的时候会调用allocWithZone
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    //方案一:加互斥锁,解决多线程访问安全问题
//    @synchronized(self){//同步的
//        if (!_instance) {
//            _instance = [super allocWithZone:zone];
//        }
//    }
    //方案二.GCD dispatch_onec,本身是线程安全的,保证整个程序中只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
//严谨
//遵从NSCopying协议,可以通过copy方式创建对象
- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return _instance;
}
//遵从NSMutableCopying协议,可以通过mutableCopy方式创建对象
- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return _instance;
}

- (void)tran:(NSData *)data: (NSMutableData*)buffer {
    NSMutableData *tmp_data = NULL;
    NSMutableData *input_data = [data copy];

    NSString *end_flag = @"|#|";
    end_flag = [NSString stringWithFormat:@"%@",[end_flag dataUsingEncoding: NSUTF8StringEncoding]];
    end_flag = [end_flag substringToIndex:end_flag.length-1];
    end_flag = [end_flag substringFromIndex:1];
    end_flag = [end_flag componentsSeparatedByString:@"="][2];
    end_flag = [end_flag substringFromIndex:3];

    NSString *str_data=[NSString stringWithFormat:@"%@",data];
    str_data=[str_data stringByReplacingOccurrencesOfString:@" " withString:@""];
    str_data=[str_data lowercaseString];
    str_data=[str_data substringToIndex:str_data.length-1];
    str_data=[str_data substringFromIndex:1];
    str_data=[str_data componentsSeparatedByString:@"="][2];
    str_data=[str_data substringFromIndex:2];

    char *the_data = (char *)malloc(sizeof(char) * data.length);
    the_data = (char *)data.bytes;


    if ([str_data containsString:end_flag]) {
        char *location = the_data;
        int lenth = 0;

        while (location != '\0' && location != NULL) {
            if (*location == '|' && *(location+1) == '#' && *(location+2) == '|') {
                break;
            }
            lenth += 1;
            location ++;
        }

        if (sizeof(the_data) == 3) {
            tmp_data = [buffer copy];
            [buffer setData:[[NSData alloc]init]];

        }

        [buffer appendData:[input_data subdataWithRange:NSMakeRange(0, lenth)]];
        tmp_data = [buffer copy];
        if (input_data.length - lenth == 3){
             [buffer setData:[[NSData alloc]init]];
        }else{
            buffer = [[input_data subdataWithRange:NSMakeRange(lenth + 3, data.length - lenth - 3)] copy];
        }
    }else{
        [buffer appendData:data];
        tmp_data = NULL;
    }

    if (tmp_data != NULL) {
        dispatch_async(dispatch_get_main_queue(), ^{
            int flag = 0;
            @try {
//                [self->_img setImage:[UIImage imageWithData:]];
//                return tmp_data;
                [[NSNotificationCenter defaultCenter] postNotificationName:@"postImage" object:tmp_data];
            } @catch (NSException *exception) {
                flag = 1;
                NSLog(@"error");
            } @finally {
                if (flag) {
                    NSLog(@"error2");
                }
            }

        });
    }
}
@end
