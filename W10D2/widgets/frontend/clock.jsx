import React from 'react';

class Clock extends React.Component {
    constructor(props) { // props lets us use this
        super(props)
        this.state = {
            time: new Date(),
        }

        this.tick = this.tick.bind(this) // <= can't use this without bind
    }

    tick() {
        this.setState({time: new Date()}) 

        
    }

    render() {
        return(<h1>Clock</h1>)
    }

    componentDidMount() {
        setInterval(this.tick, 1000)
    }

}

export default Clock;