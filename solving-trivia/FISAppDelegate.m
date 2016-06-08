//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    NSArray *states = [self states];
    [self namesToCharacters:states];
    
    NSArray *capitals = [self capitals];
    [self namesToCharacters:capitals];
    
    [self solveTrivia];
    
    return YES;

}

// What is the only state whose capital contains none of the characters as the state name?

-(NSArray *)states {
    NSArray *states = @[@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming"];
    return states;
}

-(NSArray *)capitals {
    NSArray *capitals = @[@"Montgomery", @"Juneau", @"Phoenix", @"Little Rock", @"Sacramento", @"Denver", @"Hartford", @"Dover", @"Tallahassee", @"Atlanta", @"Honolulu", @"Boise", @"Springfield", @"Indianapolis", @"Des Moines", @"Topeka", @"Frankfort", @"Baton Rouge", @"Augusta", @"Annapolis", @"Boston", @"Lansing", @"Saint Paul", @"Jackson", @"Jefferson City", @"Helena", @"Lincoln", @"Carson City", @"Concord", @"Trenton", @"Santa Fe", @"Albany", @"Raleigh", @"Bismarck", @"Columbus", @"Oklahoma City", @"Salem", @"Harrisburg", @"Providence", @"Columbia", @"Pierre", @"Nashville", @"Austin", @"Salt Lake City", @"Montpelier", @"Richmond", @"Olympia", @"Charleston", @"Madison", @"Cheyenne"];
    return capitals;
}
                       
-(NSArray *)namesToCharacters:(NSArray *)names {
    NSMutableArray *namesToCharacters = [names mutableCopy];
    for (NSUInteger i = 0; i < [names count]; i++) {
        NSString *name = namesToCharacters[i];
        name = [name lowercaseString];
        name = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSMutableArray *charactersInName = [[NSMutableArray alloc]init];
        for (NSUInteger j = 0; j < [name length]; j++) {
            NSString *nameCharacter = [NSString stringWithFormat:@"%C", [name characterAtIndex:j]];
            [charactersInName addObject:nameCharacter];
        }
        [namesToCharacters replaceObjectAtIndex:i withObject:charactersInName];
    }
    return namesToCharacters;
}

-(BOOL)characterInCommonForState:(NSArray *)state AndCapital:(NSArray *)capital {
    if ([state count] >= [capital count]) {
        // Check each letter in the capital against all letters in the state. Use capital count as iteration limit since it is the shorter array.
        for (NSUInteger i = 0; i < [capital count]; i++) {
            if ([state containsObject:capital[i]]) {
                NSLog(@"This state and capital have shared letter(s): %@, %@", state, capital);
                return YES;
            }
        }
        
    } else if ([state count] < [capital count]) {
        // Check each letter in the state against all letters in the capital. Use state count as iteration limit since it is the shorter array.
        for (NSUInteger i = 0; i < [state count]; i++) {
            if ([capital containsObject:state[i]]) {
                return YES;
            }
        }
    }
    return NO;
}

- (NSString *)solveTrivia {
    NSString *stateWithCapitalHavingNoCommonCharacters = [@"" mutableCopy];
    
    NSArray *states = [self states];
    NSArray *capitals = [self capitals];
    
    NSArray *stateCharacters = [self namesToCharacters:states];
    NSArray *capitalCharacters = [self namesToCharacters:capitals];

    for (NSUInteger i = 0; i < [stateCharacters count]; i++) {
        if (![self characterInCommonForState:stateCharacters[i] AndCapital:capitalCharacters[i]]) {
            NSLog(@"We entered the if statement for this state: %@", stateCharacters[i]);
            stateWithCapitalHavingNoCommonCharacters = states[i];
        }
    }
    NSLog(@"This is the answer! %@", stateWithCapitalHavingNoCommonCharacters);
    return stateWithCapitalHavingNoCommonCharacters;
}

@end
