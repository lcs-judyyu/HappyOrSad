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

class TextFieldManager: ObservableObject {
    
    let characterLimit = 1
    
    @Published var userInput = "" {
        didSet {
            if userInput.count > characterLimit {
                userInput = String(userInput.prefix(characterLimit))
            }
        }
    }
}

struct ContentView: View {
    
    //MARK: Stored Properties
    @State private var textFieldData = ""
    
    @State private var showFeedback = false
    
    @ObservedObject var textFieldManager = TextFieldManager()
    
    //MARK: Computed Properties
    
    var feedback: String {
        switch textFieldData {
        case "😉", "☺️", "😋", "😛", "😝":
            return "Looks like you are feeling great! Glad to hear!"
        case "😀", "😃", "😄", "😁", "😆":
            return "Having a good day? Yeahhhhh"
        case "😢", "😭", "🙁", "☹️":
            return "Sorry to hear that you are sad. Consider reaching out to a friend, just to talk."
        case "😤", "😠", "😡", "🤬", "🤯":
            return "Oh no, too much to handle in life? Take a break, get some sleep or have your favourite treat might help."
        case "😷":
            return "Yeah... Masks can be annoying to wear sometimes, but it keeps you safe from the viruses!"
        case "🤢", "🤮", "🤧", "🤒", "🤕":
            return "Sorry to hear that you are feeling sick. Rest more and you will get better soon!"
        case "😍", "🥰", "😘", "😗", "😙":
            return "❤️❤️❤️"
        case "🥱", "😴":
            return "I got you... Consider taking a short nap. It helps a lot!"
        case "😣", "😖", "😫", "😩":
            return "Sorry to hear that you are sad. Try to grab something write with – then describe what's happening. Sometimes writing down why we are feeling sad can make us feel better :)"
        default:
            return "Sorry, please enter a valid emoji. If you did, we are still working on providing feedback for every emoji. Thanks! 😊"
        }
    }
    
    //content
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            
            TextField("Enter An Emoji 😉 ☺️ 😆", text:$textFieldData)
                .font(.title)
                .padding(10)
                .keyboardType(UIKeyboardType.default)
                .overlay(
                    // Add the outline
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.purple, lineWidth: 2.5)
                )
                .padding(.horizontal, 25)
            
            Button(action: {
                showFeedback.toggle()
            }, label: {
                Text("Submit My Emoji")
                    .bold()
            })
                .buttonStyle(GrowingButton())
                .disabled(textFieldData.isEmpty)
            
            if showFeedback {
                Text(feedback)
                    .font(.body)
                    .padding(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 3)
                    )
                    .background(Color.purple.opacity(0.3))
                    .padding(.horizontal, 20)
                    .animation(Animation.easeIn(duration: 1.0), value: showFeedback)
                    .onTapGesture {
                        showFeedback.toggle()
                    }
            }
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
