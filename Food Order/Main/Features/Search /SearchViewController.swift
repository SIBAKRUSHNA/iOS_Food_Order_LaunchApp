//
//  SearchViewController.swift
//  Food Order
//
//  Created by Mobiotics on 15/08/22.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchResultTableView: UITableView!
    private var orderData: OrderResponse?
    private var searchResults = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataFromJson()
        setUI()
    }
    private func setUI() {
        searchTextField.delegate = self
        searchResultTableView.separatorStyle = .none
    }
    func setDataFromJson() {
        do {
            if let file = Bundle.main.url(forResource: "data", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: [])
                self.orderData = OrderResponse(object: jsonDictionary)
            } else {
                print("no file")
            }
        } catch {
            print(error)
        }
    }
    func searchResultData(_ searchString: String) {
        orderData?.restaurants?.forEach({ restaurant in
            if (restaurant.restaurantName ?? "").lowercased().trimmingCharacters(in: .whitespaces) == searchString.lowercased().trimmingCharacters(in: .whitespaces) {
                searchResults.append(restaurant.restaurantName ?? "")
            }
        })
        if searchResults.isEmpty {
            searchResults.append("No Search Result Found")
        }
        self.searchResultTableView.reloadData()
    }
}
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell()}
        cell.setData(searchResults[indexPath.row])
        return cell
    }
}
extension SearchViewController: UITableViewDelegate {
    
}
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let searchText = textField.text, !searchText.isEmpty {
            self.searchResultData(searchText)
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.searchResults.removeAll()
        self.searchResultTableView.reloadData()
    }
}
