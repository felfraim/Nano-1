//
//  Wishlist.swift
//  Nano-1
//
//  Created by Joshia Felim Efraim on 28/04/22.
//

import Foundation

struct Wishlist{
    var titles  : String?
    var details : String?
}

struct WLFeeder {
    
    func getWishlist() -> [Wishlist] {
        return [
            Wishlist(titles: "KJ Amigurumi", details: "boneka rajut killjoy, beli di ig medaami "),
            Wishlist(titles: "Eating Racoon T-Shirt", details: "Anown Creation, RP.249k ."),
            Wishlist(titles: "Fawking Penguin T-Shirt", details: "Anown Creation, RP.249k."),
            Wishlist(titles: "Second Monitor", details: "Second Monitor")
        ]
    }
    
}
