//
//  ContentView.swift
//  HappyOrSad
//
//  Created by Judy Yu on 2021-12-06.
//

import SwiftUI

//MARK: Functions
//button style
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView: View {
    
    //MARK: Stored Properties
    @State private var textFieldData = ""
    
    
    var body: some View {
        VStack {
            
            TextField("Enter An Emoji😉☺️😆", text: $textFieldData)
             .font(Font.system(size: 27, design: .monospaced))
             .padding(10)
             .overlay(
             // Add the outline
            RoundedRectangle(cornerRadius: 8)
             .stroke(Color.purple, lineWidth: 2)
             )
             .padding(.horizontal, 15)
             .padding(.bottom, 25)
            
            Button(action: {
                print("Button was pressed")
            }, label: {
                Text("Submit My Emoji")
                    .bold()
            })
                .buttonStyle(GrowingButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
