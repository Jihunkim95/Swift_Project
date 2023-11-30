//
//  ContentView.swift
//  WeatherAPI
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
            
            Button("버튼", action: weatherData)
        }
        .padding()
    }
    
    //API 불러오는 테스트용 함수
    func weatherData() -> Void{
        //apiKey 불러오고
        guard let apiKey = apiKey else { return }
        
        //test 서울
        let lat:String = "37.56" //위도
        let lon:String = "126.97" //경도
        
        //url선언
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }

        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
             if let error = error {
                 print(error.localizedDescription)
                 return
             }

             guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                 // 정상적으로 값이 오지 않았을 때 처리
//                 self.posts = []
                 return
             }

             guard let data = data else {
                 print("No data received")
                 return
             }

//             let str = String(decoding: data, as: UTF8.self)
//             print(str)
            
            //JSON 데이터 Decoder
            do {
                let json = try JSONDecoder().decode(WeatherData.self, from: data)
                print(json)
            } catch let error {
                print(error)
                print(error.localizedDescription)
            }
            
         }
        //중단된 작업 재개
        task.resume()
    }
    
    //plist에서 선언한 API Key 받기
    private var apiKey: String?{
        get{
            let keyfilename = "ApiKeys"
            let api_key = "API_KEY"
            
            //생성한 .plist 파일 경로 불러오기
            guard let filePath = Bundle.main.path(forResource: keyfilename, ofType: "plist") else {
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
    


}

#Preview {
    ContentView()
}
