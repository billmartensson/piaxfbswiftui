//
//  FBHelper.swift
//  piaxfbswiftui
//
//  Created by Bill Martensson on 2021-11-18.
//

import Foundation
import SwiftUI
import Firebase

class FBHelper : ObservableObject {
    
    var ref: DatabaseReference!
    
    @Published var funtitle = ""
    
    init() {
        ref = Database.database().reference()
    }
    
    
    func letsSaveStuff(funname : String)
    {
        
        ref.child("funthing").setValue(funname) { err, fbref in
            self.loadstuff()
        }
    }
    
    
    func loadstuff() {
        ref.child("funthing").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            let funny = snapshot.value as! String
            print(funny)
            self.funtitle = funny
        })
    }
    
}
