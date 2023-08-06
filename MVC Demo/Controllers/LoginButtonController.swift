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
    
    init(button: UIButton, password: @escaping () -> String? ) {
        self.button = button
        getPassword = password
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        if let password = getPassword(), !password.isEmpty {
            print(password)
        } else {
            print("No password provided.")
        }
    }
}
