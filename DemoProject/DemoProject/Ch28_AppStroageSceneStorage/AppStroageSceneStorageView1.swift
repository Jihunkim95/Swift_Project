//
//  AppStroageSceneStorageView1.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI


//
//struct BgColorName: Encodable, Decodable {
//    
//    var red : CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
//    
//    var uiColor : UIColor {
//        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
//    }
//    
//    init(uiColor : UIColor) {
//        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//    }
//}
//
//struct AppStroageSceneStorageView1: View {
//    
//    /*
//     데이터 지속성 예제 01
//     AppStorate 를 사용하여 사용자의 선호하는 테마 색상을 저장하고, 앱의 모든 뷰에 적용하는 코드를 작성하세요.
//     첫 화면에 컬러 피커로 사용자 색상 선택이 가능
//     두 번째 화면 바탕색을 선택한 색으로 채움 // AppStroageSceneStorageView2
//     앱을 종료 후 다시 실행하면 선택한 색상으로 복원
//     */
//    @State private var bgColorName = BgColorName
//        Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
//    @AppStorage("bgColorStore") var bgColorStore : Data = Data()
//    var body: some View {
////        Text("\(colorsetting.color)")
//        VStack{
//            ColorPicker("배경색 지정", selection: $bgColor)
//                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
//                .onChange(of: bgColor) { newColor in
//                    let encorder = JSONEncoder()
//                    if let data = try? encorder.encode(bgColor){
//                        bgColorStore = data
//                        
//                    }
//                    print("Background color changed to: \(newColor)")
//                }
//
//            NavigationView(content: {
//                NavigationLink(destination: AppStroageSceneStorageView1_2()){
//                    Text("Next Screen")
//                .padding()
//                }
//            })
//
//        }
//    }
//}
//
//#Preview {
//    AppStroageSceneStorageView1()
//}
