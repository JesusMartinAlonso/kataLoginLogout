//
//  LoginViewController.swift
//  kataLoginLogout
//
//  Created by Jesus Martin Alonso on 20/9/18.
//  Copyright © 2018 Aiwin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions
    
    @IBAction func doLogin() {
        
        
        if KataApp().login(username: usernameTextField.text!, password: passwordTextField.text!) {
        
            showAlert(title: "Congratulations", message: "Login successfull", button: "OK")
            
        }else{
            showAlert(title: "Error", message: "Login fails", button: "OK")
        }
        
    }
    
    
    //MARK: - Private functions
    
    private func showAlert(title : String, message : String, button : String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: button, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
 

}
