//
//  PreviousOrderTableViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 14/08/22.
//

import UIKit

class PreviousOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var previousOrderCollectionView: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    private let cellSpace: CGFloat = 10
    private var leftSpace: CGFloat = 10
    private var rightSpace: CGFloat = 10
    private var contentLayoutHelper: ContentLayoutHelper!
    private var orderAgainData = [OrderAgain]()
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
        previousOrderCollectionView.collectionViewLayout.invalidateLayout()
        previousOrderCollectionView.delegate = self
        previousOrderCollectionView.dataSource = self
        contentLayoutHelper = ContentLayoutHelper(ContentLayout(right: rightSpace,
                                                                left: leftSpace,
                                                                cellSpace: cellSpace,
                                                                width: UIScreen.main.bounds.width,
                                                                layout: .LANDSCAPE,
                                                                cellCount: CGFloat(1.8)))
        heightConstraint?.constant = contentLayoutHelper.fetchCellSize().height
    }
    func setData(_ orderAgain: [OrderAgain]?) {
        if let orderAgain = orderAgain {
            self.orderAgainData = orderAgain
            previousOrderCollectionView.reloadData()
        }
    }
}
extension PreviousOrderTableViewCell: UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orderAgainData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: "PreviousOrderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PreviousOrderCollectionViewCell")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviousOrderCollectionViewCell", for: indexPath) as? PreviousOrderCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(self.orderAgainData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.leftSpace, bottom: 0, right: self.rightSpace)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return contentLayoutHelper.fetchCellSize()
    }
}
extension PreviousOrderTableViewCell: UICollectionViewDelegate {
    
}
