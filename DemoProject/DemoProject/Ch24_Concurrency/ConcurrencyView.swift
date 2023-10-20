//
//  Ch24Concurrency.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/19.
//

import SwiftUI


struct ConcurrencyView: View {
    var body: some View {
        
        Button(action: { 
            
            Task{
                            await doSomething()
                        }
            }){
                Text("Do Something")
            }
    }
    
    /*오류 핸들링*/
    enum DurationError: Error {
        case tooLong,tooShort
    }
    func doSomething() async{
        
        print("Start\(Date())")
        print("After async-let \(Date())")
        do{
            try await takesTooLong(delay: 5)
        }catch DurationError.tooShort {
            print("Error: Duration too short")
        }catch DurationError.tooLong{
            print("Error: Duration too long")
        }catch {
            print("Unknown Error")
        }
        print("End\(Date())")
    }
    func takesTooLong(delay:UInt32) async throws{
        if delay < 5{
            throw DurationError.tooShort
        }else if delay > 20{
            throw DurationError.tooLong
        }
        sleep(UInt32.random(in: 1...5))            // 램덤 초 지연
    }
 
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View{
//        Ch24StructuredConcurrency()
//    }
//}

#Preview {
    ConcurrencyView()
}
