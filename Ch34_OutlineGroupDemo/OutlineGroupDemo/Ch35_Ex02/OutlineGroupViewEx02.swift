//
//  OutlineGroupViewEx02.swift
//  OutlineGroupDemo
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI
/*
 OutlineGroup 예제 02
 다음 코드는 OutlineGroup을 이용하여 메뉴 아이템을 표시하려고 합니다.
 예시 코드의 MenuItem을 이용하여
 다음 화면이 되도록 구현해 보세요.
 */
// 예시 코드:
struct MenuItem{
    let name: String
    let price: Double?
    let subItems: [MenuItem]?
}

let menuItems: [MenuItem] = [


        MenuItem(name: "Buger",price: 100,subItems: [
            MenuItem(name: "Pizza",price: 100,subItems: [
                MenuItem(name: "Cheese",price: 100, subItems: nil),
                MenuItem(name: "Pepperoni",price: 100, subItems: nil),
                MenuItem(name: "Veggie",price: 100, subItems: nil)])])
    ,MenuItem(name: "Salad",price: 100, subItems: nil)

    
]

struct OutlineGroupViewEx02: View {
    var body: some View {
        List {
//            ForEach(menuItems) { menuItem in
                    // 데이터를 화면에 표현하는 것에 더 큰 제어 기능을 제공
                    // Section으로 구분하여 표시
                    // List 뷰에 포함하면 시각적으로 만족스러움
            OutlineGroup (menuItems, id: \.name, children: \.subItems){
                        child in
//                        
                        CellViewEx02(item: child)
                    } // end OutlineGroup
//            }
        }
        .listStyle(.grouped)
    }
}
// 각 list Cell에 표시할 CustomView를 Design
struct CellViewEx02: View {
    var item: MenuItem
    var body: some View{
        HStack{
 
            Text(item.name)
                .font(.system(.title3,design: .rounded))
//            Text("\(item.price)")
        }
    }
}
#Preview {
    OutlineGroupViewEx02()
}
