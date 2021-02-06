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
    
    private let userName = "Alexey"
    private let password = "discoman"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeUserVC = segue.destination as? WelcomeUserViewController
        else {return}
        welcomeUserVC.userName = userName
    }
   
    @IBAction func logInAction() {
        if usernameTextField.text != userName || passwordTextField.text != password {
            showAlert(with: "Wrong username or password!", and: "Try again!")
            passwordTextField.text = nil
            return
        }
        
        performSegue(withIdentifier: "showWelcomeUserVC", sender: nil)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotUsernameAction(_ sender: UIButton) {
        showAlert(with: "Wrong username!",
                  and: "Alexey, your username is \(userName)")
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        showAlert(with: "Wrong password!",
                  and: "Alexey, your password is \(password)")
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

extension LogInViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInAction()
        }
        return true
    }
}
