//
//  CreateAccountView.swift
//  Store
//
//  Created by Denys Nalbat on 15.08.2025.
//

import SwiftUI
import SwiftData
// realisation of View and SwiftUI allows to use canvas

struct CreateAccountView: View {
    @Bindable var userValidator: UserValidator
    
    var body: some View {
        VStack {
            Text("Create Account")
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
            Group {
                TextField(text: $userValidator.name) {
                    Text("Name")
                }
                .autocorrectionDisabled()
                .textInputAutocapitalization(.words)
                
                TextField(text: $userValidator.email) {
                    Text("Email")
                }
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                
                SecureField(text: $userValidator.password) {
                    Text("Password")
                }
            }
            .padding()
            .background(.background)
            .clipShape(.rect(cornerRadius: 4))
            
            
            Button {
                print(
                )
            } label: {
                Text("Create Account")
                    .bold()
            }
            .disabled(userValidator.isSubmitButtonDisabled)
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(4)
    }
}

#Preview {
    @Previewable @State var userValidator = UserValidator()
    
    CreateAccountView(userValidator: userValidator)
}
