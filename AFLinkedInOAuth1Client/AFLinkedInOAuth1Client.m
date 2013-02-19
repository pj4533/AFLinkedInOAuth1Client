//
//  AFLinkedInOAuth1Client.m
//  ET
//
//  Created by PJ Gray on 1/29/13.
//  Copyright (c) 2013 Say Goodnight Software. All rights reserved.
//

#import "AFLinkedInOAuth1Client.h"

@implementation AFLinkedInOAuth1Client

#pragma mark - AFHTTPClient

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request = [super requestWithMethod:method path:path parameters:parameters];
    [request setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];    
    return request;
}

- (void)acquireOAuthAccessTokenWithPath:(NSString *)path
                           requestToken:(AFOAuth1Token *)requestToken
                           accessMethod:(NSString *)accessMethod
                                success:(void (^)(AFOAuth1Token *accessToken))success
                                failure:(void (^)(NSError *error))failure
{
    self.accessToken = requestToken;
    [super acquireOAuthAccessTokenWithPath:path requestToken:requestToken accessMethod:accessMethod success:success failure:failure];
}

@end
