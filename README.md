# AFLinkedInOAuth1Client

An AFOAuth1Client subclass for easily authenticating with LinkedIn.

## Instructions

Register your application to [launch from a custom URL scheme](http://iphonedevelopertips.com/cocoa/launching-your-own-application-via-a-custom-url-scheme.html), and use that with the path `/success` as your callback URL.

Here's how it all looks together:

``` objective-c
AFLinkedInOAuth1Client *linkedinClient = [[AFLinkedInOAuth1Client alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.linkedin.com/"]
                                                                     key:@"KEY"
                                                                  secret:@"SECRET"];
    
[linkedinClient authorizeUsingOAuthWithRequestTokenPath:@"uas/oauth/requestToken"
                                  userAuthorizationPath:@"uas/oauth/authorize"
                                            callbackURL:[NSURL URLWithString:@"x-yourscheme://success"]
                                        accessTokenPath:@"uas/oauth/accessToken"
                                           accessMethod:@"POST"
                                                success:^(AFOAuth1Token *accessToken) {
                                                    NSLog(@"Success: %@", accessToken);
                                                } failure:^(NSError *error) {
                                                    NSLog(@"Error: %@", error);
                                                }];
```

## Details for LinkedIn

Two problems occur from the base AFOAuth1Client implementation, onlined on [this page](http://developer.linkedin.com/documents/common-issues-oauth-authentication).

* Content-Type needs to be text/xml.   Don't think thats in the OAuth spec...
* "Properly handling oauth_token_secret"

## Contact

PJ Gray

- http://github.com/pj4533
- http://twitter.com/pj4533
- pj@pj4533.com

## License

AFLinkedInOAuth1Client is available under the MIT license. See the LICENSE file for more info.

