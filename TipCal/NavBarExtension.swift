//
//  NavBarExtension.swift
//  TipCal
//
//  Created by Raina Wang on 8/10/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import Foundation

extension UINavigationBar {
    
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}
