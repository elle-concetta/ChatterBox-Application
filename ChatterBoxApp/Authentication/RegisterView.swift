// Elizabeth Fassler

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email: String = ""
    @State private var password: String = ""

    
    
    var body: some View {
        
        VStack {
            //--------------------------------------------
            // Location 1
            Text("New Account")
                .font(.largeTitle)
            
            Spacer()
            
            //--------------------------------------------
            // Email Field
            //--------------------------------------------
            // Location 2
            HStack {
                
                Image(systemName: "mail")
                    .foregroundColor(.gray)
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                
                if(email.count != 0) {
                    Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                        .frame(width: 30)
                        .fontWeight(.bold)
                        .foregroundColor(email.isValidEmail() ? .green : .red)

                }
                
            }.padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                ).padding()
            
            
            //--------------------------------------------
            // Password Field
            //--------------------------------------------
            // Location 3
            HStack {
                
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                TextField("Password", text: $password)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
            
            }.padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    
                ).padding()
            
            
            //--------------------------------------------
            // Cancel Create Account Button
            //--------------------------------------------
            // Location 4
            HStack {
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .foregroundColor(.black)
                        .font(.title)
                }
                
                Spacer()
                
                //--------------------------------------------
                
                Button(action: {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        
                        if let error = error {
                            print(error)
                            
                            return
                            
                        }
                        
                        if let authResult = authResult {
                            print("\(authResult.user.uid)")
                        }
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Create Account")
                        .foregroundColor(.black)
                        .font(.title)
                }
                
                Spacer()
                
            } // End HStack
            
            //--------------------------------------------
            // Location 5
            
            Spacer()
            
        } // End VStack
      
    } // End body
} // End view

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

