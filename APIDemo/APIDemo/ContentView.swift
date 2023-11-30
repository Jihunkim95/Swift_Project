//
//  ContentView.swift
//  APIDemo
//
//  Created by 김지훈 on 2023/11/30.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var newsAPI = NewsAPI.shared
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(newsAPI.posts, id: \.self){ result in
                    HStack{
                        //비동기 이미지 API데이터때문에 사용
                        AsyncImage(url: URL(string: result.urlToImage ?? "")){ image in
                                image.image?.resizable()
                            }
                        .frame(width: 120, height: 80)
                        
                        Text(result.title)
                            .bold()
                    }
                }
            }

        }
        .padding()
        .onAppear() {
            newsAPI.feachData()
        }
    }
 
}

#Preview {
    ContentView()
}
