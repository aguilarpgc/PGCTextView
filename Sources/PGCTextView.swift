//
//  PGCTextView.swift
//  TestTextView
//
//  Created by Paul Aguilar on 4/3/18.
//  Copyright © 2018 aguilarpgc. All rights reserved.
//

//#if os(iOS)
import  UIKit
//#endif

@IBDesignable
public class PGCTextView: UITextView {

    // MARK: - Properties
    // MARK: - Property Observers -

    @IBInspectable public var counterColor: UIColor = .black {
        didSet { updateCounter() }
    }
    @IBInspectable public var isCounterVisible: Bool = false {
        didSet { updateCounter() }
    }
    @IBInspectable public var isCounterAscending: Bool = false {
        didSet { updateCounter() }
    }
    @IBInspectable public var maxCharacters: UInt = 0 {
        didSet { updateCounter() }
    }
    @IBInspectable public var placeholderText: String = "" {
        didSet { updatePlaceholder() }
    }
    @IBInspectable public var placeholderColor: UIColor = .darkGray {
        didSet { updatePlaceholder() }
    }

    override public var font: UIFont! {
        didSet { updatePlaceholder() }
    }
    override public var text: String! {
        didSet { textChanged() }
    }

    public var placeholderFont: UIFont? {
        didSet {

            guard placeholderFont != nil else { return }

            placeholderLabel.font = placeholderFont
        }
    }
    public var counterFont = UIFont.systemFont(ofSize: 12) {
        didSet {

            counterLabel.font = counterFont
        }
    }

    // MARK: - Lazy Properties -

    private lazy var placeholderLabel: UILabel = {

        let label = UILabel()
        label.lineBreakMode = .byClipping
        label.font = self.font
        label.numberOfLines = 0
        label.text = placeholderText
        label.textAlignment = .left
        self.addSubview(label)

        return label
    }()

    private lazy var counterLabel: UILabel = {

        let counterFrame = CGRect(
            x: self.bounds.size.width - 40.0,
            y: self.bounds.size.height - 30.0,
            width: 30.0,
            height: 20.0
        )

        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = self.font
        label.frame = counterFrame
        label.text = "\(maxCharacters)"
        label.textAlignment = .center
        self.addSubview(label)

        return label
    }()

    // MARK: - Initializer -

    deinit {

        NotificationCenter.default.removeObserver(self)
    }

    public override func draw(_ rect: CGRect) {
        
        super.draw(rect)

        firstSetup()
        updateAll()
    }

    // MARK: - Setup -

    private func firstSetup() {

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.textChanged),
            name: NSNotification.Name.UITextViewTextDidChange,
            object: nil)
    }

    // MARK: - Methods -

    @objc private func textChanged() {

        placeholderLabel.isHidden = !text.isEmpty

        if maxCharacters > 0 && isCounterVisible {

            if self.text.count > maxCharacters {

                let range = self.text.startIndex..<self.text.index(self.text.startIndex, offsetBy: Int(maxCharacters))

                let tempText = self.text[range]
                self.text = String(tempText)
            }

            updateCounterTracking()
        }
    }

    // MARK: - Update -

    private func updateAll() {

        updateCounter()
        updateCounterFrame()
        updatePlaceholder()

        placeholderLabel.isHidden = !text.isEmpty
    }

    private func updatePlaceholder() {

        let placeholderFrame = CGRect(
            x: self.textContainerInset.left + self.textContainer.lineFragmentPadding,
            y: self.textContainerInset.top + 0.5,
            width: self.bounds.size.width - (self.textContainerInset.left + self.textContainerInset.right),
            height: self.bounds.size.height - (self.textContainerInset.top + self.textContainerInset.bottom))

        if self.placeholderFont != nil {
            placeholderLabel.font = self.placeholderFont
        }
        placeholderLabel.frame = placeholderFrame
        placeholderLabel.text = placeholderText
        placeholderLabel.textAlignment = self.textAlignment
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.sizeToFit()
    }

    private func updateCounterFrame() {

        let counterFrame = CGRect(
            x: self.bounds.size.width - 40.0,
            y: self.bounds.size.height - 30.0,
            width: 30.0,
            height: 20.0
        )

        counterLabel.frame = counterFrame
    }

    private func updateCounter() {

        counterLabel.font = counterFont
        counterLabel.textColor = counterColor

        guard maxCharacters > 0 && isCounterVisible else {

            counterLabel.isHidden = true
            return
        }

        counterLabel.isHidden = false

        updateCounterTracking()
    }

    private func updateCounterTracking() {

        if isCounterAscending {
            counterLabel.text = "\(self.text.count)"
        }
        else {
            counterLabel.text = "\(Int(maxCharacters) - self.text.count)"
        }
    }
}
