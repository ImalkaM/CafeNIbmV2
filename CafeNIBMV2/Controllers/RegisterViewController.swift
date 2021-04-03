//
//  RegisterViewController.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-03.
//

import UIKit
import  Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTextFieldSizeSetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        if let email = emailAddressTextField.text, let password = passwordTextField.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let err = error{
                    print(err)
                }else{
                    self.performSegue(withIdentifier: K.registerToHomeSeauge, sender: self)
                }
              // ...
            }
        }
        
       
        
    }
    
    
    
    func registerTextFieldSizeSetup(){
        emailAddressTextField.addConstraint(emailAddressTextField.heightAnchor.constraint(equalToConstant: 50))
        emailAddressTextField.addConstraint(emailAddressTextField.widthAnchor.constraint(equalToConstant: 270))
        phoneNumberTextField.addConstraint(phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50))
        passwordTextField.addConstraint(passwordTextField.heightAnchor.constraint(equalToConstant: 50))
        
        registerButton.layer.cornerRadius = 25
        registerButton.addConstraint(registerButton.heightAnchor.constraint(equalToConstant: 50))
        
    }
  

}
