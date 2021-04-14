sub InitScreenStack()
    m.screenStack = []
end sub

sub ShowScreen(node as Object)
    prev = m.screenStack.Peek()
    if prev <> invalid
        prev.visible = false
    end if

    m.top.AppendChild(node)
    node.visible = true
    node.SetFocus(true)
    m.screenStack.Push(node)
end sub

sub CloseScreen(node as Object) 
    if node <> invalid
        last = m.screenStack.Pop()
        last.visible = false
        m.top.RemoveChild(node)

        current = m.screenStack.Peek()
        if current <> invalid 
            current.visible = true
            current.SetFocus(true)
        end if
    end if

end sub