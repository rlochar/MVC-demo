//
//  InitialView.swift
//  MVC Demo
//
//  Created by Roar Lochar on 06/08/2023.
//

import UIKit

class InitialView: UIView {
    
    private let padding: CGFloat = 16

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel(view: UILabel) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let guide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding),
            view.topAnchor.constraint(equalTo: guide.topAnchor, constant: padding * 2)
        ])
    }
}
