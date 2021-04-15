sub showVideoPlayerScreen(content as Object)
    m.videoPlayerScreen = CreateObject("roSGNode", "VideoPlayerScreen")
    m.videoPlayerScreen.ObserveField("state", "OnVideoPlayerStateChanged")
    m.videoPlayerScreen.content = content
    ShowScreen(m.videoPlayerScreen)
end sub

sub OnVideoPlayerStateChanged()
    state = m.videoPlayerScreen.state
    if state = "error" or state = "finished"
        CloseScreen(m.videoPlayerScreen)
    end if
end sub