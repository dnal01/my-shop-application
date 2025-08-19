//  LogInView.swift
//  Store
//
//  Created by Denys Nalbat on 15.08.2025.
//

import SwiftUI
import SwiftData
// realisation of View and SwiftUI allows to use canvas

struct LogInView: View {
    @Bindable var logInValidator: LogInValidator
    
    var body: some View {
        VStack {
            Text("Log in")
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
            Group {
                TextField(text: $logInValidator.email) {
                    Text("Email")
                }
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)

                SecureField(text: $logInValidator.password) {
                    Text("Password")
                }
            }
            .padding()
            .background(.background)
            .clipShape(.rect(cornerRadius: 4))

            NavigationView {
                VStack {
                    NavigationLink(destination: HomeView()) {
                        Button {
                        } label: {
                            Text("Log in")
                                .bold()
                        }
                        .disabled(logInValidator.isSubmitButtonDisabled)
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(4)
    }
}

#Preview {
    @Previewable @State var logInValidator = LogInValidator()
    
    LogInView(logInValidator: logInValidator)
}
