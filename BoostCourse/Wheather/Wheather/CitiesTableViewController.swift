//
//  CitiesTableViewController.swift
//  Wheather
//
//  Created by rhino Q on 2018. 5. 12..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {
    
    var selectedCountryAssetName:String?
    private var cities:[City] = []
    private let cellIdentifier = "City"
    
    @IBOutlet var citiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCities()
        
    }
    
    private func initCities() {
        let jsonDecoder = JSONDecoder()
        guard let unwrappedSeletedCountryAssetName = selectedCountryAssetName, let dataAsset = NSDataAsset(name: unwrappedSeletedCountryAssetName) else {
            return
        }

        do {
            cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        } catch {
            print("error")
            print(error.localizedDescription)
        }
        
        citiesTableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CityTableViewCell
        let city = cities[indexPath.row]
        cell.wheatherImage.image = city.wheatherImage
        cell.cityNameLbl.text = city.cityName
        cell.celsiusAndFahrenheitLbl.text = city.celsiusAndFahrenheit
        cell.rainProbabilityLbl.text = city.rainProbabilityFullName
        cell.nameOfCityWheather = city.wheaterName
        return cell
    }
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController = segue.destination as? DetailViewController else {
            return
        }
        
        guard let cell = sender as? CityTableViewCell else {
            return
        }
        
        nextViewController.navigationItem.title = cell.cityNameLbl.text
        nextViewController.selectedCityWeatherImage = cell.wheatherImage.image
        nextViewController.selectedCityWeatherName = cell.nameOfCityWheather
        nextViewController.selectedCityCelsiusAndFahrenheit = cell.celsiusAndFahrenheitLbl.text
        nextViewController.selectedCitiyRainProbability = cell.rainProbabilityLbl.text
    }

}
