//
//  ItemsCollectionViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 14/08/22.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    private func setUI() {
        imageView.applyCorner(radius: imageView.frame.height / 2)
        itemNameLabel.font = UIFont.systemFont(ofSize: 12)
        itemNameLabel.textColor = UIColor.white
    }
    func setData(_ orderItem: OrderItem) {
        imageView.image = UIImage(named: orderItem.imageName ?? "")
        itemNameLabel.text = orderItem.itemName
    }
}
