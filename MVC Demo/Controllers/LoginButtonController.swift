//
//  LoginButtonController.swift
//  MVC Demo
//
//  Created by Roar Lochar on 06/08/2023.
//

import UIKit

class LoginButtonController {
    
    let button: UIButton
    let getPassword: () -> String?
    let controller: UIViewController
    
    init(button: UIButton, password: @escaping () -> String?, controller: UIViewController) {
        self.button = button
        getPassword = password
        self.controller = controller
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        if let password = getPassword(), !password.isEmpty {
            showSuccess()
        } else {
            showError()
        }
    }
    
    private func showError() {
        let alertController = UIAlertController(title: "Error!", message: "No password provided, please try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        
        alertController.addAction(action)
        controller.present(alertController, animated: true)
    }
    
    private func showSuccess() {
        let alertController = UIAlertController(title: "Success!", message: "You have been logged in.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue", style: .default)
        let cancel = UIAlertAction(title: "Log out", style: .destructive)
        
        alertController.addAction(action)
        alertController.addAction(cancel)
        
        controller.present(alertController, animated: true)
    }
}
