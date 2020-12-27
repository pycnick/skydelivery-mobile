//
//  ProfileInteractor.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import Foundation

struct ProfileData {
    var firstName: String
    var surName: String
    var phone: String
    var email: String
}

class ProfileInteractor: PresenterToInteractorProfileProtocol {
    
    var presenter: InteractorToPresenterProfileProtocol?
    let api = ApiManager.shared
    
    func LoadProfile() {
//        self.api.LogIn(req: LogInRequest(username: "79150421496", password: "password")) { (data) in
//            print(data)
//        }
        
        self.api.IsAuthenticated() { (ok) in
            if ok == true {
                var prof = ProfileData(firstName: "", surName: "", phone: "", email: "")
                self.api.GetProfile() { (profile) in
                    if profile != nil {
                        print(profile)
                        prof.firstName = (profile?.User?.FirstName)!
                        prof.surName = (profile?.User?.LastName)!
                        prof.phone = (profile?.User?.Phone)!
                        prof.email = (profile?.User?.Email)!
                        self.presenter?.ShowProfile(profile: prof)
                    }
                }
            } else {
                self.presenter?.ShowLogin()
            }
        }
    }
    
    func editProfile(request: ProfileRequest) {
        api.EditProfile(req: request) { (error) in
            if let message = error?.Error {
                print("EDIT")
                print(message)
            }
            var prof = ProfileData(firstName: "", surName: "", phone: "", email: "")
            self.api.GetProfile() { (profile) in
                if profile != nil {
                    print(profile)
                    prof.firstName = (profile?.User?.FirstName)!
                    prof.surName = (profile?.User?.LastName)!
                    prof.phone = (profile?.User?.Phone)!
                    prof.email = (profile?.User?.Email)!
                    self.presenter?.ShowProfile(profile: prof)
                }
            }
        }
    }
    


}
