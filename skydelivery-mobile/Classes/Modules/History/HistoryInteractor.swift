//
//  HistoryInteractor.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import Foundation
//func loadHistory() {
//    var ordersData = [HistoryData]()
//    api.GetUserOrders(count: 7, page: 1) { (orders) in
//        if let list = orders?.List {
//            for order in list {
//                ordersData.append(HistoryData(ID: order.ID!,
//                                              RestID: order.RestID!,
//                                              Address: order.Address!,
//                                              Products: order.Products!,
//                                              Price: order.Price!,
//                                              Created: order.Created!,
//                                              Status: order.Status!))
//            }
//            
//            presenter?.ShowLogin()
//        }
//    }
//}

class HistoryInteractor {
    var presenter: InteractorToPresenterHistoryProtocol?
    
    let api = ApiManager.shared
}

extension HistoryInteractor: PresenterToInteractorHistoryProtocol {
    func LoadHistory() {
        var ordersData = [HistoryData]()
        api.GetUserOrders(count: 7, page: 1) { (orders) in
            if let list = orders?.List {
                for order in list {
                    ordersData.append(HistoryData(ID: order.ID!,
                                                  RestID: order.RestID!,
                                                  Address: order.Address!,
                                                  Products: order.Products!,
                                                  Price: order.Price!,
                                                  Created: order.Created!,
                                                  Status: order.Status!))
                }
    
                self.presenter?.OnSuccessHistory(orders: ordersData)
            } else {
                self.presenter?.OnSuccessHistory(orders: [HistoryData]())
            }
        }
    }
}
