//
//  AccountView.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                        
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header : Text("Requests")){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .tint(.brandPrimary)
            }
            .navigationTitle("😊 Account")
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
        
    }
}

#Preview {
    AccountView()
}
