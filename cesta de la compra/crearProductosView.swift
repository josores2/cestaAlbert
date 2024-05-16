//
//  crearProductosView.swift
//  cesta de la compra
//
//  Created by Jose on 15/5/24.
//

import SwiftUI

struct crearProductosView: View {
    
    @State private var nombreProducto:String = ""
    @State private var descrProducto:String = ""
    //@State private var product = Producto
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("AGREGAR PRODUCTOS NUEVOS")
            .padding()
            HStack{
                Text("Nombre del producto:")
                TextField("Nombre", text: $nombreProducto)
                Spacer()
            }.padding([.bottom,.leading])
            HStack{
                Text("Descripción del producto:")
                TextField("Características", text: $descrProducto)
                Spacer()
            }.padding(.leading)
            //padding()
            Button(action: {
                //product.nombre = nombreProducto
               // product.caracteristicas = descrProducto
                //print(product)
            }) {
                Text("AGREGAR PRODUCTO")
            }
            Spacer()
        }
    }
}

struct crearProductosView_Previews: PreviewProvider {
    static var previews: some View {
        crearProductosView()
    }
}
