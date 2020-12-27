//
//  profile.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 27.12.2020.
//

struct ProfileRequest {
    init(firstname: String, lastname: String, email: String) {
        self.FirstName = firstname
        self.LastName = lastname
        self.Email = email
    }
    
    var FirstName: String
    var LastName: String
    var Email: String
}

