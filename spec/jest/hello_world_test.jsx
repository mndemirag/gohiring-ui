import React from 'react';

import HelloWorld from 'HelloWorld/components/HelloWorld';
import { mount } from 'enzyme';

import faker from 'faker';

describe('<HelloWorld />', () => {
  it('greets', () => {
    const name = faker.name.firstName();
    const wrapper = mount(<HelloWorld name={name} />);

    expect(wrapper.text()).toMatch(`Hello, ${name}`);
  });

  it('can be changed', () => {
    const name = faker.name.firstName();
    const wrapper = mount(<HelloWorld name={faker.name.firstName()} />);
    wrapper.find('input').simulate('change', { target: { value: name } });
    expect(wrapper.text()).toMatch(name);
  });
});
