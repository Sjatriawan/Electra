//
//  shania.swift
//  Electra
//
//  Created by Sha Nia Siahaan on 11/04/23.
//

import SwiftUI

struct shania: View {
    @Binding var addItem: Bool
    @State private var inputUnit: String = ""
    enum units{
        case Watt, Ampere, kiloWatt
    }
    
//    @State private var unitss: [String] = ""
//    @State private var selectedUnit: units = .Watt
    @State private var selectedUnit: String = "W"
    var unitsSymbol: [String] = ["W", "A", "kWh"]
    @State private var unitKosong: [String] = []
    
    var body: some View {
        NavigationStack{
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
                        TextField("Nama alat elektronik", text: .constant(""))
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
                        TextField("Banyaknya alat elektronik", text: .constant(""))
//                        TextField("Banyaknya alat elektronik", value: $totalAppliance, formatter: NumberFormatter())
                            .font(.system(size: 15))
                            .overlay{
                                Divider()
                                    .background(Color("textFieldLineSeparator"))
                                    .offset(x: 0, y: 20)
                                    .frame(width: 212)
                            }
                    }
                    GridRow{
                        Text("Beban Alat")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color("TextColor"))
                        HStack{
                            TextField("Beban (Watt/V/A)", text: $inputUnit)
                                .font(.system(size: 15))
                                .overlay{
                                    Divider()
                                        .background(Color("textFieldLineSeparator"))
                                        .rotationEffect(.degrees(90))
                                        .offset(x: 0, y: 20)
                                        .frame(height: 145)
                                }
                            
//                            Picker("Pilih satuan", selection: $selectedUnit){
//                                ForEach(units.allCases){ unit in
//                                    Text(unit.rawValue)
//                                }
//                            }
                            
//                            Picker(
//                                selection: .constant(1),
//                                label: Text("select unit"),
//                                content: {
//                                    Text("Watt").tag(1)
//                                    Text("Volt").tag(2)
//                                })
//                            Picker("Please choose a unit",
//                                   selection: $selectedUnit){
//                                ForEach(unitsSymbol,
//                                        id: \.self){
//                                    Text($0)
//                                }
//
//                            }
//                            .pickerStyle()
                        }
                        
                    }
                    GridRow{
                        Text("Waktu")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color("TextColor"))
                        TextField("Pemakaian (jam/hari)", text: .constant(""))
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
                        TextField("Setiap hari/tertentu", text: .constant(""))
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
                    Button("Simpan"){
                        print("saved")
                    }
                }
            }
        }    }
}

struct shania_Previews: PreviewProvider {
    static var previews: some View {
        shania(addItem: .constant(false))
    }
}
