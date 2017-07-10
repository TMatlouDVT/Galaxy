

import UIKit

class InfoViewController: UIViewController {

    let info: UILabel = {
    
    let i = UILabel()
    i.translatesAutoresizingMaskIntoConstraints = false
    i.textColor = .white
        i.textAlignment = NSTextAlignment.center
    i.numberOfLines = 5
    i.text = "Galaxy is an app that gets wheather information by city or country name. The API is from APIXU, it can be configured to be viewed in current or forecast, the app is currently operating under forecast mode."
    
    return i
    
    }()
    
    let home: UIButton = {
        
        let hme = UIButton()
        hme.translatesAutoresizingMaskIntoConstraints = false
        let homie = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        hme.setImage(homie, for: UIControlState.normal)
        hme.tintColor = .white
        hme.addTarget(self, action: #selector(openHome), for: .touchUpInside)
        hme.backgroundColor = .clear
        
        return hme
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    
    }
    
    func setup(){
    
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        UIImage(named: "Passion")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        view.addSubview(home)
        view.addSubview(info)
        
        home.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        home.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        home.heightAnchor.constraint(equalToConstant: 45).isActive = true
        home.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        info.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        info.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        info.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        info.heightAnchor.constraint(equalToConstant: 455).isActive = true
    }
    
    func openHome(){
        
        self.dismiss(animated: true, completion: nil)
        
    }    

}
