//
//  ObservableEnvironmentSecondView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI
import Foundation

struct ObservableEnvironmentSecondView: View {
    //따로 인스턴스 생성 안해줌. 왜냐 ? ObservableEnvironmentSecondView에 이미 TimerData인스턴스를 생성해줬기때문
    @EnvironmentObject var timerData: TimerData
    var body: some View {
        VStack{
            Text("SecondView")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
                .padding()
        }
    }
}

//#Preview {
//    ObservableEnvironmentSecondView().environmentObject(TimerData())
//}
