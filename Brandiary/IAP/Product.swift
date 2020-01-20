//
//  Product.swift
//  Brandiary
//
//  Created by young on 16/11/2019.
//  Copyright © 2019 young. All rights reserved.
//

import Foundation

public struct RazeFaceProducts {
  
  public static let SwiftShopping = "SwiftShopping"
  
  private static let productIdentifiers: Set<ProductIdentifier> = [RazeFaceProducts.SwiftShopping]

  public static let store = IAPHelper(productIds: RazeFaceProducts.productIdentifiers)
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
  return productIdentifier.components(separatedBy: ".").last
}

