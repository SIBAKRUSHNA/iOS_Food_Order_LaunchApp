//
//  OfferTableViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 13/08/22.
//

import UIKit

class OfferTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    private let cellSpace: CGFloat = 15
    private var leftSpace: CGFloat = 15
    private var rightSpace: CGFloat = 15
    private var contentLayoutHelper: ContentLayoutHelper!
    var imageArr = [String]()
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
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        contentLayoutHelper = ContentLayoutHelper(ContentLayout(right: rightSpace,
                                                                left: leftSpace,
                                                                cellSpace: cellSpace,
                                                                width: UIScreen.main.bounds.width,
                                                                layout: .LANDSCAPE,
                                                                cellCount: CGFloat(2)))
        heightConstraint?.constant = contentLayoutHelper.fetchCellSize().height
    }
    func setData(_ imageArr: [String]?) {
        if let imageArr = imageArr {
            self.imageArr = imageArr
        }
        collectionView.reloadData()
    }
}
extension OfferTableViewCell: UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: "OffersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OffersCollectionViewCell")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCollectionViewCell", for: indexPath) as? OffersCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(imageArr[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.leftSpace, bottom: 0, right: self.rightSpace)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return contentLayoutHelper.fetchCellSize()
    }
}
extension OfferTableViewCell: UICollectionViewDelegate {
    
}
