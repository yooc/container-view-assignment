# CoderGirl-IOS

### Demo app: Puppy Rating App
- two content view controllers - normal puppies, most favorite puppy
- Track information about puppies
- Use swipe gesture to browse puppies
- Use double tap to save as most favorite puppy and display
- Have root controller rating buttons in another container view (ibDesignable!)

### Homework: A more sophisticated flash card app
- Use three content view controllers (front and back of card, report card)
- use swipe gesture to change flashcards
- Use double tap to show other side of flashcard
- Use IBDesignable and IBInspectable to style the container view to look like a card with rounded corners and drop shadow
- Include ability to remove cards from review
- Show a report when no more cards to review

Container Views
---
**Resources**
[developer.apple.com: container view](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html)
[developer.apple.com: view heirarchy](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CocoaViewsGuide/WorkingWithAViewHierarchy/WorkingWithAViewHierarchy.html)
[developer.apple.com UIViewController: implementing a child view controller](https://developer.apple.com/documentation/uikit/uiviewcontroller)

**XCode Docs Text**
> Container View defines a region within a view controller's view subgraph that can include a child view controller. Create an embed segue from the container view to the child view controller in the storyboard.

**How does Apple use container views?**

Existing implementations of container views can be seen in UINavigationController, UITabBarController, and UISplitViewController. More details are found in the container view developer guide (see resources).

![navigation stack](./Images/navigationstack.png)

![tabBar Controller Views](./Images/tabbar_controllerviews.jpg)

![UISplitView Controller](./Images/splitview_master.png)

*Image credits: Apple Documentation*

**How does a container view fit into the hierarchy?**

- A normal view is a UIView, which can have a single superview and many children views. A container is a UIContainerView, which has a single parent view controller and can have many children view controllers.

**How could I use a container view?**

- Break down complex views into component parts with their own view controller
- Facilitate AutoLayout, especially when rotating the device
- Display multiple views in the same location of a view controller
- Design a view only once and display it from multiple views

**How do I add a container view?**
This is easily done through the storyboard (Interface Builder). In the Object library find container view, and drag it where it is wanted in the storyboard. It will automatically generate a view which is connected with an Embed segue.

**How do I add a child view to a container view?**
This can be done either through the storyboard through the embed segue for a static child view controller. When switching between child view controllers, we will have to change the visible child controller programatically using the following methods:
https://useyourloaf.com/blog/container-view-controllers/
```

addChildViewController(_:)

removeFromParentViewController()

willMove(toParentViewController:)

didMove(toParentViewController:)
```

When doing this programmatically it is important to follow a strict order of operation:
1. Establish a parent-child relationship to allow system messages to be propogated through the heirarchy
1. Add the child's root view to the view heirarchy
1. Add the child view controller to the parent view controller

When removing a child view controller, reverse the order of operation.

```
private func addContentController(_ child: UIViewController, to stackView: UIStackView) {
    addChildViewController(child)
    stackView.addArrangedSubview(child.view)
    child.didMove(toParentViewController: self)
}

private func removeContentController(_ child: UIViewController, from stackView: UIStackView) {
    child.willMove(toParentViewController: nil)
    stackView.removeArrangedSubview(child.view)
    child.view.removeFromSuperview()
    child.removeFromParentViewController()
}
```
[code credit](https://useyourloaf.com/blog/container-view-controllers/)*

**How do I communicate between a child view controller and the parent view controller?**
Delegation, of course! In order to set the parent view controller as the delegate to the container view's child view controller, we need to override prepare(for:sender:) and identify which view controller is going to be loaded.

```
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.destination {
        case let viewController1 as ViewController1:
            self.viewController1 = viewController1
            viewController1.delegate = self
        case let viewController2 as ViewController2:
            self.viewController2 = viewController2
            viewController2.delegate = self
        default:
            break
        }
}
```
*[code credit](https://medium.com/@superpeteblaze/ios-swift-tip-getting-references-to-container-child-view-controllers-653fe58e6f5e)

Custom Views
---
**Resources**
[developer.apple.com: NIB files](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/LoadingResources/CocoaNibs/CocoaNibs.html)


Gestures
---
