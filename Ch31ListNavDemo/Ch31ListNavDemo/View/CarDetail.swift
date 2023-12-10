//
//  CarDetail.swift
//  Ch31ListNavDemo
//
//  Created by 김지훈 on 2023/11/02.
//

import SwiftUI

//31.8 상세 뷰 설계하기
struct CarDetail: View {
    let selectedCar : Car
    var body: some View {
        //Form컨테이너 : 뷰들을 그룹핑하고 서로 다른 섹션으로 나눌 수 있게하는 컨테이너뷰
        Form{
            Section(header: Text("Car Details")){
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack{
                    Text("Hybrid").font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
                
            }
        }
    }
}

#Preview {
    CarDetail(selectedCar: carData[0])
}
