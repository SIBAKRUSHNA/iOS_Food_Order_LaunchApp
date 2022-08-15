//
//  ItemsTableViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 14/08/22.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    private let cellSpace: CGFloat = 15
    private var leftSpace: CGFloat = 15
    private var rightSpace: CGFloat = 15
    private var contentLayoutHelper: ContentLayoutHelper!
    var orderItem = [OrderItem]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        setUI()
    }
    private func setUI() {
        self.selectionStyle = .none
        itemsCollectionView.collectionViewLayout.invalidateLayout()
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        contentLayoutHelper = ContentLayoutHelper(ContentLayout(right: rightSpace,
                                                                left: leftSpace,
                                                                cellSpace: cellSpace,
                                                                width: UIScreen.main.bounds.width,
                                                                layout: .SQUARE,
                                                                cellCount: CGFloat(4)))
        heightConstraint?.constant = contentLayoutHelper.fetchCellSize().height * 2
    }
    func setData(_ orderItem: [OrderItem]?) {
        if let orderItem = orderItem {
            self.orderItem = orderItem
            itemsCollectionView.reloadData()
        }
    }
}
extension ItemsTableViewCell: UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orderItem.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: "ItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath) as? ItemsCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(orderItem[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.leftSpace, bottom: 0, right: self.rightSpace)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return contentLayoutHelper.fetchCellSize()
    }
}
extension ItemsTableViewCell: UICollectionViewDelegate {
    
}
