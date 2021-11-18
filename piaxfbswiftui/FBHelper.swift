//
//  FBHelper.swift
//  piaxfbswiftui
//
//  Created by Bill Martensson on 2021-11-18.
//

import Foundation
import SwiftUI
import Firebase

class FBHelper {
    
    var ref: DatabaseReference!
    
    @State var funtitle = ""
    
    init() {
        ref = Database.database().reference()
    }
    
    func loadstuff() {
        ref.child("funthing").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            let funny = snapshot.value as! String
            print(funny)
            funtitle = funny
        })
    }
    
}
