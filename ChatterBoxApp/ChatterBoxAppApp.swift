//=============================================================================
// PROGRAMMERS: Elizabeth Fassler, Marie Haccandy, Matthew Neal, and Javier Guevara
// GROUP NAME: Mobile CodeCraft
//
// CLASS: COP4655
// SECTION: RVCC 1245
// SEMESTER: Summer 2024
//
// Project: Group Project
//
// CERTIFICATION: I understand FIU’s academic policies, and I certify that
// this work is my own and that none of it is the work of any other person.
//=============================================================================

import SwiftUI
import Firebase
import FirebaseCore

@main
struct ChatterBoxAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

