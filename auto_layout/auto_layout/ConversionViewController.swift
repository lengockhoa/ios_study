//
//  ConversionViewController.swift
//  auto_layout
//
//  Created by Le NK on 4/10/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController{
    @IBOutlet var celciusLabel: UILabel!
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelciusLabel()
        }
    }
    
    var celciusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextView){
//        if let text = textField.text, !text.isEmpty{
//            celciusLabel.text = text
//        } else {
//            celciusLabel.text = "???"
//        }
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelciusLabel()
    }
    
    let numberFormatter : NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    func updateCelciusLabel(){
        if let celciusValue = celciusValue {
//            celciusLabel.text = "\(celciusValue.value)"
            celciusLabel.text = numberFormatter.string(from: NSNumber(value: celciusValue.value))
        } else {
            celciusLabel.text = "???"
        }
    }
    
}
