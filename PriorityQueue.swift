/*
 constructor: Array
 based on : Binary Tree
 */
class PriorityQueue<T: Comparable>{
    private var elements: [T] = []
    private let compare: (T, T) -> Bool
    
    var top: T?{elements.first}
    
    var isEmpty: Bool{elements.isEmpty}
    
    var count: Int{elements.count}
    
    init(){
        compare = {$0 < $1}
    }
    
    init(criteria compare:@escaping (T, T) -> Bool){
        self.compare = compare
    }
    
    func push(_ element: T){
        elements.append(element)
        var now: Int = elements.count - 1
        while now > 0 {
            let parent: Int = (now-1) / 2
            guard compare(elements[now],elements[parent]) else{break}
            elements.swapAt(now, parent)
            now = parent
        }
    }
    
    func pop() -> T?{
        guard self.count != 0 else{ return nil}
        let ret: T? = elements.first
        elements.swapAt(0, self.count - 1)
        elements.removeLast()
        
        var parent: Int = 0
        var child: Int = 1
        while child < self.count{
            if child + 1 < self.count, compare(elements[child + 1],elements[child]){
                child += 1
            }
            guard compare(elements[child],elements[parent]) else {break}
            elements.swapAt(parent, child)
            parent = child
            child = parent*2 + 1
        }
        return ret
    }
}
