//
//  SignUpContracts.swift
//  skydelivery-mobile
//
//  Created by pycnick on 26.12.2020.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewSignUpProtocol: class {
//    func onFetchQuotesSuccess()
//    func onFetchQuotesFailure(error: String)
//
//    func showHUD()
//    func hideHUD()
//
//    func deselectRowAt(row: Int)
//    func SetRestaurants(restaurants: [RestaurantData])
//    func SetTags(tags: [TagData])
//    func SetRecommendations(restaurants: [RestaurantData])
    func OnSuccessSignUp(profile: ProfileData)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSignUpProtocol: class {
    
    var view: PresenterToViewSignUpProtocol? { get set }
    var interactor: PresenterToInteractorSignUpProtocol? { get set }
    var router: PresenterToRouterSignUpProtocol? { get set }
    
    func showSignUp(req: SignUpRequest)
//
//    func viewDidLoad()
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
protocol PresenterToInteractorSignUpProtocol: class {
//
    var presenter: InteractorToPresenterSignUpProtocol? { get set }
    
    func SignUp(request: SignUpRequest)
//
//    func loadQuotes()
//    func retrieveQuote(at index: Int)
    
//    func LoadRestaurants()
//
//    func LoadRecommendations()
//
//    func LoadTags()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSignUpProtocol: class {
//
//    func fetchQuotesSuccess(quotes: [Quote])
//    func fetchQuotesFailure(errorCode: Int)
//
//    func getQuoteSuccess(_ quote: Quote)
//    func getQuoteFailure()
//    func UpdateRestaurants(data: [RestaurantData])
//    func UpdateTags(data: [TagData])
//    func UpdateRecommendations(data: [RestaurantData])
    
    func OnSuccessSignUp(profile: ProfileData)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSignUpProtocol: class {
//
    static func createView() -> UIView
//
//    func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: Quote)
}
