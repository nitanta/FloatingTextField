//
//  FloatingTextField.swift
//  FloatingTextField-Swiftui (iOS)
//
//  Created by ebpearls on 4/21/21.
//

import SwiftUI

typealias SeparatorStringFormat = (separator: String, chunk: Int, limit: Int)

struct FloatingTextField: View {
    let title: String
    
    @State var isSecureField = false
    @Binding var text: String
    @Binding var displayError: Error?
    
    var isPassworder: Bool = false
    var isPicker: Bool = false
    var formatting: SeparatorStringFormat? = nil
    
    var normalTextFont: Font = Font(UIFont.systemFont(ofSize: 14))
    var floatingTextFont: Font = Font(UIFont.systemFont(ofSize: 12))
    
    var errorColor: Color = Color.red
    var normalTextColor: Color = Color.black
    var floatingTextColor: Color = Color.gray
    var dividerColor: Color = Color.black
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .leading) {
                
                Text(title)
                    .font($text.wrappedValue.isEmpty ? normalTextFont : floatingTextFont)
                    .foregroundColor(displayError != nil ? errorColor : ($text.wrappedValue.isEmpty ? normalTextColor : floatingTextColor))
                    .offset(y: $text.wrappedValue.isEmpty ? 0 : -30)
                    .scaleEffect($text.wrappedValue.isEmpty ? 1 : 0.94, anchor: .leading)
                
                HStack {
                    
                    if !isSecureField {
                        if #available(iOS 14.0, *) {
                            
                            TextField("", text: $text)
                                .font(normalTextFont)
                                .foregroundColor(displayError != nil ? errorColor : normalTextColor)
                                .disabled(isPicker)
                                .onChange(of: text) { (value) in
                                    guard formatting != nil else { return }
                                    self.text = value.creditCardFormatting(separator: formatting!.separator, chunkSize: formatting!.chunk, limit: formatting!.limit)
                                }
                            
                        } else {
                            
                            TextField("", text: $text)
                                .font(normalTextFont)
                                .foregroundColor(displayError != nil ? errorColor : normalTextColor)
                                .disabled(isPicker)
                            
                        }
                    } else {
                        
                        SecureField("", text: $text)
                        .font(normalTextFont)
                        .foregroundColor(displayError != nil ? errorColor :normalTextColor)
                        
                    }
                    if isPassworder {
                        
                        Button(action: {
                            self.isSecureField.toggle()
                        }) {
                            Text(isSecureField ? Constants.show : Constants.hide)
                            .font(normalTextFont)
                            .foregroundColor(displayError != nil ? errorColor :floatingTextColor)
                        }
                        
                    }
                    
                    if isPicker {
                        
                        Button(action: {}) {
                            Image(systemName: "chevron.down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                                .frame(width: 20, height: 10, alignment: .center)
                                .foregroundColor(normalTextColor)
                        }
                        .disabled(isPicker)
                        
                    }
                }
            }
            .padding(.top, 15)
            .animation(nil)
            
            Divider()
                .frame(height: 2.0, alignment: .center)
                .background(displayError != nil ? errorColor : dividerColor)
            
            if displayError != nil {
                Text(verbatim: displayError!.localizedDescription)
                    .font(floatingTextFont)
                    .foregroundColor(errorColor)
            }
        }
    }
}

extension FloatingTextField {
   struct Constants {
       static let show = "SHOW"
       static let hide = "HIDE"
   }
}



#if DEBUG
struct FloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTextField(title: "Email", isSecureField: false, text: .constant(""), displayError: .constant(nil), isPassworder: false)
    }
}
#endif
