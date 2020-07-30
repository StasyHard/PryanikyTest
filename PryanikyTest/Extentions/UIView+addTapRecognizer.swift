//
//  UIView+addTapRecognizer.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 29.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


extension UIView {
    
    func addGTapRecognizer(selector: Selector) {
        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
}
