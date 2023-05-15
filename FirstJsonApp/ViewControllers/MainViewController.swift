//
//  MainViewController.swift
//  FirstJsonApp
//
//  Created by Andrey Machulin on 14.05.2023.
//

import UIKit

enum Link: String {
    case newYorkURL = "https://api.weatherapi.com/v1/current.json?key=4588851614d64e558cf225001231405&q=New York&aqi=no"
    case moscowURL = "https://api.weatherapi.com/v1/current.json?key=4588851614d64e558cf225001231405&q=Moscow&aqi=no"
    case barcelonaURL = "https://api.weatherapi.com/v1/current.json?key=4588851614d64e558cf225001231405&q=Barcelona&aqi=yes"
}

enum City: String, CaseIterable {
    case newYork = "New York"
    case moscow = "Moscow"
    case barcelona = "Barcelona"
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
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCity = cities[indexPath.item]
        switch selectedCity {
        case .newYork: fetchNewYork()
        case .moscow: fetchMoscow()
        case .barcelona: fetchBarcelona()
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

extension MainViewController {
    private func fetchNewYork() {
        guard let url = URL(string: Link.newYorkURL.rawValue) else { return }
        
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
}
