//
//  NetworkResponseError.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


enum NetworkResponseError: Error {
    case errorTimedOut
    case notConnectedToInternet
    case anotherError
}
