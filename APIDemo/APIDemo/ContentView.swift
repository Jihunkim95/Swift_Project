//
//  ContentView.swift
//  APIDemo
//
//  Created by 김지훈 on 2023/11/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            feachData()
        }
    }
    
    //API Key 불러오기
    private var apiKey: String? {
        get {
            let keyfilename = "ApiKeys"
            let api_key = "API_KEY"
            
            // 생성한 .plist 파일 경로 불러오기
            guard let filePath = Bundle.main.path(forResource: keyfilename , ofType: "plist") else {
                fatalError("Couldn't find file '\(keyfilename).plist'")
            }
            
            // .plist 파일 내용을 딕셔너리로 받아오기
            let plist = NSDictionary(contentsOfFile: filePath)
            
            // 딕셔너리에서 키 찾기
            guard let value = plist?.object(forKey: api_key) as? String else {
                fatalError("Couldn't find key '\(api_key)'")
            }
            
            return value
        }
    }
    
    //결과값
    func feachData(){
        guard let apiKey = apiKey else { return }

        let urlString = "https://newsapi.org/v2/everything?q=Apple&from=2023-11-29&sortBy=popularity&apiKey=\(apiKey)"

        guard let url = URL(string: urlString) else { return }

        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // 정상적으로 값이 오지 않았을 때 처리
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            let str = String(decoding: data, as: UTF8.self)
            print(str)

        }
        task.resume()
    }
}

#Preview {
    ContentView()
}
