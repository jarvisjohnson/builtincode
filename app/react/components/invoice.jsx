import React from "react";

class Invoice extends React.Component {
  render() {
    return (
      <div>
        <h1>{this.props.clientName} Hello</h1>
        <h1>{this.props.clientName}</h1>
      </div>
    );
  }
}

export default Invoice;