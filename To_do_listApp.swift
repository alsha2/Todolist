
import SwiftUI
import Firebase

@main
struct todolistApp: App {
    
    final class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
             
            return true
        }
    }
    
    @StateObject private var storeData = StoreData()
    
    init() {
        FirebaseApp.configure()
    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(storeData)
        }
    }
}
