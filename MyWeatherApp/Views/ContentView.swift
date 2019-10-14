//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Vedarth Solutions on 10/12/19.
//  Copyright © 2019 Vedarth Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel : WeatherViewModel
    
    init() {
        weatherViewModel = WeatherViewModel()
    }
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter City Name", text: self.$weatherViewModel.cityName) {
                self.weatherViewModel.search()
            }.font(.custom("Arial", size: 50))
                .padding()
                .fixedSize()
            Text(self.weatherViewModel.temperature)
                .font(.custom("Arial", size: 100))
                .offset(y: 100)
                .foregroundColor(Color.white)
                .padding()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.blue
                .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/))
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
