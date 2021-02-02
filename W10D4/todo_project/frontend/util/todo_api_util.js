import TodoForm from "../components/todos/todo_form";

export const fetchTodos = () => {
    debugger
    return ($.ajax({
        method: 'GET',
        url: '/api/todos'
    }));
    //  $. => promise pending with info from the ajax call
    // .then is convenient handler
};

// export const createTodo = (todo) => {
//     return $.ajax({
//         method: 'POST',
//         url: '/api/todos',
//         data: {
//             todo: todo
//         }
//     })
// };
