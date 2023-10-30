//
//  StackAlignmentGuideView4.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI

struct StackAlignmentGuideView4: View {
    
    
    
    var body: some View {
        
        let GoldJJang9 = Image("금쪽이짱구")
            .resizable()
            .aspectRatio(contentMode: .fit)//이게 핵심임 아 ㅅ
            .frame(width: 50)
            .cornerRadius(100)
            
        VStack(alignment: .center) {
            
            VStack{
                GoldJJang9
            }.padding()
            
            HStack{
                GoldJJang9
                GoldJJang9
                GoldJJang9
            }.padding()
            
            HStack{
                GoldJJang9
                GoldJJang9
                GoldJJang9
            }.padding()
            
            HStack{
                GoldJJang9
                GoldJJang9
                GoldJJang9
            }.padding()
            
            Spacer()
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Button("BUTTON"){
                }.modifier(PurpleButton())
                Spacer()
                Button("BUTTON"){
                }.modifier(PurpleButton())
                Spacer()
                Button("BUTTON"){
                }.modifier(PurpleButton())
            }
        }.padding()

    }
}

struct PurpleButton: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width:100,height: 35)
            .background(Color.purple)
            .foregroundColor(.white)
            .font(.system(size: 15))
            .cornerRadius(10)
        
    }
}
#Preview {
    StackAlignmentGuideView4()
}
