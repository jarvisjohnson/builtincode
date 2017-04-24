import React from "react";

class Invoice extends React.Component {
  render() {
    return (
      <div className="client-name">
        <h1>{this.props.clientName}</h1>
      </div>
    );
  }
}

export default Invoice;