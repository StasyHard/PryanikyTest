//
//  ViewController.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    //MARK: - Open properties
    var presenter: MainViewActions?
    
    //MARK: - Private properties
    private lazy var mainView = self.view as? MainViewImpl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationUI()
        
        if let presenter = presenter {
            mainView?.setPresenter(presenter)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getContent()
    }
    
    //MARK: - Private metods
    private func setupNavigationUI() {
        title = "Главная"
    }
}


//MARK: - MainViewImpl
extension MainScreenViewController: MainScreenViewImpl {
    
    func showInformationAlert(withMessage message: String) {
        self.showAlert(title: "Information about view", msg: message)
    }
    
    func showContent(forState state: ViewState) {
        mainView?.showContentView(forState: state)
    }
}


