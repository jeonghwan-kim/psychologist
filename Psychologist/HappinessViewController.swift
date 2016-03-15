//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Chris on 2016. 3. 13..
//  Copyright © 2016년 WePlanet. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    var happiness: Int = 25 { // 0 = very sad, 100 = scstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gusture: UIPanGestureRecognizer) {
        switch gusture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gusture.translationInView(faceview)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gusture.setTranslation(CGPointZero, inView: faceview)
            }
        default: break
        }
    }
    
    @IBOutlet weak var faceview: FaceView! {
        didSet {
            faceview.dataSource = self
            faceview.addGestureRecognizer(UIPinchGestureRecognizer(target: faceview, action: "scale:"))
        }
    }
    
    private func updateUI() {
        faceview?.setNeedsDisplay() // if faceview is nill, ignore this statement
        print("updateUI()")
        title = "\(happiness)"
    }
    
    func smilnessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
}
