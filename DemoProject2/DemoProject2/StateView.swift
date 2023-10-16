//
//  StateView.swift
//  DemoProject2
//
//  Created by 김지훈 on 2023/10/13.
//

import SwiftUI
import Combine
import Observation
/**
 UI 내의 뷰들은 기본 데이터의 변경에 따른 처리 코드를 작성하지 않아도 뷰가 업데이트된다.

 이것은 데이터와 사용자 인터페이스(UI) 내의 뷰 사이에 게시자(publisher)와 구독자(subscriber)를 구축할 수 있다.

 >  UI의 모양과 동작을 결정하는 [상태 프로퍼티, Observable 객체, State 객체, Environment 객체]를 제공한다.
 */

struct StateView: View {
    @State private var wifiEnabled = true
    @State private var bluetoothEnabled = false
    @State private var airplaneEnabled = false
    @State private var userName = ""
    
    //Observe 패턴을 이용한 DemoData클래스 인스턴스 구독
    @StateObject var demoData : DemoData = DemoData()
    var body: some View {
        VStack {
            
            Text("\(demoData.currentUser), you are user number \(demoData.userCount)")
            
            Button(action: {demoData.userCount += 1}, label:{Text("버튼")})

            HStack{
                //하위뷰가 호출 될때 상태 프로퍼티에 대한 바인딩 전달
                WifiImageView(wifiEnabled: $wifiEnabled)
                BluetoothImageView(bluetoothEnabled: $bluetoothEnabled)
                AirplaneImageView(airplaneEnabled: $airplaneEnabled)
            }

            List{
                Toggle(isOn: $wifiEnabled){
                    Text("Wi-fi")
                }
                Toggle(isOn: $bluetoothEnabled){
                    Text("블루투스")
                }
                Toggle(isOn: $airplaneEnabled){
                    Text("비행기 탑승 모드")
                }
            }

            //상태 프로퍼티 userName 과 TextField는 바인딩 된상황
            TextField("Enter User Name", text: $userName)
            //바인딩된 프로퍼티를 보여준다.
            Text(userName)
        }
    }
}

//struct ContentView_Previews: PreviewProvider{
//    struct var Previews: some View {
//        ContentView(demoData: DemoData())
//    }
//}

/*
 하위 뷰로 이미지 관리
 */
struct WifiImageView : View {
    //@Binding 프로퍼티로 메인뷰 밖에서도 wifiEnabled 변수를관리
    @Binding var wifiEnabled : Bool
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

struct BluetoothImageView : View {
    //@Binding 프로퍼티로 메인뷰 밖에서도 wifiEnabled 변수를관리
    @Binding var bluetoothEnabled : Bool
    var body: some View {
        Image(bluetoothEnabled ? "bluetooth2" : "").frame(width: 10)
    }
}
struct AirplaneImageView : View {
    //@Binding 프로퍼티로 메인뷰 밖에서도 wifiEnabled 변수를관리
    @Binding var airplaneEnabled : Bool
    var body: some View {
        Image(systemName: airplaneEnabled ? "airplane" : "")
    }
}

/*
 Observable 객체
    State객체는 메인밖에서 @Binding 프로퍼티 래퍼를 사용해서 게시자,구독자를 연결시킨 반면,
    Observable 객체는 Combine 프레임 워크하나로 객체간에 상호작용을 할 수 있다. (최상단에 선언해둠)
    구독자는 ObservableObject를 구독하기 위해 @ObservedObject 또는 @StateObject 프로퍼티래퍼를 사용한다.
 */

class DemoData : ObservableObject{
    @Published var userCount = 0
    @Published var currentUser = ""
    
    init(){
        //데이터를 초기화하기 위한 코드
        updateData()
    }
    
    func updateData(){
        //데이터를 최신 상태로 유지하기 위한 코드가 온다
    }
}

/*
 Enviroment 객체
 사용자 인터페이스 밖에 있고, 여러뷰가 접근해야 하는 데이터일 경우에는 Environment객체 사용
 */
class SpeedSetting: ObservableObject{
    @Published var speed = 0.0
}

struct SpeedControlView:View {
    @EnvironmentObject var speedsetting: SpeedSetting
    
    var body: some View{
        Slider(value: $speedsetting.speed,in:0...100)
    }
    
}

struct SpeedDisplayView: View {
    @EnvironmentObject var speedsetting:SpeedSetting
    
    var body: some View {
        Text("Speed = \(speedsetting.speed)")
    }
}

#Preview{StateView(demoData: DemoData())}


