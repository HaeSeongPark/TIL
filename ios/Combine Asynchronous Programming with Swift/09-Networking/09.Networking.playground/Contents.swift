import Foundation
import Combine
// https://dummyjson.com/

struct Test:Decodable {
    var id:Int
}

//let subscription = URLSession.shared
//  .dataTaskPublisher(for: URL(string: "https://dummyjson.com/products/1")!)
//  .sink(receiveCompletion: { completion in
//    if case .failure(let err) = completion {
//      print("Retrieving data failed with error \(err)")
//    }
//  }, receiveValue: { data, response in
//    print("Retrieved data of size \(data.count), response = \(response)")
//  })

//let subscription = URLSession.shared
//    .dataTaskPublisher(for: URL(string: "https://dummyjson.com/products/1")!)
//    .tryMap { data, _ in
//        try JSONDecoder().decode(Test.self, from: data)  // JSONDEcoder를 매번 만든다.
//    }
//    .sink(receiveCompletion: { completion in
//        if case .failure(let err) = completion {
//            print("Retrieving data failed with error \(err)")
//        }
//    }, receiveValue: { value in
//        print(value)
//    })

//let subscription = URLSession.shared
//    .dataTaskPublisher(for: URL(string: "https://dummyjson.com/products/1")!)
//    .map(\.data)
//    .decode(type: Test.self, decoder: JSONDecoder()) // JSONDEcoder를 세팅할 때 한 번만 만든다.
//    .sink(receiveCompletion: { completion in
//        if case .failure(let err) = completion {
//            print("Retrieving data failed with error \(err)")
//        }
//    }, receiveValue: { value in
//        print(value)
//    })
/*
 publisher를 구독할 때마다 publisher가 일을해야한다.
 예를들어 네트워크 요청을 하는 경우, 여러 섭스크라이브가 결과를 요청할 때 그 때마다 여러번 같은 네트워크 요청을 해야 한다.
 컴바인에서는 놀랍게도 이런 문제를 쉽게 해결하는 오퍼레이터가부족하다. 다른 프레임워크랑 다르게
 share()를 써도 되지만 share()는 쓰기 까다롭다. 결과가 오기 전에 모든 구독자가 구독하고 있어야 한다
 
 캐싱을 쓰는 것 외에 한가지 솔루션은 multicast() 오퍼레이터를 쓰는 것이다.
 이 오퍼레이터는 ConnectablePublisher는 subject를 통해서 갓을 방출한다.
 모든 구독자가 구독해서 준비가 된 다음 connect()를 호출하면 된다.
 */
//let publisher = URLSession.shared
//    .dataTaskPublisher(for: URL(string: "https://dummyjson.com/products/1")!)
//    .print("request")
//    .map(\.data)
//    .multicast { PassthroughSubject<Data,URLError>()}
//
//// 첫 번째 구독, 구독하고 바로 실행되지 않는다.
//let subscripption1 = publisher
//    .sink { completion in
//        if case .failure(let err) = completion {
//            print("Sink1 Retrieving data failed with error \(err)")
//        }
//    } receiveValue: { object in
//        print("Sink1 Retrieved object \(object)")
//    }
//// 두 번쨰 구독
//let subscription2 = publisher
//  .sink(receiveCompletion: { completion in
//    if case .failure(let err) = completion {
//      print("Sink2 Retrieving data failed with error \(err)")
//    }
//  }, receiveValue: { object in
//    print("Sink2 Retrieved object \(object)")
//  })
//
//// 준비가 됐을떄 연결한다. 이 때 업스트림 이벤트가 구독자한테 보내진다.
//// 이렇게 하면 네트워크 요청 한 번만 하고 그 값을 모든 구독자한테 공유한다.
//let subscription = publisher.connect()

// 아래처럼 share없이 하면 리퀘스트 2번
//let publisher = URLSession.shared
//    .dataTaskPublisher(for: URL(string: "https://dummyjson.com/products/1")!)
//    .print("request")
//    .map(\.data)
//    .share() // share하면 리퀘스트 1번
//
//
//let subscripption1 = publisher
//    .sink { completion in
//        if case .failure(let err) = completion {
//            print("Sink1 Retrieving data failed with error \(err)")
//        }
//    } receiveValue: { object in
//        print("Sink1 Retrieved object \(object)")
//    }
//// 두 번쨰 구독
//let subscription2 = publisher
//    .sink(receiveCompletion: { completion in
//        if case .failure(let err) = completion {
//            print("Sink2 Retrieving data failed with error \(err)")
//        }
//    }, receiveValue: { object in
//        print("Sink2 Retrieved object \(object)")
//    })

let publisher = URLSession.shared
    .dataTaskPublisher(for: URL(string: "https://dummyjson.com/products/1")!)
    .print("request")
    .map(\.data)
//    .share()
    .multicast(subject: PassthroughSubject<Data,URLError>()) // subject를 통해서 이벤트 발생


let subscripption1 = publisher
    .sink { completion in
        if case .failure(let err) = completion {
            print("Sink1 Retrieving data failed with error \(err)")
        }
    } receiveValue: { object in
        print("Sink1 Retrieved object \(object)")
    }

// 두 번쨰 구독 : 결과가 오고 나중에 구독하면, 이벤트를 받지 못한다.
/*
 subscription2: receive subscription: (Multicast)
 subscription2: request unlimited
 subscription2: receive finished
 */
var sub2:AnyCancellable?
var lastSub:Cancellable?
DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    sub2 = publisher
        .print("subscription2")
        .sink(receiveCompletion: { completion in
            if case .failure(let err) = completion {
                print("Sink2 Retrieving data failed with error \(err)")
            }
        }, receiveValue: { object in
            print("Sink2 Retrieved object \(object)")
        })
    lastSub = publisher.connect()
}
