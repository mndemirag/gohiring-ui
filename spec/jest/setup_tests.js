/* global global */

import Enzyme from 'enzyme';
import EnzymeAdapter from '@wojtekmaj/enzyme-adapter-react-17';
import 'jest-enzyme';

Enzyme.configure({ adapter: new EnzymeAdapter() });
