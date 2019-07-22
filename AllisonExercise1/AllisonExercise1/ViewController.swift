//
//  ViewController.swift
//  AllisonExercise1
//
//  Created by Allison Schneider on 7/16/19.
//  Copyright © 2019 Allison Schneider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showHello() {
        let alert = UIAlertController(title: "Hello Simon", message: "This is Exercise 1.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}

