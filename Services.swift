//
//  Services.swift
//  Galaxy
//
//  Created by Garlic Technologies  on 2017/07/09.
//  Copyright © 2017 Garlic Technologies . All rights reserved.
//


import UIKit

class Services: NSObject {
    
    var degree: Double!
    var pressure: Double!
    var windDirection: String!
    var windSpeed: Double!
    var precipitationH: Double!
    var sunrise: String!
    var sunset: String!
    
    var country: String!
    var city: String!
    
    var mod: Model!
    
    override init(){
        super.init()
        
        mod = Model()
        
    }
    
    public func makeRequest(request: URLRequest, completion: @escaping (String)->Void) {
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data, error == nil else{
                print(error ?? "Unkown error occured")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                //print(response ?? "No response")
            }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : AnyObject]
                
                if let location = json["location"] as? [String: AnyObject] {
                
                    if let name = location["name"] {
                    
                        self.city = name as! String
                    
                    }
                    
                    if let cntry = location["country"] {
                    
                        self.country = cntry as! String
                    
                    }
                
                }
                
                if let current = json["current"] as? [String : AnyObject] {
                    
                    if let temp = current["temp_c"] {
                        
                        print(temp)
                        
                        self.degree = temp as! Double
                        
                    }
                    
                    if let press = current["pressure_in"]{
                        
                        self.pressure = press as! Double
                        
                    }
                    
                    if let windD = current["wind_dir"]{
                        
                        self.windDirection = windD as! String
                        
                    }
                    
                    if let windS = current["wind_kph"]{
                        
                        self.windSpeed = windS as! Double
                        
                    }
                    
                    if let precip = current["precip_mm"] {
                        
                        self.precipitationH = precip as! Double
                        
                    }
        
                }
                
                 if let astro = json["forecast"] as? [String: AnyObject] {
                 
                    if let forecastday = astro["forecastday"] {
                        
                        if let astr = forecastday[0] as? [String: AnyObject] {
                            
                            if let check = astr["astro"] as? [String: AnyObject]{
            
                                if let sunr = check["sunrise"] {
                                
                                    self.sunrise = sunr as! String
                                
                                }
                                
                                if let suns = check["sunset"] {
                                
                                    self.sunset = suns as! String
                                
                                }
                            
                            }
                        }
        
                    }
                 
                 }
                
            } catch {
                
            }
            
            let responseString = String(data: data, encoding: .utf8) ?? ""
            completion(responseString)
        }
        task.resume()
    }
    
    
}
