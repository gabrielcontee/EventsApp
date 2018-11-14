//
//  LoginViewModel.swift
//  EventsApp
//
//  Created by Gabriel Conte on 14/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate {
    func validateLogin(username: String?, email: String?) -> Bool
}

class LoginViewModel: NSObject, LoginViewModelDelegate{
    
    var dataSource: LoginDataSource!
    
    func validateLogin(username: String?, email: String?) -> Bool{
        if username == "" || email == ""{
            return false
        }else{
            guard let user = username, let email = email else{
                return false
            }
            dataSource.setLoginData(name: user, email: email)
            return true
        }
    }
    
}
