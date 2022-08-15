//
//  OrderAgain.swift
//
//  Created by Siba Krushna on 14/08/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class OrderAgain: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let imageName = "imageName"
        static let itemName = "itemName"
        static let deliveryTime = "deliveryTime"
        static let discount = "discount"
    }
    
    // MARK: Properties
    public var imageName: String?
    public var itemName: String?
    public var deliveryTime: String?
    public var discount: String?
    
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
        imageName = json[SerializationKeys.imageName].string
        itemName = json[SerializationKeys.itemName].string
        deliveryTime = json[SerializationKeys.deliveryTime].string
        discount = json[SerializationKeys.discount].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = imageName { dictionary[SerializationKeys.imageName] = value }
        if let value = itemName { dictionary[SerializationKeys.itemName] = value }
        if let value = deliveryTime { dictionary[SerializationKeys.deliveryTime] = value }
        if let value = discount { dictionary[SerializationKeys.discount] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.imageName = aDecoder.decodeObject(forKey: SerializationKeys.imageName) as? String
        self.itemName = aDecoder.decodeObject(forKey: SerializationKeys.itemName) as? String
        self.deliveryTime = aDecoder.decodeObject(forKey: SerializationKeys.deliveryTime) as? String
        self.discount = aDecoder.decodeObject(forKey: SerializationKeys.discount) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(imageName, forKey: SerializationKeys.imageName)
        aCoder.encode(itemName, forKey: SerializationKeys.itemName)
        aCoder.encode(deliveryTime, forKey: SerializationKeys.deliveryTime)
        aCoder.encode(discount, forKey: SerializationKeys.discount)
    }
    
}
