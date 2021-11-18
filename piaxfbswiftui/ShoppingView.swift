//
//  ShoppingView.swift
//  piaxfbswiftui
//
//  Created by Bill Martensson on 2021-11-18.
//

import SwiftUI

struct ShoppingView: View {
    
    @ObservedObject var shopfb = ShoppingFB()
    
    @State var shopName = ""
    @State var shopAmount = ""
    
    var body: some View {
        VStack {
            
            HStack {
                
                TextField("Vad att köpa", text: $shopName)

                TextField("Antal", text: $shopAmount)
                    .frame(width: 70.0)
                
                Button(action: {
                    shopfb.addShopping(name: shopName, amount: shopAmount)
                }) {
                    Text("Lägg till")
                }
            }
            .padding(.horizontal)
            
            if(shopfb.errormessage != "")
            {
                Text(shopfb.errormessage)
                    .font(.title2)
            }
            
            List {
                ForEach(shopfb.allshopping){ shopitem in
                    HStack {
                        Text(shopitem.shopname)
                        Spacer()
                        Text(shopitem.shopamount)
                    }
                }.onDelete(perform: deleteSomeRow)
            }.refreshable {
                shopfb.loadShopping()
            }
            
        }.onAppear(perform: {
            shopfb.loadShopping()
        })
    }
    
    func deleteSomeRow(at offsets: IndexSet) {
        offsets.forEach { offset in
            
            var shopToDelete = shopfb.allshopping[offset]
            
            shopfb.deleteShopping(shopdelete: shopToDelete)
        }
    }
}

struct ShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView()
    }
}
