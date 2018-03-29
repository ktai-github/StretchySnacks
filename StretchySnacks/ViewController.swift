//
//  ViewController.swift
//  StretchySnacks
//
//  Created by KevinT on 2018-03-29.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var heightConstraint: NSLayoutConstraint!
  
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
    
    if self.heightConstraint.constant == CGFloat(200) {
      self.heightConstraint.constant = CGFloat(60)
      self.view.layoutIfNeeded()
    }
    
    UIView.animate(withDuration: 0.75, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: [], animations: {
      self.heightConstraint.constant = CGFloat(200)
      self.view.layoutIfNeeded()

    })
  }
  
}

