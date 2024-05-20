//
//  BaseViewController.swift
//  FootbalApp
//
//  Created by Apple on 18.5.2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupAdd()
        setupLayouts()
    }
    
    func setupAdd() { }
    
    func setupLayouts() { }
    
    func showAlert(title: String, massage: String){
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .destructive))
        self.present(alert, animated: true)
    }
    
}
