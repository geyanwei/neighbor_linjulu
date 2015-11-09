//
//  DataRequest.m
//  Neighbour
//
//  Created by apple on 15/11/4.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "DataRequest.h"


@interface DataRequest ()

@end

@implementation DataRequest

//get请求
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //拼接参数
    
    [[AFHTTPRequestOperationManager manager] GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

//post请求
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //拼接参数
    
    [[AFHTTPRequestOperationManager manager] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+ (void)getDataWithURL:(NSString *)url modelType:(NSString *)type success:(void(^)(NSMutableArray *dataArr))success failure:(void (^)(NSError *error))failure
{
    [[AFHTTPRequestOperationManager manager] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //回调数据
        //装数据
        NSMutableArray *muArr = [NSMutableArray array];
        if (success) {
            success(muArr);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
        
    }];
}

@end
