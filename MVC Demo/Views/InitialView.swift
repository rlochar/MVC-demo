//
//  InitialView.swift
//  MVC Demo
//
//  Created by Roar Lochar on 06/08/2023.
//

import UIKit

class InitialView: UIView {
    
    private let padding: CGFloat = 16
    
    private var label: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // NOTE: This setup for `addLabel` is *overkill*
    // There is no need for dependency injection in this case
    // It would be perfectly okay to add this *directly*
    // It does not require anything special from a model
    func addLabel(view: UILabel) {
        label = view
        label?.setContentHuggingPriority(.required, for: .horizontal)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        
        let guide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding),
            view.topAnchor.constraint(equalTo: guide.topAnchor, constant: padding * 2)
        ])
    }
    
    func addTextfield(view: UITextField) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let guide = safeAreaLayoutGuide
        
        if let label {
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: padding),
                view.topAnchor.constraint(equalTo: label.topAnchor, constant: 0),
                view.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: padding)
            ])
        }
    }
    
    func addLoginButton(view: UIButton) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        if let label {
            NSLayoutConstraint.activate([
                view.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
                view.topAnchor.constraint(equalTo: label.bottomAnchor, constant: padding)
            ])
        }
    }
    
    private func addSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        NSLayoutConstraint.activate(constraints)
    }
}
