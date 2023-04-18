//
//  EditScreen.swift
//  Electra
//
//  Created by Rival Fauzi on 12/04/23.
//

import SwiftUI

struct EditScreen: View {
    @Binding var addItem: Bool
    @ObservedObject var toolViewmodell: ToolViewModel
    @State var index: Int
    @State private var name = ""
    @State private var quantity = ""
    @State private var power = ""
    @State private var usageTimePerHour = ""
    @State private var selectedDay = "1"
    @State private var selectedDayChange: Bool = false
    @State private var totalDay: [String] = ["1", "2", "3", "4", "5", "6", "7"]
    @State private var isPicker: Bool = false
    
    func addValue() {
        let getDetailData = toolViewmodell.getDetail(index: index)
        name = getDetailData.name
        quantity = String(getDetailData.quantity)
        power = String(getDetailData.power)
        usageTimePerHour = String(getDetailData.usageTimePerHour)
        
        if (!selectedDayChange) {
            selectedDay = String(getDetailData.repeatDays)
        } else {
            selectedDay = self.selectedDay
        }
    }
    
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
                            .keyboardType(.numberPad)
                            .overlay(
                                Divider()
                                    .background(Color("textFieldLineSeparator"))
                                    .offset(x: 0, y: 20)
                                    .frame(width: 212)
                            )
                    }
                    GridRow{
                        HStack(spacing: 5){
                            Text("Beban Alat")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Color("TextColor"))
                                .keyboardType(.numberPad)
                            
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 12))
                                .foregroundColor(Color("Box"))
                                .contextMenu{
                                    Text("Daya listrik yang digunakan agar alat elektronik menyala")
                                }
                        }
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
                                .disabled(true)
                                .onChange(of: usageTimePerHour) { newValue in
                                    if(Int(newValue) ?? 0 > 24){
                                        usageTimePerHour = "24"
                                    } else if (Int(newValue) ?? 0 < 0) {
                                        usageTimePerHour = ""
                                    }
                                }
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
                        
                        HStack(spacing: 20){
                            TextField("Pilih hari", text: self.$selectedDay)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 15, weight: .medium))
                                .onTapGesture {
                                    isPicker.toggle()
                                }
                            .foregroundColor(Color("TextColor"))
                            
                            Text("hari/minggu")
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
                }
                Spacer()
            }
            .padding(35)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Simpan"){
                        toolViewmodell.editTool(
                            index: index,
                            name: self.name,
                            quantity: Int(self.quantity) ?? 0,
                            power: Int(self.power) ?? 0,
                            usageTimePerHour: Int(self.usageTimePerHour) ?? 0,
                            repeatDays: Int(self.selectedDay) ?? 0
                        )
                        addItem.toggle()
                    }
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
            .onAppear{
                addValue()
            }
            .sheet(isPresented: $isPicker) {
                PickerView(selectedDay: $selectedDay, totalDay: $totalDay, selectedDayChange: $selectedDayChange, isPicker: $isPicker)
            }
            .animation(nil, value: 0)
        }
    }
}

struct PickerView: View {
    @Binding var selectedDay: String
    @Binding var totalDay: [String]
    @Binding var selectedDayChange: Bool
    @Binding var isPicker: Bool
    
    @State private var offset: CGFloat = 0
    var body: some View{
        List{
            Picker("Pilih hari", selection: $selectedDay){
                ForEach(totalDay, id: \.self){ numberDay in
                    Text(numberDay).tag(totalDay)
                }
            }
            .onChange(of: selectedDay, perform: { newValue in
                if(newValue != selectedDay) {
                    selectedDayChange.toggle()
                }
                isPicker.toggle()
            })
            .pickerStyle(.inline)
        }
        .animation(nil, value: offset)
    }
}

//struct EditScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        EditScreen(addItem: .constant(false))
//    }
//}
