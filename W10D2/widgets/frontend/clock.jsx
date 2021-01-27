import React from 'react';

class Clock extends React.Component {
    constructor() {
        this.state = {
            new Date()
        }
    }

    tick() {
        this.setState({new Date()}) 

        
    }

    render() {
        return(<h1>Clock</h1>)
    }
}

export default Clock;