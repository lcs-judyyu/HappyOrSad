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

//limit textfield input length

private func textLimit(existingText: String?,
                       newText: String,
                       limit: Int) -> Bool {
    let text = existingText ?? ""
    let isAtLimit = text.count + newText.count <= limit
    return isAtLimit
}

struct ContentView: View {
    
    //MARK: Stored Properties
    @State private var textFieldData = ""
    
    @State private var showFeedback = false
    
    //MARK: Computed Properties
    var feedback: String {
        switch textFieldData {
        case "😉":
            return "Looks like you are feeling great! Glad to hear! 😉"
        case "😀", "😃", "😄", "😁", "😆":
            return "Having a good day? Yeahhhhh"
        default:
            return "Sorry, please enter a valid emoji. If you did, we are still working on providing feedback for every emoji. Thanks! 😊"
        }
    }
    
    //content
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            
            TextField("Enter An Emoji 😉 ☺️ 😆 😝", text: $textFieldData)
                .font(.title)
                .padding(10)
                .overlay(
                    // Add the outline
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.purple, lineWidth: 2.5)
                )
                .padding(.horizontal, 15)
            
            Button(action: {
                showFeedback.toggle()
                print("Buttom is pressed")
            }, label: {
                Text("Submit My Emoji")
                    .bold()
            })
                .buttonStyle(GrowingButton())
            
            if showFeedback {
                Text(feedback)
                    .font(.body)
                    .padding(15)
                    .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 4)
                        )
                    .background(Color.purple.opacity(0.3))
                    .padding(.horizontal, 20)
            }
//            if textFieldData == .isEmpty {
//                showFeedback.toggle()
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
