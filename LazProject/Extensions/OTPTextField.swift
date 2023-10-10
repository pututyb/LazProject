//
//  OTPTextField.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 21/09/23.
//

import SwiftUI

struct OTPTextField: View {
    
    @Binding var otp: String
    
    /// - Keyboard State
    @FocusState private var isKeyboardShowing: Bool
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<4, id: \.self) { index in
                    OTPBox(index)
                }
            }
            .background(content: {
                TextField("", text: $otp.limit(4))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            })
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardShowing.toggle()
            }
            .padding(.bottom)
            .padding(.top)
        }
        .padding(.all)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    // MARK: OTP Text Box
    @ViewBuilder
    func OTPBox(_ index: Int) -> some View {
        ZStack {
            if otp.count > index {
                //Find char at Index
                let startIndex = otp.startIndex
                let charIndex = otp.index(startIndex, offsetBy: index)
                let charToString = String(otp[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 77, height: 98)
        .background {
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(.gray, lineWidth: 1)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OTPTextField(otp: .constant("1234"))
}


// MARK: Binding <String> Extension
extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
