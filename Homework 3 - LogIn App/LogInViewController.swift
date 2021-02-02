//
//  LogInViewController.swift
//  Homework 3 - LogIn App
//
//  Created by Виталий Сабин on 02.02.2021.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        guard let welcomeUserVC = segue.destination
                as? WelcomeUserViewController
        else {return}
        welcomeUserVC.userName = usernameTextField.text
    }
   
    @IBAction func loginAction(_ sender: UIButton) {
        if usernameTextField.text != "Alexey" ||
           passwordTextField.text != "discoman" {
            showAlert(with: "Wrong username or password!",
                      and: "Try again!")
            passwordTextField.text = nil
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotUsernameAction(_ sender: UIButton) {
        showAlert(with: "Wrong username!",
                  and: "Alexey, your username is 'Alexey'")
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        showAlert(with: "Wrong password!",
                  and: "Alexey, your password is 'discoman'")
    }
}
extension LogInViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
