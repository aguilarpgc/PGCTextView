//
//  ViewController.swift
//  TestTextView
//
//  Created by Paul Aguilar on 4/3/18.
//  Copyright © 2018 aguilarpgc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum TextViewInitiable {
        case code
        case nib
    }

    // MARK: - Outlets -

    @IBOutlet weak var pgcTextView1: PGCTextView!

    // MARK: - Properties -

    var pgcTextView2: PGCTextView!

    var modeTextView: TextViewInitiable = .code // change this to test

    // MARK: - Override UIViewController -

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGray

        switch modeTextView {
        case .code: setupViewFromCode()
        case .nib: setupViewFromNibFile()
        }
    }

    // MARK: - Methods -

    func setupViewFromCode() {

        pgcTextView2 = PGCTextView() //frame: .zero)
        pgcTextView2.counterColor = .blue
        pgcTextView2.counterFont = UIFont.italicSystemFont(ofSize: 11)
        pgcTextView2.font = UIFont.systemFont(ofSize: 20)
        pgcTextView2.frame = CGRect(x: 20.0, y: 100.0, width: 150.0, height: 200.0)
        pgcTextView2.isCounterAscending = true
        pgcTextView2.isCounterVisible = true
        pgcTextView2.maxDigits = 30
        pgcTextView2.placeholder = "Placeholder"
        pgcTextView2.placeholderColor = .lightGray
        pgcTextView2.placeholderFont = UIFont.systemFont(ofSize: 17)
        pgcTextView2.text = ""
        pgcTextView2.textColor = .purple
        
        self.view.addSubview(pgcTextView2)
        pgcTextView1.isHidden = true
    }

    func setupViewFromNibFile() {

        pgcTextView1.isHidden = false
    }
}
