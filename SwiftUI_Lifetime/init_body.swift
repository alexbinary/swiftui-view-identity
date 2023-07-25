
import SwiftUI



class Env1: ObservableObject {
    
    @Published var v: Int = 0
}

class Env2: ObservableObject {
    
    @Published var v: Int = 0
}


struct DemoRootView_InitBody: View {

    @StateObject var env1 = Env1()
    @StateObject var env2 = Env2()
    
    @State var state = 0
    
    init() {
        print("\(Date()) [InitBody] ParentView init")
    }
    
    var body: some View {
        let _ = print("\(Date()) [InitBody] ParentView body")
        let _ = Self._printChanges()

        VStack {
            HStack {
                Text("Parent").font(.title3)
                    .frame(width: 100)
                Button {
                    state += 1
                } label: {
                    Text("state = \(state)")
                }.frame(width: 100)
                Button {
                    env1.v += 1
                } label: {
                    Text("env1 = \(env1.v)")
                }.frame(width: 100)
                Button {
                    env2.v += 1
                } label: {
                    Text("env2 = \(env2.v)")
                }.frame(width: 200)
            }

            Divider()
            MiddleView(state: state)
            .environmentObject(env1)
            .environmentObject(env2)
            .padding()
        }
    }
}

struct MiddleView: View {
    
    @EnvironmentObject var env2: Env2
    
    let state: Int
    
    init(state: Int) {
        self.state = state
        print("\(Date()) [InitBody] MiddleView init")
    }

    var body: some View {
        
        let _ = print("\(Date()) [InitBody] MiddleView body")
        let _ = Self._printChanges()

        VStack {
            HStack {
                Text("Middle").font(.title3)
                    .frame(width: 100)
                Text("state: \(state)")
                    .frame(width: 100)
                Text("")
                    .frame(width: 100)
                Text("env2: \(env2.v)")
                    .frame(width: 200)
            }
            Divider()
            VStack {
                ChildView1(
                    data1: state
                )
                .padding()
                ChildView2(
                    data2: env2.v
                )
                .padding()
            }
        }
    }
}


struct ChildView1: View {
    
    @EnvironmentObject var env1: Env1
    
    let data1: Int
    
    init(data1: Int) {
        self.data1 = data1
        print("\(Date()) [InitBody] ChildView1 init")
    }

    var body: some View {
        
        let _ = print("\(Date()) [InitBody] ChildView1 body")
        let _ = Self._printChanges()

        HStack {
            Text("Child1").font(.title3)
                .frame(width: 100)
            Text("state: \(data1)")
                .frame(width: 100)
            Text("env1: \(env1.v)")
                .frame(width: 100)
            Text("")
                .frame(width: 200)
        }
    }
}


struct ChildView2: View {
    
    @EnvironmentObject var env2: Env2
    
    let data2: Int
    
    init(data2: Int) {
        self.data2 = data2
        print("\(Date()) [InitBody] ChildView2 init")
    }

    var body: some View {
        
        let _ = print("\(Date()) [InitBody] ChildView2 body")
        let _ = Self._printChanges()

        HStack {
            Text("Child2").font(.title3)
                .frame(width: 100)
            Text("")
                .frame(width: 100)
            Text("")
                .frame(width: 100)
            VStack {
                Text("env2 (from middle): \(data2)")
                Text("env2 (from env): \(env2.v)")
            }
            .frame(width: 200)
        }
    }
}



