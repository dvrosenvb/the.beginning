//
//  ProtocolsHome.swift
//  the.beginning
//
//  Created by Rosendo Vazquez on 22/07/22.
//

import Foundation

//MARK: Router - Presenter -> Router
protocol PresenterToRouterProtocolHome:AnyObject{
  static func createModule() -> ViewHome
}

//MARK: Presenter - View -> Presenter
protocol ViewToPresenterProtocolHome:AnyObject{
  var view:PresenterToViewProtocolHome? {get set}
  var interactor:PresenterToInteractorProtocolHome? {get set}
  var router: PresenterToRouterProtocolHome? {get set}
  
  func launchHome()
}

//MARK: Interactor - Interactor -> Presenter
protocol InteractorToPresenterProtocolHome:AnyObject{
  
}

//MARK: View - Presenter -> View
protocol PresenterToViewProtocolHome:AnyObject{
  
}


//MARK: PresenterToInteractor
protocol PresenterToInteractorProtocolHome:AnyObject{
  var presenter:InteractorToPresenterProtocolHome?{get set}
  
}
