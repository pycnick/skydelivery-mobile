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

    func IsAuthenticated(completion: @escaping (Bool) -> Void) {
        Alamofire
            .request(self.host + "/profile")
            .response { (response) in
                switch response.response?.statusCode {
                case 200:
                    completion(true)
                default:
                    completion(false)
                }
            }
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
                    self.token = headers["X-Csrf-Token"]
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
                if let headers = response.response?.allHeaderFields as? [String: String] {
                    print(headers)
                    self.token = headers["X-Csrf-Token"]
                }
                completion(value)
            }
    }
    
    func EditProfile(req: ProfileRequest, completion: @escaping (Error?) -> Void) {
        let params = ["firstName": req.FirstName,
                      "lastName": req.LastName,
                      "email": req.Email]
        
        print("TOKEN")
        print(self.token)
        
        let headers: HTTPHeaders = [
            "X-csrf-Token": self.token ?? "",
            "Content-Type": "application/json"
            ]
        
        Alamofire
            .request(self.host + "/profile/bio",
                                method: .put,
                                parameters: params,
                                 encoding: JSONEncoding.default,
                                 headers: headers)
            .responseObject { (response: DataResponse<Error>) in
                print(response.debugDescription)
                print(response.response?.statusCode)
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
    
    func GetProfile(completion: @escaping (Profile?) -> Void) {
        Alamofire
            .request(self.host + "/profile")
            .responseObject { (response: DataResponse<Profile>) in
                print(response.debugDescription)
                print(response.response?.statusCode)
                completion(response.value)
            }
    }
    
    // MARK: Methods that need authentication
    
    func GetRecommendations(count: Int, completion: @escaping (Restaurants?) -> Void) {
        Alamofire
            .request(self.host + "/restaurants_recommendations?count=\(count)")
            .responseObject { (response: DataResponse<Restaurants>) in
                print(response.debugDescription)
                completion(response.value)
            }
    }
    
    func GetRestaurantProducts(req: GetProductsRequest, completion: @escaping (Products?) -> Void) {
        Alamofire
            .request(self.host + "/restaurants/\(req.ID)/product?count=\(req.Count)&page=\(req.Page)")
            .responseObject { (response: DataResponse<Products>) in
                print(response.debugDescription)
                completion(response.value)
            }
    }
    
    func GetProduct(prodID: Int, completion: @escaping (Product?) -> Void) {
        Alamofire
            .request(self.host + "/products/\(prodID)")
            .responseObject { (response: DataResponse<Product>) in
                print(response.debugDescription)
                completion(response.value)
            }
    }
    
    
}

extension ApiManager: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
