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
    
    private let userJedi = User(userName: "Alexey", password: "password")
    private let personJedi = Person(firstName: "Alexey", lastName: "Efimov")
    private let personPadawan = Person(firstName: "Vitaliy", lastName: "Sabin")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else {return}
        
        for viewController in viewControllers {
            if let welcomeUserVC = viewController as? WelcomeUserViewController {
                welcomeUserVC.userName = "\(personJedi.firstName) \(personJedi.lastName)"
            } else if let resumeVC = viewController as? ResumeViewController {
                resumeVC.user = "\(personPadawan.firstName) \(personPadawan.lastName)"
            } else if let moreInfoVC = viewController as? MoreInfoViewController {
                moreInfoVC.user = "\(personPadawan.firstName) \(personPadawan.lastName)"
            } else {return}
        }
//        guard let welcomeUserVC = segue.destination as? WelcomeUserViewController
//        else {return}
//        welcomeUserVC.userName = "\(personJedi.firstName) \(personJedi.lastName)"
    }
    
    @IBAction func logInAction() {
        if usernameTextField.text != userJedi.userName || passwordTextField.text != userJedi.password {
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
        showAlert(with: "Forgot?",
                  and: "Alexey, your username is \(userJedi.userName)")
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        showAlert(with: "Forgot?",
                  and: "Alexey, your password is \(userJedi.password)")
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
