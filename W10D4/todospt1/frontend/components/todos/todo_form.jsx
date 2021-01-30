import React from 'react';

class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            id: Math.floor(Math.random() * 1000),
            title: '',
            body: '',
        };

        this.handleSubmit = this.handleSubmit.bind(this);
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
    } 
    handleSubmit(e) {
        e.preventDefault();
        this.props.receiveTodo(this.state);
        this.setState({
            id: Math.floor(Math.random() * 1000),
            title: '',
            body: '',
        });
    }
    updateTitle(e){
        this.setState({title: e.target.value});
    }
    updateBody(e) {
        this.setState({ body: e.target.value });
    }

    render() {
        return (
            <form onSubmit={this.handleSubmit}>
                <h1>Add a new Todo!</h1>
                <label>Title:
                    <input onChange={this.updateTitle} type="text" value={this.state.title}/>
                </label>
                <label>Body:
                    <input onChange={this.updateBody} type="text" value={this.state.body} />
                </label>
                <input type="submit" value="Add a new Todo!"/>

            </form>
        )
    }
}

export default TodoForm;