import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

function Root() { // component/wrapper
  return(<div>
          <Clock/>
          <Tabs/>
        </div>);
}


document.addEventListener('DOMContentLoaded', () => { //wait for DOM(index.html) to load
  ReactDOM.render(<Root/>, document.getElementById('root')) //virtual DOM will render root component, will live in element with id="root"
});

