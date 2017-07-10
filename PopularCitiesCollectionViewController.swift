//
//  PopularCitiesCollectionViewController.swift
//  Galaxy
//
//  Created by Garlic Technologies  on 2017/07/09.
//  Copyright © 2017 Garlic Technologies . All rights reserved.
//

import UIKit

class PopularCitiesCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    let popularCitiesLabel: UILabel = {
    
        let pcL = UILabel()
        pcL.translatesAutoresizingMaskIntoConstraints = false
        pcL.textColor = .white
        pcL.textAlignment = NSTextAlignment.center
        pcL.text = "Popular Cities"
        
        
        return pcL
    }()
    
    var cityNames: [String] = ["Home", "Johannesburg", "Cape Town", "Pretoria", "Tzaneen", "Polokwane", "Witbank", "Durban"]
    var backgroundImages: [String] = ["home-1", "joburg", "capetown", "pretoria", "tzaneen", "polokwane", "witbank", "durban"]
    
    let cellId = "cellId"
    
    let collection: UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cll = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cll.register(Cell.self, forCellWithReuseIdentifier: "cellId")
        cll.translatesAutoresizingMaskIntoConstraints = false
        
        return cll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        collection.delegate = self
        collection.dataSource = self
        
    }

    func setup(){
        
        view.backgroundColor = .black

        view.addSubview(popularCitiesLabel)
        view.addSubview(collection)
        
        popularCitiesLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        popularCitiesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        popularCitiesLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        popularCitiesLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
    
        collection.topAnchor.constraint(equalTo: popularCitiesLabel.bottomAnchor, constant: 15).isActive = true
        collection.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collection.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cityNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! Cell
    
        cell.cityName.text = cityNames[indexPath.row]
        
        cell.backgroundImage.image = UIImage(named: backgroundImages[indexPath.row])
        
        let urlToRequest = "http://api.apixu.com/v1/forecast.json?key=a69f6734b2d24b8e85f125353172006&q=\(cityNames[indexPath.row].replacingOccurrences(of: " ", with: "%20"))"
        
        let url = URL(string: urlToRequest)!
        
        let request = NSMutableURLRequest(url: url)
        
        services.makeRequest(request: request as URLRequest) {response in
            
            DispatchQueue.main.async{
                
                cell.tempLabel.text = "\(self.services.degree.description)° C"
                
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: view.frame.width - 30, height: 95)
        
        return size
        
    }
    
    var vC: ViewController!
    
    let services = Services()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath == [0, 0] {
        
            self.dismiss(animated: true, completion: nil)
        
        }else{
        
            
            let urlToRequest = "http://api.apixu.com/v1/forecast.json?key=a69f6734b2d24b8e85f125353172006&q=\(cityNames[indexPath.row].replacingOccurrences(of: " ", with: "%20"))"
            
            let url = URL(string: urlToRequest)!
            
            let request = NSMutableURLRequest(url: url)
            
            vC = ViewController()
            
            services.makeRequest(request: request as URLRequest) {response in
                
                DispatchQueue.main.async{
                    
                    self.vC.temperatureLabel.text = "\(self.services.degree.description)° C"
                    self.vC.sunriseTime.text = "\(self.services.sunrise.description)"
                    self.vC.secondTime.text = "\(self.services.sunset.description)"
                    self.vC.country.text = "\(self.services.country.description)"
                    self.vC.cityName.text = "\(self.services.city.description)"
                    
                }
            }
    
            vC.callPopUp = false
            
            let navi = UINavigationController(rootViewController: vC)
            
            present(navi, animated: true, completion: nil)
        
        }
        
    }
    
}
