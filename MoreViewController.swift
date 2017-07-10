//
//  MoreViewController.swift
//  Galaxy
//
//  Created by Garlic Technologies  on 2017/07/09.
//  Copyright © 2017 Garlic Technologies . All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    let services = Services()
    
    public func callMore(city name: String){
    
    
        
        
        let urlToRequest = "http://api.apixu.com/v1/forecast.json?key=a69f6734b2d24b8e85f125353172006&q=\(name.replacingOccurrences(of: " ", with: "%20"))"
        
        let url = URL(string: urlToRequest)!
        
        let request = NSMutableURLRequest(url: url)
        
        services.makeRequest(request: request as URLRequest) {response in
            
            DispatchQueue.main.async{
                
                /*let st = Station()
                 
                 st.getCityName(city: self.accText.text!)
                 
                 self.present(st, animated: true, completion: nil)*/
                
                self.temperatureLabel.text = "\(self.services.degree.description)° C"
                self.windyV.text = "\(self.services.windSpeed.description) kph"
                self.pressureV.text = "\(self.services.pressure.description) "
                self.rainV.text = "\(self.services.precipitationH.description) %"
                self.country.text = "\(self.services.country.description)"
                self.cityName.text = "\(self.services.city.description)"
                
            }
        }
        
        
    
    }
    
    
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
    
    let currentTime: UILabel = {
    
        let cT = UILabel()
        cT.translatesAutoresizingMaskIntoConstraints = false
        cT.textColor = .white
        cT.textAlignment = NSTextAlignment.center
        
        return cT
    }()
    
    let firstView: UIView = {
    
        let fV = UIView()
        fV.translatesAutoresizingMaskIntoConstraints = false
        fV.backgroundColor = .red
        fV.layer.cornerRadius = 8
        fV.alpha = 0.5
        
        return fV
    }()
    
    let secondView: UIView = {
    
        let sV = UIView()
        sV.translatesAutoresizingMaskIntoConstraints = false
        sV.backgroundColor = .orange
        sV.layer.cornerRadius = 8
        sV.alpha = 0.5
        
        return sV
    }()
    
    let thirdView: UIView = {
    
        let tV = UIView()
        tV.translatesAutoresizingMaskIntoConstraints = false
        tV.backgroundColor = .purple
        tV.layer.cornerRadius = 8
        tV.alpha = 0.5
        
        return tV
    }()
    
    let windy: UIImageView = {
    
        let wndy = UIImageView()
        wndy.translatesAutoresizingMaskIntoConstraints = false
        wndy.image = UIImage(named: "windy")?.withRenderingMode(.alwaysTemplate)
        wndy.tintColor = .white
        wndy.alpha = 1
        
        return wndy
    
    }()
    
    let pressure: UIImageView = {
        
        let prss = UIImageView()
        prss.translatesAutoresizingMaskIntoConstraints = false
        prss.image = UIImage(named: "pressure")?.withRenderingMode(.alwaysTemplate)
        prss.tintColor = .white
        prss.alpha = 1
        
        return prss
        
    }()
    
    let rain: UIImageView = {
        
        let rn = UIImageView()
        rn.translatesAutoresizingMaskIntoConstraints = false
        rn.image = UIImage(named: "precipitation")?.withRenderingMode(.alwaysTemplate)
        rn.tintColor = .white
        rn.alpha = 1
        
        return rn
        
    }()
    
    let windyL: UILabel = {
    
    
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.text = "Wind"
        label.backgroundColor = .red
        
        
        return label
    }()
    
    let pressureL: UILabel = {
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.text = "Pressure"
        label.backgroundColor = .orange
        
        
        return label
    }()

    let rainL: UILabel = {
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.text = "Humidity"
        label.backgroundColor = .purple
        
        return label
    }()
    
    let windyV: UILabel = {
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.text = "1080 kPa"
        
        
        return label
    }()
    
    let pressureV: UILabel = {
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.text = "174 lbs"
        
        
        return label
    }()
    
    let rainV: UILabel = {
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.text = "33 %"
        
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setup()
        getCurrentTime()
        
    }

    func setup(){
    
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        UIImage(named: "sunset")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        view.addSubview(country)
        view.addSubview(cityName)
        view.addSubview(temperatureLabel)
        view.addSubview(firstView)
        view.addSubview(windy)
        view.addSubview(thirdView)
        view.addSubview(rain)
        view.addSubview(secondView)
        view.addSubview(pressure)
        view.addSubview(currentTime)
        view.addSubview(windyL)
        view.addSubview(pressureL)
        view.addSubview(rainL)
        view.addSubview(windyV)
        view.addSubview(pressureV)
        view.addSubview(rainV)
        
        country.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
        country.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        country.heightAnchor.constraint(equalToConstant: 75).isActive = true
        country.widthAnchor.constraint(equalToConstant: 225).isActive = true
        
        cityName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        cityName.topAnchor.constraint(equalTo: view.topAnchor, constant: 115).isActive = true
        cityName.heightAnchor.constraint(equalToConstant: 75).isActive = true
        cityName.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        
        temperatureLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        temperatureLabel.topAnchor.constraint(equalTo: cityName.bottomAnchor).isActive = true
        temperatureLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        firstView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: view.frame.height / 2 - 55).isActive = true
        firstView.widthAnchor.constraint(equalToConstant: view.frame.width / 3 - 10).isActive = true
        
        thirdView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        thirdView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        thirdView.heightAnchor.constraint(equalToConstant: view.frame.height
         / 2 - 55).isActive = true
        thirdView.widthAnchor.constraint(equalToConstant: view.frame.width / 3 - 10).isActive = true
        
        secondView.leftAnchor.constraint(equalTo: firstView.rightAnchor, constant: 5).isActive = true
        secondView.rightAnchor.constraint(equalTo: thirdView.leftAnchor, constant: -5).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: view.frame.height / 2 - 55).isActive = true
        secondView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        
        currentTime.bottomAnchor.constraint(equalTo: secondView.topAnchor, constant: -1).isActive = true
        currentTime.leftAnchor.constraint(equalTo: secondView.leftAnchor).isActive = true
        currentTime.rightAnchor.constraint(equalTo: secondView.rightAnchor).isActive = true
        currentTime.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        windy.centerXAnchor.constraint(equalTo: firstView.centerXAnchor).isActive = true
        windy.topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
        windy.heightAnchor.constraint(equalToConstant: 95).isActive = true
        windy.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        pressure.centerXAnchor.constraint(equalTo: secondView.centerXAnchor).isActive = true
        pressure.topAnchor.constraint(equalTo: secondView.topAnchor).isActive = true
        pressure.heightAnchor.constraint(equalToConstant: 95).isActive = true
        pressure.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        rain.centerXAnchor.constraint(equalTo: thirdView.centerXAnchor).isActive = true
        rain.topAnchor.constraint(equalTo: thirdView.topAnchor).isActive = true
        rain.heightAnchor.constraint(equalToConstant: 95).isActive = true
        rain.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        windyL.centerXAnchor.constraint(equalTo: firstView.centerXAnchor).isActive = true
        windyL.bottomAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
        windyL.heightAnchor.constraint(equalToConstant: 95).isActive = true
        windyL.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        pressureL.centerXAnchor.constraint(equalTo: secondView.centerXAnchor).isActive = true
        pressureL.bottomAnchor.constraint(equalTo: secondView.bottomAnchor).isActive = true
        pressureL.heightAnchor.constraint(equalToConstant: 95).isActive = true
        pressureL.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        rainL.centerXAnchor.constraint(equalTo: thirdView.centerXAnchor).isActive = true
        rainL.bottomAnchor.constraint(equalTo: thirdView.bottomAnchor).isActive = true
        rainL.heightAnchor.constraint(equalToConstant: 95).isActive = true
        rainL.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        windyV.centerXAnchor.constraint(equalTo: firstView.centerXAnchor).isActive = true
        windyV.bottomAnchor.constraint(equalTo: windyL.topAnchor).isActive = true
        windyV.topAnchor.constraint(equalTo: windy.bottomAnchor).isActive = true
        windyV.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        pressureV.centerXAnchor.constraint(equalTo: secondView.centerXAnchor).isActive = true
        pressureV.bottomAnchor.constraint(equalTo: pressureL.topAnchor).isActive = true
        pressureV.topAnchor.constraint(equalTo: pressure.bottomAnchor).isActive = true
        pressureV.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        rainV.centerXAnchor.constraint(equalTo: thirdView.centerXAnchor).isActive = true
        rainV.bottomAnchor.constraint(equalTo: rainL.topAnchor).isActive = true
        rainV.topAnchor.constraint(equalTo: rain.bottomAnchor).isActive = true
        rainV.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
    }

    func getCurrentTime(){
        
        let date = Date()
        let calender = Calendar.current
        
        let hour = calender.component(.hour, from: date)
        let minutes = calender.component(.minute, from: date)
        
        currentTime.text = "\(hour):\(minutes)"
        
    }

}
