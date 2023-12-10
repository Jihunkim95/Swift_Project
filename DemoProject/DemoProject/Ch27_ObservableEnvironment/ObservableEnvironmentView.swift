//
//  ObservableEnvironmentView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI
import Foundation

class TimerData: ObservableObject {
    @Published var timeCount = 0
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeerDidFire), userInfo: nil, repeats: true)
    }
    
    @objc func timeerDidFire(){
        timeCount += 1
    }
    
    func resetCount(){
        timeCount = 0
    }
}

struct ObservableEnvironmentView: View {
    
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("시간 카운터 = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: resetCount){
                    Text("Reset Counter")
                }
                
                NavigationLink(destination: ObservableEnvironmentSecondView()){
                    Text("Next Screen") 
                }
                .padding()
            }
        }.environmentObject(timerData)
    }
    func resetCount() {
        timerData.resetCount()
    }
}

//
//#Preview {
//    ObservableEnvironmentView().environmentObject(TimerData())
//}
