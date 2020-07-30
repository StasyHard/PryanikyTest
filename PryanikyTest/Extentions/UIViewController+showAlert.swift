//
//  UIViewController+showAlert.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 30.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


extension UIViewController {
    func showAlert(title: String, msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
