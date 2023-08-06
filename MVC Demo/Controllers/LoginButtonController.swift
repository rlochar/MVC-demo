//
//  LoginButtonController.swift
//  MVC Demo
//
//  Created by Roar Lochar on 06/08/2023.
//

import UIKit

class LoginButtonController {
    let button: UIButton
    
    init(button: UIButton) {
        self.button = button
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        print("Button was tapped")
    }
}
