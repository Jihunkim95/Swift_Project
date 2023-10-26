//
//  ConcurrencyView10.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct ConcurrencyView10: View {
    /*
     동시성 예제 02
     withTaskGroup사용하여
     1부터 100까지의 합을 구하는 비동기 함수
     async let을 사용하여 두 개의 비동기 작업을 동시에 실행하고 결과를 합하여 출력하는 함수를 작성해보세요.
     */
    @State private var x:Int = 0
    @State private var y:Int = 0
    @State private var result:Int = 0

    var body: some View {

        VStack{
            Text("withTaskGroup 사용한 \n비동기 2개 스레드 A,B 합 및 에러처리").font(.largeTitle)
            
            HStack(spacing: 30 ){
                TextField("num1", value: $x, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType (.decimalPad)
                .foregroundColor (.black)
                .multilineTextAlignment (.center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                Text("~")
                TextField("num2", value: $y, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType (.decimalPad)
                .foregroundColor (.black)
                .multilineTextAlignment (.center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                
            }
            Button("Enter", action: {Task{
                do{try await doSomething(x,y)
                }catch InputError.Error{
                    result = -9999
                }catch{
                    result = -9998
                }
            }
            }).frame(width: 50,height: 40).border(Color.white, width: 2)
            
            Text("결과 : \(result)")
            Text("유효하지 않으면 -9999 반환")
        }
        
        
    }
    
//     class ArticleViewModel: ObservableObject {
        enum InputError: Error {
            case Error
        }
    
        @discardableResult
        func doSomething(_ x:Int,_ y:Int) async throws -> Int{
            
            guard x < y else{ throw InputError.Error }
            guard y - x > 2 else{ throw InputError.Error }
            guard y != 0 else { throw InputError.Error }
        

            var totalSum: [Int: Int] = [:]
            let indexlist:[Int] = [x, y] //1, 100
            // async let을 사용하여 두 개의 비동기 작업을 동시에 실행
            await withTaskGroup(of: (Int,Int).self){ group in
                
                for i in 0...1{
                    group.addTask {
                        if i == 0{
                            return (i, await sumFrom(indexlist[0],indexlist[1]/2))
                        }else{
                            return (i, await sumFrom(indexlist[1]/2 + 1,indexlist[1]))
                        }

                    }
                }
                //task에대한 value값 저장
                for await (task, value) in group {
                    totalSum[task] = value
                }
            }
            //        print("totalSum\(totalSum.values.reduce(0,+)) \(result)")
            result = totalSum.values.reduce(0,+)
            
            return result
        }
        func sumFrom(_ start:Int,_ end:Int) async -> Int {
            var ex:Int = 0
            
            for i in start...end{
                ex += i
            }
            return ex
        }

}

#Preview {
    ConcurrencyView10()
}
