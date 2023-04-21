//
//  SceneDelegate.swift
//  MVC-TodoApp
//
//  Created by administrador on 17/04/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)

        
        let navigationController = UINavigationController(rootViewController: HomeViewController(taskListService: TaskListService(coreDataManager: CoreDataManager.shared), taskService: TaskService(coreDataManager: CoreDataManager.shared)) )
        
        navigationController.interactivePopGestureRecognizer?.isEnabled =  false
        window.backgroundColor = .white
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

