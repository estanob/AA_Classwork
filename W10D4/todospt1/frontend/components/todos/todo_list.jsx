import React from 'react';
import TodoListItem from "./todo_list_item";
import TodoForm from './todo_form';




// const TodoList = () => <h3>Todo List goes here!</h3>

// export default TodoList;
export default (props) => {
    const TodoListItems = props.todos.map(todo => { // this is ul
        return <TodoListItem key={todo.id} todo={todo} />;
    });
    return (<div>
        <TodoForm receiveTodo={props.receiveTodo}/>
        <ul>
            {/* { props.todos.forEach ((todo) => {
                debugger
                <TodoListItem todo={todo}/>
            })} */}
            {TodoListItems}
        </ul>
    </div>)
}