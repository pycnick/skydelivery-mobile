//
//  MainInteractor.swift
//  skydelivery-mobile
//
//  Created by pycnick on 20.11.2020.
//

import UIKit

class MainInteractor: PresenterToInteractorMainProtocol {
    
    var presenter: InteractorToPresenterMainProtocol?
    let api = ApiManager.shared
    
    func LoadRestaurants() {
        var restData = [RestaurantData]()
        
        self.api.GetRestaurants(req: GetRestaurantsRequest(page: 1, count: 2, tag: 0)) { (restaurants) in
            if let list = restaurants?.List! {
                for restaurant in list {
                    var data = RestaurantData(title: restaurant.Name!, url: restaurant.Description!, backgroundImage: UIImage())
                    
                    self.api.GetImage(url: restaurant.Image!) { (image) in
                        if image != nil {
                            data.backgroundImage = image!
                        } else {
                            print("error image nil")
                        }
                        
                        restData.append(data)
                        self.presenter?.UpdateRestaurants(data: restData)
                    }
                }
            }
        }
    }
    
    func LoadRecommendations() {
        var restData = [RestaurantData]()
        
        self.api.GetRecommendations(count: 2) { (restaurants) in
            if let list = restaurants?.List! {
                for restaurant in list {
                    var data = RestaurantData(title: restaurant.Name!, url: restaurant.Description!, backgroundImage: UIImage())
                    
                    self.api.GetImage(url: restaurant.Image!) { (image) in
                        if image != nil {
                            data.backgroundImage = image!
                        } else {
                            print("error image nil")
                        }
                        
                        restData.append(data)
                        self.presenter?.UpdateRecommendations(data: restData)
                    }
                }
            }
        }
    }
    
    func LoadTags() {
        var tagsData = [TagData]()
        
        self.api.GetTags { (tags) in
            if let list = tags?.List! {
                for tag in list {
                    tagsData.append(TagData(id: tag.ID!, title: tag.Name!))
                }
                
                self.presenter?.UpdateTags(data: tagsData)
            }
        }
    }
}
