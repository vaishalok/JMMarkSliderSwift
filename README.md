# JMMarkSliderSwift
======================
[![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)](https://github.com/andresbrun/ABCustomUINavigationController/blob/master/LICENSE)

This is Swift 3 version of [JMMarkSlider.](https://github.com/joamafer/JMMarkSlider)

It is a fully customizable slider that allows you to set marks on it. You can set the color of the bar, marks and handler, the width of the marks and even an image for the handler.

![alt tag](https://s3.amazonaws.com/cocoacontrols_production/uploads/control_image/image/4306/JMMarkSlider.png)


How to Install it
------------
JMMarkSliderSwift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JMMarkSliderSwift"
```

#### Classic and ancient way
Copy into your project the following file:
`JMMarkSlider.swift`

How to use it? 
------------
#### First way (User Interface):

Add an UISlider outlet to your view using the User Interface and set `JMMarkSlider` as the custom class. All the exposed properties are marked with **@IBInspectable**, so you can customize them in storyboard's attributes inspector and preview it directly. 

Link it with the outlet property if you want to access its properties:

@IBOutlet weak var firstSlider: JMMarkSlider!

Simply customize it! (take a look at -Customization- section)

firstSlider.markColor = UIColor(white: 1, alpha: 0.5)
firstSlider.markPositions = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
firstSlider.markWidth = 1.0
firstSlider.selectedBarColor = .gray
firstSlider.unselectedBarColor = .black

#### Second way (Using code):
var secondSlider: JMMarkSlider!

Instantiate and customize it (again, take a look at -Customization- section). Finally add it to the desired view as usual:

secondSlider = JMMarkSlider()
secondSlider.frame = CGRect(x: 0, y: 200, width: 284, height: 31)
secondSlider.markColor = UIColor(white: 1, alpha: 0.5)
secondSlider.markPositions = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
secondSlider.markWidth = 1.0
secondSlider.selectedBarColor = .gray
secondSlider.unselectedBarColor = .black
view.addSubview(secondSlider)

Setting the marks
------------
You can set the marks using a percentage system from 0 to 100. Set all the marks in the `markPositions array` property:

firstSlider.markPositions = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

Customization
------------
Here you can see a bunch of parameters that you can change:

#### Marks
- `markColor` : UIColor  - Customize the color of the marks.
- `markWidth`: Float - Customize the width of the marks.
- `markPositions`: [Float] - Set in a percentage system from 0 to 100 where the marks should be placed.

#### Bar colors
- `selectedBarColor`: UIColor - Customize the color of the selected side of the slider.
- `unselectedBarColor`: UIColor - Customize the color of the unselected side of the slider.

#### Handler.
- `handlerColor`: UIColor - Customize the color of the handler.
- `handlerImage`: UIImage  - Set a custom UIImage for the handler.


## Author
vaishalok, vaish.alok16@gmail.com

## License
JMMarkSliderSwift is available under the MIT license. See the LICENSE file for more info.
