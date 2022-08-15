//
//  OrderTableView.swift
//  Food Order
//
//  Created by Mobiotics on 13/08/22.
//

import UIKit

class OrderTableView: UITableView {
    // MARK: - Life Cycle
    var orderData: OrderResponse?
    var currentAddress = String()
    var returnToSearchPage: (() -> Void)?
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.configTableView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configTableView()
    }
    private func configTableView() {
        self.separatorStyle = .none
        self.backgroundColor = UIColor.clear
        self.delegate = self
        self.dataSource = self
    }
    func setData(_ orderData: OrderResponse?) {
        self.orderData = orderData
        self.reloadData()
    }
}
extension OrderTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            register(UINib(nibName: "SearchAndTagTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchAndTagTableViewCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchAndTagTableViewCell", for: indexPath) as? SearchAndTagTableViewCell else { return UITableViewCell()}
            cell.returnToSearchPage = self.returnToSearchPage
            cell.setData(currentAddress)
            return cell
        } else if indexPath.section == 1 {
            register(UINib(nibName: "OfferTableViewCell", bundle: nil), forCellReuseIdentifier: "OfferTableViewCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OfferTableViewCell", for: indexPath) as? OfferTableViewCell else { return UITableViewCell()}
            cell.setData(orderData?.offers?.images)
            return cell
        } else if indexPath.section == 2 {
            register(UINib(nibName: "PreviousOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "PreviousOrderTableViewCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousOrderTableViewCell", for: indexPath) as? PreviousOrderTableViewCell else { return UITableViewCell()}
            cell.setData(orderData?.orderAgain)
            return cell
        } else if indexPath.section == 3 {
            register(UINib(nibName: "ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell", for: indexPath) as? ItemsTableViewCell else { return UITableViewCell()}
            cell.setData(orderData?.orderItem)
            return cell
        } else {
            register(UINib(nibName: "RestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "RestaurantTableViewCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as? RestaurantTableViewCell else { return UITableViewCell()}
            cell.setData(orderData?.restaurants)
            return cell
        }
    }
}
extension OrderTableView: UITableViewDelegate {
}
