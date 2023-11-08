//
//  LazyHGridView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI

struct LazyHGridView: View {
    private var colors: [Color] = [.blue, .yellow, .green]
//    // 적응형 GridItem 설정 : 열너비가 50 미만으로 될 수 없다
//    private var gridItems = [GridItem(.adaptive(minimum:50))]
    
//    // 고정형 GridItem 설정 : 열너비가 100인 단일 그리드
//    private var gridItems = [GridItem(.fixed(100))]
    
    // 고정형과 적응형 조합
    private var gridItems = [GridItem(.fixed(100)),GridItem(.adaptive(minimum: 50)),GridItem(.fixed(150))]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: gridItems, spacing: 5){
                ForEach((0...99),id:\.self){ index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
            .padding(5)
        }
    }
}

#Preview {
    LazyHGridView()
}
