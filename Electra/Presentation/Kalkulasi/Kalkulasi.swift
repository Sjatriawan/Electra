    //
    //  Kalkulasi.swift
    //  Electra
    //
    //  Created by Sha Nia Siahaan on 07/04/23.
    //

import SwiftUI

struct Kalkulasi: View {
    @Binding var addItem: Bool
    @ObservedObject var toolViewModel: ToolViewModel
        //    @State var totalAppliance: Int = 0
        //    enum Days: String, CaseIterable, Identifiable {
        //        case Minggu, Senin, Selasa, Rabu, Kamis, Jumat, Sabtu
        //        var id: Self {self}
        //    }
        //    @State private var selectedDay: String = "Minggu"
        //    @State private var selectedDay: Days = .Minggu
    
        //    @State private var everyday = "Setiap hari"
        //    @State private var everyDay = "Setiap hari"
        //    @State private var selectedDay = "Se
        //    @State private var Days: [String] = [ "Setiap hari","Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"]
    @State private var name = ""
    @State private var quantity = ""
    @State private var power = ""
    @State private var usageTimePerHour = ""
    @State private var selectedDay = "1"
    @State private var totalDay: [String] = ["1", "2", "3", "4", "5", "6", "7"]
    
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
                            .overlay(
                                Divider()
                                    .background(Color("textFieldLineSeparator"))
                                    .offset(x: 0, y: 20)
                                    .frame(width: 212)
                            )
                            .keyboardType(.numberPad)
                    }
                    GridRow{
                        HStack(spacing: 5){
                            Text("Beban Alat")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Color("TextColor"))
                            
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 12))
                                .foregroundColor(Color("Box"))
                                .contextMenu{
                                    Text("Daya listrik yang digunakan agar alat elektronik menyala")
                                }
                        } .keyboardType(.numberPad)
                        HStack(spacing: 20){
                            TextField("Jumlah Watt", text: self.$power)
                                .font(.system(size: 15))
                                .keyboardType(.numberPad)
                            Text("Watt")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundColor(Color("TextColor"))
                        }
                        .overlay(
                            Divider()
                                .background(Color("textFieldLineSeparator"))
                                .offset(x: 0, y: 20)
                                .frame(width: 212)
                        )
                        
                    }
                    GridRow{
                        Text("Waktu")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color("TextColor"))
                        HStack{
                            TextField("Pemakaian (jam/hari)", text: self.$usageTimePerHour)
                                .font(.system(size: 15))
                                .keyboardType(.numberPad)
                            Text("jam/hari")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundColor(Color("TextColor"))
                        }
                        .overlay(
                            Divider()
                                .background(Color("textFieldLineSeparator"))
                                .offset(x: 0, y: 20)
                                .frame(width: 212)
                        )
                    }
                    GridRow{
                        Text("Hari")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color("TextColor"))
                        VStack{
                            HStack(spacing: 20){
                                NavigationLink(destination:
                                                NavigationStack{
                                    List{
                                        Picker("Pilih hari", selection: $selectedDay){
                                            ForEach(totalDay, id: \.self){ numberDay in
                                                Text(numberDay).tag(totalDay)
                                            }
                                        }
                                        .pickerStyle(.inline)
                                    }
                                }, label: {
                                    TextField("Pilih hari", text: $selectedDay)
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 15, weight: .medium))
                                        .disabled(true)
                                    
                                })
                                .foregroundColor(Color("TextColor"))
                                Text("hari/minggu")
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundColor(Color("TextColor"))
                            }
                        }
                        .overlay(
                            Divider()
                                .background(Color("textFieldLineSeparator"))
                                .offset(x: 0, y: 20)
                                .frame(width: 212)
                        )
                    }
                }
                Spacer()
            }
            .padding(35)
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Simpan"){
                        toolViewModel.addTool(
                            name: self.name,
                            quantity: Int(self.quantity) ?? 0,
                            power: Int(self.power) ?? 0,
                            usageTimePerHour: Int(self.usageTimePerHour) ?? 0,
                            repeatDays: Int(self.selectedDay) ?? 0
                        )
                        addItem.toggle()
                    }.padding(.top, 10)
                }
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Kalkulasi")
                        .foregroundColor(.black)
                        .font(.headline)
                        .padding(.top, 10)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
//
//struct Kalkulasi_Previews: PreviewProvider {
//    static var previews: some View {
//        Kalkulasi(addItem: , viewmodel: BudgetingViewModel())
//    }
//}
