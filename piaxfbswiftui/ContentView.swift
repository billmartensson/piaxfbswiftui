//
//  ContentView.swift
//  piaxfbswiftui
//
//  Created by Bill Martensson on 2021-11-18.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    var body: some View {
        VStack {
            Text(funtitle)
                .padding()
            
            Button(action: {
                //ref.child("piaxswiftui").setValue("KLICKAT!")
            }) {
                Text("Klicka här")
            }
            
        }.onAppear(perform: {
            
            
            //ref.child("piaxswiftui").setValue("Hurra det funkar")
            
            loadstuff()
            
            
        })
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
