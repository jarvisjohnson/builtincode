import React from 'react';

class MoodSticker extends React.Component {
  render() {
    console.log('MoodStickerProps :');
    console.log(this.props);
    return (
      <span className="mood-sticker">
        {/* Comment*/}
        <img src='http://thecatapi.com/api/images/get?format=src' />
        <i className={'flag ' + (this.props.currency == 'AUD' ? 'australia' : 'usa') }></i>
      </span>

    );
  }
}

export default MoodSticker;