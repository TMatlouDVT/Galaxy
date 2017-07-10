//
//  ViewController.swift
//  Galaxy
//
//  Created by Garlic Technologies  on 2017/07/08.
//  Copyright © 2017 Garlic Technologies . All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var callPopUp = true
    
    let button = UIButton.init(type: .custom)
    
    var favs: [Favorites] = []
    
    let LocationManager = CLLocationManager()
    var services: Services!
    
    let menu: UIButton = {
    

        let mn = UIButton()
        mn.translatesAutoresizingMaskIntoConstraints = false
        mn.backgroundColor = .clear
        let image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
        mn.setImage(image, for: UIControlState.normal)
        mn.tintColor = .white
        mn.addTarget(self, action: #selector(callSlideMenu), for: .touchUpInside)
        
        return mn
    }()
    
    
    let addToFavourites: UIButton = {
    
        let addtF = UIButton()
        addtF.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(named: "star")?.withRenderingMode(.alwaysTemplate)
        
        addtF.setImage(image, for: UIControlState.normal)
        addtF.tintColor = .white
        
        addtF.addTarget(self, action: #selector(addToFavs), for: .touchUpInside)
        
        return addtF
    }()
    
    let slideMenu: UIView = {
    
        let sm = UIView()
        sm.translatesAutoresizingMaskIntoConstraints = false
        sm.backgroundColor = .black
        sm.alpha = 0.8
        
        
        
        return sm
    }()
    
    let popularCities: UIButton = {
    
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.setTitle("Popular Cities", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.backgroundColor = .clear
        
        btn.addTarget(self, action: #selector(openPopularCities), for: .touchUpInside)
        
        return btn
    }()
    
    let dividerline: UIView = {
    
        let dL = UIView()
        dL.translatesAutoresizingMaskIntoConstraints = false
        dL.backgroundColor = .white
        
        
        return dL
    }()
    
    let customSearch: UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.setTitle("Custom Search", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.backgroundColor = .clear
        
        btn.addTarget(self, action: #selector(openBySearch), for: .touchUpInside)
        
        return btn
    }()
    
    let dividerlineS: UIView = {
        
        let dL = UIView()
        dL.translatesAutoresizingMaskIntoConstraints = false
        dL.backgroundColor = .white
        
        
        return dL
    }()

    
    let myFavourites: UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.setTitle("My Favourites", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.backgroundColor = .clear
        
        btn.addTarget(self, action: #selector(openFavourites), for: .touchUpInside)
        
        return btn
    }()
    
    let dividerlineT: UIView = {
        
        let dL = UIView()
        dL.translatesAutoresizingMaskIntoConstraints = false
        dL.backgroundColor = .white
        
        
        return dL
    }()
    
    
    let about: UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.setTitle("About", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.backgroundColor = .clear
        
        btn.addTarget(self, action: #selector(openInfo), for: .touchUpInside)
        
        return btn
    }()
    
    let dividerlineF: UIView = {
        
        let dL = UIView()
        dL.translatesAutoresizingMaskIntoConstraints = false
        dL.backgroundColor = .white
        
        
        return dL
    }()
    
    
    
    let slideMenuUpDown: UIView = {
        
        let sm = UIView()
        sm.translatesAutoresizingMaskIntoConstraints = false
        sm.backgroundColor = .orange
        sm.alpha = 0.6
        
        
        
        return sm
    }()
    
    
    let country: UILabel = {
    
        let ctry = UILabel()
        ctry.translatesAutoresizingMaskIntoConstraints = false
        ctry.textColor = .white
        ctry.text = "..."
        ctry.font = UIFont(name:"HelveticaNeue", size: 19.0)
        
        return ctry
    }()
    
    let cityName: UILabel = {
    
        let cN = UILabel()
        cN.translatesAutoresizingMaskIntoConstraints = false
        cN.textColor = .white
        cN.textAlignment = NSTextAlignment.center
        cN.text = "..."
        cN.font = UIFont(name:"HelveticaNeue", size: 17.0)
        
        return cN
    }()
    
    let temperatureLabel: UILabel = {
    
        let tL = UILabel()
        tL.translatesAutoresizingMaskIntoConstraints = false
        tL.textColor = .white
        tL.textAlignment = NSTextAlignment.center
        tL.text = "..."
        tL.font = UIFont(name:"HelveticaNeue", size: 17.0)
    
        return tL
    }()
    
    let sun: UIImageView = {
    
        let sn = UIImageView()
        sn.translatesAutoresizingMaskIntoConstraints = false
        sn.image = UIImage(named: "sunclouds")?.withRenderingMode(.alwaysTemplate)
        sn.tintColor = .white
        
        return sn
    }()
    
    let sunriseTime: UILabel = {
        
        let tL = UILabel()
        tL.translatesAutoresizingMaskIntoConstraints = false
        tL.textColor = .white
        tL.textAlignment = NSTextAlignment.center
        tL.text = "... "
        tL.font = UIFont(name:"HelveticaNeue", size: 17.0)
        
        return tL
    }()
    
    
    let lineUnderSun: UIView = {
    
        let lus = UIView()
        lus.translatesAutoresizingMaskIntoConstraints = false
        lus.backgroundColor = .white
        
        
        return lus
    }()
    
    let sunWithClouds: UIImageView = {
        
        let sn = UIImageView()
        sn.translatesAutoresizingMaskIntoConstraints = false
        sn.image = UIImage(named: "sunCloudRain")?.withRenderingMode(.alwaysTemplate)
        sn.tintColor = .white
        
        return sn
    }()
    
    let more: UIButton = {
    
        let mre = UIButton()
        mre.translatesAutoresizingMaskIntoConstraints = false
        
        mre.setTitle("More", for: UIControlState.normal)
        mre.setTitleColor(UIColor.white, for: UIControlState.normal)
        mre.addTarget(self, action: #selector(openMoreController), for: .touchUpInside)
        
        return mre
    }()
    
    let moreLine: UIView = {
    
        let mL = UIView()
        mL.translatesAutoresizingMaskIntoConstraints = false
        mL.backgroundColor = .white
        
        return mL
    }()
    
    let firstTime: UILabel = {
        
        let tL = UILabel()
        tL.translatesAutoresizingMaskIntoConstraints = false
        tL.textColor = .white
        tL.textAlignment = NSTextAlignment.center
        tL.text = "..."
        
        return tL
    }()

    
    let lineUnderSunWithClouds: UIView = {
        
        let lus = UIView()
        lus.translatesAutoresizingMaskIntoConstraints = false
        lus.backgroundColor = .white
        
        
        return lus
    }()
    
    let sunset: UIImageView = {
        
        let sn = UIImageView()
        sn.translatesAutoresizingMaskIntoConstraints = false
        sn.image = UIImage(named: "sunset-1")?.withRenderingMode(.alwaysTemplate)
        sn.tintColor = .white
        
        return sn
    }()
    
    let secondTime: UILabel = {
        
        let tL = UILabel()
        tL.translatesAutoresizingMaskIntoConstraints = false
        tL.textColor = .white
        tL.textAlignment = NSTextAlignment.center
        tL.text = "..."
        
        return tL
    }()
    
    
    let lineUnderSunset: UIView = {
        
        let lus = UIView()
        lus.translatesAutoresizingMaskIntoConstraints = false
        lus.backgroundColor = .white
        
        
        return lus
    }()
    
    let home: UIImageView = {
    
        let hme = UIImageView()
        hme.translatesAutoresizingMaskIntoConstraints = false
        hme.image = UIImage(named: "home")
        
        return hme
    }()
    
    let rainbow: UIImageView = {
        
        let rbw = UIImageView()
        rbw.translatesAutoresizingMaskIntoConstraints = false
        rbw.image = UIImage(named: "rainbow")
        
        return rbw
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        services = Services()
        
        LocationManager.requestAlwaysAuthorization()
        LocationManager.requestWhenInUseAuthorization()
        
        setup()
        popUp()
        getCurrentTime()
        
    }
    
    
    var topAnchor: NSLayoutConstraint?
    var rightAnchor: NSLayoutConstraint?

    func setup(){
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        UIImage(named: "firewatchMount")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        view.addSubview(menu)
        view.addSubview(addToFavourites)
        view.addSubview(country)
        view.addSubview(cityName)
        view.addSubview(temperatureLabel)
        view.addSubview(sun)
        view.addSubview(sunriseTime)
        view.addSubview(lineUnderSun)
        view.addSubview(sunWithClouds)
        view.addSubview(more)
        view.addSubview(moreLine)
        view.addSubview(firstTime)
        view.addSubview(lineUnderSunWithClouds)
        view.addSubview(sunset)
        view.addSubview(secondTime)
        view.addSubview(lineUnderSunset)
        view.addSubview(home)
        view.addSubview(rainbow)
        view.addSubview(slideMenuUpDown)
        view.addSubview(slideMenu)
        
        slideMenu.addSubview(popularCities)
        slideMenu.addSubview(dividerline)
        slideMenu.addSubview(customSearch)
        slideMenu.addSubview(dividerlineS)
        slideMenu.addSubview(myFavourites)
        slideMenu.addSubview(dividerlineT)
        slideMenu.addSubview(about)
        slideMenu.addSubview(dividerlineF)
        
        //let myAdd = UIImage(named: "add")?.withRenderingMode(.alwaysTemplate)
        
        
        button.setImage(UIImage.init(named: "menu")?.withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        
        button.tintColor = .white
        
        button.addTarget(self, action:#selector(callSlideMenu), for: UIControlEvents.touchUpInside)
        
        button.frame = CGRect.init(x: 0, y: 0, width: 35, height: 35) //CGRectMake(0, 0, 30, 30)
        
        let barButton = UIBarButtonItem.init(customView: button)
        
        self.navigationItem.leftBarButtonItem = barButton
        self.navigationItem.title = "Home"
        
        menu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        menu.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        menu.heightAnchor.constraint(equalToConstant: 25).isActive = true
        menu.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addToFavourites.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        addToFavourites.centerYAnchor.constraint(equalTo: country.centerYAnchor).isActive = true
        addToFavourites.heightAnchor.constraint(equalToConstant: 25).isActive = true
        addToFavourites.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        country.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
        country.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        country.heightAnchor.constraint(equalToConstant: 75).isActive = true
        country.widthAnchor.constraint(equalToConstant: 225).isActive = true
        
        cityName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 45).isActive = true
        cityName.topAnchor.constraint(equalTo: view.topAnchor, constant: 115).isActive = true
        cityName.heightAnchor.constraint(equalToConstant: 75).isActive = true
        cityName.leftAnchor.constraint(equalTo: sun.rightAnchor).isActive = true
        
        temperatureLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        temperatureLabel.topAnchor.constraint(equalTo: cityName.bottomAnchor).isActive = true
        temperatureLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        sun.topAnchor.constraint(equalTo: view.topAnchor, constant: 115).isActive = true
        sun.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 95).isActive = true
        sun.heightAnchor.constraint(equalToConstant: 75).isActive = true
        sun.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        sunriseTime.rightAnchor.constraint(equalTo: sun.leftAnchor).isActive = true
        sunriseTime.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sunriseTime.heightAnchor.constraint(equalToConstant: 35).isActive = true
        sunriseTime.centerYAnchor.constraint(equalTo: sun.centerYAnchor).isActive = true
        
        lineUnderSun.centerXAnchor.constraint(equalTo: sun.centerXAnchor).isActive = true
        lineUnderSun.topAnchor.constraint(equalTo: sun.bottomAnchor, constant: -35).isActive = true
        lineUnderSun.heightAnchor.constraint(equalToConstant: 135).isActive = true
        lineUnderSun.widthAnchor.constraint(equalToConstant: 3).isActive = true
        
        sunWithClouds.topAnchor.constraint(equalTo: lineUnderSun.bottomAnchor, constant: -35).isActive = true
        sunWithClouds.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 95).isActive = true
        sunWithClouds.heightAnchor.constraint(equalToConstant: 75).isActive = true
        sunWithClouds.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        more.centerYAnchor.constraint(equalTo: sunWithClouds.centerYAnchor).isActive = true
        more.widthAnchor.constraint(equalToConstant: 75).isActive = true
        more.heightAnchor.constraint(equalToConstant: 35).isActive = true
        more.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        moreLine.leftAnchor.constraint(equalTo: more.leftAnchor).isActive = true
        moreLine.rightAnchor.constraint(equalTo: more.rightAnchor).isActive = true
        moreLine.topAnchor.constraint(equalTo: more.bottomAnchor, constant: 1).isActive = true
        moreLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        firstTime.rightAnchor.constraint(equalTo: sunWithClouds.leftAnchor).isActive = true
        firstTime.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        firstTime.heightAnchor.constraint(equalToConstant: 35).isActive = true
        firstTime.centerYAnchor.constraint(equalTo: sunWithClouds.centerYAnchor).isActive = true
        
        lineUnderSunWithClouds.centerXAnchor.constraint(equalTo: sunWithClouds.centerXAnchor).isActive = true
        lineUnderSunWithClouds.topAnchor.constraint(equalTo: sunWithClouds.bottomAnchor, constant: -35).isActive = true
        lineUnderSunWithClouds.heightAnchor.constraint(equalToConstant: 135).isActive = true
        lineUnderSunWithClouds.widthAnchor.constraint(equalToConstant: 3).isActive = true

        sunset.topAnchor.constraint(equalTo: lineUnderSunWithClouds.bottomAnchor, constant: -35).isActive = true
        sunset.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 95).isActive = true
        sunset.heightAnchor.constraint(equalToConstant: 75).isActive = true
        sunset.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        secondTime.rightAnchor.constraint(equalTo: sunset.leftAnchor).isActive = true
        secondTime.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        secondTime.heightAnchor.constraint(equalToConstant: 35).isActive = true
        secondTime.centerYAnchor.constraint(equalTo: sunset.centerYAnchor).isActive = true
        
        lineUnderSunset.centerXAnchor.constraint(equalTo: sun.centerXAnchor).isActive = true
        lineUnderSunset.topAnchor.constraint(equalTo: sunset.bottomAnchor, constant: -35).isActive = true
        lineUnderSunset.heightAnchor.constraint(equalToConstant: 135).isActive = true
        lineUnderSunset.widthAnchor.constraint(equalToConstant: 3).isActive = true
        
        home.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        home.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        home.widthAnchor.constraint(equalToConstant: 45).isActive = true
        home.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        rainbow.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        rainbow.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rainbow.heightAnchor.constraint(equalToConstant: 45).isActive = true
        rainbow.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        slideMenuUpDown.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        slideMenuUpDown.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        slideMenuUpDown.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        topAnchor = slideMenuUpDown.topAnchor.constraint(equalTo: view.bottomAnchor)
        topAnchor?.isActive = true
        
        slideMenu.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: 5).isActive = true
        slideMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        slideMenu.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        rightAnchor = slideMenu.rightAnchor.constraint(equalTo: view.leftAnchor)
        rightAnchor?.isActive = true
        
        popularCities.rightAnchor.constraint(equalTo: slideMenu.rightAnchor, constant: -5).isActive = true
        popularCities.topAnchor.constraint(equalTo: slideMenu.topAnchor, constant: 15).isActive = true
        popularCities.heightAnchor.constraint(equalToConstant: 35).isActive = true
        popularCities.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        dividerline.leftAnchor.constraint(equalTo: slideMenu.leftAnchor, constant: 5).isActive = true
        dividerline.rightAnchor.constraint(equalTo: slideMenu.rightAnchor, constant: -5).isActive = true
        dividerline.topAnchor.constraint(equalTo: popularCities.bottomAnchor).isActive = true
        dividerline.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        customSearch.rightAnchor.constraint(equalTo: slideMenu.rightAnchor, constant: -5).isActive = true
        customSearch.topAnchor.constraint(equalTo: popularCities.bottomAnchor, constant: 15).isActive = true
        customSearch.heightAnchor.constraint(equalToConstant: 35).isActive = true
        customSearch.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        dividerlineS.leftAnchor.constraint(equalTo: slideMenu.leftAnchor, constant: 5).isActive = true
        dividerlineS.rightAnchor.constraint(equalTo: slideMenu.rightAnchor, constant: -5).isActive = true
        dividerlineS.topAnchor.constraint(equalTo: customSearch.bottomAnchor).isActive = true
        dividerlineS.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        myFavourites.rightAnchor.constraint(equalTo: slideMenu.rightAnchor, constant: -5).isActive = true
        myFavourites.topAnchor.constraint(equalTo: customSearch.bottomAnchor, constant: 15).isActive = true
        myFavourites.heightAnchor.constraint(equalToConstant: 35).isActive = true
        myFavourites.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        dividerlineT.leftAnchor.constraint(equalTo: slideMenu.leftAnchor, constant: 5).isActive = true
        dividerlineT.rightAnchor.constraint(equalTo: slideMenu.rightAnchor, constant: -5).isActive = true
        dividerlineT.topAnchor.constraint(equalTo: myFavourites.bottomAnchor).isActive = true
        dividerlineT.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        about.rightAnchor.constraint(equalTo: slideMenu.rightAnchor, constant: -5).isActive = true
        about.topAnchor.constraint(equalTo: myFavourites.bottomAnchor, constant: 15).isActive = true
        about.heightAnchor.constraint(equalToConstant: 35).isActive = true
        about.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        dividerlineF.leftAnchor.constraint(equalTo: slideMenu.leftAnchor, constant: 5).isActive = true
        dividerlineF.rightAnchor.constraint(equalTo: slideMenu.rightAnchor, constant: -5).isActive = true
        dividerlineF.topAnchor.constraint(equalTo: about.bottomAnchor).isActive = true
        dividerlineF.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func getCurrentTime(){
    
    
    
        let date = Date()
        let calender = Calendar.current
        
        let hour = calender.component(.hour, from: date)
        let minutes = calender.component(.minute, from: date)
        
        firstTime.text = "\(hour):\(minutes)"
    
    }
    
    func popUp(){
        
        if callPopUp == true {
        
        
            let alert = UIAlertController(title: "Hi There!", message: "The app only functions at its best whether you are interested in knowing todays weather condition or not, so enjoy!!! : )", preferredStyle: .alert)
        
        
            alert.addAction(UIAlertAction(title: "Will do !", style: .default, handler: self.callLocation))
        
        
            self.present(alert, animated: true, completion: nil)
        
        }
        
    }
    
    func callLocation(alert: UIAlertAction!){
    
    
        if CLLocationManager.locationServicesEnabled() {
            
            LocationManager.delegate = self
            LocationManager.desiredAccuracy = kCLLocationAccuracyBest
            LocationManager.startUpdatingLocation()
            
        }
        
    
    }
    
    var gotCityName = false
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            
            
            let geocoder = CLGeocoder()
            
            let location = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            
            
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                
                
                if self.gotCityName == false {
                
                
                if error != nil {
                    
                    
                    let alert = UIAlertController(title: "Location error!", message: "We run into a problem while trying to access your location. Try searching the name of your city or make sure that your connected to the internet :) !", preferredStyle: .alert)
                    
                    
                    
                    alert.addAction(UIAlertAction(title: "Will do!", style: .default, handler: nil))
                    
                    
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    self.gotCityName = false
                    
                }else{
                    
                
                    
                    if let pmark = placemarks?.first {
                        
                        
                        print(pmark.addressDictionary?["City"] ?? "No value was found")
                        
                        let cityV = pmark.addressDictionary?["City"]
                        let countryV = pmark.addressDictionary?["Country"]
                        
                        self.cityName.text = cityV as! String
                        self.country.text = countryV as! String
                        
                        let urlToRequest = "http://api.apixu.com/v1/forecast.json?key=a69f6734b2d24b8e85f125353172006&q=\(self.cityName.text!.replacingOccurrences(of: " ", with: "%20"))"
                        
                        let url = URL(string: urlToRequest)!
                        
                        let request = NSMutableURLRequest(url: url)
                        
                        self.services.makeRequest(request: request as URLRequest) {response in
                            
                            DispatchQueue.main.async{
                               
                                self.temperatureLabel.text = "\(self.services.degree.description)° C"
                                self.sunriseTime.text = "\(self.services.sunrise.description)"
                                self.secondTime.text = "\(self.services.sunset.description)"
                                self.country.text = "\(self.services.country.description)"
                                self.cityName.text = "\(self.services.city.description)"
                                
                            }
                        }
                        
                        self.gotCityName = true
                        manager.stopUpdatingLocation()
                        
                    }
                    
                }
                
            }
            }
        }
        
    }
    
    
    var slideMenuWasCalled = false
    
    func slides(){
    
        if slideMenuWasCalled == false {
            
            topAnchor?.isActive = false
            topAnchor?.constant = -slideMenu.frame.height
            topAnchor?.isActive = true
            
            rightAnchor?.isActive = false
            rightAnchor?.constant = view.frame.width / 2
            rightAnchor?.isActive = true
            
            UIView.animate(withDuration: 0.9) {
                
                self.view.layoutIfNeeded()
                
            }
            
            slideMenuWasCalled = true
            
            button.setImage(UIImage.init(named: "right")?.withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
            
            button.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            
        }else {
            
            topAnchor?.isActive = false
            topAnchor?.constant = 0
            topAnchor?.isActive = true
            
            rightAnchor?.isActive = false
            rightAnchor?.constant = 0
            rightAnchor?.isActive = true
            
            UIView.animate(withDuration: 0.9, animations: {
                
                self.view.layoutIfNeeded()
                
            })
            
            slideMenuWasCalled = false
            button.setImage(UIImage.init(named: "menu")?.withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
            
            button.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi) * -2)
            
        }
    
    }
    
    func callSlideMenu (){
    
        slides()
        
    }
    
    func openPopularCities(){
    
        let popularC = PopularCitiesCollectionViewController()
        
        present(popularC, animated: true, completion: nil)
        
       slides()
    
    }
    
    var accText = UITextField()
    
    func openBySearch(){
        
        let alert = UIAlertController(title: "City Name:", message: "Please enter the name of the city you want to get weather info from.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Search", style: .default, handler: self.okHandler))
        alert.addTextField(configurationHandler: accTextH)
        
        self.present(alert, animated: true, completion: nil)
        slides()
    }
    
    func accTextH(textField: UITextField!){
        
        accText = textField
        accText.placeholder = "City Name"
        
    }
    
    func okHandler(alert: UIAlertAction!){
        
        print("Ok pressed")
        
        if accText.text != nil {
            
            let urlToRequest = "http://api.apixu.com/v1/forecast.json?key=a69f6734b2d24b8e85f125353172006&q=\(accText.text!.replacingOccurrences(of: " ", with: "%20"))"
            
            let url = URL(string: urlToRequest)!
            
            let request = NSMutableURLRequest(url: url)
            
            services.makeRequest(request: request as URLRequest) {response in
                
                DispatchQueue.main.async{
            
                    self.temperatureLabel.text = "\(self.services.degree.description)° C"
                    self.sunriseTime.text = "\(self.services.sunrise.description)"
                    self.secondTime.text = "\(self.services.sunset.description)"
                    self.country.text = "\(self.services.country.description)"
                    self.cityName.text = "\(self.services.city.description)"
                    
                }
            }
            
        }
        
    }
    
    func openFavourites(){
    
        let favourites = FavouritesTableViewController()
        
        navigationController?.pushViewController(favourites, animated: true)
    
        slides()
    }
    
    var isThere = false
    
    func addToFavs(){
        
        getData()
        
        if favs != [] {
            
            let cnt = favs.count
            
            for i in 0 ..< cnt {
                
                if (favs[i].cityNames?.contains(cityName.text!))!{
                    
                    let alert = UIAlertController(title: "!!!", message: "City already added to favourites!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    
                    present(alert, animated: true, completion: nil)
                    
                    isThere = true
                    
                }
            }
            
            if isThere == false {
                
                saveItem(item: cityName.text!)
                
                let alert = UIAlertController(title: "Success!", message: "City successfuly added to favourites!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
            }
            
        }else {
            
            saveItem(item: cityName.text!)
            
            let alert = UIAlertController(title: "Success!", message: "City successfuly added to favourites!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func getData(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            
            favs = try context.fetch(Favorites.fetchRequest())
            
        }catch {
            
            print("Fetching failed")
            
        }
        
    }
    
    
    func saveItem(item: String){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let favs = Favorites(context: context)
        
        favs.cityNames = item
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    func openInfo(){
        
        let info = InfoViewController()
        
        
        present(info, animated: true, completion: nil)
        
        slides()
    }
    
    func openMoreController(){
    
    
        let mre = MoreViewController()
        mre.callMore(city: cityName.text!)
        
        navigationController?.pushViewController(mre, animated: true)

    }
    
}

