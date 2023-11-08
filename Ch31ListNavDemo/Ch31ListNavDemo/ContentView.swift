
//https://drive.google.com/file/d/1ZZRLhVC4M6UaRFjw0Bdcg8ty__FCFrJQ/view
import SwiftUI

struct ContentView: View {
    //31.7 콘텐트 뷰 설계하기
    // CarStore 인스턴스에 상태객체 바인딩 추가
    @StateObject var carStore : CarStore = CarStore(cars: carData)
    //31.12 네비게이션 경로 추가하기
    @State private var stackPath = NavigationPath()
    
    var body: some View {
        //NavigationLink가 동작하려면 NavigationStack에 감싸져야함
        NavigationStack(path: $stackPath){
            List{
                ForEach(0..<carStore.cars.count, id: \.self){ i in
                    //31.9 리스트에 내비게이션 추가하기
                    NavigationLink(value: i ){
                        ListCell(car: carStore.cars[i])
                    }
                }
                //31.13 Edit 버튼에 메서드 추가하기
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            //항목을 탭하면 선택된 자동차의 세부 정보가 포함된 CarDetail 뷰로 이동
            .navigationDestination(for: Int.self){ i in
                CarDetail(selectedCar: carStore.cars[i])
            }
            //31.11_2는 31.11_1 눌렀을때 뷰 이동, 여기까지 하면 Add 버튼 눌렀을때 새로운 추가 화면 및 상세정보가 입력할 수 있어야함
            .navigationDestination(for: String.self){ _ in
                AddNewCar(carStore: self.carStore, path: $stackPath)
            }
            //31.11_1 Add버튼과 Edit 버튼 구현하기
            .navigationBarTitle(Text("Ev Cars"))
            .navigationBarItems(leading: NavigationLink(value: "Add Car"){
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
            
        }
    }
    
    //선택된 행의 offsets가 전달되며 해당항목 삭제
    func deleteItems(at offsets: IndexSet){
        carStore.cars.remove(atOffsets: offsets)
    }
    
    //리스트 행의 위치로 이동하면 from에서 to로 변환
    func moveItems(from source: IndexSet,to destination: Int){
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}

//Extraxt to Subview로 만든뒤 struct명을 ListCell로 변경
struct ListCell: View {
    var car: Car
    var body: some View {
        HStack{
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
            
        }
    }
}
