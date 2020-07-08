//
//  ViewController.swift
//  CreateTitleScreen
//
//  Created by Mac on 7/7/20.
//  Copyright © 2020 Eric Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonWasPressed(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "Second") as? SecondViewController {
            present(vc, animated: true, completion: nil)
            vc.modalPresentationStyle = .fullScreen
            
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan

    }


}
