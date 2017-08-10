//
//  UIHelper.swift
//  TipCal
//
//  Created by Raina Wang on 8/9/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//
import UIKit

class Helper {
    static func applyGradient(_ control: UIViewController) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = control.view.frame
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor(red: 124/255.5, green: 14/255.5, blue: 54/255.5, alpha: 1.0).cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        control.view.layer.addSublayer(gradientLayer)
    }
}
