//
//  DataRequest.h
//  Neighbour
//
//  Created by apple on 15/11/4.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  处理业务逻辑
 */

@interface DataRequest : NSObject


/**
 *  发送一个get请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;
/**
 *  发送一个post请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 *  数据接口
 *
 *  @param url     接口
 *  @param type    模型类型
 *  @param success 成功回调数据
 *  @param failure 错误信息
 */
+ (void)getDataWithURL:(NSString *)url modelType:(NSString *)type success:(void(^)(NSMutableArray *dataArr))success failure:(void (^)(NSError *error))failure;

@end
