//
//  ContentView.swift
//  piaxfbswiftui
//
//  Created by Bill Martensson on 2021-11-18.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var thehelper = FBHelper()
    
    var body: some View {
        VStack {
            Text(thehelper.funtitle)
                .padding()
            
            Button(action: {
                thehelper.letsSaveStuff(funname: "Badboll")
            }) {
                Text("Klicka här")
            }

            Button(action: {
                thehelper.letsSaveStuff(funname: "Studsmatta")
            }) {
                Text("Klicka här också")
            }

        }.onAppear(perform: {
            //ref.child("piaxswiftui").setValue("Hurra det funkar")
            
            thehelper.loadstuff()
        })
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
