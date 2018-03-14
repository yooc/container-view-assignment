# CoderGirl-IOS

### Container Views

**Resources**
[developer.apple.com resource](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html)

**XCode Docs Text**
> Container View defines a region within a view controller's view subgraph that can include a child view controller. Create an embed segue from the container view to the child view controller in the storyboard.

**How does Apple use container views?**
Existing implementations of container views can be seen in UINavigationController, UITabBarController, and UISplitViewController (for iPad)

![navigation stack](./Images/navigationstack.png)

![tabBar Controller Views](./Images/tabbar_controllerviews.jpg)

![UISplitView Controller](./Images/splitview_master.png)
*Image credits: Apple Documentation*

**How does a container view fit into the view hierarchy?**

**Why would I want a container view?**

- Break down complex views into component parts
- Display multiple views in the same location
- Design a view only once and display it from multiple views

**How do I add a container view?**

**How do I add a child view to a container view?**

**How do I access a container view’s child controller?**

**How do I change a container view’s child controller?**

**How do I communicate between a child view controller and the parent view controller?**

- Delegation

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


