//
//  Kalkulasi.swift
//  Electra
//
//  Created by Sha Nia Siahaan on 07/04/23.
//

import SwiftUI

struct Kalkulasi: View {
    @Binding var addItem: Bool
    @ObservedObject var viewmodel: BudgetingViewModel
    
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
                        TextField("Watt/Kilowatt/Ampere", text: .constant(""))
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
        }
        
    }
}

struct Kalkulasi_Previews: PreviewProvider {
    static var previews: some View {
        Kalkulasi(addItem: .constant(false), viewmodel: BudgetingViewModel())
    }
}
