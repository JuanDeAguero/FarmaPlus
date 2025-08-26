import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      NavigationView {
        ScrollView {
          VStack {
            WrappingHStack(spacing: 8) {
              NavigationLink(destination: Parafarmacia()) {
                HStack(spacing: 4) {
                  Image(systemName: "cross.case.fill")
                    .foregroundColor(.white)
                  Text("Parafarmacia")
                    .foregroundColor(.white)
                }
                .padding(8)
              }
              .background(.green)
              .cornerRadius(8)

              NavigationLink(destination: Parafarmacia()) {
                HStack(spacing: 4) {
                  Image(systemName: "figure.walk")
                    .foregroundColor(.white)
                  Text("Ortopedia")
                    .foregroundColor(.white)
                }
                .padding(8)
              }
              .background(.green)
              .cornerRadius(8)

              NavigationLink(destination: Parafarmacia()) {
                HStack(spacing: 4) {
                  Image(systemName: "eyeglasses")
                    .foregroundColor(.white)
                  Text("Optica")
                    .foregroundColor(.white)
                }
                .padding(8)
              }
              .background(.green)
              .cornerRadius(8)

              NavigationLink(destination: Parafarmacia()) {
                HStack(spacing: 4) {
                  Image(systemName: "sparkles")
                    .foregroundColor(.white)
                  Text("Cosmética")
                    .foregroundColor(.white)
                }
                .padding(8)
              }
              .background(.green)
              .cornerRadius(8)

              NavigationLink(destination: Parafarmacia()) {
                HStack(spacing: 4) {
                  Image(systemName: "figure.strengthtraining.traditional")
                    .foregroundColor(.white)
                  Text("Fitness")
                    .foregroundColor(.white)
                }
                .padding(8)
              }
              .background(.green)
              .cornerRadius(8)
            }
            .padding()

            HStack {
              HStack {
                Image(systemName: "tag.fill")
                  .foregroundColor(.green)
                Text("Ofertas")
                  .font(.title2)
                  .frame(maxWidth: .infinity, alignment: .leading)
              }

              Button(action: {

              }) {
                NavigationLink(destination: Parafarmacia()) {
                  Text("Ver más")
                    .foregroundColor(.green)
                    .font(.body)
                }
              }
            }
            .padding()

            HStack {
              HStack {
                Image(systemName: "cross.case.fill")
                  .foregroundColor(.green)
                Text("Parafarmacia")
                  .font(.title2)
                  .frame(maxWidth: .infinity, alignment: .leading)
              }

              Button(action: {

              }) {
                Text("Ver más")
                  .foregroundColor(.green)
                  .font(.body)
              }
            }
            .padding()

            HStack {
              HStack {
                Image(systemName: "figure.walk")
                  .foregroundColor(.green)
                Text("Ortopedia")
                  .font(.title2)
                  .frame(maxWidth: .infinity, alignment: .leading)
              }

              Button(action: {

              }) {
                Text("Ver más")
                  .foregroundColor(.green)
                  .font(.body)
              }
            }
            .padding()

            HStack {
              HStack {
                Image(systemName: "eyeglasses")
                  .foregroundColor(.green)
                Text("Optica")
                  .font(.title2)
                  .frame(maxWidth: .infinity, alignment: .leading)
              }

              Button(action: {

              }) {
                Text("Ver más")
                  .foregroundColor(.green)
                  .font(.body)
              }
            }
            .padding()
          }
          .frame(maxWidth: .infinity)
        }
        .navigationTitle("FARMA+")
        .refreshable {
          try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            ZStack {
              Button(action: {
                
              }) {
                Image(systemName: "bell")
              }
              Text("3")
                .font(.caption2)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                .offset(x: 10, y: -10)
            }
          }
          
          ToolbarItem(placement: .navigationBarTrailing) {
            ZStack {
              Button(action: {
                  
              }) {
                Image(systemName: "cart")
              }
              Text("5")
                .font(.caption2)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                .offset(x: 10, y: -10)
            }
          }
        }
      }
      .tabItem {
        Image(systemName: "cart")
        Text("Tienda")
      }

      NavigationView {
        ScrollView {
          VStack {
            Text("Chat")
          }
          .frame(maxWidth: .infinity)
        }
        .navigationTitle("Chat")
        .refreshable {
          try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        }
      }
      .tabItem {
        Image(systemName: "message")
        Text("Chat")
      }

      NavigationView {
        ScrollView {
          VStack {
            Text("Usuario")
          }
          .frame(maxWidth: .infinity)
        }
        .navigationTitle("Usuario")
        .refreshable {
          try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        }
      }
      .tabItem {
        Image(systemName: "person")
        Text("Usuario")
      }
    }
    .tint(.green)
  }
}

struct Parafarmacia: View {
  var body: some View {
    ScrollView {
      VStack {
        Text("Parafarmacia")
      }
      .frame(maxWidth: .infinity)
    }
    .navigationTitle("Parafarmacia")
    .navigationBarTitleDisplayMode(.inline)
    .refreshable {
      try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
    }
  }
}

struct Ortopedia: View {
  var body: some View {
    ScrollView {
      VStack {
        Text("Ortopedia")
      }
      .frame(maxWidth: .infinity)
    }
    .navigationTitle("Ortopedia")
    .navigationBarTitleDisplayMode(.inline)
    .refreshable {
      try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
    }
  }
}

struct Optica: View {
  var body: some View {
    ScrollView {
      VStack {
        Text("Optica")
      }
      .frame(maxWidth: .infinity)
    }
    .navigationTitle("Optica")
    .navigationBarTitleDisplayMode(.inline)
    .refreshable {
      try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
    }
  }
}

#Preview {
  ContentView()
}
