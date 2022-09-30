import React, { useState } from 'react';
import PropTypes from 'prop-types';

const HelloWorld = (props) => {
  const [name, setName] = useState(props.name);

  return <div>
    <h3>Hello, {name}</h3>
    <hr />
    <form>
      <label htmlFor="name">
        Say hello to:
      </label>
      <input id="name"
             type="text"
             value={name}
             onChange={(e) => setName(e.target.value)}
        />
    </form>
  </div>;
};

HelloWorld.propTypes = {
  name: PropTypes.string.isRequired
};

export default HelloWorld;
