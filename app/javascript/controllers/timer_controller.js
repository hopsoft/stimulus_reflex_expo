// import Velocity from 'velocity-animate'
import ApplicationController from './application_controller'
import StimulusReflex from 'stimulus_reflex'

export default class extends ApplicationController {
  static targets = ['time']

  connect() {
    StimulusReflex.register(this)

    this.timerInterval = null
    this.timerDuration = 0

    this.startOrStopCounter()
  }

  disconnect() {
    this.stopCounter()
  }

  afterToggle(element, reflex) {
    this.startOrStopCounter()
  }

  afterReset() {
    this.stopCounter()
  }

  afterEnd() {
    this.stopCounter()
  }

  tick() {


    if (this.timerActive) {
      this.timerDuration++
      let newValue = (this.countdown ? this.countItDown() : this.countItUp())
      this.timeTarget.textContent = this.formatTime(newValue)
    }
  }

  countItDown() {
    let val = (this.duration - this.totalRunningTime)
    if (val <= 10) {
      this.element.querySelector('.timer__path').setAttribute('fill', 'yellow')
    }
    if (val <= 0) {
      this.endTimer()
      val = 0
    }
    return (val)
  }

  countItUp() {
    return (this.totalRunningTime)
  }

  endTimer() {
    this.element.querySelector('.timer__path').setAttribute('fill', 'gray')
    this.stimulate('Timer#end')
  }

  startOrStopCounter() {
    if (this.timerInterval && !this.timerActive) {
      this.stopCounter()
    }
    if (!this.timerInterval && this.timerActive) {
      this.startCounter()
    }
  }

  stopCounter() {
    clearInterval(this.timerInterval)
    this.timerDuration = 0
    this.timerInterval = null
  }

  startCounter() {
    this.timerInterval = setInterval(this.tick.bind(this), 1000)
  }

  formatTime(time) {
    let minutes = Math.floor(time / 60);
    let seconds = time % 60;

    if (minutes < 10) {
      minutes = `0${minutes}`;
    }
    if (seconds < 10) {
      seconds = `0${seconds}`;
    }
    return `${minutes}:${seconds}`;
  }

  get value() {
    return Number(this.data.get('current'))
  }

  get startedAt() {
    return new Date(Number(this.data.get('start')))
  }

  get currentRunningTime() {
    const timeElapsed = (new Date).getTime() - this.startedAt.getTime()
    return parseInt(timeElapsed / 1000)
  }

  get totalRunningTime() {
    return Number(this.value + this.currentRunningTime)
  }

  get duration() {
    return Number(this.data.get('duration'))
  }

  get countdown() {
    return (this.data.get('countdown') == 'true')
  }

  get timerActive() {
    return (this.data.get('status') == 'active')
  }
}
