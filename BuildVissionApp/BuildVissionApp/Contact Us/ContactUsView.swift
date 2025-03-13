//
//  ContactUs.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-03-11.
//

import SwiftUI

struct ContactUsView: View {
    
    // State variables for form data
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var emailAddress: String = ""
    @State private var company: String = ""
    @State private var message: String = ""
    // State variable to control the display of the alert
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    // Success message
    private let successMessage = "Your request was submitted successfully!"
    
    var body: some View {
        ZStack {
            Color(red: 39/255, green: 37/255, blue: 37/255)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                HeaderSection()
                    .padding(.bottom, -20)
                
                ScrollView {
                    BannerSection()
                    
                    // Main content
                    Text("Request a Free Demo")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    
                    Text("Connect with one of our product experts for a free,\n custom demo to see if Spectrum is right for you.")
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    // Form fields
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("First Name:", text: $firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 5)
                        
                        TextField("Last Name:", text: $lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 5)
                        
                        TextField("Phone Number:", text: $phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 5)
                        
                        TextField("Email Address", text: $emailAddress)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 5)
                        
                        TextField("Company", text: $company)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 5)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            // Label for the message field
                            Text("Your Message:")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.leading, 5)
                            
                            TextEditor(text: $message)
                                .padding(.horizontal, 5)
                                .frame(minHeight: 300, maxHeight: .infinity) // Adjusted height for the TextEditor
                                .cornerRadius(10) // Rounded corners
                                .overlay(
                                    Group {
                                        if message.isEmpty {
                                            Text("Enter your message here...")
                                                .font(.body)
                                                .foregroundColor(.gray)
                                                .padding(.top, 10)
                                                .padding(.leading, 10)
                                        }
                                    },
                                    alignment: .topLeading // Align the placeholder text
                                )
                        }
                    }
                    
                    // Submit button
                    Button(action: {
                        validateFormField()
                    }) {
                        Text("SUBMIT")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, maxHeight: 50)  // Set the max height and stretch the width
                            .background(Color(red: 0.85, green: 0.56, blue: 0.0))  // Button background color
                            .cornerRadius(10)  // Rounded corners for the button
                    }
                    .padding(.horizontal, 5)  // Horizontal padding for width control
                    .padding(5) // Padding for the button
                    
                    FooterView()
                }
            }
        }
        
        // Alert view that shows when showAlert is true
    .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertMessage == successMessage ? "Success" : "Error"), // alert title - ternery condition
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")){
                    clearFormFields()
                }
            )
        }
    }
    
    //Function to Clear Form Fields
        private func clearFormFields() {
            if alertMessage == successMessage {
                firstName = ""
                lastName = ""
                phoneNumber = ""
                emailAddress = ""
                company = ""
                message = ""
            }
        }

    
    // Function to validate form fields
    private func validateFormField() {
        if firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty || emailAddress.isEmpty || company.isEmpty || message.isEmpty {
            alertMessage = "Please fill up the form correctly"
        } else {
            alertMessage = successMessage
            
        }
        
        showAlert = true
    }
}

#Preview {
    ContactUsView()
}


/*
 
 private func validateFormField() {
         if firstName.isEmpty {
             alertMessage = "Please enter your first name"
         } else if lastName.isEmpty {
             alertMessage = "Please enter your last name"
         } else if phoneNumber.isEmpty {
             alertMessage = "Please enter your phone number"
         } else if emailAddress.isEmpty {
             alertMessage = "Please enter your email address"
         } else if company.isEmpty {
             alertMessage = "Please enter your company name"
         } else if message.isEmpty {
             alertMessage = "Please enter your message"
         } else {
             alertMessage = "Your request was submitted successfully!"
         }
         showAlert = true
     }

 */
