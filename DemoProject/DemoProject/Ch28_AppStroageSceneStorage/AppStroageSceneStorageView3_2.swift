//
//  AppStroageSceneStorageView3_2.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/29.
//

import SwiftUI

struct AppStroageSceneStorageView3_2: View {
    @ObservedObject var name : Name = Name()
    @State var appearName : String = ""
    var body: some View {
        VStack{
            ZStack {

                Image("너의 이름은_명대사").resizable()
                    .frame(width: 380, height: 200)
                    .cornerRadius(10)
            }
            Text(appearName)
                .font(.title)
                .foregroundColor(.black)
                .padding(.top, 20)
                .onAppear {
                    // 5초 뒤에 텍스트 업데이트
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        appearName = ("\(name.nameSet) !!")
                    }
                }

        }

    }
    func takesTooLong(){
        
    }
}

#Preview {
    AppStroageSceneStorageView3_2(name: Name())
}
