//
//  AppCoordinator.swift
//  app
//
//  Created by Lorenzo Limoli on 28/09/22.
//

import UIKit
import Login
import Feed

extension LoginViewController: XibImportable{}
extension FeedViewController: XibImportable{}

class AppCoordinator {
    private let navController = UINavigationController()
    
    private let window: UIWindow
    
    init(from window: UIWindow){
        self.window = window
    }
    
    func start() {
        let loginProtocol = LoginAdapter { [weak self] in
            let feedProtocol = FeedAdapter()
            let feedController = FeedViewController.fromXib()
                .with(feedProtocol: feedProtocol)
            self?.navController.pushViewController(feedController, animated: true)
        }
        navController.viewControllers = [
            LoginViewController.fromXib()
                .with(loginProtocol: loginProtocol)
        ]
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
}
