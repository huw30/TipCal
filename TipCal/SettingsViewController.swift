//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Raina Wang on 8/7/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var excellentLabel: UILabel!
    @IBOutlet weak var satisfLabel: UILabel!
    @IBOutlet weak var terribleLabel: UILabel!
    @IBOutlet weak var exStepper: UIStepper!
    @IBOutlet weak var saStepper: UIStepper!
    @IBOutlet weak var teStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func excellentStepper(_ sender: Any) {
        excellentLabel.text = Int(exStepper.value).description + "%"
    }
    
    @IBAction func satisfStepper(_ sender: Any) {
        satisfLabel.text = Int(saStepper.value).description + "%"
    }

    @IBAction func terribleStepper(_ sender: Any) {
        terribleLabel.text = Int(teStepper.value).description + "%"
    }
}
