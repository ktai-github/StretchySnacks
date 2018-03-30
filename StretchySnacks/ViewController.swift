//
//  ViewController.swift
//  StretchySnacks
//
//  Created by KevinT on 2018-03-29.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var snacksTableView: UITableView!
  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var heightConstraint: NSLayoutConstraint!
  @IBOutlet weak var snacksStackView: UIView!
  
  @IBOutlet var ramenTapGestRec: UITapGestureRecognizer!
  @IBOutlet var popsicleTapGestRec: UITapGestureRecognizer!
  @IBOutlet var popTartTapGestRec: UITapGestureRecognizer!
  @IBOutlet var pizzaPopTapGestRec: UITapGestureRecognizer!
  @IBOutlet var oreosTapGestRec: UITapGestureRecognizer!
  
  var snacksArray: [String] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    snacksTableView.dataSource = self
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
    
    let animation = CABasicAnimation(keyPath: "transform.rotation.z")
    animation.duration = 0.5
    
    let newAngle:CGFloat = isNavClosed ? rotated : unrotated
    let oldAngle:CGFloat = isNavClosed ? rotated : unrotated

    animation.fromValue = oldAngle
    animation.toValue = newAngle
    animation.fillMode = kCAFillModeForwards;
    animation.isRemovedOnCompletion = false;
    plusButton.layer.add(animation, forKey: "transform.rotation.z")
    
    snacksStackView.isHidden = !snacksStackView.isHidden
    
    UIView.animate(withDuration: 0.75, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: [], animations: {
      self.heightConstraint.constant = newValue
      self.view.layoutIfNeeded()
    })
    
    
  }
  
  @IBAction func oreosTapped(_ sender: Any) {
    print("oreos tapped")
    snacksArray.append("Oreos")
    snacksTableView.reloadData()
  }
  
  @IBAction func pizzaPopTapped(_ sender: Any) {
    print("pizza pop tapped")
    snacksArray.append("Pizza Pop")
    snacksTableView.reloadData()
  }
  
  @IBAction func popTartsTapped(_ sender: Any) {
    print("pop tarts tapped")
    snacksArray.append("Pop Tarts")
    snacksTableView.reloadData()
  }
  
  @IBAction func popsicleTapped(_ sender: Any) {
    print("popsicle tapped")
    snacksArray.append("Popsicle")
    snacksTableView.reloadData()
  }
  
  @IBAction func ramenTapped(_ sender: Any) {
    print("ramen tapped")
    snacksArray.append("Ramen")
    snacksTableView.reloadData()
  }
  
  
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return snacksArray.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let snacksTableViewCell : UITableViewCell = snacksTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    snacksTableViewCell.textLabel?.text = snacksArray[indexPath.row]
    return snacksTableViewCell
  }

  
}

