//
//  signUp.swift
//  skydelivery-mobile
//
//  Created by pycnick on 24.12.2020.
//

struct SignUpRequest {
    init(firstname: String, lastname: String, phone: String, password: String) {
        self.FirstName = firstname
        self.LastName = lastname
        self.Phone = phone
        self.Password = password
    }
    
    var FirstName: String
    var LastName: String
    var Phone: String
    var Password: String
}
