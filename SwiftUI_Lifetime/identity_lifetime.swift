
import SwiftUI



struct DemoRootView_IdentityLifetime: View {
    
    @State var red = false
    @State var id = 0
    
    init() {
        print("\(Date()) [IdentityLifetime] ParentView init")
    }
    
    var body: some View {
        let _ = print("\(Date()) [IdentityLifetime] ParentView body")
        let _ = Self._printChanges()
        
        VStack {
            
            HStack {
                
                Button {
                    red.toggle()
                } label: {
                    Text("Red: \(red.description)")
                }
                
                Button {
                    id += 1
                } label: {
                    Text("id = \(id)")
                }
            }.padding()
            
            Divider()
            
            VStack {
                if red {
                    ContentView1()
                        .id("stableid1")
                        .foregroundColor(.red)
                } else {
                    ContentView1()
                        .id("stableid1")
                }
            }.padding()
            
            Divider()
                
            ContentView2()
                .id(id)
                .foregroundColor(red ? .red : .primary)
                .padding()
        }
    }
}


struct ContentView1: View {
    
    @State var state = 0
    
    init() {
        print("\(Date()) [IdentityLifetime] ContentView1 init")
    }
    
    var body: some View {
        let _ = print("\(Date()) [IdentityLifetime] ContentView1 body")
        let _ = Self._printChanges()

        VStack {
            Text("if/else with stable id")
            Button {
                state += 1
            } label: {
                Text("state = \(state)")
            }
        }
    }
}

struct ContentView2: View {
    
    @State var state = 0
    
    init() {
        print("\(Date()) [IdentityLifetime] ContentView2 init")
    }
    
    var body: some View {
        let _ = print("\(Date()) [IdentityLifetime] ContentView2 body")
        let _ = Self._printChanges()

        VStack {
            Text("conditional modifier value + view id")
            Button {
                state += 1
            } label: {
                Text("state = \(state)")
            }
        }
    }
}
