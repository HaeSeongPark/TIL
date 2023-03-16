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
    @State private var stickerImage: UIImage?
    @State private var images:[UIImage] = []
    @State private var frame:AnyShape?
    
    var content: some View {
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
                    .resizableView(transform: bindingTransform(for: element))
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
        content
            .onDrop(of: [.item], delegate: CardDrop(card: $card))
            .modifier(CardToolbar(currentModal:$currentModal))
            .sheet(item: $currentModal) { item in
                switch item {
                case .stickerPicker:
                    StickerPicker(stickerImage: $stickerImage)
                        .onDisappear {
                            if let stickerImage {
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        }
                case .photoPicker:
                    PhotoPicker(iamges: $images)
                        .onDisappear {
                            for image in images {
                                card.addElement(uiImage: image)
                            }
                            images = []
                        }
                case .framePicker:
                    FramePicker(frame: $frame)
                        .onDisappear {
                            if let frame = frame {
                                card.update(
                                    viewState.selectedElement,
                                    frame:frame
                                )
                            }
                            frame = nil
                        }
                default:
                    EmptyView()
                }
            }
    }
    
    func bindingTransform(for element: CardElement) -> Binding<Transform> {
        guard let index = element.index(in: card.elements) else {
            fatalError("Element does not exist")
        }
        
        return $card.elements[index].transform
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
