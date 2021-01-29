import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { receiveTodo, receiveTodos } from './actions/todo_actions';

document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();
  
  ReactDOM.render(<h1>Todos App</h1>, document.getElementById('content'));
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
});