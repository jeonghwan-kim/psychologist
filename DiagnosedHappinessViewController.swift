//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Chris on 2016. 3. 15..
//  Copyright © 2016년 WePlanet. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController : HappinessViewController, UIPopoverPresentationControllerDelegate
{
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        get { return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? [] }
        set { defaults.setObject(newValue, forKey: History.DefaultsKey) }
    }
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History" // id와 동일해야함
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    // iphone에 맞추기 위한 코드, UIPopoverPresentationControllerDelegate를 상속하고 아래 인터페이스 구현
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
