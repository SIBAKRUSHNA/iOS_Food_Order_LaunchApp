//
//  OffersCollectionViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 13/08/22.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.applyCorner(radius: 10)
    }
    func setData(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
