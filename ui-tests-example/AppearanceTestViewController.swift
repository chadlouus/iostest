//
//  AppearViewController.swift
//  ui-tests-example
//
//  Created by Jakub Knejzlik on 22/03/16.
//  Copyright © 2016 Funtasty Digital. All rights reserved.
//

import UIKit

class AppearanceTestViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.perform(#selector(AppearanceTestViewController.showButton), with: nil, afterDelay: 5)
    }
    
    @objc func showButton() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 40) //CGRectMake(0, 0, 200, 40)
        button.center = self.view.center
        button.setTitle("Hello world!", for: .normal)
        self.view.addSubview(button)
    }
    
}
