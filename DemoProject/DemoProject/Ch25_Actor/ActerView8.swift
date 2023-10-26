//
//  ActerView8.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/23.
//

import SwiftUI
/*
액터 예제 06
다음 코드는 actor 를 사용하여 은행 계좌의 입출금을 관리하는 예제이다.
코드를 완성하여 입출금 기능을 구현하고, 잔액을 출력하세요.
 */

struct ActerView8: View {
    @State private var account = BankAccount(balance: 0)
    @State private var money:Int = 0
    @State private var balance:String = ""
    var body: some View {
        VStack{
            Text("actor 입출금").font(.largeTitle)
            
            HStack{
                TextField("num", value: $money, format: .number)
                .textFieldStyle(.roundedBorder)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            }
            
            Button("입금 버튼", action: {
                Task{
                    do{
                        try balance = await String(account.deposit(money))
                    }catch minusError.Error{
                        balance = "잔액이 부족합니다"
                    }
                }
            }).font(.title3)
            
            Button("출금 버튼", action: {
                Task{
                    do{
                        try balance = await String(account.withdraw(money))
                    }catch minusError.Error{
                        balance = "잔액이 부족합니다"
                    }
                }
            }).font(.title3)
            
            Text("현재 잔액 : \(balance)")
        }
        
    }
    
    enum minusError: Error {
        case Error
    }
    actor BankAccount {
        var balance:Int = 0
        init(balance: Int) {
            self.balance = balance
        }
        func deposit(_ expression:Int) throws-> Int{
            balance = balance + expression
            guard balance >= 0 else{
                throw minusError.Error
            }
            return balance
        }
        func withdraw(_ expression:Int) throws -> Int{
            balance = balance - expression
            guard balance >= 0 else{
                throw minusError.Error
            }
            return balance
        }
    }
}

#Preview {
    ActerView8()
}
