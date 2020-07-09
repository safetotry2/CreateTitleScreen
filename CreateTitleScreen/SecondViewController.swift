//
//  SecondViewController.swift
//  CreateTitleScreen
//
//  Created by Mac on 7/7/20.
//  Copyright © 2020 Eric Park. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func overlayBlurredBackgroundView()
    func removeBlurredBackgroundView()
}

class SecondViewController: UIViewController {

    weak var delegate: SecondViewControllerDelegate?
    
    @IBOutlet var bottomContraint: NSLayoutConstraint!
    @IBOutlet var textField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate?.removeBlurredBackgroundView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        textField.becomeFirstResponder()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
    }
    
    override func viewDidLayoutSubviews() {
        //Bottom line also works to display UIView and Keyboard at the same time.
        //textField.becomeFirstResponder()
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        let info = notification.userInfo!
        let kbHeight = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        bottomContraint.constant = -kbHeight
    }
    
}
