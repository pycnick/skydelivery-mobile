//
//  SignUpInteractor.swift
//  skydelivery-mobile
//
//  Created by pycnick on 26.12.2020.
//

import Foundation

class SignUpInteractor {
    var presenter: InteractorToPresenterSignUpProtocol?
    var api = ApiManager.shared
}

extension SignUpInteractor: PresenterToInteractorSignUpProtocol {
    func SignUp(request: SignUpRequest) {
        api.SignUp(req: request) { (error) in
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
                    self.presenter?.OnSuccessSignUp(profile: prof)
                }
            }
        }
        
        print("SignUp")
        
    }
}
