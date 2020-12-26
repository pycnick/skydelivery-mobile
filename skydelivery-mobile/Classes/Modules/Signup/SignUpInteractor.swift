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
            }
            
            self.presenter?.OnSuccessSignUp()
        }
        
        print("SignUp")
        
    }
}
