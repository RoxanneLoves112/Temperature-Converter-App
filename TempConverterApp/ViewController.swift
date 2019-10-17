//
//  ViewController.swift
//  TempConverterApp
//
//  Created by Roxanne Zhang on 9/10/19.
//  Copyright © 2019 Roxanne Zhang. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
  
  let tempConverter = TempConverter()
  
  @IBOutlet weak var convertedTempDisplay: UILabel!
  @IBOutlet weak var newUnit: UILabel!
  @IBOutlet weak var inputTemp: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    convertedTempDisplay.text = "--"
    self.inputTemp.delegate = self
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    inputTemp.resignFirstResponder()
    return true
  }

  @objc func updateLabel() {
    newUnit.text = tempConverter.newUnits
  }
  
  @objc func updateDisplay() {
    convertedTempDisplay.text = tempConverter.convertedTempDisplay
  }
  
  @IBAction func switchChanged() {
    tempConverter.toggleUnits()
    updateLabel()
  }
  
  @IBAction func convertButtonPushed(sender: UIButton) {
    let userData:String = inputTemp.text!
    if let i = Int(userData) {
      tempConverter.inputTemp = i
    }
    else {
      tempConverter.inputTemp = -500
    }
    tempConverter.convert()
    updateDisplay()
  }
}

