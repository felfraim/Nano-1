//
//  ViewController.swift
//  Nano-1
//
//  Created by Joshia Felim Efraim on 27/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    /// Data
    var arrOfWL: [Wishlist]?
    
    /// Data Feeder (filler)
    var feeder = WLFeeder()
    
    /// Control
    var rowSelected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrOfWL = feeder.getWishlist()
        
        tableView.register(UINib(nibName: "WishlistTableViewCell", bundle: nil), forCellReuseIdentifier: "wishlistCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNewWL(_ sender: Any) {
        performSegue(withIdentifier: "tableToAdd", sender: self)
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        if tableView.isEditing{
            tableView.isEditing = false
        }else{
            tableView.isEditing = true
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    /// define each cell in tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishlistCell") as? WishlistTableViewCell
        cell?.titleLabel.text = arrOfWL?[indexPath.row].titles
        
        return cell ?? UITableViewCell()
    }
    
    
    /// define number of row within section + show message if tableview is empty
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrOfWL?.count == 0 {
            self.tableView.setEmptyMessage("your wishlist is empty")
        }else{
            self.tableView.restore()
        }
        
        return arrOfWL?.count ?? 0
    }
    
    
    /// function to tell the cell when they r selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        performSegue(withIdentifier: "tableToDetail", sender: self)
    }
    
    ///delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         
        if editingStyle == .delete{
            arrOfWL?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    ///drag item at tableview
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arrOfWL?.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    
    ///segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableToAdd" {
            guard let vc = segue.destination as? AddWLViewController else{
                fatalError("Destination is misisng")
            }
            vc.delegate = self
        } else if segue.identifier == "tableToDetail"{
            if let selectedRow = rowSelected{
                if let destination = segue.destination as? DetailViewController{
                    destination.titleDetail = arrOfWL?[selectedRow].titles
                    destination.DetailDetail = arrOfWL?[selectedRow].details
                }
            }
        }
    }
}

extension ViewController: AddWLDelegate{
    func getNewWL(_ title: String, _ detail: String) {
        let newWL = Wishlist(titles: title, details: detail)
        arrOfWL?.append(newWL)
        self.tableView.reloadData()
    }
}

extension UITableView{
    
    ///set message waktu tableview kosong
    func setEmptyMessage(_ message: String){
        let messageLabel =  UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .lightGray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "System", size: 32)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    func restore(){
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
