//
//  ShoppingFB.swift
//  piaxfbswiftui
//
//  Created by Bill Martensson on 2021-11-18.
//

import Foundation
import SwiftUI
import Firebase

class ShoppingFB : ObservableObject {
    
    var ref: DatabaseReference!
    
    @Published var allshopping = [Shopthing]()
    
    @Published var errormessage = ""
    
    init() {
        ref = Database.database().reference()
    }
    
    func addShopping(name : String, amount : String) {
        /*
        var shop = [String : String]()
        shop["shopname"] = name
        shop["shopamount"] = amount
        */
        
        if(name == "")
        {
            errormessage = "Ange namn!!"
            return
        }
        if(amount == "")
        {
            errormessage = "Angel antal!!"
            return
        }
        errormessage = ""
        
        var saveshop = ["shopname" : name, "shopamount" : amount]
        
        ref.child("swiftuishopping").childByAutoId().setValue(saveshop) { err, fbref in
            print("Vi har nu sparat")
            self.loadShopping()
        }
    }
    
    func deleteShopping(shopdelete : Shopthing)
    {
        ref.child("swiftuishopping").child(shopdelete.fbid).removeValue() { err, fbref in
            self.loadShopping()
        }
    }
    
    func loadShopping() {
        ref.child("swiftuishopping").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            
            DispatchQueue.main.async {
                self.allshopping.removeAll()
            }
            
            for shopsnapchild in snapshot.children {
                var childdatasnap = shopsnapchild as! DataSnapshot
                
                var shopdict = childdatasnap.value as! [String : String]
                
                print(shopdict["shopname"])
                
                var tempshop = Shopthing()
                tempshop.fbid = childdatasnap.key
                tempshop.shopname = shopdict["shopname"]!
                tempshop.shopamount = shopdict["shopamount"]!
                
                DispatchQueue.main.async {
                    self.allshopping.append(tempshop)
                }
                
                
                
            }
            
            
        })
    }
    
}
