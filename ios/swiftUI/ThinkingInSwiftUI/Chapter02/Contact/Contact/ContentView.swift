//
//  ContentView.swift
//  Contact
//
//  Created by rhino Q on 2023/04/28.
//
import SwiftUI

final class Contact: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var city: String
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
}

struct Detail: View {
    @ObservedObject var contact: Contact
    // 다른 contact가 또 들어 올 수 있기 떄문에  ObservedObject
    // 레퍼런스가 변경되지 않는게 보장되면 StateObject
    var body: some View {
        print("contact \(contact)")
        return VStack {
            Text(contact.name)
                .bold()
            Text(contact.city)
        }
    }
}


struct ContentView: View {
    @State var selection:Contact?
    var contacts:[Contact] {
        let contact = Contact(name: "123", city: "123")
        return [contact]
    }
    
    var body: some View {
        HStack{
            ForEach(contacts) { contact in
                Button {
                    self.selection = contact
                } label: {
                    Text(contact.name)
                }

            }
        }
        if let c = selection {
            Detail(contact: c)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
