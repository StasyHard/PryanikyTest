//
//  Content.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


struct ContentDataModel: Decodable {
    let title: String
    let body: BodyContent?
    
    private enum CodingKeys: String, CodingKey {
        case title = "name"
        case body = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        
        switch title {
        case "hz":
            let contentData = try? container.decode(IndefiniteModel.self, forKey: .body)
            self.body = contentData.map { BodyDataModel(data: $0) }
        case "picture":
            let contentData = try? container.decode(PictureModel.self, forKey: .body)
            self.body = contentData.map { BodyDataModel(data: $0) }
        case "selector":
            let contentData = try? container.decode(SelestorModel.self, forKey: .body)
            self.body = contentData.map { BodyDataModel(data: $0) }
        default:
            self.body = nil
        }
        
    }
}

