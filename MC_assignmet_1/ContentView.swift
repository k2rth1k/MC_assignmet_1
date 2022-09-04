import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    @State var getUsers = false
    @State var postedVaesd = false
    @State var freeBoard = true
    var body: some View {
        if(postedVaesd){
                HStack{
                    Spacer()
                    Spacer()
                    Text(network.posterResp?.name ?? "default")
                    Spacer()
                }
        }
        if getUsers{
                ScrollView {
                    Text("All users")
                        .font(.title)
                        .bold()

                    VStack(alignment: .leading) {
                        ForEach(network.users) { user in
                            HStack(alignment:.top) {
                                Text("\(user.id)")

                                VStack(alignment: .leading) {
                                    Text(user.name)
                                        .bold()

                                    Text(user.email.lowercased())

                                    Text(user.phone)
                                }
                            }
                            .frame(width: 300, alignment: .leading)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                            .cornerRadius(20)
                        }
                    }

                }
                .padding(.vertical)
        }
        if (freeBoard){
            VStack{
                Button(action: {
                    network.getUsers()
                    getUsers=true
                    freeBoard=false
                }, label:{
                    Text("Get users")
                })
                Button(action: {
                   network.postUser()
                    postedVaesd = true
                    freeBoard=false
                }, label: {
                    Text("make post")
                })
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
