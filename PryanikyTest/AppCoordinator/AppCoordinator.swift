//
//  AppCoordinator.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    func start()
}


final class AppCoordinator: Coordinator {
    
    //MARK: - Open properties
    var parentCoordinator: Coordinator?
    
    // MARK: - Private properties
    private let window: UIWindow
    private let navController: UINavigationController
    
    
    // MARK: - Init
    init(window: UIWindow, navController: UINavigationController) {
        self.window = window
        self.navController = navController
    }
    
    //MARK: - Open metods
    func start() {
        window.rootViewController = navController
        window.makeKeyAndVisible()
        parentCoordinator = nil
        showMain()
    }
    
    //MARK: - Private metods
    private func showMain() {
        let coordinator = MainCoordinator(navController: navController)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
}
