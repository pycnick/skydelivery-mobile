//
//  ApService.swift
//  skydelivery-mobile
//
//  Created by pycnick on 17.12.2020.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import AlamofireImage

class ApiManager {
    let host: String
    let imageHost: String
    var token: String?
    
    static var shared: ApiManager = {
        let instance = ApiManager()
        return instance
    }()
    
    private init() {
        self.host = "http://84.201.130.248:5000/api/v1"
        self.imageHost = "http://84.201.130.248:8080/images/"
    }
    
    // MARK: internal methods
    func IsAuthenticated() -> Bool {
        if HTTPCookieStorage.shared.cookies?.count != 0 {
            return true
        }
        
        return false
    }
    
    // MARK: login and signup methods
    func SignUp(req: SignUpRequest, completition: @escaping (Error?) -> Void) {
        let params = ["firstName": req.FirstName,
                      "lastName": req.LastName,
                      "phone": req.Phone,
                      "password": req.Password]
        
        Alamofire
            .request(self.host + "/signup",
                                 method: .post,
                                 parameters: params,
                                 encoding: JSONEncoding.default)
            .responseObject { (response: DataResponse<Error>) in
                if let headers = response.response?.allHeaderFields as? [String: String] {
                    self.token = headers["X-csrf-Token"]
                }
                completition(response.value)
            }
    }
    
    func LogIn(req: LogInRequest, completion: @escaping (Error?) -> Void) {
        let params = ["phone": req.Username,
                      "password": req.Password]
        
        Alamofire
            .request(self.host + "/signin",
                                 method: .post,
                                 parameters: params,
                                 encoding: JSONEncoding.default)
            .responseObject { (response: DataResponse<Error>) in
                let value = response.value
                completion(value)
            }
    }
    
    
    // MARK: Methods that doesn't need authentication
    func GetRestaurants(req: GetRestaurantsRequest, completion: @escaping (Restaurants?) -> Void) {
        Alamofire
            .request(self.host + "/restaurants?count=\(req.Count)&page=\(req.Page)")
            .responseObject { (response: DataResponse<Restaurants>) in
                print(response)
                completion(response.value)
            }
    }
    
    func GetImage(url: String, completion: @escaping (UIImage?) -> Void){
        Alamofire
            .request(self.imageHost + url)
            .responseImage { (response) in
                completion(response.result.value)
            }
    }
    
    func GetTags(completion: @escaping (Tags?) -> Void) {
        Alamofire
            .request(self.host + "/rest_tags")
            .responseObject { (response: DataResponse<Tags>) in
                completion(response.value)
            }
    }
    
    // MARK: Methods that need authentication
    
//    func GetRecommendations()
    
    
}

extension ApiManager: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
