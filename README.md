# Forgeries

Forgeries is a library that makes unit testing iOS applications easier. UIKit has lots of limitations 
that make sense in production code, but make testing difficult. Forgeries fixes that problem.

## Usage

Currently, the library provides subclasses of the standard gesture recognizers:

- ForgeryTapGestureRecognizer
- ForgeryPinchGestureRecognizer
- ForgeryRotationGestureRecognizer
- ForgerySwipeGestureRecognizer
- ForgeryPanGestureRecognizer
- ForgeryScreenEdgeGestureRecognizer
- ForgeryLongPressGestureRecognizer

These subclasses keep track of the number of times they've invoked their targets' actions; a handy interface to `UIGestureRecognizer` is provided:

```objc
@interface UIGestureRecognizer (Forgeries)

- (void)invoke;

@end
```

The trick is to use the subclasses in _testing only_. I like to use dependency injection. 

Say you're testing `MyViewController`, you'd use lazy loading for your recognizer.

```objc
@interface MyViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *recognizer;

@end

@implementation MyViewController

...

- (UITapGestureRecognizer *)recognizer {
	if (_recognizer == nil) {
		_recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
	}

	return _recognizer;
}

...
```

What we need to do is set that property before it is lazily loaded. Here's our testing code:

```objc
MyViewController *subject = /* Instantiate somehow */
ForgeryTapGestureRecognizer *recognizer = [[ForgeryTapGestureRecognizer alloc] initWithTarget:subject action:@selector(handleGestureRecognizer:)];
subject.recognizer = recognizer;

/* Optionally, set the testing_location and testing_velocity properties on recognizer. */

[recognizer invoke];

expect(subject).to( /* have done something, whatever it is you're testing for */ );
```

## Requirements

Requires iOS 7 or higher.

## Installation

Forgeries is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile under the _unit testing_ target:

```ruby
target 'MyApp_Tests' do

  pod 'forgeries'

  ...

end
```

Now import the library in your unit tests.

```swift
import Forgeries
```

```objc
@import Forgeries;
// or #import <Forgeries/Forgeries.h>
```

## Author

Ash Furrow, ash@ashfurrow.com

## License

Forgeries is available under the MIT license. See the LICENSE file for more info.
