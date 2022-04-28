//
//  DetailViewController.swift
//  Nano-1
//
//  Created by Joshia Felim Efraim on 28/04/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    /// Data
    var titleDetail: String?
    var DetailDetail: String?
    
    @IBOutlet weak var titleLabelDetail: UILabel!
    @IBOutlet weak var detailLabelDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelDetail.text = titleDetail
        detailLabelDetail.text = DetailDetail
        
        // Do any additional setup after loading the view.
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
