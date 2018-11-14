//
//  LoginViewController.swift
//  EventsApp
//
//  Created by Gabriel Conte on 14/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController {
    
    private let eventsListSegue = "goToEventsList"
    
    var viewModel: LoginViewModelDelegate!
    
    @IBOutlet weak var loginNameTextField: UITextField!
    @IBOutlet weak var loginEmailTextField: UITextField!
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        if !viewModel.validateLogin(username: loginNameTextField.text, email: loginEmailTextField.text){
            print("")
        }else{
            self.performSegue(withIdentifier: eventsListSegue, sender: self)
        }
    }
}
