//
//  NavigationSplitView예제03.swift
//  Ch33_NavSplitDemo
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI

struct NavigationSplitViewEx03: View {
    //33.3 카테코리 아이콘 배열 선언
    @State private var categories = [
        TeamCategory(categoryName: "1팀: 전국방방코코", images: ["백대홍",
                                                  "홍세희"]),
                TeamCategory(categoryName: "2팀: 카페인S2", images:
            ["김지훈",
             "김민재",
             "신희선",
             "이현호",
             "조성현",
             "황민채"])
        ,TeamCategory(categoryName: "3팀: 멋쟁이사과처럼", images: ["3",
                                                  "3"]),
        
    ]
    //33.5 사이드바 열만들기
    @State private var selectedCategory: TeamCategory?
    //33.6 콘첸츠열에 목록 추가
    @State private var selectedImage: String?
    //33.8 분할 내비게이션 환경 구성하기
    @State private var columnVisibiliy = NavigationSplitViewVisibility.all


    @State private var selectedIntroduce: String?
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
                        Image(image)
                            .resizable()
                            .frame(width: 44, height: 44)
                            .padding()
                        Text(image)                     
  
                        
                    }.tag(image)
   
                }
            }else{
                Text("Select a category")
            }
        }detail: {

            //33.7 디테일 열에 화면 추가하기
            if let selectedImage{
                Text("\(selectedImage)")
                Image(selectedImage)
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
    NavigationSplitViewEx03()
}
