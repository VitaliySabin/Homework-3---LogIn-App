//
//  ResumeViewController.swift
//  Homework 3 - LogIn App
//
//  Created by Виталий Сабин on 07.02.2021.
//

import UIKit

class ResumeViewController: UIViewController {
    
    var user = ""
    
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "\(user) with his wife"
    }
    
}
