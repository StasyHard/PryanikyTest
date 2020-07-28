//
//  MainView.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


enum ViewState: Equatable {
    case loading
    case failed(error: NetworkResponseError)
    case success
}


protocol MainViewImplement {
    func setPresenter(_ presenter: MainViewActions)
    func showContentView(forState state: ViewState)
}


class MainView: UIView {
    
    //MARK: - Private properties
    private var presenter: MainViewActions?
    
    private var viewState: ViewState?
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    //MARK: - Private metods
    private func showLoadingView() {
        self.addSubview(indicator)
        indicator.startAnimating()
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}


extension MainView: MainViewImplement {
    func showContentView(forState state: ViewState) {
        
        if viewState != state {
            self.subviews.forEach { $0.removeFromSuperview() }
            
            switch state {
            case .loading, .failed(error: _):
                showLoadingView()
            case .success:
                break
            }
        }
    }
    
    func setPresenter(_ presenter: MainViewActions) {
        self.presenter = presenter
    }
    
    
}
