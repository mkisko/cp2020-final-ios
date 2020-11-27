//
//  ViewController.swift
//  RosAtomApp
//
//  Created by Admin on 27.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var enterButtonOutlet: UIButton!
    @IBAction func enterButton(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var numberView: UIView!
    
    @IBOutlet weak var passwordView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        enterButtonOutlet.layer.cornerRadius = 13
        numberView.layer.cornerRadius = 15
        passwordView.layer.cornerRadius = 15
        setShadow(view: numberView)
        setShadow(view: passwordView)
        numberField.keyboardType = .numberPad
        passwordField.isSecureTextEntry = true
    }
    
    func setShadow(view: UIView) {
        view.layer.shadowColor = UIColor(red: 0.488, green: 0.785, blue: 1, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 15
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: 15).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

