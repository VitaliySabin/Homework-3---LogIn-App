//
//  WelcomeUserViewController.swift
//  Homework 3 - LogIn App
//
//  Created by Виталий Сабин on 02.02.2021.
//

import UIKit

class WelcomeUserViewController: UIViewController {
    
    @IBOutlet var welcomeUserLabel: UILabel!
    
    var userName: Person
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeUserLabel.text = "Welcome, \(userName)!"
    }
}
