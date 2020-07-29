//
//  MainPresenter.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


protocol MainViewActions: class {
    func getContent()
}

protocol MainViewImpl: class {
    func showContent(forState state: ViewState)
}


final class MainPresenter {
    
    //MARK: - Private properties
    private weak var view: MainViewImpl?
    private let pryanikyNetworkService: NetworkServiceImpl
    
    //MARK: - Init
    init(view: MainViewImpl, pryanikyNetworkService: NetworkServiceImpl) {
        self.view = view
        self.pryanikyNetworkService = pryanikyNetworkService
    }
}


//MARK: - MainViewActions
extension MainPresenter: MainViewActions {
    func getContent() {
        view?.showContent(forState: .loading)
        
        pryanikyNetworkService.getData { [weak self] result in
                        
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.view?.showContent(forState: .success(value: response))
                }
            case .failure(let error):
                self?.view?.showContent(forState: .failed(error: error))
            }
        }
        
    }
    
    
}
