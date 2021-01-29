import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

let next = {};

const todosReducer = (state = initialState, action) => {
    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach(todo => {
                next[todo.id] = todo;
            });
            return next; //completely new todo list 
        case RECEIVE_TODO:
            let newTodo = {};
            newTodo[action.todo.id] = action.todo;
            return Object.assign({}, state, newTodo); // mutated NEW copy of original state
            // let newState = { [action.todo.id]: action.todo };
            //                    ^[] will create a key
            // let newState = { action.todo.id: action.todo };
        case REMOVE_TODO:
            next = Object.assign({}, state)
        default:
            return state;
    }
};

export default todosReducer;