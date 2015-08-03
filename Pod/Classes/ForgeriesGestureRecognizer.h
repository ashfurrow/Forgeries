@import UIKit;

@interface UIGestureRecognizer (Forgeries)

- (void)invoke;

@end

#define ForgeryUIGestureRecognizerSubclass(name, superclass) \
@interface name : superclass \
 \
@property (nonatomic, readwrite) CGPoint testing_location; \
@property (nonatomic, readwrite) CGFloat testing_velocity; \
 \
@end

ForgeryUIGestureRecognizerSubclass(ForgeryTapGestureRecognizer, UITapGestureRecognizer)
ForgeryUIGestureRecognizerSubclass(ForgeryPinchGestureRecognizer, UIPinchGestureRecognizer)
ForgeryUIGestureRecognizerSubclass(ForgeryRotationGestureRecognizer, UIRotationGestureRecognizer)
ForgeryUIGestureRecognizerSubclass(ForgerySwipeGestureRecognizer, UISwipeGestureRecognizer)
ForgeryUIGestureRecognizerSubclass(ForgeryPanGestureRecognizer, UIPanGestureRecognizer)
ForgeryUIGestureRecognizerSubclass(ForgeryScreenEdgeGestureRecognizer, UIScreenEdgePanGestureRecognizer)
ForgeryUIGestureRecognizerSubclass(ForgeryLongPressGestureRecognizer, UILongPressGestureRecognizer)
