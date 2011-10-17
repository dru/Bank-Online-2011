//
//  Configuration.m
//  Bank Online 2011
//
//  Created by Андрей Мельник on 17.10.11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import "Configuration.h"

static Configuration *sharedConfiguration = nil;

@implementation Configuration

    @synthesize data, version;

    + (Configuration*)shared{
        if (nil == sharedConfiguration)
        {
            sharedConfiguration = [[Configuration alloc] init];
        }
        
        return sharedConfiguration;
    }

    -(id) init {
        if ((self = [super init]))
        {
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsPath = [paths objectAtIndex:0];
            NSString *downloadedFilePath = [documentsPath stringByAppendingPathComponent:@"index.json"];
            NSString *dataFilePath = [documentsPath stringByAppendingPathComponent:@"pref.data"];
            
            NSData *prefs = [NSData dataWithContentsOfFile:dataFilePath];
            
            if(prefs.length <=0){
                
                version  = [[NSNumber alloc] initWithFloat:1.0];
                [self savePrefs: dataFilePath];
                
            }else{
                
                NSKeyedUnarchiver *unarchiver = [[[NSKeyedUnarchiver alloc] initForReadingWithData:prefs] autorelease];
            
                version = [unarchiver decodeObjectForKey:@"version"];
            }
            
            NSLog(@"%@", version);
            
            NSString *filePath = nil;
            NSString *fileContent = nil;
            NSError *error = nil;
            
            BOOL toLoadJSONFromBundle = NO;
            
            NSFileManager *fileManager = [NSFileManager defaultManager];
            
            if ([fileManager fileExistsAtPath:downloadedFilePath]) {
                NSLog(@"Downloaded");
                filePath = downloadedFilePath;
                fileContent = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
                
                if ([fileContent length] <= 0) {
                    toLoadJSONFromBundle = YES;
                }
            } else {
                toLoadJSONFromBundle = YES;
            }
            
            if (toLoadJSONFromBundle) {
                NSLog(@"Local");
                filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"json"];
                fileContent = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
            }
                        
            NSDictionary *jsonDict = [fileContent JSONValue];
            
            [fileContent release];
            
            NSDictionary *tmpDict = [NSDictionary dictionaryWithDictionary:jsonDict];    
            
            if (tmpDict && [tmpDict count] > 0) {
                [data release];
                data = [tmpDict retain];
            }
            
        }
        return self;
    }

    -(void)savePrefs:(NSString *)path{
        
        NSLog(@"%@", path);
        
        NSMutableData *new_prefs = [NSMutableData data];
        
        NSKeyedArchiver *archiver = [[[NSKeyedArchiver alloc] initForWritingWithMutableData:new_prefs] autorelease];
        
        
        [archiver encodeObject:version forKey:@"version"];
        
        [archiver finishEncoding];
        
        [new_prefs writeToFile:path atomically:YES];
    }


    - (BOOL)isNewDataAvailable {
        NSError *error = nil;
        NSString *response = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://unteleported.com/bank-online-2011/version.json"] encoding:NSUTF8StringEncoding error:&error];
        if (error) {
            NSLog(@"error %@", [error localizedDescription]);
            return NO;
        }
        
        NSDictionary *dict = [NSDictionary dictionaryWithDictionary:[response JSONValue]];
        
        if ([[self version] isEqualToNumber:[dict objectForKey:@"version"]]) {
            return NO;
        }
        
        version = [[NSNumber alloc] initWithFloat:[[dict objectForKey:@"version"] floatValue]];
        
        NSLog(@"%@", version);
        
        return YES;
    }

- (void)loadNewDataFromServer {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://unteleported.com/bank-online-2011/index.json"]];
    
    receivedData = [[NSMutableData data] retain];

    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Receive response");
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)content
{
    [receivedData appendData:content];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *downloadedFilePath = [documentsPath stringByAppendingPathComponent:@"index.json"];
    NSString *dataFilePath = [documentsPath stringByAppendingPathComponent:@"pref.data"];

    NSError *error = nil;
    
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    
    [connection release];
  	NSString *responseString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    [receivedData release];
    
    [responseString writeToFile:downloadedFilePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    [self savePrefs:dataFilePath];
    exit(0);
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    [connection release];
    [receivedData release];
    
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

@end
