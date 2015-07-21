'use strict';

var React = require('react-native');
var Overlay = require('react-native-overlay');
var PropTypes = require('ReactPropTypes');


class RCTMediaPlayerVideo extends React.Component {
    render() {
        var style = {
            width: 1024,
            height: 768,
        };

        return (
            <Overlay isVisible={true}>
                <RCTVideo src={this.props.src} onVideoEnd={() => this.props.onEnd()} style={style} />
            </Overlay>
        );
    }
}

RCTMediaPlayerVideo.propTypes = {
    src: PropTypes.string
}

var RCTVideo = React.requireNativeComponent('RCTMediaPlayerVideo', RCTMediaPlayerVideo);

module.exports = RCTMediaPlayerVideo;