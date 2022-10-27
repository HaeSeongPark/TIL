//: [Previous](@previous)

import Foundation

func fibo(_ n:Int) -> Int {
    var cache:[Int] = [0,1]
    
    for num in 2...n {
        let fi = cache[num-1] + cache[num-2]
        if fi > n { break }
        cache.append(fi)
            
    }
    
    cache.remove(at: 1)
    print(cache)
    return 0
}
fibo(15)


//: [Next](@next)
