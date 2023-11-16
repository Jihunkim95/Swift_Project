//
//  GirdRowDemo.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/09.
//
/**
 # GridRow p. 377
 Grid 와 GridRow
 지연 lazy 그리드 뷰가 할 수 없는 열 확장, 빈 셀, 다양한 정렬과 간격 등의 기능을 제공
 */
import SwiftUI

struct GirdRowDemo: View {
    var body: some View {
        // 37.8 Grid 뷰의 horizontalSpacing:, verticalSpacing: 매개 변수로 행열 간격 조절 가능함
        Grid(alignment: .topLeading){
            
            GridRow(alignment: .bottom) {
                CellContent_Ch37(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                    .gridColumnAlignment(.trailing)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.center)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.top)
                CellContent_Ch37(index: 0, color: .yellow)
            }.font(.largeTitle)
            
            GridRow(alignment: .top) {
                CellContent_Ch37(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                CellContent_Ch37(index: 0, color: .yellow)
            }.font(.largeTitle)
            
            GridRow{
                ForEach(1...5, id: \.self){ index in
                    if (index % 2 == 1){
                        CellContent_Ch37(index: index, color: .red)
                    }else{
                        //빈 cell은 clear color 같은 구성된 Color 뷰로 표시
                        // gridCellUnsizedAxes() 수정자를 Color뷰에 적용하면 빈 cell의 높이와 너비가 점유된 셀의 Default같도록
                        Color.clear.gridCellUnsizedAxes([.horizontal,.vertical])
                    }

                }
            }
            GridRow{
                ForEach(6...8, id: \.self){ index in
                    CellContent_Ch37(index: index, color: .blue)
                }
            }
            GridRow{
                ForEach(11...12, id: \.self){ index in
                    CellContent_Ch37(index: index, color: .green)
                }
            }
            //GridRow가 아닌 다른 Children View
            CellContent_Ch37(index: 16, color: .orange)
            
            // Ch37.7 열 확장 하기 p. 382
            // gridCellColumns()수정자를 사용하여 열확장
            GridRow{
                CellContent_Ch37(index: 17, color: .orange)
                    .gridCellColumns(2)
                CellContent_Ch37(index: 18, color: .indigo)
                    .gridCellColumns(3)
            }
        }//grid
        .padding()
    }
}
struct CellContent_Ch37: View {
    var index: Int
    var color: Color
    
    var body: some View{
        Text("\(index)")
            .frame(minWidth: 50,maxWidth: .infinity,minHeight: 100 )
            .background(color)
            .cornerRadius(8)
            .font(.largeTitle)
    }
}
#Preview {
    GirdRowDemo()
}
