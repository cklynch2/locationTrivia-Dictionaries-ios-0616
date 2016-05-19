//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length
{
    NSString *name = location[@"name"];
    NSString *truncatedName = [name copy];
    if (length <= name.length){
       truncatedName = [name substringToIndex:length];
    }
    return truncatedName;
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
    NSDictionary *dictionaryForLocationWithName = @{@"name" : name,
                                                    @"latitude" : @(latitude),
                                                    @"longitude" : @(longitude)};
    return dictionaryForLocationWithName;
}

-(NSArray *)namesOfLocations:(NSArray *)locations
{
    NSMutableArray *namesOfLocations = [[NSMutableArray alloc]init];
    for (NSDictionary *location in locations){
        [namesOfLocations addObject:location[@"name"]];
    }
    return namesOfLocations;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary
{
    BOOL isValidLocation = ([[dictionary allKeys] containsObject:@"name"] &&
                            ![dictionary[@"name"]  isEqualToString: @""] &&
                            
                            [[dictionary allKeys] containsObject:@"latitude"] &&
                            [dictionary[@"latitude"] integerValue] >= -90.0 &&
                            [dictionary[@"latitude"] integerValue] <= 90.0 &&
                             
                            [[dictionary allKeys] containsObject:@"longitude"] &&
                            [dictionary[@"longitude"] integerValue] >= -180.0 &&
                            [dictionary[@"longitude"] integerValue] <= 180.0 &&
                             
                            [[dictionary allKeys] count] == 3);
    return isValidLocation;
}

-(NSDictionary *)locationNamed:(NSString *)location inLocations:(NSDictionary *)locations
{
    for (NSDictionary *locationInDictionary in locations) {
        if ([locationInDictionary[@"name"] isEqualToString:location]) {
            return locationInDictionary;
        }
    }
    return nil;
}

@end
