//
//  PresenterHome.swift
//  the.beginning
//
//  Created by Rosendo Vazquez on 22/07/22.
//

import Foundation

class PresenterHome: ViewToPresenterProtocolHome {
  
  var view: PresenterToViewProtocolHome?
  var interactor: PresenterToInteractorProtocolHome?
  var router: PresenterToRouterProtocolHome?
  
  func launchHome() {
    print("launchHome")
  }
  
}

extension PresenterHome:InteractorToPresenterProtocolHome{
  
}
