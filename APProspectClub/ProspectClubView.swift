import SwiftUI
import Firebase

@main
struct ProspectClubView: App {
    
    init() {
        FirebaseApp.configure()
    }
    @State var switchScreen = true
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
