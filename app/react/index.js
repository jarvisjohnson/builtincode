import RWR from 'react-webpack-rails';
RWR.run();

import PageTitle from './components/page-title';
RWR.registerComponent('PageTitle', PageTitle);

if (module.hot) {
  module.hot.accept();
  RWR.reloadNodes();
}
