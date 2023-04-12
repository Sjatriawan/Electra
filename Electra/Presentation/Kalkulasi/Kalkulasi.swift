//
//  Kalkulasi.swift
//  Electra
//
//  Created by Sha Nia Siahaan on 07/04/23.
//

import SwiftUI

struct Kalkulasi: View {
    @ObservedObject var viewmodel: BudgetingViewModel
    @ObservedObject var toolViewModel: ToolViewModel
    @Binding var addItem:Bool
    @State private var isPresented = false
    @State private var name = ""
    @State private var quantity = ""
    @State private var power = ""
    @State private var usageTimePerHour = ""
    @State private var repeatDays = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                    .frame(height: 20)
                Grid(alignment: .leading,
                     horizontalSpacing: 35,
                     verticalSpacing: 44
                ){
                    GridRow{
                        Text("Nama Alat")
                            .foregroundColor(Color("TextColor"))
                            .font(.system(size: 15, weight: .medium))
                        TextField("Nama alat elektronik", text: self.$name)
                            .font(.system(size: 15))
                            .overlay{
                                Divider()
                                    .background(Color("textFieldLineSeparator"))
                                    .offset(x: 0, y: 20)
                                    .frame(width: 212)
                            }
                    }
                    GridRow{
                        Text("Jumlah")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color("TextColor"))
                        TextField("Banyaknya alat elektronik", text: self.$quantity)
                            .font(.system(size: 15))
                            .overlay{
                                Divider()
                                    .background(Color("textFieldLineSeparator"))
                                    .offset(x: 0, y: 20)
                                    .frame(width: 212)
                            }
                    }
                    GridRow{
                        HStack {
                            Text("Beban Alat")
                                .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color("TextColor"))
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 12))
                                .foregroundColor(Color("Box"))
                                .contextMenu{
                                        Text("Daya listrik yang digunakan agar alat elektronik menyala")
                                }
                        }
                        TextField("Watt/Kilowatt/Ampere", text: self.$power)
                            .font(.system(size: 15))
                            .overlay{
                                Divider()
                                    .background(Color("textFieldLineSeparator"))
                                    .offset(x: 0, y: 20)
                                    .frame(width: 212)
                            }
                    }
                    GridRow{
                        Text("Waktu")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color("TextColor"))
                        TextField("Pemakaian (jam/hari)", text: self.$usageTimePerHour)
                            .font(.system(size: 15))
                            .overlay{
                                Divider()
                                    .background(Color("textFieldLineSeparator"))
                                    .offset(x: 0, y: 20)
                                    .frame(width: 212)
                            }
                    }
                    GridRow{
                        Text("Hari")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color("TextColor"))
                        TextField("Setiap hari/tertentu", text: self.$repeatDays)
                            .font(.system(size: 15))
                            .overlay{
                                Divider()
                                    .background(Color("textFieldLineSeparator"))
                                    .offset(x: 0, y: 20)
                                    .frame(width: 212)
                            }
                    }
                }
                Spacer()
            }
            .padding(35)
            .navigationTitle("Kalkulasi")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button(action: {
                        toolViewModel.addTool(
                            name: self.name,
                            quantity: Int(self.quantity) ?? 0,
                            power: Int(self.power) ?? 0,
                            usageTimePerHour: Int(self.usageTimePerHour) ?? 0,
                            repeatDays: Int(self.repeatDays) ?? 0
                        )
                        self.addItem.toggle()
                    }) {
                        Text("Add Tool")
                    }
                }
            }
        }
        
    }
}
//
//struct Kalkulasi_Previews: PreviewProvider {
//    static var previews: some View {
//        Kalkulasi(addItem: , viewmodel: BudgetingViewModel())
//    }
//}
