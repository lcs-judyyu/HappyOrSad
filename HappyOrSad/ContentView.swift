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

//func textField(_ textField: UITextField,
//               shouldChangeCharactersIn range: NSRange,
//               replacementString string: String) -> Bool {
//    return self.textLimit(existingText: textField.text,
//                          newText: string,
//                          limit: 1)
//}

struct ContentView: View {
    
    //MARK: Stored Properties
    @State private var textFieldData = ""
    
    //MARK: Computed Properties
    var feedback: String {
        if textFieldData == "" {
            return ""
        } else if textFieldData == "😉" {
            return "Looks like you are feeling great! Glad to hear! 😉"
        } else {
            return "Sorry, please enter a valid emoji. If you did, we are still working on providing feedback for every emoji. Thanks! 😊"
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            
            TextField("Enter An Emoji 😉 ☺️ 😆 😝", text: $textFieldData)
                .font(.title)
                .padding(10)
                .overlay(
                    // Add the outline
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.purple, lineWidth: 2)
                )
                .padding(.horizontal, 15)
            
            Button(action: {
                print("Button was pressed")
            }, label: {
                Text("Submit My Emoji")
                    .bold()
            })
                .buttonStyle(GrowingButton())
            
            Text(feedback)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
