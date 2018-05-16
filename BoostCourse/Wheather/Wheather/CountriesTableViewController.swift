//
//  CountryTableViewController.swift
//  Wheather
//
//  Created by rhino Q on 2018. 5. 11..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    private let cellIdentifier = "Country"
    private var countries:[Country] = []
    
    @IBOutlet var contriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCountries()
    }
    
    private func initCountries() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        contriesTableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CountryTableViewCell
        
        let country = countries[indexPath.row]
        cell.countryAssetName = country.assetName
        cell.flag.image = UIImage(named: "flag_\(country.assetName)")
        cell.countryName.text = country.koreanName
        return cell
    }
    
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController = segue.destination as? CitiesTableViewController else {
            return
        }
        
        guard let cell = sender as? CountryTableViewCell else {
            return
        }
        
        nextViewController.navigationItem.title = cell.countryName.text
        nextViewController.selectedCountryAssetName = cell.countryAssetName
     }
}
