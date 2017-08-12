//
//  UIViewController+Extension.swift
//  TipCal
//
//  Created by Raina Wang on 8/11/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func removeNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white;
    }
}
