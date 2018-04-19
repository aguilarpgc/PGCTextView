# PGCTextView

[![Swift](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/badge/license-MIT-71787A.svg)](https://tldrlegal.com/license/mit-license)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://developer.apple.com/ios/)


## Simple Customizable UITextView

Works in xib file and code.

### Usage

#### Code

```swift
let customTextView = PGCTextView()
customTextView.counterColor = .blue
customTextView.counterFont = UIFont.italicSystemFont(ofSize: 11)
customTextView.font = UIFont.systemFont(ofSize: 25)
customTextView.frame = CGRect(x: 20.0, y: 100.0, width: 150.0, height: 200.0)
customTextView.isCounterAscending = true
customTextView.isCounterVisible = true
customTextView.maxCharacters = 50
customTextView.placeholderColor = .darkGray
customTextView.placeholderFont = UIFont.italicSystemFont(ofSize: 25)
customTextView.placeholderText = "Placeholder"
customTextView.text = ""
customTextView.textColor = .black
self.view.addSubview(customTextView)
```

### Xib file

Add `PGCTextView` in Identity inspector > Custom Class > Class.

![Class](https://github.com/aguilarpgc/PGCTextView/blob/master/Images/class_name.png)

Modify custom properties for placeholder and counter.

![Xib](https://github.com/aguilarpgc/PGCTextView/blob/master/Images/xib_file.png)

## License

PGCTextView is released under the MIT license.

