//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Raina Wang on 8/7/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import UIKit
import KWStepper

class SettingsViewController: UIViewController {
    weak var delegate: Delegate?

    func parentCallback() {
        delegate?.initValues()
    }

    var excellentStepper: KWStepper!
    @IBOutlet weak var eCountLabel: UILabel!
    @IBOutlet weak var eDecrementButton: UIButton!
    @IBOutlet weak var eIncrementButton: UIButton!

    var satisfactoryStepper: KWStepper!
    @IBOutlet weak var sCountLabel: UILabel!
    @IBOutlet weak var sDecrementButton: UIButton!
    @IBOutlet weak var sIncrementButton: UIButton!

    var terribleStepper: KWStepper!
    @IBOutlet weak var tCountLabel: UILabel!
    @IBOutlet weak var tDecrementButton: UIButton!
    @IBOutlet weak var tIncrementButton: UIButton!


    @IBOutlet weak var tipRoundUpControl: UISwitch!
    @IBOutlet weak var totalRoundUpControl: UISwitch!

    @IBOutlet weak var localCurrencyControl: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initEStepper()
        initSStepper()
        initTStepper()
        initStepperValues()
        initRoundUps()
        initUseLocalCurrency()
        
        //UI changes
        view.setGradiantBackground(colorOne: Colors.babyPurple, colorTwo: Colors.lightGrey)
        self.removeNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveStepperValues()
        parentCallback()
        super.viewWillDisappear(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func initEStepper() {
        excellentStepper = KWStepper(decrementButton: eDecrementButton, incrementButton: eIncrementButton);
        excellentStepper.valueChangedCallback = { excellentStepper in
            self.eCountLabel.text = Int(excellentStepper.value).description + "%"
        }
    }

    func initSStepper() {
        satisfactoryStepper = KWStepper(decrementButton: sDecrementButton, incrementButton: sIncrementButton);
        satisfactoryStepper.valueChangedCallback = { satisfactoryStepper in
            self.sCountLabel.text = Int(satisfactoryStepper.value).description + "%"
        }
    }

    func initTStepper() {
        terribleStepper = KWStepper(decrementButton: tDecrementButton, incrementButton: tIncrementButton);
        terribleStepper.valueChangedCallback = { terribleStepper in
            self.tCountLabel.text = Int(terribleStepper.value).description + "%"
        }
    }

    func initStepperValues() {

        let defaults = UserDefaults.standard

        excellentStepper.value = defaults.value(forKey: "excellentStepperValue") as? Double ?? 20
        satisfactoryStepper.value = defaults.value(forKey: "satisfactoryStepperValue") as? Double ?? 18
        terribleStepper.value = defaults.value(forKey: "terribleStepperValue") as? Double ?? 15
    }
    func saveStepperValues() {
        let defaults = UserDefaults.standard

        defaults.setValue(excellentStepper.value, forKey: "excellentStepperValue")
        defaults.setValue(satisfactoryStepper.value, forKey: "satisfactoryStepperValue")
        defaults.setValue(terribleStepper.value, forKey: "terribleStepperValue")
    }
    func initRoundUps() {
        let defaults = UserDefaults.standard
        let tipRoundUp = defaults.value(forKey: "tipRoundUp") as? Bool ?? false
        let totalRoundUp = defaults.value(forKey: "totalRoundUp") as? Bool ?? false
        tipRoundUpControl.setOn(tipRoundUp, animated: true)
        totalRoundUpControl.setOn(totalRoundUp, animated: true)
    }
    
    @IBAction func onTipRoundUpControlChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.setValue(tipRoundUpControl.isOn, forKey: "tipRoundUp")
    }
    
    @IBAction func onTotalRoundUpControlChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.setValue(totalRoundUpControl.isOn, forKey: "totalRoundUp")
    }
    
    @IBAction func onLocalCurrencyControlChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.setValue(localCurrencyControl.isOn, forKey: "isLocalCurrency")
    }
    
    func initUseLocalCurrency() {
        let defaults = UserDefaults.standard
        let isLocalCurrency = defaults.value(forKey: "isLocalCurrency") as? Bool ?? false
        localCurrencyControl.setOn(isLocalCurrency, animated: true)
    }
}
