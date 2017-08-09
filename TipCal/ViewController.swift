//
//  ViewController.swift
//  TipCal
//
//  Created by Raina Wang on 8/7/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTotal(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.2]
        
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[1]

        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

