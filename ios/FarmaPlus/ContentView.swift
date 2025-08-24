import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      NavigationView {
        ScrollView {
          VStack {
            Button(action: {
              
            }) {
              Text("Tienda")
                .foregroundColor(.white)
                .padding()
            }
            .background(.green)
            .cornerRadius(8)
          }
        }
        .navigationTitle("Tienda")
        .refreshable {
          await Task.sleep(2 * 1_000_000_000)
        }
      }
      .tabItem {
        Image(systemName: "cart")
        Text("Tienda")
      }

      VStack {
        Text("Chat")
      }
      .tabItem {
        Image(systemName: "message")
        Text("Chat")
      }

      VStack {
        Text("Usuario")
      }
      .tabItem {
        Image(systemName: "person")
        Text("Usuario")
      }
    }
    .tint(.green)
  }
}

#Preview {
  ContentView()
}
