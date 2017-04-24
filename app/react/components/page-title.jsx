import React from 'react';

import MoodSticker from './mood-sticker';

class PageTitle extends React.Component {
  render() {
    console.log('PageTitleProps :');
    console.log(this.props);
    return (
      <div className="client-name">
        <h1>{this.props.clientName}</h1>
        <MoodSticker currency={this.props.client.billing_currency}/>
        <h3>{this.props.client.billing_currency}</h3>
      </div>
    );
  }
}

export default PageTitle;