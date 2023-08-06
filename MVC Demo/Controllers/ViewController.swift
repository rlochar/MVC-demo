//
//  ViewController.swift
//  MVC Demo
//
//  Created by Roar Lochar on 06/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        let newView = InitialView()
        
        view = newView
        
        newView.addLabel(view: createLabel(title: "Passord:"))
    }
    
    private func createLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        
        return label
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

