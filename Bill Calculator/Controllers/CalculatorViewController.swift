//
//  ViewController.swift
//  Bill Calculator
//
//  Created by Ejder Dağ on 15.10.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var tip = 0.10
    var numberOfPeople = 2
    var perPerson = 0.0
    var billTotal = 0.0
    var finalResult = "0.0"
    
  
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        if bill != "" {
            
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            finalResult = String(format: "%.2f", result)
            
            performSegue(withIdentifier: "toResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toResult" {
            
            let resultVC = segue.destination as! ResultViewController
            
            resultVC.result = finalResult
            resultVC.split = numberOfPeople
            resultVC.tip = Int(tip * 100)
        }
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        tenPctButton.isSelected = false
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsNumber / 100
        
        
        // Açık olan keybord'u kapatma. Tip butonlarından biri işaretlendiği zaman keybord kapatılır.
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
    }
}

