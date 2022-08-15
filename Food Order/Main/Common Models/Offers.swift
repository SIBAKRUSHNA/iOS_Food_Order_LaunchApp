//
//  Offers.swift
//
//  Created by Siba Krushna on 14/08/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Offers: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let images = "images"
  }

  // MARK: Properties
  public var images: [String]?

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
    if let items = json[SerializationKeys.images].array { images = items.map { $0.stringValue } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = images { dictionary[SerializationKeys.images] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.images = aDecoder.decodeObject(forKey: SerializationKeys.images) as? [String]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(images, forKey: SerializationKeys.images)
  }

}
