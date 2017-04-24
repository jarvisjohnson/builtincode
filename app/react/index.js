import RWR from 'react-webpack-rails';
RWR.run();

import HelloWorld from './components/hello-world';
RWR.registerComponent('HelloWorld', HelloWorld);

import Invoice from './components/invoice';
RWR.registerComponent('Invoice', Invoice);

if (module.hot) {
  module.hot.accept();
  RWR.reloadNodes();
}
