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
        let newView = InitialView()
        
        view = newView
        
        newView.addLabel(view: createLabel(title: "Passord:"))
        newView.addTextfield(view: createTextfield(placeholder: "Write your password here"))
        newView.addLoginButton(view: createLoginButton(title: "Log in"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        let action = { [weak self] in self?.passwordController?.getText() }
        
        buttonController = LoginButtonController(button: button, password: action, controller: self)
        
        return button
    }
}

