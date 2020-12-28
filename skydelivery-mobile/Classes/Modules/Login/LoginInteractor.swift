//
//  LoginInteractor.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 27.12.2020.
//

import Foundation

class LogInInteractor {
    var presenter: InteractorToPresenterLogInProtocol?
    var api = ApiManager.shared
}

extension LogInInteractor: PresenterToInteractorLogInProtocol {
    func LogIn(request: LogInRequest) {
        api.LogIn(req: request) { (error) in
            if let message = error?.Error {
                print(message)
                return
            }
            var prof = ProfileData(firstName: "", surName: "", phone: "", email: "")
            self.api.GetProfile() { (profile) in
                if profile != nil {
                    print(profile)
                    prof.firstName = (profile?.User?.FirstName)!
                    prof.surName = (profile?.User?.LastName)!
                    prof.phone = (profile?.User?.Phone)!
                    prof.email = (profile?.User?.Email)!
                    self.presenter?.OnSuccessLogIn(profile: prof)
                }
            }
        }
        
        print("LogIn")
        
    }
}
