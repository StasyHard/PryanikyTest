//
//  UIStoryboard+instantiateVC.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


extension UIStoryboard {
    
    // MARK: - Storyboards init
    private static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    // MARK: - View Controllers init
    static func instantiateMainVC() -> MainScreenViewController {
        let mainVC = main.instantiateViewController(
            withIdentifier: "MainViewController") as! MainScreenViewController
        return mainVC
    }
    
}


