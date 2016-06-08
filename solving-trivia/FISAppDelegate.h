//  FISAppDelegate.h

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSString *)solveTrivia;
- (NSArray *)namesToCharacters:(NSArray *)names;
-(BOOL)characterInCommonForState:(NSArray *)state AndCapital:(NSArray *)capital;

@end
