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
    @State private var precioString:String = ""
    @State private var precioFloat:Float = 0.0
    @EnvironmentObject private var authModel: AuthViewModel
    //@State private var product = Producto()
    @State private var productosFB : [Producto] = []
    @ObservedObject private var productosVM = ProductosViewModel()
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("AGREGAR PRODUCTOS NUEVOS")
            .padding()
            HStack{
                Text("Nombre del producto")
                TextField("Nombre", text: $nombreProducto)
                Spacer()
            }.padding([.bottom,.leading])
            HStack{
                Text("Descripción del producto")
                TextField("Características", text: $descrProducto)
                Spacer()
            }.padding(.leading)
            HStack{
                Text("Precio")
                TextField("Precio:", text: $precioString)
                    .keyboardType(.decimalPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: precioString) { newValue in
                        let filtered = newValue.filter { "0123456789.".contains($0) }
                        if filtered != newValue {
                            self.precioString = filtered
                        }
                    }
                Spacer()
            }.padding(.leading)
            //padding()
            Button(action: {
                precioFloat = Float(precioString) ?? 0.0
                let user = authModel.user?.email ?? ""
                let product = Producto(nombre:nombreProducto,caracteristicas: descrProducto,precio: precioFloat,usuarioE: user)
                productosVM.agregarProducto(producto: product)
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
