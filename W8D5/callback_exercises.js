class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    let date = new Date();
    let h = date.getHours();
    let m = date.getMinutes();
    let s = date.getSeconds();
    // let [HH, MM, SS] = new Date().toLocaleTimeString("en-US").split(/:|/)
    this.printTime(h, m, s);
    this._tick()
  }

  printTime(h, m, s) {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(h, m, s);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    setInterval(this.printTime, 1000)
  }
}

const clock = new Clock();