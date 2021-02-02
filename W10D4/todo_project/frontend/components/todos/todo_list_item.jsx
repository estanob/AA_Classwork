import React from 'react';

const TodoListItem = (props) => {
  return <li>{props.todo.title}</li>
};

export default TodoListItem;

// export default (props) => {
//   debugger
//   return <li>{props.todo.title}</li>
// };