//
//  ContentData.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


protocol BodyContent: Decodable {
    func getContent<T: Decodable>() -> T?
}


struct ContentData<T: Decodable>: BodyContent {
    let data: T
    
    func getContent<R>() -> R? where R: Decodable {
        return (data as? R)
    }
}
