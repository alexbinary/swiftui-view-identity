
import SwiftUI



@main
struct SwiftUI_LifetimeApp: App {

    var body: some Scene {
    
        WindowGroup {
            TabView {
                
                DemoRootView_InitBody()
                    .tabItem { Text("init() & body {}") }
                DemoRootView_IdentityLifetime()
                    .tabItem { Text("identity & lifetime") }
            }
            .padding()
            .navigationTitle("SwiftUI Demo app")
        }
    }
}
