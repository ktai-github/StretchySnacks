//
//  ViewController.swift
//  StretchySnacks
//
//  Created by KevinT on 2018-03-29.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var heightConstraint: NSLayoutConstraint!
  @IBOutlet weak var snacksStackView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func plusButtonTouched(_ sender: UIButton) {
    print("plus button pressed")
    
    let closedValue:CGFloat = 66
    let openValue:CGFloat = 200
    
    let rotated:CGFloat = -0.75
    let unrotated:CGFloat = 0
    
    var isNavClosed:Bool
    
    if self.heightConstraint.constant == closedValue {
      isNavClosed = true
    }else{
      isNavClosed = false
    }
    
    let newValue:CGFloat = isNavClosed ? openValue : closedValue
    
//    if self.heightConstraint.constant == CGFloat(200) {
//      self.heightConstraint.constant = CGFloat(66)
//      let animation = CABasicAnimation(keyPath: "transform.rotation.z")
//      animation.duration = 0.5
//      animation.fromValue = -0.75
//      animation.toValue = 0
//      plusButton.layer.add(animation, forKey: "transform.rotation.z")
//
//      UIView.animate(withDuration: 0.75, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: [], animations: {
//        self.heightConstraint.constant = newValue
//        self.view.layoutIfNeeded()
//
//      })
//
//      self.view.layoutIfNeeded()
//      return
//    }
    
    let animation = CABasicAnimation(keyPath: "transform.rotation.z")
    animation.duration = 0.5
    
    let newAngle:CGFloat = isNavClosed ? rotated : unrotated
    let oldAngle:CGFloat = isNavClosed ? rotated : unrotated

    animation.fromValue = oldAngle
    animation.toValue = newAngle
    animation.fillMode = kCAFillModeForwards;
    animation.isRemovedOnCompletion = false;
    plusButton.layer.add(animation, forKey: "transform.rotation.z")
    
//    let areImagesHidden:Bool = isNavClosed ? true : false
//    snacksStackView.isHidden = areImagesHidden
//    if snacksStackView.isHidden == true {
//      snacksStackView.isHidden = false
//    } else {
//      snacksStackView.isHidden = true
//    }
    
    snacksStackView.isHidden = !snacksStackView.isHidden
    
    UIView.animate(withDuration: 0.75, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: [], animations: {
      self.heightConstraint.constant = newValue
      self.view.layoutIfNeeded()
    })
    

  }
  
}

