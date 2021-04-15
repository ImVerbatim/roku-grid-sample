sub init() 
    m.video = m.top.FindNode("VideoPlayer")
    m.top.ObserveField("content", "OnContentSet")
    m.video.ObserveField("state", "OnVideoPlayerStateChanged")
end sub

sub setVideoContent(content as Object)
    videoContent = CreateObject("RoSGNode", "ContentNode")
    videoContent.url = content.videoUrl
    videoContent.title = content.title
    videoContent.streamformat = content.videoType

    m.video.content = videoContent
    m.video.control = "play"
end sub

sub OnContentSet(event as Object)
    data = event.getData()
    print "video content set"
    setVideoContent(data)
end sub

sub OnVideoPlayerStateChanged() 
    print "video player state changed"
    m.top.state = m.video.state
end sub