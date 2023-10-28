//
//  AppStroageSceneStorageView1.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

extension Color: RawRepresentable {

    public init?(rawValue: String) {
        
        guard let data = Data(base64Encoded: rawValue) else{
            self = .black
            return
        }
        
        do{
            let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor ?? .black
            self = Color(color)
        }catch{
            self = .black
        }
        
    }

    public var rawValue: String {
        
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
            
        }catch{
            
            return ""
            
        }
        
    }

}

class ColorSetting: ObservableObject{
//    @Published var color : Color = .clear
    @AppStorage("colorkey") var storedColor: Color = .black
    @Published var color : Color = .clear
    init() {
//        self.storedColor = storedColor
        self.color = storedColor
    }
}

struct AppStroageSceneStorageView1: View {
    @EnvironmentObject var colorsetting:ColorSetting
    
    /*
     데이터 지속성 예제 01
     AppStorate 를 사용하여 사용자의 선호하는 테마 색상을 저장하고, 앱의 모든 뷰에 적용하는 코드를 작성하세요.
     첫 화면에 컬러 피커로 사용자 색상 선택이 가능
     두 번째 화면 바탕색을 선택한 색으로 채움 // AppStroageSceneStorageView2
     앱을 종료 후 다시 실행하면 선택한 색상으로 복원
     */
    
    var body: some View {
//        Text("\(colorsetting.color)")
        VStack{
            ColorPicker("배경색 지정", selection: colorsetting.$storedColor).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            NavigationView(content: {
                NavigationLink(destination: AppStroageSceneStorageView1_2()){
                    Text("Next Screen")
                .padding()
                }
            })

        }
    }
}

#Preview {
    AppStroageSceneStorageView1().environmentObject(ColorSetting())
}
