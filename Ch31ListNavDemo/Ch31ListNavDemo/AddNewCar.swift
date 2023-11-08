//
//  AddNewCar.swift
//  Ch31ListNavDemo
//
//  Created by 김지훈 on 2023/11/02.
//

import SwiftUI

//31.10 자동차 정보를 추가하는 뷰 설계하기
struct AddNewCar: View {
    @StateObject var carStore : CarStore
    //31.12 네비게이션 경로, 바인딩 매개변수 추가.
    //이제 뷰는 라이브 프리뷰 내에서 액세스 할 수 없는 탐색 뷰를 전달 할 것이므로 "preview provider"주석처리해야함
    @Binding var path: NavigationPath
    
    @State private var isHybrid = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    
    var body: some View {
        //밑에 struct DataInput를 추가했으니,
        //메인 뷰의 사용자 인터페이스 레이아웃을 선언한다.
        Form{
            Section(header: Text("Car Details")){
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid){
                    Text("Hybrid").font(.headline)
                }.padding()
            }
            //버튼 클릭시 addNewCar라는 이름의 저장 메소드 호출
            Button(action: addNewCar){
                Text("Add Car")
            }
        }
    }
    func addNewCar(){
        let newCar = Car(id: UUID().uuidString,
                         name: name,
                         description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        carStore.cars.append(newCar)
        //NavigationPath의 마지막을 제거하여, 버튼 누르면 이전화면으로 돌아감
        path.removeLast()
    }
}
/*
 //NavigationPath 추가로 인한 주석
#Preview {
    AddNewCar(carStore: CarStore(cars: carData))
}
*/
//새로운 자동차에 대한 상세 정보를 입력할 TextField뷰와 Text뷰를 나타낼 새로운 하위 뷰를 선언부에 추가
//Ch22 상태 프러퍼티,Observable,State,Environmnet @Binding 프로퍼티 래퍼 사용

struct DataInput: View{
    var title: String
    @Binding var userInput: String
    
    var body: some View{
        VStack(alignment: HorizontalAlignment.leading){
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
