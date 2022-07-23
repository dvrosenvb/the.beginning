//
//  RouterHome.swift
//  the.beginning
//
//  Created by Rosendo Vazquez on 22/07/22.
//

import Foundation

class RouterHome:PresenterToRouterProtocolHome{
  
  weak var viewController:ViewHome?
  
  static func createModule() -> ViewHome {
    
    let view = ViewHome()
    let presenter:ViewToPresenterProtocolHome & InteractorToPresenterProtocolHome = PresenterHome()
    let interactor:PresenterToInteractorProtocolHome = InteractorHome()
    let router:PresenterToRouterProtocolHome = RouterHome()
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return view
  }
  
  
}
