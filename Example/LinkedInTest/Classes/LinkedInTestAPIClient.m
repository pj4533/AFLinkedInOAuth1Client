#import "LinkedInTestAPIClient.h"
#import "AFJSONRequestOperation.h"

static NSString * const kLinkedInTestAPIBaseURLString = @"<# API Base URL #>";

@implementation LinkedInTestAPIClient

+ (LinkedInTestAPIClient *)sharedClient {
    static LinkedInTestAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kLinkedInTestAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
