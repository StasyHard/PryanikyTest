//
//  ViewController.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Open properties
    var presenter: MainViewActions?
    
    //MARK: - Private properties
    private lazy var mainView = self.view as? MainViewImplement
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationUI()
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
extension MainViewController: MainViewImpl {
    
    func showContent(forState state: ViewState) {
        mainView?.showContentView(forState: state)
    }
    
    
}

