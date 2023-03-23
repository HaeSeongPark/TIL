//
//  CardDetailView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/09.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var viewState:ViewState
    @State private var currentModal: CardModal?
    @Binding var card: Card
    
    @Environment(\.scenePhase) private var scenePhase
    
    func content(size:CGSize) -> some View {
        ZStack {
            card.backgroundColor
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    viewState.selectedElement = nil
                }
            
            ForEach(card.elements, id: \.id) { element in
                CardElementView(
                    element: element,
                    selected:viewState.selectedElement?.id == element.id
                )
                .contextMenu {
                    Button {
                        card.remove(element)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                .resizableView(transform: bindingTransform(for: element), viewScale:calculateScale(size))
                .frame(
                    width: element.transform.size.width,
                    height: element.transform.size.height
                )
                .onTapGesture {
                    viewState.selectedElement = element
                }
            }
        }
    }
    
    var body: some View {
        RenderableView(card: $card){
            GeometryReader { proxy in
                content(size: proxy.size)
                    .onDrop(of: [.item], delegate: CardDrop(card: $card, size: proxy.size, frame: proxy.frame(in: .global)))
                    .onChange(of: scenePhase, perform: { newValue in
                        if newValue == .inactive {
                            card.save()
                        }
                    })
                    .onDisappear {
                        card.save()
                    }

                    .frame(
                        width: calculateSize(proxy.size).width,
                        height: calculateSize(proxy.size).height
                    )
                    .clipped()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .modifier(CardToolbar(currentModal:$currentModal))
        .cardModals(card: $card, currentModal: $currentModal)
    }
    
    func bindingTransform(for element: CardElement) -> Binding<Transform> {
        guard let index = element.index(in: card.elements) else {
            fatalError("Element does not exist")
        }
        
        return $card.elements[index].transform
    }
    
    func calculateSize(_ size:CGSize) -> CGSize {
        var newSize = size
        let ratio = Settings.cardSize.width / Settings.cardSize.height
        
        if size.width < size.height {
            newSize.height = min(size.height, newSize.width / ratio)
            newSize.width = min(size.width, newSize.height * ratio)
        } else {
            newSize.width = min(size.width, newSize.height * ratio)
            newSize.height = min(size.height, newSize.width / ratio)
        }
        
        return newSize
    }
    
    func calculateScale(_ size:CGSize) -> CGFloat {
        let newSize = calculateSize(size)
        return newSize.width / Settings.cardSize.width
    }
}



struct CardDetailView_Previews: PreviewProvider {
    
    struct CardDetailPreivew:View {
        @State private var card = initialCards[0]
        var body: some View {
            CardDetailView(card: $card)
                .environmentObject(ViewState(card: card))
        }
    }
    
    static var previews: some View {
        CardDetailPreivew()
    }
}
