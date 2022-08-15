//
//  PreviousOrderCollectionViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 13/08/22.
//

import UIKit

class PreviousOrderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var orderTimeLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.applyCorner(radius: 10)
    }
    private func setUI() {
        itemNameLabel.font = UIFont.systemFont(ofSize: 16)
        itemNameLabel.textColor = UIColor.white
        orderTimeLabel.font = UIFont.systemFont(ofSize: 12)
        orderTimeLabel.textColor = UIColor.white
        offerLabel.font = UIFont.systemFont(ofSize: 12)
        offerLabel.textColor = UIColor.green
    }
    func setData(_ orderAgain: OrderAgain) {
        imageView.image = UIImage(named: orderAgain.imageName ?? "")
        itemNameLabel.text = orderAgain.itemName
        orderTimeLabel.text = orderAgain.deliveryTime
        offerLabel.text = orderAgain.discount
    }
}
