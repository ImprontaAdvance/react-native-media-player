# react-native-media-player
A React Native module that allows you to use the native Media Player Framework Reference to play movies

### Add it to your project

1. Run `npm install git+https://github.com/ImprontaAdvance/react-native-media-player.git --save`
2. Open your project in XCode, right click on `Libraries` and click `Add Files to "Your Project Name"`
   * ![Screenshot](http://url.brentvatne.ca/jQp8.png) ![Screenshot](http://url.brentvatne.ca/1gqUD.png) (use the RCTMediaPlayer project rather than the one pictured in screenshot).
3. Add `libRTCMediaPlayer.a` to `Build Phases -> Link Binary With Libraries`
   ![(Screenshot)](http://url.brentvatne.ca/g9Wp.png).
5. Whenever you want to use it within React code now you can: `var { VideoPlayer } = require('react-native-media-player');


```javascript
// Render it when you want to open video player fullscreen 
<VideoPlayer src={this.state.videoOpened} onEnd={() => this.closeVideo()}  />
````

## Examples

```javascript
render() {
		var video;
		if(this.state.video)
			video = <VideoPlayer src={this.state.video} onEnd={() => this.setState({video: false)}  />;

		return (
			<View>
			  <TouchableHighlight onPress={() => this.setState({video: 'video.mp4'})}>
			    <Text>Click to open video</Text>
			  </TouchableHighlight>
				{video}
			</View>
		);
	}
````


## TODOS

- [ ] Improve example
- [ ] Support iPhone resolution



## NOTES

I'm not iOS developer, so feel free to send pull requests for fix, coding style and improvements.

A special thanks to [brentvatne](https://github.com/brentvatne) and his [react-native-video](https://github.com/brentvatne/react-native-video).
