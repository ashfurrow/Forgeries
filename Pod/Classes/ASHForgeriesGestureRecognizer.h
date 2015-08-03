@import UIKit;

@interface UIGestureRecognizer (Forgeries)

- (void)invoke;

@end

#define ASHForgeryUIGestureRecognizerSubclass(name, superclass) \
@interface name : superclass \
 \
@property (nonatomic, readwrite) CGPoint testing_location; \
@property (nonatomic, readwrite) CGFloat testing_velocity; \
 \
@end

ASHForgeryUIGestureRecognizerSubclass(ASHForgeryTapGestureRecognizer, UITapGestureRecognizer)
ASHForgeryUIGestureRecognizerSubclass(ASHForgeryPinchGestureRecognizer, UIPinchGestureRecognizer) //@property (nonatomic,readonly) CGFloat velocity
ASHForgeryUIGestureRecognizerSubclass(ASHForgeryRotationGestureRecognizer, UIRotationGestureRecognizer) //@property (nonatomic,readonly) CGFloat velocity
ASHForgeryUIGestureRecognizerSubclass(ASHForgerySwipeGestureRecognizer, UISwipeGestureRecognizer)
ASHForgeryUIGestureRecognizerSubclass(ASHForgeryPanGestureRecognizer, UIPanGestureRecognizer)
ASHForgeryUIGestureRecognizerSubclass(ASHForgeryScreenEdgeGestureRecognizer, UIScreenEdgePanGestureRecognizer)
ASHForgeryUIGestureRecognizerSubclass(ASHForgeryLongPressGestureRecognizer, UILongPressGestureRecognizer)
