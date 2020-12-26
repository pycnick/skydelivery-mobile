//
//  login.swift
//  skydelivery-mobile
//
//  Created by pycnick on 24.12.2020.
//

struct LogInRequest {
    init(username: String, password: String) {
        self.Username = username
        self.Password = password
    }
    
    var Username: String
    var Password: String
}
