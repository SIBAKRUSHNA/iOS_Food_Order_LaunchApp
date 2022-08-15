//
//  TagCollectionViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 15/08/22.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tagNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    private func setUI() {
        tagNameLabel.superview?.backgroundColor = #colorLiteral(red: 0.2257985473, green: 0.2257985473, blue: 0.2257985473, alpha: 1)
        tagNameLabel.superview?.applyCorner(radius: 8)
        tagNameLabel.font = UIFont.systemFont(ofSize: 10)
        tagNameLabel.textColor = UIColor.white
    }
    func setData(_ tagName: String) {
        tagNameLabel.text = tagName
    }
}
