//
//  UIView+removeSubviews.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 29.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


extension UIView {
    
    func removeSubviews() {
        if !self.subviews.isEmpty {
            self.subviews.forEach { $0.removeFromSuperview() }
        }
    }
}
