//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Mikhail Ustyantsev on 06.09.2023.
//

import UIKit

class WBBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        constraintViews()
        configureViews()
    }
    

}


@objc extension WBBaseController {
    
    func addViews() {}
    func constraintViews() {}
    func configureViews() {
        view.backgroundColor = R.Colors.background
    }
    
  
}
 

