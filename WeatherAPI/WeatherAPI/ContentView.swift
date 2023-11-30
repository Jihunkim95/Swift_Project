//
//  ContentView.swift
//  WeatherAPI
//
//  Created by 김지훈 on 2023/11/30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherAPI = WeatherAPI.shared
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("버튼", action: weatherAPI.weatherData)
        }
        .padding()
    }
     
    
    
}

#Preview {
    ContentView()
}
