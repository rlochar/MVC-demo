//
//  PasswordTextfieldController.swift
//  MVC Demo
//
//  Created by Roar Lochar on 06/08/2023.
//

import UIKit

class PasswordTextfieldController {
    
    private let textfield: UITextField!
    
    init(textfield: UITextField) {
        self.textfield = textfield
    }
    
    func getText() -> String? {
        textfield.text
    }
}
