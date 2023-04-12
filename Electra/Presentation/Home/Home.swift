//
//  ContentView.swift
//  Listrik
//
//  Created by Ghita Aulia Hidayat on 04/04/23.
//

import SwiftUI

struct Home: View {
    @State var addItem: Bool = false
    @ObservedObject var budgetHomeViewmodel: BudgetingViewModel
    @ObservedObject var toolViewmodell: ToolViewModel
    
    var body: some View {
        NavigationStack {
            TabView{
                VStack{
                    VStack(spacing: 22){
                        HStack{
                            Text("Atur Budgetmu")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                            NavigationLink {
                                BudgetingPlan()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 22, weight: .regular, design: .default))
                                    .foregroundColor(.white)
                            }
                        }
                        HStack{
                            VStack{
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Biaya listrikmu saat ini")
                                        .font(.system(size: 15, weight: .medium, design: .default))
                                        .foregroundColor(Color("IconTabBar"))
                                    HStack (alignment: .bottom){
                                        Text("Rp")
                                            .font(.system(size: 13, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                        Text("\(toolViewmodell.calculateTotalUsageCost())")
                                            .font(.system(size: 22, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                    }
                                    HStack(spacing: 3){
                                        Text("Sisa budget")
                                            .font(.system(size: 12, weight: .medium, design: .default))
                                            .foregroundColor(Color("IconTabBar"))
                                        Text("Rp.")
                                            .font(.system(size: 12, weight: .medium, design: .default))
                                            .foregroundColor(.white)
                                        Text("\(budgetHomeViewmodel.budgetingList[0].biaya - toolViewmodell.calculateTotalUsageCost())")
                                            .font(.system(size: 12, weight: .medium, design: .default))
                                            .foregroundColor(.white)
                                    }
                                    HStack(spacing: 3){
                                        Text("Sisa daya listrik")
                                            .font(.system(size: 12, weight: .medium, design: .default))
                                            .foregroundColor(Color("IconTabBar"))
                                        Text("73.3")
                                            .font(.system(size: 12, weight: .medium, design: .default))
                                            .foregroundColor(.white)
                                        Text("kWh")
                                            .font(.system(size: 12, weight: .medium, design: .default))
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                            }
                            
                            Spacer()
                            ProgressBar()
                        }
                        .frame(width: 328, height: 129)
                    }
                    .padding(.horizontal, 16.5)
                    .padding(.vertical, 64)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("ShadowBox1"), Color("ShadowBox2")]), startPoint: .top, endPoint: .center))
                    .cornerRadius(32)
                    .shadow(color: Color("Shadow"), radius: 24, x: 8, y: 2)
                    Spacer()
                        .frame(height: 38)
                    HStack{
                        Text("Peralatan Elektronik")
                            .font(.headline)
                            .foregroundColor(Color("TextColor"))
                        Spacer()
                        Button {
                            addItem.toggle()
                        } label: {
                            Text("Tambah")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 121, height: 44)
                                .background(Color("tambahButtonColor"))
                                .cornerRadius(12)
                        }
                        .sheet(isPresented: $addItem){
                            Kalkulasi(viewmodel: budgetHomeViewmodel, toolViewModel: toolViewmodell, addItem: $addItem)
                                .presentationDetents([.medium, .large])
                            
                        }
                    }
                    .padding(.horizontal, 32)
                    List{
                        ForEach(toolViewmodell.tools, id: \.self){ tool in
                            NavigationLink{
                                DetailScreen()
                            } label: {
                                HStack(spacing: 16){
                                    Text("\(tool.quantity)x")
                                        .font(.system(size: 12, weight: .medium, design: .default))
                                        .foregroundColor(Color("TextColor"))
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(tool.name)
                                            .font(.system(size: 15, weight: .medium, design: .default))
                                            .foregroundColor(Color("TextColor"))
                                        Text("\(tool.usageTimePerHour) jam/hari")
                                            .font(.caption)
                                            .italic()
                                            .foregroundColor(Color("TextColor"))
                                    }
                                    Spacer()
                                    Text("Rp. \(toolViewmodell.calculateUsagePerday(tool: tool))")
                                        .font(.system(size: 15, weight: .medium, design: .default))
                                        .foregroundColor(Color("TextColor"))
                                }
                                .listRowSeparator(.hidden)
                            }
                            
                        }
                        .listStyle(.plain)
                        .padding(16)
                    }
                    .edgesIgnoringSafeArea(.top)
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                            .onAppear(){
                                UITableView.appearance().separatorStyle = .none
                            }
                            .listStyle(.plain)
                            .padding(16)
                    }
                    Text("Info")
                        .tabItem{
                            Image(systemName: "questionmark.circle")
                            Text("Info")
                        }
                }
                .onAppear(){
                    UITabBar.appearance().isTranslucent = false
                    UITabBar.appearance().unselectedItemTintColor = UIColor(Color("IconTabBar"))
                }
                .accentColor(Color("Box"))
                .navigationTitle("")
            }
        }
    }
}

struct ProgressBar: View {
    var body: some View{
        ZStack{
            Circle()
                .stroke(
                    Color.white.opacity(0.55),
                    lineWidth: 14)
            Circle()
                .trim(from: 0, to: 0.45)
                .stroke(
                    Color("tambahButtonColor"), style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
            VStack{
                Text("45%")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                Text("60/133.3kWh")
                    .font(.system(size: 11, weight: .regular, design: .default))
                    .foregroundColor(.white)
            }
        }
    }
}

//struct ListContent: View{
//    @ObservedObject var toolViewmodell: ToolViewModel
//    var body: some View{
//        HStack(spacing: 16){
//            Text("")
//                .font(.system(size: 12, weight: .medium, design: .default))
//                .foregroundColor(Color("TextColor"))
//        }
//    }
//}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home( BudgetHomeViewmodel: BudgetingViewModel())
//    }
//}
