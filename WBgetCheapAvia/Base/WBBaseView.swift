//
//  BaseView.swift
//  WorkoutApp
//
//  Created by Mikhail Ustyantsev on 07.09.2023.
//

import UIKit

class WBBaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@objc extension WBBaseView {
    func setupViews() {}
    func constraintViews() {}
    func configureAppearance() {
        backgroundColor = .systemBackground
    }
}
