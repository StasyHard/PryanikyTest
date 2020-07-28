//
//  Data.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


struct Response: Decodable {
    let data: [Content]
    let views: [String]
    
    private enum CodingKeys: String, CodingKey {
        case data
        case views = "view"
    }
}

