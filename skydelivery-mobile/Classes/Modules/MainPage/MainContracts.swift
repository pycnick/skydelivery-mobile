//
//  MainContracts.swift
//  skydelivery-mobile
//
//  Created by pycnick on 20.11.2020.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMainProtocol: class {
//    func onFetchQuotesSuccess()
//    func onFetchQuotesFailure(error: String)
//
//    func showHUD()
//    func hideHUD()
//
//    func deselectRowAt(row: Int)
    func SetRestaurants(restaurants: [RestaurantData])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMainProtocol: class {
    
    var view: PresenterToViewMainProtocol? { get set }
    var interactor: PresenterToInteractorMainProtocol? { get set }
    var router: PresenterToRouterMainProtocol? { get set }
    
    func viewDidLoad()
//
//    var quotesStrings: [String]? { get set }
//
//    func viewDidLoad()
//
//    func refresh()
//
//    func numberOfRowsInSection() -> Int
//    func textLabelText(indexPath: IndexPath) -> String?
//
//    func didSelectRowAt(index: Int)
//    func deselectRowAt(index: Int)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMainProtocol: class {
//
    var presenter: InteractorToPresenterMainProtocol? { get set }
//
//    func loadQuotes()
//    func retrieveQuote(at index: Int)
    
    func LoadRestaurants()
    
    func LoadRecommendations()
    
    func LoadTags()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMainProtocol: class {
//
//    func fetchQuotesSuccess(quotes: [Quote])
//    func fetchQuotesFailure(errorCode: Int)
//
//    func getQuoteSuccess(_ quote: Quote)
//    func getQuoteFailure()
    func UpdateRestaurants(data: [RestaurantData])
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMainProtocol: class {
//
    static func createModule() -> UINavigationController
//
//    func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: Quote)
}
