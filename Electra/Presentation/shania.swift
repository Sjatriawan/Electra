//
//  shania.swift
//  Electra
//
//  Created by Sha Nia Siahaan on 11/04/23.
//

import SwiftUI

struct shania: View {
    @State private var hari = "Setiap hari"
    var hari2: [String] = ["Setiap hari", "Senin", "Selasa", "Rabu"]
    var body: some View {
        NavigationStack{
            List{
                Picker("pick", selection: $hari){
                    ForEach(0...3, id: \.self){ i in
                        Text("\(hari2[i])").tag(hari2[i])
                    }
                }
                .pickerStyle(.inline)
            }
            
        }
    }
}

struct shania_Previews: PreviewProvider {
    static var previews: some View {
        shania()
    }
}
