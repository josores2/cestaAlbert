//
//  ContentView.swift
//  cesta de la compra
//
//  Created by Jose on 15/5/24.
//

import SwiftUI

struct Inicio: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
    NavigationView{
        VStack{
            NavigationLink(destination: crearProductosView().environmentObject(authModel)){
                Text("CREAR PRODUCTOR NUEVOS")
            }
            //.padding()
            Image("logocesta")
                .resizable()
                .aspectRatio(contentMode: .fit)
            NavigationLink(destination: HacerLaCompraView().environmentObject(authModel)){
                Text("HACER LA COMPRA")
            }
            //.padding()
        }
    }//Fin NavigationView
    }
}

struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio()
    }
}
