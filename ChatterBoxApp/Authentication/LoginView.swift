// Elizabeth Fassler

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State private var isCreateAccountViewPresented = false
    @State private var isPasswordCorrect: Bool = false
    @State private var showErrorAlert: Bool = false
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                // Location 1
                Image("LoginBackGround")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                //--------------------------------------------
                VStack {
                    // Location 2
                    Text("")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                    //----------------------------------------
                    // Email field
                    //----------------------------------------
                    // Location 3
                    HStack {
                        
                        Image(systemName: "mail")
                            .foregroundColor(.black)
                        TextField("Email", text:$email)
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
                    
                    //----------------------------------------
                    // Password field
                    //----------------------------------------
                    // Location 4
                    HStack {
                        
                        Image(systemName: "lock")
                            .foregroundColor(.black)
                        TextField("Password", text:$password)
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        
                    }.padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.black)
                            
                        ).padding()
                    
                    //----------------------------------------
                    // New account button
                    //----------------------------------------
                    // Location 5
                    Button(action: {
                        isCreateAccountViewPresented.toggle()
                    }) {
                        Text("Create Account")
                    }.foregroundColor(.black)
                        .font(.title)
                        .sheet(isPresented: $isCreateAccountViewPresented) {
                            RegisterView()
                        }
                    
                    //----------------------------------------
                    // Spacers
                    //----------------------------------------
                    // Location 6
                  Spacer()
                  
                    
                    //----------------------------------------
                    // Login button
                    //----------------------------------------
                    // Location 7
                    Button( action: {
                        
                        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                            
                            if let error = error {
                                print(error)
                                email = ""
                                password = ""
                                showErrorAlert.toggle()
                            }
                            
                            if let authResult = authResult {
                                isPasswordCorrect = true
                            }
                        } // End sign-in
                        
                    }){
                        Text("Login")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.black)
                            ).padding(.horizontal)
                        
                            .alert(isPresented: $showErrorAlert, content: {
                                Alert(title: Text("Error login! Please check email and password."))
                            })
                        }
                
                        .padding(.bottom)
                    
                    //----------------------------------------
                    
                } // End VStack
                
                //--------------------------------------------
                // Location 8
                
                
            } // End ZStack
            
            //------------------------------------------------
            // Location 9
            NavigationLink(destination: ContentView(), isActive: $isPasswordCorrect) {
                EmptyView()
            }
            //------------------------------------------------
            
        } // End Navigation Stack
        
        // Location 10
       
        
    } // End body
} // End of LoginView

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
