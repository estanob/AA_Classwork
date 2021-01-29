import React from 'react';
import TodoListItem from "./todo_list_item";




// const TodoList = () => <h3>Todo List goes here!</h3>

// export default TodoList;
export default (props) => {
    const TodoListItems = props.todos.map(todo => {
        return <TodoListItem todo={todo} />;
    });
    return(<div>
        <ul>
            {/* { props.todos.forEach ((todo) => {
                debugger
                <TodoListItem todo={todo}/>
            })} */}
            {TodoListItems}
        </ul>
    </div>)
}