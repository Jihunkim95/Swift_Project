//
//  sample.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI


struct Calc: View {
    
    enum CalcRule {
        case plus, minus, multiply, divide
    }
    
    let gridForm: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var number: Int = 0
    @State private var firstNumber: Int = 0
    @State private var secondNumber: Int = 0
    @State private var calculateRule: CalcRule?
    
    var body: some View {
        
        Text("\(number)")
        
        LazyVGrid(columns: gridForm, content: {
            Button(action: {
                updateNumber(inputNumber: 7)
            }, label: {
                Text("7")
            })
            
            Button(action: {
                updateNumber(inputNumber: 8)
            }, label: {
                Text("8")
            })
            
            Button(action: {
                updateNumber(inputNumber: 9)
            }, label: {
                Text("9")
            })
            
            Button(action: {
                secondNumber = number
                calculate()
            }, label: {
                Text("=")
            })
            
            Button(action: {
                updateNumber(inputNumber: 4)
            }, label: {
                Text("4")
            })
            
            Button(action: {
                updateNumber(inputNumber: 5)
            }, label: {
                Text("5")
            })
            
            Button(action: {
                updateNumber(inputNumber: 6)
            }, label: {
                Text("6")
            })
            
            Button(action: {
                firstNumber = number
                calculateRule = .plus
                number = 0
            }, label: {
                Text("+")
            })
            
            Button(action: {
                updateNumber(inputNumber: 1)
            }, label: {
                Text("1")
            })
            
            Button(action: {
                updateNumber(inputNumber: 2)
            }, label: {
                Text("2")
            })
            
            Button(action: {
                updateNumber(inputNumber: 3)
            }, label: {
                Text("3")
            })
            
            Button(action: {
                firstNumber = number
                calculateRule = .minus
                number = 0
            }, label: {
                Text("-")
            })
        })
        
        Button(action: {
            self.number = 0
        }, label: {
            Text("Reset")
        })
        .buttonStyle(.borderedProminent)
    }
    
    func updateNumber(inputNumber: Int) -> Void {
        if number == 0 {
            number += inputNumber
        } else if number > 0 {
            number = number * 10 + inputNumber
        }
        
        print(number)
    }
    
    func calculate() -> Void {
        var result: Int = number
        switch calculateRule {
            case .plus:
                result = firstNumber + secondNumber
            case .minus:
                result = firstNumber - secondNumber
            case .multiply:
                result = firstNumber * secondNumber
            case .divide:
                result = firstNumber / secondNumber
            case nil:
                break
        }
        
        number = result
    }
}
#Preview {
    Calc()
}
