//
//  MainViewController.swift
//  FirstJsonApp
//
//  Created by Andrey Machulin on 14.05.2023.
//

import UIKit

enum Link: String {
    case parisURL = "http://api.weatherapi.com/v1/current.json?key=4588851614d64e558cf225001231405&q=Paris&aqi=no"
    case moscowURL = "https://api.weatherapi.com/v1/current.json?key=4588851614d64e558cf225001231405&q=Moscow&aqi=no"
    case barcelonaURL = "https://api.weatherapi.com/v1/current.json?key=4588851614d64e558cf225001231405&q=Barcelona&aqi=yes"
    case londonURL = "http://api.weatherapi.com/v1/current.json?key=4588851614d64e558cf225001231405&q=London&aqi=no"
}

enum City: String, CaseIterable {
    case paris = "Paris"
    case moscow = "Moscow"
    case barcelona = "Barcelona"
    case london = "London"
}

class MainViewController: UICollectionViewController {
    
    let cities = City.allCases
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? UserActionCell
        else {
            return UICollectionViewCell()
        }
        cell.userActionLabel.text = cities[indexPath.item].rawValue
        
        let city = cities[indexPath.item]
        switch city {
        case .paris:
            let parisImage = UIImage(named: "paris")
            cell.backgroundView = UIImageView(image: parisImage)
        case .moscow:
            let moscowImage = UIImage(named: "moscow")
            cell.backgroundView = UIImageView(image: moscowImage)
        case .barcelona:
            let barcelonaImage = UIImage(named: "barcelona")
            cell.backgroundView = UIImageView(image: barcelonaImage)
        case .london:
            let londonImage = UIImage(named: "london")
            cell.backgroundView = UIImageView(image: londonImage)
        }
        
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCity = cities[indexPath.item]
        switch selectedCity {
        case .paris: fetchParis()
        case .moscow: fetchMoscow()
        case .barcelona: fetchBarcelona()
        case .london: fetchLondon()
        }
    }
    // MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    } 
}


// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 36, height: 100)
    }
    
}
// MARK: - Networing
extension MainViewController {
    private func fetchParis() {
        guard let url = URL(string: Link.parisURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let city = try JSONDecoder().decode(Weather.self, from: data)
                self?.successAlert()
                print(city)
            } catch let error {
                self?.failedAlert()
                print(error)
            }
            
            
        }.resume()
    }
    
    private func fetchMoscow() {
        guard let url = URL(string: Link.moscowURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let city = try JSONDecoder().decode(Weather.self, from: data)
                self?.successAlert()
                print(city)
            } catch let error {
                self?.failedAlert()
                print(error)
            }
            
            
        }.resume()
    }
    
    private func fetchBarcelona() {
        guard let url = URL(string: Link.barcelonaURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let city = try JSONDecoder().decode(Weather.self, from: data)
                self?.successAlert()
                print(city)
            } catch let error {
                self?.failedAlert()
                print(error)
            }
            
            
        }.resume()
    }
    
    private func fetchLondon() {
        guard let url = URL(string: Link.londonURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let city = try JSONDecoder().decode(Weather.self, from: data)
                self?.successAlert()
                print(city)
            } catch let error {
                self?.failedAlert()
                print(error)
            }
            
            
        }.resume()
    }
}
