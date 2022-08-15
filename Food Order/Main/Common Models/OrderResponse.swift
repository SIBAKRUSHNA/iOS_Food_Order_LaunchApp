//
//  OrderResponse.swift
//
//  Created by Siba Krushna on 14/08/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class OrderResponse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let orderItem = "orderItem"
    static let offers = "offers"
    static let restaurants = "restaurants"
    static let orderAgain = "orderAgain"
  }

  // MARK: Properties
  public var orderItem: [OrderItem]?
  public var offers: Offers?
  public var restaurants: [Restaurants]?
  public var orderAgain: [OrderAgain]?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    if let items = json[SerializationKeys.orderItem].array { orderItem = items.map { OrderItem(json: $0) } }
    offers = Offers(json: json[SerializationKeys.offers])
    if let items = json[SerializationKeys.restaurants].array { restaurants = items.map { Restaurants(json: $0) } }
    if let items = json[SerializationKeys.orderAgain].array { orderAgain = items.map { OrderAgain(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = orderItem { dictionary[SerializationKeys.orderItem] = value.map { $0.dictionaryRepresentation() } }
    if let value = offers { dictionary[SerializationKeys.offers] = value.dictionaryRepresentation() }
    if let value = restaurants { dictionary[SerializationKeys.restaurants] = value.map { $0.dictionaryRepresentation() } }
    if let value = orderAgain { dictionary[SerializationKeys.orderAgain] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.orderItem = aDecoder.decodeObject(forKey: SerializationKeys.orderItem) as? [OrderItem]
    self.offers = aDecoder.decodeObject(forKey: SerializationKeys.offers) as? Offers
    self.restaurants = aDecoder.decodeObject(forKey: SerializationKeys.restaurants) as? [Restaurants]
    self.orderAgain = aDecoder.decodeObject(forKey: SerializationKeys.orderAgain) as? [OrderAgain]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(orderItem, forKey: SerializationKeys.orderItem)
    aCoder.encode(offers, forKey: SerializationKeys.offers)
    aCoder.encode(restaurants, forKey: SerializationKeys.restaurants)
    aCoder.encode(orderAgain, forKey: SerializationKeys.orderAgain)
  }

}
