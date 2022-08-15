//
//  RestaurantTableViewCell.swift
//  Food Order
//
//  Created by Mobiotics on 14/08/22.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var restaurantCollectionView: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    private let cellSpace: CGFloat = 20
    private var leftSpace: CGFloat = 20
    private var rightSpace: CGFloat = 20
    private var contentLayoutHelper: ContentLayoutHelper!
    var restaurantData = [Restaurants]()
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
        restaurantCollectionView.collectionViewLayout.invalidateLayout()
        restaurantCollectionView.delegate = self
        restaurantCollectionView.dataSource = self
        contentLayoutHelper = ContentLayoutHelper(ContentLayout(right: rightSpace,
                                                                left: leftSpace,
                                                                cellSpace: cellSpace,
                                                                width: UIScreen.main.bounds.width,
                                                                layout: .LANDSCAPE,
                                                                cellCount: CGFloat(1)))
        heightConstraint?.constant = (contentLayoutHelper.fetchCellSize().height + 110) * CGFloat(restaurantData.count)
    }
    func setData(_ restaurantData: [Restaurants]?) {
        if let restaurantData = restaurantData {
            self.restaurantData = restaurantData
            restaurantCollectionView.reloadData()
        }
    }
}
extension RestaurantTableViewCell: UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: "RestaurantCollectionView", bundle: nil), forCellWithReuseIdentifier: "RestaurantCollectionView")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCollectionView", for: indexPath) as? RestaurantCollectionView else { return UICollectionViewCell() }
        cell.setData(restaurantData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: self.leftSpace, bottom: 0, right: self.rightSpace)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentLayoutHelper.fetchCellSize().width, height: contentLayoutHelper.fetchCellSize().height + 110)
    }
}
extension RestaurantTableViewCell: UICollectionViewDelegate {
}
