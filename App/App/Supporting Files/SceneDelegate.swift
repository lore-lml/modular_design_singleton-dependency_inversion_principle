//
//  SceneDelegate.swift
//  app
//
//  Created by Lorenzo Limoli on 28/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var appCoordinator: AppCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        let window = UIWindow(windowScene: windowScene)
        appCoordinator = AppCoordinator(from: window)
        appCoordinator.start()
    }
}
