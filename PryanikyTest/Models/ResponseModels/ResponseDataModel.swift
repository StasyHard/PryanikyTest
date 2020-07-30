//
//  Data.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


struct ResponseDataModel: Decodable {
    let data: [ContentDataModel]
    let views: [String]
    
    private enum CodingKeys: String, CodingKey {
        case data
        case views = "view"
    }
}

