//
//  ViewController.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://pryaniky.com/static/json/sample.json") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                     let myStruct = try JSONDecoder().decode(Response.self, from: data)
                    //print(myStruct.data[0])
//                    myStruct.data.forEach { bodyContent in
//                        let hz: Indefinite? = bodyContent.data?.getContent()
//                        let picture: Picture? = bodyContent.data?.getContent()
//                        let selector: Selector? = bodyContent.data?.getContent()
//                    }                    
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
        }
        
        
    }


}

