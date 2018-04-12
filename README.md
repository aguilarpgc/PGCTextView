# PGCTextView

[![Swift](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/badge/license-MIT-71787A.svg)](https://tldrlegal.com/license/mit-license)


## Simple Customizable UITextView

Works in xib file and code.

### Usage

#### Code

```swift
pgcTextView2 = PGCTextView()
pgcTextView2.counterColor = .blue
pgcTextView2.counterFont = UIFont.italicSystemFont(ofSize: 11)
pgcTextView2.font = UIFont.systemFont(ofSize: 25)
pgcTextView2.frame = CGRect(x: 20.0, y: 100.0, width: 150.0, height: 200.0)
pgcTextView2.isCounterAscending = true
pgcTextView2.isCounterVisible = true
pgcTextView2.maxCharacters = 50
pgcTextView2.placeholderColor = .darkGray
pgcTextView2.placeholderFont = UIFont.italicSystemFont(ofSize: 25)
pgcTextView2.placeholderText = "Placeholder"
pgcTextView2.text = ""
pgcTextView2.textColor = .black
```

### Xib file

Add `PGCTextView` in custom class.

![Class](https://github.com/aguilarpgc/PGCTextView/blob/master/Images/class_name.png)

Modify custom properties for placeholder and counter.

![Xib](https://github.com/aguilarpgc/PGCTextView/blob/master/Images/xib.png)

## License

PGCTextView is released under the MIT license.

