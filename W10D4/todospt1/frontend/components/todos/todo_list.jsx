import React from 'react';





// const TodoList = () => <h3>Todo List goes here!</h3>

// export default TodoList;
export default (props) => {
    <div>
        <h3>Todo List goes here!</h3>
        <ul>
            { props.todos.map ((todo) => {
                <li key={todo.id}></li>
            })}
        </ul>
    </div>
}