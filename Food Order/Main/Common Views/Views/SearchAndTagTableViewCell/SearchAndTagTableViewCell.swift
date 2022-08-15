//
//  SearchAndTagTableViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 15/08/22.
//

import UIKit

class SearchAndTagTableViewCell: UITableViewCell {
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    var returnToSearchPage: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
        // Configure the view for the selected state
    }
    private func setUI() {
        addressLabel.font = UIFont.systemFont(ofSize: 14)
        addressLabel.textColor = UIColor.white
    }
    func setData(_ currentAddress: String) {
        addressLabel.text = currentAddress
    }
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.returnToSearchPage?()
    }
}
