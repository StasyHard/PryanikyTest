//
//  Selector.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


//selector
struct SelestorModel: Decodable {
    let selectedId: Int
    let variants: [SelestorVariantModel]
}
