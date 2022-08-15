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
    private let cellCount: CGFloat = 4
    private let leftCellSpace: CGFloat = 10
    private let rightCellSpace: CGFloat = 20
    private let cellSpacing: CGFloat = 10
    private let cellHeight: CGFloat = 42
    var returnToSearchPage: (() -> Void)?
    let tags = ["(1)", "Max Safety", "Pro", "Cuisines", "Papular", "Order Again", "Go Out"]
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
        self.selectionStyle = .none
        tagCollectionView.collectionViewLayout.invalidateLayout()
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
    }
    func setData(_ currentAddress: String) {
        addressLabel.text = currentAddress
    }
    private func getCellSize() -> CGSize {
        let collectionViewWidth = tagCollectionView.frame.width
        let totalSpacingBetweenCells = self.cellSpacing * round(self.cellCount - 1)
        let reducedWidth = (collectionViewWidth - totalSpacingBetweenCells - leftCellSpace - rightCellSpace) / self.cellCount
        return CGSize(width: reducedWidth, height: self.cellHeight)
    }
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.returnToSearchPage?()
    }
}
extension SearchAndTagTableViewCell: UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(tags[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.getCellSize()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: self.leftCellSpace, bottom: 10, right: self.rightCellSpace)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}
extension SearchAndTagTableViewCell: UICollectionViewDelegate {
    
}
