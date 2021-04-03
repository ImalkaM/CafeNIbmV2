//
//  LoginViewController.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-03.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTextFieldSizeSetup()
        // Do any additional setup after loading the view.
    }
    

    
    func registerTextFieldSizeSetup(){
        emailTextField.addConstraint(emailTextField.heightAnchor.constraint(equalToConstant: 50))
        emailTextField.addConstraint(emailTextField.widthAnchor.constraint(equalToConstant: 270))
        passwordTextField.addConstraint(passwordTextField.heightAnchor.constraint(equalToConstant: 50))
        
        loginButton.layer.cornerRadius = 25
        loginButton.addConstraint(loginButton.heightAnchor.constraint(equalToConstant: 50))
        
    }

}
