//
//  DetailScreen.swift
//  Electra
//
//  Created by Rival Fauzi on 05/04/23.
//

import SwiftUI

struct DetailScreen: View {
    @ObservedObject var toolViewmodell: ToolViewModel
    @ObservedObject var budgetViewmodel: BudgetingViewModel
    @State var index: Int
    @State private var showingAlert = false
    @State private var toNextScreen: Bool = false
    @State private var isEdit = false
    
    var detailData: Tool {
        toolViewmodell.getDetail(index: index)
    }
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 10){
                Text(detailData.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(spacing: 3){
                    HStack{
                        Text("Jumlah")
                        Spacer()
                        Text("\(detailData.quantity)")
                            .fontWeight(.medium)
                    }
                    HStack{
                        Text("Watt")
                        Spacer()
                        Text(customFormat(Double(detailData.power))+" W")
                            .fontWeight(.medium)
                    }
                    HStack{
                        Text("Waktu")
                        Spacer()
                        Text("\(detailData.usageTimePerHour) jam/hari")
                            .fontWeight(.medium)
                    }
                    HStack{
                        Text("Hari")
                        Spacer()
                        Text("\(detailData.repeatDays) hari")
                            .fontWeight(.medium)
                    }
                }
                Rectangle()
                    .frame(height: 0.5, alignment: .bottom)
                
                VStack(spacing: 3){
                    HStack{
                        Text("Wh/hari")
                        Spacer()
                        Text("\(customFormat(Double(detailData.power * detailData.usageTimePerHour))) Wh")
                            .fontWeight(.medium)
                    }
                    HStack{
                        Text("kWh/hari")
                        Spacer()
                        Text("\(customFormat(toolViewmodell.calculateKwhPerDay(tool: detailData))) kWh")
                            .fontWeight(.medium)
                    }
                    HStack{
                        Text("Biaya/hari")
                            .fontWeight(.regular)
                        Spacer()
                        Text("Rp \(customFormat(toolViewmodell.calculateUsagePerday(tool: detailData)))")
                            .fontWeight(.medium)
                    }
                }
                
                Rectangle()
                    .frame(height: 0.5, alignment: .bottom)
                
                VStack(spacing: 3){
                    HStack{
                        Text("Wh/bulan")
                        Spacer()
                        Text("\(customFormat(Double(detailData.power * detailData.usageTimePerHour * (detailData.repeatDays * 4)))) Wh")
                            .fontWeight(.medium)
                    }
                    HStack{
                        Text("kWh/bulan")
                        Spacer()
                        Text("\(customFormat(toolViewmodell.calculateKwhPerMonth(tool: detailData))) kWh")
                            .fontWeight(.medium)
                    }
                    HStack{
                        Text("Biaya/bulan")
                            .fontWeight(.regular)
                        Spacer()
                        Text("Rp \(customFormat(toolViewmodell.calculateUsageCost(tool: detailData)))")
                            .fontWeight(.medium)
                    }
                }
            }
            .frame(maxWidth: .greatestFiniteMagnitude)
            .padding(EdgeInsets(.init(top: 28.0, leading: 32.0, bottom: 38.0, trailing: 32.0)))
            .background(LinearGradient(gradient: Gradient(colors: [Color("background1"), Color("background2")]), startPoint: .top, endPoint: .center))
            .cornerRadius(24.0)
            .foregroundColor(.white)
            .fontWeight(.light)
            .shadow(color: Color("shadow"), radius: 28)
            
            Button{
                print("Button berhasil di klik")
                showingAlert = true
            } label: {
                HStack{
                    Image(systemName: "trash")
                    Text("Hapus")
                }.frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .fontWeight(.semibold)
            .padding()
            .foregroundColor(Color("button1"))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("button1"), lineWidth: 1)
            )
            
            Spacer()
        }
        .padding()
        .background{
            NavigationLink(destination: Home(budgetHomeViewmodel: budgetViewmodel, toolViewmodell: toolViewmodell).navigationBarHidden(true), isActive: $toNextScreen) {
                EmptyView()
            }
        }
        .alert(isPresented: $showingAlert){
            Alert(
                title: Text("Menghapus Data"),
                message: Text("Kamu yakin ingin menghapus informasi alat ini?"),
                primaryButton: .default(Text("Hapus")){
                    print("Menghapus....")
                    toolViewmodell.deleteTool(index: index)
                    showingAlert = false
                    toNextScreen = true
                },
                secondaryButton: .default(Text("Batalkan")){
                    showingAlert = false
                }
            )
        }
        .navigationTitle("Informasi Alat")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing:
                Button(action: {
                    isEdit.toggle()
                }, label: {
                     Text("Edit")
//                    Image(systemName: "square.and.pencil")
                })
        )
        .sheet(isPresented: $isEdit){
            EditScreen(addItem: $isEdit, toolViewmodell: toolViewmodell, index: index)
                .presentationDetents([.medium, .large])
                
        }
    }
}

func customFormat(_ number: Double) -> String  {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    
    let decimalValue = number.truncatingRemainder(dividingBy: 1)
    
    if (decimalValue == 0){
        formatter.minimumFractionDigits = 0
    } else {
        formatter.minimumFractionDigits = 2
    }
    
    let formattedString = formatter.string(from: NSNumber(value: number))!
    return formattedString
}

//struct DetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailScreen()
//    }
//}
