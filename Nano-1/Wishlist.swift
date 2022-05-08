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
            Wishlist(titles: "wishlist 1", details: "ini si harusnya wishlist detail sih ya"),
            Wishlist(titles: "wishlist 2", details: "ini si harusnya wishlist detail sih ya"),
            Wishlist(titles: "wishlist 3", details: "ini si harusnya wishlist detail sih ya")
        ]
    }
    
}
