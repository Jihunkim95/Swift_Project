//
//  ContentView.swift
//  ViewControllerDemo
//
//  Created by 김지훈 on 2023/11/20.
//

import SwiftUI

//62.4 콘텐트 뷰 설계하기
struct ContentView: View {
    @State var imagePickerVisible: Bool = false
    @State var selectedImage: Image? = Image(systemName: "photo")
    var body: some View {
        ZStack{
            VStack{
                selectedImage?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button(action:{
                    withAnimation {
                        self.imagePickerVisible.toggle()
                    }
                }){
                    Text("Select an Image")
                }
            }.padding()
            
            if (imagePickerVisible){
                MyImagePicker(imagePickerVisivle: $imagePickerVisible, selectedImage: $selectedImage)
            }
        }
    }
}

#Preview {
    ContentView()
}
