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
    func didTappedView(id: Int?, title: String?)
}

extension MainViewActions {
    func didTappedView(id: Int? = nil, title: String?) {
        return didTappedView(id: id, title: title)
    }
}

protocol MainScreenViewImpl: class {
    func showContent(forState state: ViewState)
    func showInformationAlert(withMessage message: String)
}


final class MainPresenter {
    
    //MARK: - Private properties
    private weak var view: MainScreenViewImpl?
    private let pryanikyNetworkService: NetworkServiceImpl
    
    //MARK: - Init
    init(view: MainScreenViewImpl, pryanikyNetworkService: NetworkServiceImpl) {
        self.view = view
        self.pryanikyNetworkService = pryanikyNetworkService
    }
}


//MARK: - MainViewActions
extension MainPresenter: MainViewActions {
    
    func didTappedView(id: Int?, title: String?) {
        var alertMessage: String? = nil
        
        if let id = id, let title = title {
            alertMessage = "View id - \(String(id)), name - \(title)"
        } else if id == nil, let title = title {
            alertMessage = "Name - \(title)"
        }
        
        guard let message = alertMessage else { return }
        
        view?.showInformationAlert(withMessage: message)
    }
    
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
