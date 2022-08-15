//
//  Restaurants.swift
//
//  Created by Siba Krushna on 14/08/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Restaurants: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let deliveryTime = "deliveryTime"
    static let restaurantName = "restaurantName"
    static let numberOfOrder = "numberOfOrder"
    static let discount = "discount"
    static let address = "address"
    static let rating = "rating"
    static let imageName = "imageName"
    static let price = "price"
  }

  // MARK: Properties
  public var deliveryTime: String?
  public var restaurantName: String?
  public var numberOfOrder: String?
  public var discount: String?
  public var address: String?
  public var rating: String?
  public var imageName: String?
  public var price: String?

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
    deliveryTime = json[SerializationKeys.deliveryTime].string
    restaurantName = json[SerializationKeys.restaurantName].string
    numberOfOrder = json[SerializationKeys.numberOfOrder].string
    discount = json[SerializationKeys.discount].string
    address = json[SerializationKeys.address].string
    rating = json[SerializationKeys.rating].string
    imageName = json[SerializationKeys.imageName].string
    price = json[SerializationKeys.price].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = deliveryTime { dictionary[SerializationKeys.deliveryTime] = value }
    if let value = restaurantName { dictionary[SerializationKeys.restaurantName] = value }
    if let value = numberOfOrder { dictionary[SerializationKeys.numberOfOrder] = value }
    if let value = discount { dictionary[SerializationKeys.discount] = value }
    if let value = address { dictionary[SerializationKeys.address] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = imageName { dictionary[SerializationKeys.imageName] = value }
    if let value = price { dictionary[SerializationKeys.price] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.deliveryTime = aDecoder.decodeObject(forKey: SerializationKeys.deliveryTime) as? String
    self.restaurantName = aDecoder.decodeObject(forKey: SerializationKeys.restaurantName) as? String
    self.numberOfOrder = aDecoder.decodeObject(forKey: SerializationKeys.numberOfOrder) as? String
    self.discount = aDecoder.decodeObject(forKey: SerializationKeys.discount) as? String
    self.address = aDecoder.decodeObject(forKey: SerializationKeys.address) as? String
    self.rating = aDecoder.decodeObject(forKey: SerializationKeys.rating) as? String
    self.imageName = aDecoder.decodeObject(forKey: SerializationKeys.imageName) as? String
    self.price = aDecoder.decodeObject(forKey: SerializationKeys.price) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(deliveryTime, forKey: SerializationKeys.deliveryTime)
    aCoder.encode(restaurantName, forKey: SerializationKeys.restaurantName)
    aCoder.encode(numberOfOrder, forKey: SerializationKeys.numberOfOrder)
    aCoder.encode(discount, forKey: SerializationKeys.discount)
    aCoder.encode(address, forKey: SerializationKeys.address)
    aCoder.encode(rating, forKey: SerializationKeys.rating)
    aCoder.encode(imageName, forKey: SerializationKeys.imageName)
    aCoder.encode(price, forKey: SerializationKeys.price)
  }

}
