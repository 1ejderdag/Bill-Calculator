//
//  ResultViewController.swift
//  Bill Calculator
//
//  Created by Ejder Dağ on 18.10.2023.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = "0.0"
    var split = 2
    var tip = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
}
