//
//  ContentView.swift
//  Shared
//
//  Created by ebpearls on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            
            VStack(spacing: 10) {
                
                Group {
                    FloatingTextField(title: "Email", isSecureField: false, text: .constant(""), displayError: .constant(nil), isPassworder: false)
                    
                    FloatingTextField(title: "Email with data", isSecureField: false, text: .constant("abc@getnada.com"), displayError: .constant(nil), isPassworder: false)
                    
                    FloatingTextField(title: "Email with error", isSecureField: false, text: .constant("abc@getnada.com"), displayError: .constant(NSError(domain: "", code: 413, userInfo: [NSLocalizedDescriptionKey: "Incorrect email"])), isPassworder: false)
                }
                
                Spacer()
                
                
                Group {
                    
                    FloatingTextField(title: "Password", isSecureField: false, text: .constant(""), displayError: .constant(nil), isPassworder: true)
                    
                    FloatingTextField(title: "Password with data", isSecureField: true, text: .constant("password"), displayError: .constant(nil), isPassworder: true)
                    
                    FloatingTextField(title: "Password with error", isSecureField: true, text: .constant("password"), displayError: .constant(NSError(domain: "", code: 413, userInfo: [NSLocalizedDescriptionKey: "Incorrect password"])), isPassworder: true)
                }
                
                Spacer()

                
                Group {
                    FloatingTextField(title: "Picker", isSecureField: false, text: .constant(""), displayError: .constant(nil), isPassworder: false, isPicker: true)
                    
                    FloatingTextField(title: "Picker with data", isSecureField: false, text: .constant("Picked"), displayError: .constant(nil), isPassworder: false, isPicker: true)
                    
                    FloatingTextField(title: "Picker with error", isSecureField: false, text: .constant("Picked"), displayError: .constant(NSError(domain: "", code: 413, userInfo: [NSLocalizedDescriptionKey: "No such values"])), isPassworder: false, isPicker: true)
                }
                
                Spacer()

                
                Group {
                    FloatingTextField(title: "Formatting field", isSecureField: false, text: .constant(""), displayError: .constant(nil), isPassworder: false, formatting: (separator: "-", chunk: 4, limit: 19))
                    
                    FloatingTextField(title: "Formatting field", isSecureField: false, text: .constant("4242424242424242"), displayError: .constant(nil), isPassworder: false, formatting: (separator: "-", chunk: 4, limit: 19))
                    
                    FloatingTextField(title: "Formatting field", isSecureField: false, text: .constant("4242424242424242"), displayError: .constant(NSError(domain: "", code: 413, userInfo: [NSLocalizedDescriptionKey: "Formatting issue"])), isPassworder: false, formatting: (separator: "-", chunk: 4, limit: 19))
                }
                
                Spacer()

                
                Group {
                    FloatingTextField(
                        title: "Custom field",
                        isSecureField: false,
                        text: .constant("Test data"),
                        displayError: .constant(nil),
                        normalTextFont: Font(UIFont.systemFont(ofSize: 20)),
                        floatingTextFont: Font(UIFont.systemFont(ofSize: 16)),
                        errorColor: Color.green,
                        normalTextColor: Color.blue,
                        floatingTextColor: Color.orange,
                        dividerColor: Color.blue
                    )
                    
                }
                
                Spacer()
                
            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
