import React from 'react';
import TestUtils from 'react-addons-test-utils';
import expect from 'expect';
import Invoice from './invoice';


describe('Invoice', () => {
  const component = TestUtils.renderIntoDocument(<Invoice/>);

  it('renders', () => {
    expect(TestUtils.findRenderedComponentWithType(component, Invoice)).toExist();
  });
});
