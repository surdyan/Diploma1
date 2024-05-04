import SwiftUI

enum Tab {
    case profile
    case tabBar
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedTab: Tab = .profile

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabView(selection: $selectedTab) {
                    RestaurantView()
                        .tabItem {
                            Label("Restaurants", systemImage: "fork.knife.circle")
                        }
                        .tag(Tab.tabBar)
                    CameraView()
                        .tabItem {
                            Label("Camera", systemImage: "camera.circle")
                        }
                        .tag(Tab.tabBar)
                    
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.fill")
                        }
                        .tag(Tab.profile)
                        }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
