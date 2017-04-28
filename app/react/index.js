import RWR from 'react-webpack-rails';
RWR.run();

import HelloWorld from './components/hello-world';
RWR.registerComponent('HelloWorld', HelloWorld);

import PageTitle from './components/page-title';
RWR.registerComponent('PageTitle', PageTitle);

if (module.hot) {
  module.hot.accept();
  RWR.reloadNodes();
}
