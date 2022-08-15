//
//  RestaurantCollectionView.swift
//  Food Order
//
//  Created by Mobiotics on 14/08/22.
//

import UIKit

class RestaurantCollectionView: UICollectionViewCell {
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var numberOfOrderLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var maxSafeImageView: UIImageView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        discountLabel.superview?.roundCorners(corners: [.topRight, .bottomRight], radius: 5)
        deliveryTimeLabel.superview?.applyCorner(radius: 3)
        rateLabel.superview?.applyCorner(radius: 2)
    }
    private func setUI() {
        itemImageView.superview?.superview?.backgroundColor = #colorLiteral(red: 0.2257985473, green: 0.2257985473, blue: 0.2257985473, alpha: 1)
        restaurantNameLabel.font = UIFont.systemFont(ofSize: 16)
        restaurantNameLabel.textColor = UIColor.white
        addressLabel.font = UIFont.systemFont(ofSize: 12)
        addressLabel.textColor = UIColor.white
        numberOfOrderLabel.font = UIFont.systemFont(ofSize: 10)
        numberOfOrderLabel.textColor = UIColor.white
        rateLabel.font = UIFont.systemFont(ofSize: 8)
        rateLabel.textColor = UIColor.white
        priceLabel.font = UIFont.systemFont(ofSize: 12)
        priceLabel.textColor = UIColor.white
        discountLabel.font = UIFont.systemFont(ofSize: 8)
        discountLabel.textColor = UIColor.white
        discountLabel.superview?.backgroundColor = UIColor.blue
        deliveryTimeLabel.font = UIFont.systemFont(ofSize: 12)
        deliveryTimeLabel.textColor = UIColor.black
        deliveryTimeLabel.superview?.backgroundColor = UIColor.white
        itemImageView.superview?.superview?.applyCorner(radius: 15)
    }
    func setData(_ restaurantData: Restaurants) {
        restaurantNameLabel.text = restaurantData.restaurantName
        addressLabel.text = restaurantData.address
        numberOfOrderLabel.text = restaurantData.numberOfOrder
        rateLabel.text = restaurantData.rating
        priceLabel.text = restaurantData.price
        discountLabel.text = restaurantData.discount
        deliveryTimeLabel.text = restaurantData.deliveryTime
        itemImageView.image = UIImage(named: restaurantData.imageName ?? "")
    }
}
