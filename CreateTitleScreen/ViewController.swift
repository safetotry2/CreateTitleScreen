//
//  ViewController.swift
//  CreateTitleScreen
//
//  Created by Mac on 7/7/20.
//  Copyright © 2020 Eric Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    @IBAction func buttonWasPressed(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "Second") as? SecondViewController {
            self.definesPresentationContext = true
            self.providesPresentationContextTransitionStyle = true
            self.overlayBlurredBackgroundView()
            present(vc, animated: true, completion: nil)
            vc.modalPresentationStyle = .overFullScreen
            vc.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
    func overlayBlurredBackgroundView() {
        let blurredBackgroundView = UIVisualEffectView()
        blurredBackgroundView.frame = view.frame
        blurredBackgroundView.effect = UIBlurEffect(style: .systemThinMaterialDark)
        view.addSubview(blurredBackgroundView)
    }
    
    func removeBlurredBackgroundView() {
        for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }

}
