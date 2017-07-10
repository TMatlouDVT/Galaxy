
import UIKit

class FavouritesTableViewController: UITableViewController {

    var favs: [Favorites] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    
        tableView.register(FavouritesCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.register(TheHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        tableView.sectionHeaderHeight = 55
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
    }
    
    func getData(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            
            favs = try context.fetch(Favorites.fetchRequest())
            
        }catch {
            
            print("Fetching failed")
            
        }
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if favs != [] {
        
          return favs.count
        
        }else{
        
          return 0
            
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! FavouritesCell
        
        
        cell.city.text = favs[indexPath.row].cityNames
        cell.tableViewController = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId")
    }
    
    func deleteCell(cell: UITableViewCell){
    
        if let diP = tableView.indexPath(for: cell){
        
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            do{
                
                context.delete(favs[diP.row])
                favs.remove(at: diP.row)
                
                do {
                
                    try context.save()
                
                }catch{
                
                }
                
            }catch {
                
                print("Fetching failed")
                
            }
            
            tableView.deleteRows(at: [diP], with: .automatic)
            
            tableView.reloadData()            
        }
    }
    
    func letsDisimiss(){
    
        self.dismiss(animated: true, completion: nil)
        
    }


}

class TheHeader: UITableViewHeaderFooterView {

    var dismiss: FavouritesTableViewController!
    
    let header: UILabel = {
    
        let hdr = UILabel()
        hdr.translatesAutoresizingMaskIntoConstraints = false
        hdr.textColor = .red
        hdr.text = "My Favourite Cities"
        hdr.textAlignment = NSTextAlignment.center
        
        return hdr
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(){
    
        addSubview(header)
        
        header.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        header.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        header.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    
    }
    
    func openHome(){
        
    
        dismiss = FavouritesTableViewController()
        
        dismiss.letsDisimiss()
        
        print("Called")
    }
    
}
