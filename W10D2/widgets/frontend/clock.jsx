import React from 'react';

class Clock extends React.Component {
    constructor(props) { // props lets us use this
        super(props);
        this.state = {
            time: new Date(), // <= Date object, can call hours, minutes, seconds
        }

        this.tick = this.tick.bind(this) // <= can't use this without bind
    }

    tick() {
        this.setState({time: new Date()}) 

        
    }

    render() {
        return(<div>
                <h1>Clock</h1>
                <p>{this.state.time.getHours()} : {this.state.time.getMinutes()} : {this.state.time.getSeconds()}</p>
                <p>{this.state.time.toLocaleDateString()}</p>
            </div>)
    }


    componentDidMount() {
        this.clockTick = setInterval(this.tick, 1000)
    }

    componentWillUnmount() {
        clearInterval(this.clockTick)
        this.clockTick = 0;
    }

}

export default Clock;