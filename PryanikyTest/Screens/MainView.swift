//
//  MainView.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


enum ViewState {
    case loading
    case failed(error: NetworkResponseError)
    case success(value: ResponseDataModel)
}


protocol MainViewImplement {
    func setPresenter(_ presenter: MainViewActions)
    func showContentView(forState state: ViewState)
}


class MainView: UIView {
    
    //MARK: - Private properties
    private var presenter: MainViewActions?
    
    private lazy var loadingOrFailedView: LoadingAndFailedView = {
        let view = LoadingAndFailedView()
        return view
    }()
    
    private lazy var succesView: SuccessView = {
        let view = SuccessView()
        return view
    }()
    
    
    //MARK: - Private metods
    private func showLoadingOrFailedView(withState state: ViewState) {
        self.addSubview(loadingOrFailedView)
        loadingOrFailedView.translatesAutoresizingMaskIntoConstraints = false
        loadingOrFailedView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        loadingOrFailedView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        loadingOrFailedView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        loadingOrFailedView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        loadingOrFailedView.showViewWithState(state)
    }
    
    private func showSuccessView(whithViewsData viewsData: ResponseDataModel) {
        self.addSubview(succesView)
        succesView.translatesAutoresizingMaskIntoConstraints = false
        succesView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        succesView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        succesView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        succesView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        succesView.showSuccessViews(forData: viewsData)
    }
}


extension MainView: MainViewImplement {
    func showContentView(forState state: ViewState) {
        
        self.removeSubviews()
        
        switch state {
        case .loading, .failed:
            showLoadingOrFailedView(withState: state)
        case .success(value: let viewsData):
            showSuccessView(whithViewsData: viewsData)
        }
    }
    
    func setPresenter(_ presenter: MainViewActions) {
        self.presenter = presenter
    }
    
}
