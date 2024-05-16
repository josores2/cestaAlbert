//
//  ContentView.swift
//  cesta de la compra
//
//  Created by Jose on 15/5/24.
//

import SwiftUI

struct Inicio: View {
    var body: some View {
    NavigationView{
        VStack{
            NavigationLink(destination: crearProductosView()){
                Text("CREAR PRODUCTOR NUEVOS")
            }
            .padding()
            Image("logocesta")
                .resizable()
                .aspectRatio(contentMode: .fit)
            NavigationLink(destination: HacerLaCompraView()){
                Text("HACER LA COMPRA")
            }
            .padding()
        }
    }//Fin NavigationView
    }
}

struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio()
    }
}
