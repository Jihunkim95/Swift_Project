//
//  StackFrameListView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct StackFrameListView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ch21 스택과 프레임")
                List{
                    NavigationLink(destination: StackFrame()){
                        Text("스택 프레임 예시1")
                    }.padding()
                    
                    NavigationLink(destination: StackFrame2()){
                        Text("A - B")
                    }.padding()
                    
                    NavigationLink(destination: StackFrame3()){
                        Text("농구공 박스 나누어 담기")
                    }.padding()
                }

            }
        }
    }
}

#Preview {
    StackFrameListView()
}
