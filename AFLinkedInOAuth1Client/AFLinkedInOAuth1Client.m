//
//  AFLinkedInOAuth1Client.m
//  ET
//
//  Created by PJ Gray on 1/29/13.
//  Copyright (c) 2013 Say Goodnight Software. All rights reserved.
//

#import "AFLinkedInOAuth1Client.h"
#import "AFJSONRequestOperation.h"

@implementation AFLinkedInOAuth1Client

#pragma mark - AFHTTPClient

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request = [super requestWithMethod:method path:path parameters:parameters];

    
    // if we are doing oauth then set the content type to xml,
    // otherwise add accept for text/plain so we process the JSON correctly.
    NSRange textRange;
    textRange =[path rangeOfString:@"oauth"];
    if(textRange.location != NSNotFound) {
        [request setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    } else {
        [request setValue:@"text/plain" forHTTPHeaderField:@"Accept"];
    }

    return request;
}

- (void)acquireOAuthAccessTokenWithPath:(NSString *)path
                           requestToken:(AFOAuth1Token *)requestToken
                           accessMethod:(NSString *)accessMethod
                                  scope:(NSString *)scope
                                success:(void (^)(AFOAuth1Token *accessToken, id responseObject))success
                                failure:(void (^)(NSError *error))failure
{
    self.accessToken = requestToken;
    [super acquireOAuthAccessTokenWithPath:path requestToken:requestToken accessMethod:accessMethod success:success failure:failure];
}

- (id)initWithBaseURL:(NSURL *)url
                  key:(NSString *)clientID
               secret:(NSString *)secret {
    self = [super initWithBaseURL:url key:clientID secret:secret];
    if (!self) {
        return nil;
    }
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/plain"]];
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"x-li-format" value:@"json"];

    return self;
}

@end
