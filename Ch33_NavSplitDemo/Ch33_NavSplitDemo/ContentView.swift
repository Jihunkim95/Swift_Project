//
//  ContentView.swift
//  Ch33_NavSplitDemo
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI

struct ContentView: View {
    //33.3 카테코리 아이콘 배열 선언
    @State private var categories = [
        IconCategory(categoryName: "Folders", images: ["questionmark.folder.ar",
             "questionmark.folder",
             "questionmark.folder.fill.ar",
             "folder.fill.badge.gear",
             "questionmark.folder.fill"]),
        IconCategory(categoryName: "Circles", images:
            ["book.circle",
             "books.vertical.circle",
             "books.vertical.circle.fill",
             "book.circle.fill",
             "book.closed.circle"]),
        IconCategory(categoryName: "Clouds", images:
            ["cloud.rain",
             "cloud",
             "cloud.drizzle.fill",
             "cloud.fill",
             "cloud.drizzle"])
    ]
    //33.5 사이드바 열만들기
    @State private var selectedCategory: IconCategory?
    //33.6 콘첸츠열에 목록 추가
    @State private var selectedImage: String?
    //33.8 분할 내비게이션 환경 구성하기
    @State private var columnVisibiliy = NavigationSplitViewVisibility.all
    
    var body: some View {
        //33.4 NavigationSlitView 바꾸기
        //33.8 앱이 처음 실행 될때 세개의 열모두 표시됨
        NavigationSplitView(columnVisibility: $columnVisibiliy){
            List(categories, selection: $selectedCategory){ category in
                Text(category.categoryName).tag(category)
            }
        } content: {
          //33.6 콘텐츠 열에 목록 추가하기
            if let selectedCategory {
                List(selectedCategory.images, id: \.self,
                     selection: $selectedImage) { image in
                    HStack{
                        Image(systemName: image)
                        Text(image)
                        
                    }.tag(image)
                }
            }else{
                Text("Select a category")
            }
        }detail: {
            //33.7 디테일 열에 화면 추가하기
            if let selectedImage{
                Image(systemName: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else{
                Text("Select an image")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
}
