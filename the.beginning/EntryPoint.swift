//
//  EntryPoint.swift
//  the.beginning
//
//  Created by Rosendo Vazquez on 22/07/22.
//

import Foundation
import UIKit

public class EntryPoint{
  
  public static let bundle = Bundle(for: EntryPoint.self)
  public static let shared = EntryPoint()
  
  public static func startViper() -> UIViewController{
    return RouterHome.createModule()
  }
}
