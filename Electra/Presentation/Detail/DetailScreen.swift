//
//  DetailScreen.swift
//  Electra
//
//  Created by Rival Fauzi on 05/04/23.
//

import SwiftUI

struct DetailScreen: View {
    @State private var showingAlert = false
    let nama: String = "Kulkas Mini"
    let jumlah: Int = 1
    let watt: Double = 80
    let ampere: Double = 0.36
    let volt: Double = 220
    let waktu: Int = 24
    let hari: Int = 30
    let whPerHari: Double = 1920
    let kwhPerHari: Double = 1.92
    let biayaPerHari: Double = 2880
    let whPerBulan: Double = 57600
    let kwhPerBulan: Double = 57.6
    let biayaPerBulan: Double = 86400
    
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                VStack(spacing: 10){
                    Text(nama)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .fontWeight(.semibold)
                    VStack(spacing: 3){
                        HStack{
                            Text("Jumlah")
                            Spacer()
                            Text("\(jumlah)")
                                .fontWeight(.medium)
                        }
                        HStack{
                            Text("Watt")
                            Spacer()
                            Text(customFormat(watt)+" W")
                                .fontWeight(.medium)
                        }
                        HStack{
                            Text("    Ampere")
                            Spacer()
                            Text(ampere == 0 ? "-": "\(customFormat(ampere)) A")
                                .fontWeight(.medium)
                        }
                        HStack{
                            Text("    Volt")
                            Spacer()
                            Text(volt == 0 ? "-": "\(customFormat(volt)) V")
                                .fontWeight(.medium)
                        }
                        HStack{
                            Text("Waktu")
                            Spacer()
                            Text("\(waktu) jam/hari")
                                .fontWeight(.medium)
                        }
                        HStack{
                            Text("Hari")
                            Spacer()
                            Text("\(hari) hari")
                                .fontWeight(.medium)
                        }
                    }
                    Rectangle()
                        .frame(height: 0.5, alignment: .bottom)
                    
                    VStack(spacing: 3){
                        HStack{
                            Text("Wh/hari")
                            Spacer()
                            Text("\(customFormat(whPerHari)) Wh")
                                .fontWeight(.medium)
                        }
                        HStack{
                            Text("kWh/hari")
                            Spacer()
                            Text("\(customFormat(kwhPerHari)) kWh")
                                .fontWeight(.medium)
                        }
                        HStack{
                            Text("Biaya/hari")
                                .fontWeight(.regular)
                            Spacer()
                            Text("Rp \(customFormat(biayaPerHari))")
                                .fontWeight(.medium)
                        }
                    }
                    
                    Rectangle()
                        .frame(height: 0.5, alignment: .bottom)
                    
                    VStack(spacing: 3){
                        HStack{
                            Text("Wh/bulan")
                            Spacer()
                            Text("\(customFormat(whPerBulan)) Wh")
                                .fontWeight(.medium)
                        }
                        HStack{
                            Text("kWh/bulan")
                            Spacer()
                            Text("\(customFormat(kwhPerBulan)) kWh")
                                .fontWeight(.medium)
                        }
                        HStack{
                            Text("Biaya/bulan")
                                .fontWeight(.regular)
                            Spacer()
                            Text("Rp \(customFormat(biayaPerBulan))")
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
            .alert(isPresented: $showingAlert){
                Alert(
                    title: Text("Menghapus Data"),
                    message: Text("Kamu yakin ingin menghapus informasi alat ini?"),
                    primaryButton: .destructive(Text("Hapus")){
                        print("Menghapus....")
                        // Fungsi untuk menghapus
                        showingAlert = false
                    },
                    secondaryButton: .default(Text("Batalkan")){
                        showingAlert = false
                    }
                )
            }
            .navigationTitle("Informasi Alat")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    NavigationLink(destination: SettingUp(), label: {
                        Image(systemName: "chevron.left")
                    })
//                    Button(action: {
//                        // Handle back button action
//                    }, label: {
//                        Image(systemName: "chevron.left")
//                        // Text("Kembali")
//                    })
                ,
                trailing: Button(action: {
                    // Handle edit button action
                }, label: {
                    // Text("Edit")
                    Image(systemName: "square.and.pencil")
                })
            )
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

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
