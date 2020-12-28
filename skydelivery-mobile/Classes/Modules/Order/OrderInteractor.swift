//
//  OrderInteractor.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 28.12.2020.
//

import Foundation

class OrderInteractor {
    var presenter: InteractorToPresenterOrderProtocol?
}

extension OrderInteractor : PresenterToInteractorOrderProtocol {
    
}
