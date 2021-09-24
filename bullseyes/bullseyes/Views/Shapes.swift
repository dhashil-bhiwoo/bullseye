//
//  Shapes.swift
//  bullseyes
//
//  Created by Dhashil Bhiwoo on 25/08/2021.
//

import SwiftUI

struct Shapes: View {
    
    @State private var wideShapes = true
    var body: some View {
        VStack{
            if !wideShapes {
            Circle()
                //.fill(Color.blue)
                //.inset(by: 10.0)
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width:200.0, height:100.0)
                .transition(.scale)
                .animation(.linear)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100.0, height:100.0)
                //.animation(.linear)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100.0, height:100.0)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100.0, height:100.0)
            
            Button(action: {
                withAnimation{
                    wideShapes.toggle()
                }
            }) {
                Text("Animate!")
            }
        }
        .background(Color.green)
        
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
