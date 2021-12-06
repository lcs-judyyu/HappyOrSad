//
//  ContentView.swift
//  HappyOrSad
//
//  Created by Judy Yu on 2021-12-06.
//

import SwiftUI

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
    var body: some View {
        VStack {
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
