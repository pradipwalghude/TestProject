//
//  UIViewController+Extension.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/21/22.
//

import UIKit
extension UIViewController {
    func showAlert(title : String? = nil,
                   msg : String = "Something went wrong! Please try again later",
                   style: UIAlertController.Style = .alert,
                   actions: [UIAlertAction]? = nil) {
        
        let alertController = UIAlertController(title: title,
                                                message: msg,
                                                preferredStyle: style)
        if let alertActions = actions {
            for action in alertActions {
                alertController.addAction(action)
            }
            alertController.preferredAction = alertActions[0]
        } else {
            alertController.addAction(UIAlertAction(title: "OK",
                                                    style: .default,
                                                    handler: nil))
        }
        
        present(alertController, animated: true, completion: nil)
    }
}


extension UIView {
   func addConstraints(toParent parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
    }
}
