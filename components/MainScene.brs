sub init()
    m.top.backgroundColor = "0x6f1bb1"
    m.top.backgroundUri = ""
    m.loadingIndicator = m.top.FindNode("loadingIndicator")
    m.tracker=m.top.createChild("TrackerTask")
    InitScreenStack()
    ShowGridScreen()
    RunContentTask()
end sub