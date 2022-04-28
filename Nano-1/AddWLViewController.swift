//
//  AddWLViewController.swift
//  Nano-1
//
//  Created by Joshia Felim Efraim on 28/04/22.
//

import UIKit

protocol AddWLDelegate{
    func getNewWL(_ title: String,_ detail: String)
}

class AddWLViewController:
    UIViewController {
    
    var delegate : AddWLDelegate?
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnAdd(_ sender: Any) {
        guard let wlTitle = titleTextField.text else{
            fatalError("Wishlist Title is Nil")
        }
        guard let wlDetail = detailTextView.text else{
            fatalError("Wishlist Detail is Nil")
        }
        delegate?.getNewWL(wlTitle, wlDetail)
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
