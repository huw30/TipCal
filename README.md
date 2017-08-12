# Pre-work - TipCal

TipCal is an iOS app for easy calculating tips

Submitted by: Raina (Huan) Wang

Time spent: 10 hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
- [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
- [ ] UI animations
- [x] Remembering the bill amount across app restarts (if <10mins)
- [ ] Using locale-specific currency and currency thousands separators.
- [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Added a clear button to bill text field for easy clear out content
- [x] Gradient Background (Not looking good in gif, [here](http://imgur.com/a/LdsJB)'s a image view of the gradient background)

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![Video Walkthrough](https://user-images.githubusercontent.com/5446130/29244728-abf7f9ee-7f74-11e7-8f7f-451e962f90aa.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:**

Things I like about iOS app dev so far:
- xCode does a great job on UI creation, easy drag and drop, and edit the properties, and even the alignment hint is so helpful
- Syntax hint in xCode is pretty useful for beginners
- Almost everything in Swift is object, strong object oriented design, e.g. `UIColor`
- Adding extensions to a predefined object like `UIViewController` is pretty easy
- App assets are well and easy managed e.g. upload an image and ready to select from dropdown
- So easy to store non-sensitive user data

Things I can complain about iOS (based on my current knowledge):
- Adding certain styles and layers programmatically doesn't reflect in storyboard, e.g. added a gradient background layer doesn't show on the storyboard, so making the label font white means you'll never find the label anymore
- Certain UI components are so strictly defined, which makes customization more difficult e.g. `UISegmentControl`
- It takes time for me to get used to the concept of `optional` - `?` and `unwrap` - `!` an object

As for outlets and actions:

Outlet: a reference in code to the certain element, presented as an object of the element's type. For example, an outlet for a button on your storyboard will be an object type of `UIButton`, it inherits the properties and methods from `UIButton`.

Action: a method that will be called once certain event is triggered to the corresponding element. For example, you want to print a message in console once a button is clicked.

How are outlets and actions implemented under the hood?
- Each object is presented as an XML element in the source code of the storyboard
- If an action was added to an object, then an `<action>` tag is added as a child inside the object's `<collection>` tag with properties
- The `viewController` XML element has a child called `<connections>` which contains all the outlets that were defined within this controller, referenced by the element id as `destination`.

**Question 1**: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:**

- ARC will deallocate an instance of a class or a closure when there's no strong reference to the instance or closure.

- Say you have a class, with a property that is referencing a self-contained function as a closure. This closure is also managed by ARC, same as an instance of a class. And if in the closure, you have a reference to `self`, which is the class instance itself, then we might get a strong reference cycle for closure.

- Defining a capture list of either weak or unowned inside the closure will declare a weak or unowned reference to the `self`, then the reference cycle will be break once the class instance is unreferenced and deallocated.


## License

    Copyright Raina Wang

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
