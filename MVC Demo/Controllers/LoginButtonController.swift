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
            print(password)
        } else {
            showAlert()
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Error!", message: "No password provided, please try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        
        alertController.addAction(action)
        controller.present(alertController, animated: true)
    }
}
