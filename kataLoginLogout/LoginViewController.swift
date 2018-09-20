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
    
    
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions
    
    @IBAction func doLogin() {
        
        do {
            if try KataApp().login(username: usernameTextField.text!, password: passwordTextField.text!) {
                
                showAlert(title: "Congratulations", message: "Login successfull", button: "OK")
                
                loginView.isHidden = true
                logoutButton.isHidden = false
                
            }else{
                showAlert(title: "Error", message: "Login fails", button: "OK")
            }
        } catch LoginError.usernameWithInvalidCharacters{
            showAlert(title: "Error", message: "Username with invalid characters", button: "OK")
        } catch {
            print("Another error")
        }
        
        
       
        
        
        
    }
    
    @IBAction func doLogOut() {
        
        if KataApp().logout() {
            
            loginView.isHidden = false
            logoutButton.isHidden = true
            
            
        }else {
            showAlert(title: "Error", message: "Cannot logout", button: "Try again")
        }
        
        
    }
    
    //MARK: - Private functions
    
    private func showAlert(title : String, message : String, button : String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: button, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
 

}
