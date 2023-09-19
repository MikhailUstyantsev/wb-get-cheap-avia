//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Mikhail Ustyantsev on 06.09.2023.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        constraintViews()
        configureViews()
    }
    

}


@objc extension BaseController {
    
    func addViews() {}
    func constraintViews() {}
    func configureViews() {
        view.backgroundColor = R.Colors.background
    }
    
  
}
 

