//
//  ViewController.swift
//  MVC Demo
//
//  Created by Roar Lochar on 06/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var passwordController: PasswordTextfieldController?
    private var buttonController: LoginButtonController?
    
    override func loadView() {
        let newView = InitialView(frame: UIScreen.main.bounds,
                                  label: createLabel(title: "Passord:"),
                                  textfield: createTextfield(placeholder: "Write your password here"),
                                  button: createLoginButton(title: "Log in"))
        view = newView
    }

    private func createLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        
        return label
    }

    private func createTextfield(placeholder: String) -> UITextField {
        let textfield = UITextField()
        passwordController = PasswordTextfieldController(textfield: textfield)
        
        textfield.placeholder = placeholder
        return textfield
    }
    
    private func createLoginButton(title: String) -> UIButton {
        let button = UIButton(configuration: .bordered())
        button.setTitle(title, for: .normal)
        
        let password = { [weak self] in self?.passwordController?.getText() }
        
        buttonController = LoginButtonController(button: button, password: password, controller: self)
        
        return button
    }
}

