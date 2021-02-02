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

// let next = {};

const todosReducer = (state = initialState, action) => {
    let nextState = Object.assign({}, state);
    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach(todo => {
                nextState[todo.id] = todo;
            });
            return nextState; //completely new todo list 
        case RECEIVE_TODO:
            // let newTodo = {};
            nextState[action.todo.id] = action.todo;
            return nextState; // mutated NEW copy of original state
            // let newState = { [action.todo.id]: action.todo };
            //                    ^[] will create a key
            // let newState = { action.todo.id: action.todo };
        case REMOVE_TODO:
            delete nextState[action.todo.id];
            return nextState;
        default:
            return state;
    }
};

export default todosReducer;