import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
debugger
document.addEventListener("DOMContentLoaded", () => {
  // debugger
  const store = configureStore();
  
  ReactDOM.render(<h1>Todos App</h1>, document.getElementById('content'));
  window.store = store;

});