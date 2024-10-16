//
//  ViewController.swift
//  assignment
//
//  Created by Malith Kavinda on 2024-10-11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cityTableView:UITableView!
    
    private var cities: [String] = ["Colombo","London","Newyork","Tokyo","Soul","Rome","Mathale","Hatton","Kaluthara","Gampaha","Kegalle"]
    
    private var countryCities: [String: String] = ["Colombo":"Sri Lanka","London":"England","Newyork":"America","Tokyo":"Japan","Soul":"South Korea","Rome":"Italy","Mathale":"Sri Lanka","Hatton":"Sri Lanka","Kaluthara":"Sri Lanka","Gampaha":"Sri Lanka","Kegalle":"Sri Lanka"]
    
    struct Constants {
        static let cellIdentifier = "cityCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityTableView.register(UITableViewCell.self,
                               forCellReuseIdentifier: Constants.cellIdentifier)
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let cityName = cities[indexPath.row]
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = countryCities[cityName] ?? ""
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityName = cities[indexPath.row]
        let countryName = countryCities[cityName] ?? ""
        print("city = \(cityName), country = \(countryName)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
