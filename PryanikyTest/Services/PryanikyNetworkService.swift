//
//  NetworkService.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


protocol NetworkServiceImpl {
    func getData(onCompleted: @escaping (Result<ResponseDataModel, NetworkResponseError>) -> Void)
}


final class PryanikyNetworkService: NetworkServiceImpl {
    
    //MARK: - Private properties
    private let path = "https://pryaniky.com/static/json/sample.json"
    
    //MARK: - PryanikyNetworkServiceImpl
    func getData(onCompleted: @escaping (Result<ResponseDataModel, NetworkResponseError>) -> Void) {
        
        guard let url = URL(string: path)
            else {
                onCompleted(.failure(.anotherError))
                return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            
            guard let `self` = self else { return }
            
            if let error = error {
                onCompleted(.failure(self.getNetworkResponseError(error)))
                return
            }
            
            guard let data = data,
                let response = response as? HTTPURLResponse,
                (200 ..< 300) ~= response.statusCode
                else {
                    onCompleted(.failure(.anotherError))
                    return
            }
            
            do {
                let response = try JSONDecoder().decode(ResponseDataModel.self, from: data)
                onCompleted(.success(response))
            } catch {
                print(error.localizedDescription)
                onCompleted(.failure(.anotherError))
            }
        }
        task.resume()
    }
    
    //MARK: - Private metods
    private func getNetworkResponseError(_ error: Error) -> NetworkResponseError {
        switch error._code {
        case NSURLErrorTimedOut:
            return .errorTimedOut
        case NSURLErrorNotConnectedToInternet:
            return .notConnectedToInternet
        default:
            return .anotherError
        }
    }
    
}


