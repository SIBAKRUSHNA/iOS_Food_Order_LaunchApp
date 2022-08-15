//
//  OrderViewController.swift
//  Food Order
//
//  Created by Mobiotics on 12/08/22.
//

import UIKit
import CoreLocation

class OrderViewController: UIViewController {
    @IBOutlet weak var orderTableView: OrderTableView!
    var locationManager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDataFromJson()
        setUI()
    }
    func setUI() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }
    private func setData(_ orderData: OrderResponse) {
        orderTableView.setData(orderData)
        orderTableView.returnToSearchPage = {
            guard let searchViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else { return }
            self.navigationController?.pushViewController(searchViewController, animated: true)
        }
    }
    func setDataFromJson() {
        do {
            if let file = Bundle.main.url(forResource: "data", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: [])
                self.setData(OrderResponse(object: jsonDictionary))
            } else {
                print("no file")
            }
        } catch {
            print(error)
        }
    }
}
extension OrderViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
                self.orderTableView.currentAddress = "\(placemark.thoroughfare ?? ""), \(placemark.subLocality ?? ""), \(placemark.locality ?? ""), \(placemark.postalCode ?? "")"
                self.orderTableView.reloadData()
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}
