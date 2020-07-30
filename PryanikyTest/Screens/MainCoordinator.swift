//
//  MainCoordinator.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    //MARK: - Open properties
    var parentCoordinator: Coordinator?
    
    //MARK: - Close properties
    private let navController: UINavigationController
    
    // MARK: - Init
       init(navController: UINavigationController) {
           self.navController = navController
       }
    
        //MARK: - Open metods
    func start() {
        let vc = UIStoryboard.instantiateMainVC()
        let networkService = PryanikyNetworkService()
        let presenter = MainPresenter(view: vc, pryanikyNetworkService: networkService)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
    
    
}
