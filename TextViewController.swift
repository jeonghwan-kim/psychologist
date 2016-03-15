//
//  TextViewController.swift
//  Psychologist
//
//  Created by Chris on 2016. 3. 15..
//  Copyright © 2016년 WePlanet. All rights reserved.
//

import UIKit

class TextViewController: UIViewController
{
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }

    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }
    
    // popover 크기를 contents에 맞추기 위한 코드 
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue }
    }
}
