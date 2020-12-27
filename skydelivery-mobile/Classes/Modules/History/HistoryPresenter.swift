//
//  HistoryPresenter.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import Foundation

class HistoryPresenter {
    var view: PresenterToViewHistoryProtocol?
    var interactor: PresenterToInteractorHistoryProtocol?
    var router: PresenterToRouterHistoryProtocol?
}

extension HistoryPresenter: ViewToPresenterHistoryProtocol {
    func viewDidLoad() {
        interactor?.LoadHistory()
    }
}

extension HistoryPresenter: InteractorToPresenterHistoryProtocol {
    func OnSuccessHistory(orders: [HistoryData]) {
        view?.OnSuccessHistory(orders: orders)
    }
}
