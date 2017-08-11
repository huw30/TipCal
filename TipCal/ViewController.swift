//
//  ViewController.swift
//  TipCal
//
//  Created by Raina Wang on 8/7/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import UIKit


import Foundation

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

protocol Delegate: class {
    func initValues()
}

class ViewController: UIViewController, Delegate {
    func initValues() {
        initTipPercentages()
        initRoundUps()
        calculateTotal((Any).self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? SettingsViewController {
                destinationViewController.delegate = self
        }
    }

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!

    var tipPercentages = [0.15, 0.18, 0.2];
    var tipRoundUp = false;
    var totalRoundUp = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()

        // Do any additional setup after loading the view, typically from a nib.
        view.setGradiantBackground(colorOne: Colors.pink, colorTwo: Colors.babyBlue)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

        let rect = CGRect(origin: segmentControl.frame.origin, size: CGSize(width: segmentControl.frame.size.width, height: 100))
        segmentControl.frame = rect
        segmentControl.layer.cornerRadius = 15.0
        segmentControl.layer.borderWidth = 1.0
        segmentControl.layer.borderColor = Colors.white.cgColor
        segmentControl.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTotal(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0

        var tip = bill * tipPercentages[segmentControl.selectedSegmentIndex]
        if (tipRoundUp) {
            tip = tip.rounded()
        }
        
        var total = bill + tip
        if (totalRoundUp) {
            total = total.rounded()
        }

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    func initRoundUps() {
        let defaults = UserDefaults.standard
        tipRoundUp = defaults.value(forKey: "tipRoundUp") as? Bool ?? false
        totalRoundUp = defaults.value(forKey: "totalRoundUp") as? Bool ?? false
    }

    func initTipPercentages() {
        let defaults = UserDefaults.standard

        let exVal = convertToPercentage(val: defaults.value(forKey: "excellentStepperValue") as? Double ?? 20)
        let saVal = convertToPercentage(val:defaults.value(forKey: "satisfactoryStepperValue") as? Double ?? 18)
        let teVal = convertToPercentage(val:defaults.value(forKey: "terribleStepperValue") as? Double ?? 15)

        tipPercentages = [exVal, saVal, teVal]
    }

    func convertToPercentage(val: Double) -> Double{
        return (val/100).roundToDecimal(2)
    }
}
