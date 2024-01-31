class Queue<T>{
    private var elements:[T]
    private var temp:[T]
    
    var isEmpty: Bool{//둘 다 없으면 비어있는 것이다.
        elements.isEmpty && temp.isEmpty
    }
    
    var count: Int{//두 개를 더하면 사이즈가 나온다.
        elements.count + temp.count
    }
    
    var front: T?{
        guard elements.isEmpty else {return elements.last}
        return temp.first
    }
    var back: T?{
        guard temp.isEmpty else {return temp.last}
        return elements.first
    }
    //push, pop,
    init(){
        elements = []
        temp = []
    }
    
    func push(_ element: T){
        temp.append(element)
    }
    
    func pop() -> T?{
        guard elements.isEmpty else {return elements.popLast()}
        elements = temp.reversed()
        temp = []
        return elements.popLast()
    }
}
