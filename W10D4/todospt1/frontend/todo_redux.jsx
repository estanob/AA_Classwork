import React from 'react';
import ReactDOM from 'react-dom';
// import App from './components/app';
import Root from './components/root';
import { allTodos } from './reducers/selectors';
import configureStore from './store/store';
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_actions';
import { receiveSteps, receiveStep, removeStep } from './actions/step_actions';


document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();
  
  // ReactDOM.render(<h1>Todos App</h1>, document.getElementById('content'));
  ReactDOM.render(<Root store={store}/>, document.getElementById('content'));
  window.store = store;
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.removeTodo = removeTodo;
  window.receiveSteps = receiveSteps;
  window.receiveStep = receiveStep;
  window.removeStep = removeStep;
  window.allTodos = allTodos;
});