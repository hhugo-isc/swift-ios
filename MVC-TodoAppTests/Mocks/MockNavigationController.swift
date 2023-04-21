//
//  MockNavigationController.swift
//  MVC-TodoAppTests
//
//  Created by administrador on 20/04/23.
//

import Foundation
import UIKit

class MockNavigationController: UINavigationController{
    
    public var vcIsPushed: Bool = false
    public var vcIsPoped: Bool = false
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        self.vcIsPushed = true
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        super.popViewController(animated: animated)
        self.vcIsPoped = true
        return viewControllers.first
    }
}
