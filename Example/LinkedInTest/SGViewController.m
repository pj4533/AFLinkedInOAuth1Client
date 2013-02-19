//
//  SGViewController.m
//  LinkedInTest
//
//  Created by PJ Gray on 2/19/13.
//  Copyright (c) 2013 Say Goodnight Software. All rights reserved.
//

#import "SGViewController.h"
#import "AFLinkedInOAuth1Client.h"
#import "AFXMLRequestOperation.h"

@interface SGViewController ()

@end

@implementation SGViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doItTapped:(id)sender {
    AFLinkedInOAuth1Client *oauthClient = [[AFLinkedInOAuth1Client alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.linkedin.com/"]
                                                                                         key:@"KEY"
                                                                                      secret:@"SECRET"];
    
    [oauthClient authorizeUsingOAuthWithRequestTokenPath:@"uas/oauth/requestToken"
                                      userAuthorizationPath:@"uas/oauth/authorize"
                                                callbackURL:[NSURL URLWithString:@"linkedintest://success"]
                                            accessTokenPath:@"uas/oauth/accessToken"
                                               accessMethod:@"POST"
                                                    success:^(AFOAuth1Token *accessToken) {
                                                        
                                                        [oauthClient getPath:@"v1/people/~:(id,first-name,last-name,headline)" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

                                                            NSLog(@"JSON RESPONSE: %@", responseObject);
                                                        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                            NSLog(@"ERROR: %@", error);
                                                        }];
                                                        
                                                        
                                                    } failure:^(NSError *error) {
                                                        NSLog(@"Error: %@", error);
                                                    }];

}
@end
