CCPClassDump
============
CCPClassDump is a class to dump a class structure. It's useful to find out about
a structure of system private classes.




How to Use
----------
1. Add `CCPClassDump` directory to your project.

2. Import `CCPClassDump.h`:

	```objc
	#import "CCPClassDump.h"
	```

3. Call `CCPStringFromClassDump` with target class:

	```objc
	NSString *result = CCPStringFromClassDump([TargetClass class]);
	...
	```



Example
-------
Code:
```objc
NSString *result = CCPStringFromClassDump([UITextField class]);
NSLog(@"%@", result);
```

Output:
```
@interface UITextField : UIControl<UIKeyboardInput, _UILayoutBaselineUpdating, UITextInputTraits_Private, UIPopoverControllerDelegate, UITextInput, NSCoding>
@property text;
@property attributedText;
@property textColor;
...
+ (bool)_isCompatibilityTextField;
+ (bool)_isDisplayingShortcutViewController;
- (void)__resumeBecomeFirstResponder;
- (void)_activateSelectionView;
- (void)_addShortcut:(id)arg1;
...
@end
```
