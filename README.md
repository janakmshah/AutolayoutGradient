# AutolayoutGradient

[![CI Status](https://img.shields.io/travis/janakmshah/AutolayoutGradient.svg?style=flat)](https://travis-ci.org/janakmshah/AutolayoutGradient)
[![Version](https://img.shields.io/cocoapods/v/AutolayoutGradient.svg?style=flat)](https://cocoapods.org/pods/AutolayoutGradient)
[![License](https://img.shields.io/cocoapods/l/AutolayoutGradient.svg?style=flat)](https://cocoapods.org/pods/AutolayoutGradient)
[![Platform](https://img.shields.io/cocoapods/p/AutolayoutGradient.svg?style=flat)](https://cocoapods.org/pods/AutolayoutGradient)

## Why?

`CAGradientLayer` gives us a powerful method to add gradient backgrounds to our UIViews. However, inserting the CAGradientLayer as a sublayer doesn't respect Autolayout. As soon as your UIView resizes, for example if you're using a .xib file of size *iPhone 11 Max* but the device that has the app on it is a *iPhone 8*, then the gradient layer will retain it's original size like this:

![incorrect](../master/assets/incorrect.png?raw=true)

Instead of respecting Autolayout and resizing to match it's UIView, like this:

![correct](../master/assets/correct.png?raw=true)

To solve this problem and have the gradient layer "just work" where it follows the UIView's resizing and layout out, is to **replace** the UIView's `.layer` with a `CAGradientLayer` type. Which is what this library provides.

## Installation

AutolayoutGradient is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AutolayoutGradient'
```

## Usage

The first thing you'll need to do is import the library into the file(s) where you want to use Autolayout gradients.

```swift
import AutolayoutGradient
```

### Method 1: Use the built-in GradientView class.

This is the easiest way to get gradients, and provides a bare-bones UIView which supports autolayout gradients. Init and add to your viewController in the same way you would a UIView:

```swift
let gradientView = GradientView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
self.view.addSubview(roundedRect)
```

Then instruct the view to apply a gradient. The `applyGradient` function takes an array of tuples: `(UIColor, Double)`. The `Double` indicates the location, between 0.0 and 1.0, where the gradient will only display the associated color. Here are some examples:

```swift
gradientView.applyGradient([(.white, 0.0), (.black, 1.0)])
```

```swift
gradientView.applyGradient([(.white, 0.0), (.black, 1.0), (.white, 0.0), (.white, 0.0)])
```

```swift
gradientView.applyGradient([(.red, 0.0), (.orange, 1.0), (.yellow, 0.0), (.green, 1.0), (.blue, 0.0), (.purple, 0.0)])
```

### Method 2: Use your own UIView subclass.

The `applyGradient` has been added as a UIView extension, which means any UIView can use it. This is useful when you have your own `CustomView` class which you want to add gradients to without subclassing the included `GradientView`. The one step you need to take to make your `CustomView` able to apply gradients, is to override the layerClass UIView property, like so:

```swift
class YourCustomView: UIView {

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
}
```

Enjoy!

## Author

Janak Shah, [janakshah.com](janakshah.com)

## License

AutolayoutGradient is available under the MIT license. See the LICENSE file for more info.
