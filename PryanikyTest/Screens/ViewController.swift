//
//  ViewController.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
    let service = PryanikyNetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getData { response in
            print(response)
        }
        
    }


}

