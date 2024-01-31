class Stack<T>{
    private var elements: [T]
    init(){
        elements = []
    }
    func push(_ element : T){
        elements.append(element)
    }
    func pop() -> T?{
        elements.popLast()
    }
    var top: T?{
        elements.last
    }
    var isEmpty : Bool{
        elements.isEmpty
    }
}
