//
//  CategoryInteractor.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//
import UIKit

class CategoryInteractor: PresenterToInteractorCategoryProtocol {
    
    var presenter: InteractorToPresenterCategoryProtocol?
    let api = ApiManager.shared
    
    func LoadRestaurnatByCategory(id :Int) {
        var restData = [RestaurantData]()
        
        self.api.GetRestaurantsByTag(req: GetRestaurantsRequest(page: 1, count: 100, tag: id)) { (restaurants) in
            print("CATEGORY")
            print(restaurants?.List)
            if let list = restaurants?.List! {
                for restaurant in list {
                    print(restaurant)
                    var data = RestaurantData(title: restaurant.Name!, url: restaurant.Description!, backgroundImage: UIImage())
                    
                    self.api.GetImage(url: restaurant.Image!) { (image) in
                        if image != nil {
                            data.backgroundImage = image!
                        } else {
                            print("error image nil")
                        }
                        
                        restData.append(data)
                        self.presenter?.ShowRestaurnatsByTag(data: restData)
                    }
                }
            }
        }
    }
}

