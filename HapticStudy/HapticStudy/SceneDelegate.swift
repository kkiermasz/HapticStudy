//
//  SceneDelegate.swift
//  HapticStudy
//
//  Created by jaki on 18/04/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private var mainWindow: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
         
        mainWindow = UIWindow(windowScene: windowScene)
                
        let viewController = UseCasesViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        mainWindow?.rootViewController = navigationController
        
        mainWindow?.makeKeyAndVisible()
    }

}
