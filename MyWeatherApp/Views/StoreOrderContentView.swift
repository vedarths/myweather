//
//  StoreOrderContentView.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 11/13/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import SwiftUI

struct StoreOrderContentView: View {
    
    @ObservedObject var storeOrderViewModel : StoreOrdersViewModel
    
    init() {
        storeOrderViewModel = StoreOrdersViewModel()
    }
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter Store Id", text: self.$storeOrderViewModel.storeId) {
                self.storeOrderViewModel.search()
            }.font(.custom("Arial", size: 50))
                .padding()
                .fixedSize()
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.blue
                .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/))
            .edgesIgnoringSafeArea(.all)
    }
}

struct StoreOrderContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoreOrderContentView()
    }
}
