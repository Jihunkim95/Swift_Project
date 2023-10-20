//
//  ConcurrencyListView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct ConcurrencyListView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ch24 구조화된 동시성")
                List{
                    NavigationLink(destination: ConcurrencyView()){
                        Text("Task 작업 예시")
                    }.padding()
                    
                    NavigationLink(destination: ConcurrencyView2()){
                        Text("withTaskGroup 작업그룸 예시1")
                    }.padding()
                    
                    NavigationLink(destination: ConcurrencyView3()){
                        Text("withTaskGroup 작업그룹 예시2")
                    }.padding()
                    NavigationLink(destination: ConcurrencyView4()){
                        Text("팩토리얼 에러핸들링 하다맘")
                    }.padding()
                    NavigationLink(destination: ConcurrencyView5()){
                        Text("비동기 함수를 호출하고 결과 출력")
                    }.padding()
                    NavigationLink(destination: ConcurrencyView6()){
                        Text("두개 비동기 함수 호출 결과")
                    }.padding()
                    NavigationLink(destination: ConcurrencyView7()){
                        Text("비동기 함수 형변환 호출 예시1")
                    }.padding()
                    NavigationLink(destination: ConcurrencyView8()){
                        Text("비동기 함수 형변환 호출 예시2")
                    }.padding()
                    NavigationLink(destination: ConcurrencyView9()){
                        Text("비동기 2개 스레드 A,B 합 및 에러처리")
                    }.padding()
                    NavigationLink(destination: ConcurrencyView10()){
                        Text("withTaskGroup 사용한 \n비동기 2개 스레드 A,B 합 및 에러처리")
                    }.padding()
                }

            }
        }
    }
}

#Preview {
    ConcurrencyListView()
}
