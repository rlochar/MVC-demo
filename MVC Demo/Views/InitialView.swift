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
    
    init(frame: CGRect, label: UILabel, textfield: UITextField, button: UIButton) {
        super.init(frame: frame)
        
        addLabel(view: label)
        addTextfield(view: textfield)
        addLoginButton(view: button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // NOTE: This setup for `addLabel` is *overkill*
    // There is no need for dependency injection in this case
    // It would be perfectly okay to add this *directly*
    // It does not require anything special from a model
    private func addLabel(view: UILabel) {
        label = view
        label?.setContentHuggingPriority(.required, for: .horizontal)
        
        let guide = safeAreaLayoutGuide
        
        let constraints = [
            view.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding),
            view.topAnchor.constraint(equalTo: guide.topAnchor, constant: padding * 2)
        ]
        addSubview(view, constraints: constraints)
    }
    
    private func addTextfield(view: UITextField) {
        guard let label else { return }
        
        let guide = safeAreaLayoutGuide
        
        let constraints = [
                view.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: padding),
                view.topAnchor.constraint(equalTo: label.topAnchor, constant: 0),
                view.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: padding)
        ]
        addSubview(view, constraints: constraints)
    }
    
    private func addLoginButton(view: UIButton) {
        guard let label else { return }
        
        let constraints = [
                view.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
                view.topAnchor.constraint(equalTo: label.bottomAnchor, constant: padding)
        ]
        addSubview(view, constraints: constraints)
    }
    
    private func addSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        NSLayoutConstraint.activate(constraints)
    }
}
