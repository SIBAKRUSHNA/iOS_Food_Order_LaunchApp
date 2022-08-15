//
//  SearchResultTableViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 15/08/22.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    @IBOutlet weak var searchResultLabel: UILabel!
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
        self.selectionStyle = .none
        searchResultLabel.font = UIFont.systemFont(ofSize: 14)
        searchResultLabel.textColor = UIColor.white
    }
    func setData(_ searchText: String) {
        searchResultLabel.text = searchText
    }
}
