//
//  NavigationSimplified.swift
//  Wrappers
//
//  Created by Gaurav Tiwari on 22/11/18.
//  Copyright © 2018 Gaurav Tiwari. All rights reserved.
//

import UIKit

extension UIViewController {
    /**
     Property to know if the UIViewController was presented modally
     */
    var isPresented: Bool {
        return presentingViewController != nil ||
            navigationController?.presentingViewController?.presentedViewController === navigationController ||
            tabBarController?.presentingViewController is UITabBarController
    }

    /**
     Common action for all the back buttons in navigation bar for popping from the navigation stack
     */
    @IBAction func actionPop() {
        navigationController?.popViewController(animated: true)
    }
    
    /**
     Property to know if the UIViewController was presented modally
     */
    @IBAction func actionDismiss() {
        dismiss(animated: true)
    }
}
