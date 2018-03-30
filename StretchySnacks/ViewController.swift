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
  
  var labelCenterY = NSLayoutConstraint()
  var labelCenterX = NSLayoutConstraint()
  var isNavClosed:Bool = true

  
  @IBOutlet var ramenTapGestRec: UITapGestureRecognizer!
  @IBOutlet var popsicleTapGestRec: UITapGestureRecognizer!
  @IBOutlet var popTartTapGestRec: UITapGestureRecognizer!
  @IBOutlet var pizzaPopTapGestRec: UITapGestureRecognizer!
  @IBOutlet var oreosTapGestRec: UITapGestureRecognizer!
  
  var snacksArray: [String] = []
  var titleLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    snacksTableView.dataSource = self
    
    titleLabel.textAlignment = NSTextAlignment.center
    titleLabel.text = "Snacks"
    titleLabel.isUserInteractionEnabled = true
    titleLabel.tag = 1
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    statusView.addSubview(titleLabel)

  }

  override func updateViewConstraints(){
    super.updateViewConstraints()
    
    
    labelCenterY = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: statusView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
    labelCenterY.isActive = true
    labelCenterY.identifier = "labelCenterY"
    labelCenterX = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: statusView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
    labelCenterX.isActive = true
    labelCenterX.identifier = "labelCenterX"
  }
  
  @IBAction func plusButtonTouched(_ sender: UIButton) {
    print("plus button pressed")

    let closedValue:CGFloat = 66
    let openValue:CGFloat = 200
    
    let rotated:CGFloat = -0.75
    let unrotated:CGFloat = 0
    
    if self.heightConstraint.constant == closedValue {
      isNavClosed = true
      titleLabel.text = "Add a New Snack"
      labelCenterY.constant = 0

    }else{
      isNavClosed = false
      titleLabel.text = "Snacks"
      labelCenterY.constant = 40

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
  
  fileprivate func AddToTable(snack: String) {
    print(snack + " tapped")
    snacksArray.append(snack)
    snacksTableView.reloadData()
  }
  
  @IBAction func oreosTapped(_ sender: Any) {
    AddToTable(snack: "Oreos")
  }
  
  @IBAction func pizzaPopTapped(_ sender: Any) {
    AddToTable(snack: "Pizza Pop")
  }
  
  @IBAction func popTartsTapped(_ sender: Any) {
    AddToTable(snack: "Pop Tarts")
  }
  
  @IBAction func popsicleTapped(_ sender: Any) {
    AddToTable(snack: "Popsicle")
  }
  
  @IBAction func ramenTapped(_ sender: Any) {
    AddToTable(snack: "Ramen")
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

