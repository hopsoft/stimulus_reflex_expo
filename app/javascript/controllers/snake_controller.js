import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'
export default class extends Controller {
  static targets = ['start', 'connecting']
  connect () {
    StimulusReflex.register(this)
    this.StimulusReflex.subscription.consumer.connection.webSocket.addEventListener(
      'open',
      this.enableStart.bind(this)
    )
  }
  move (event) {
    this.stimulate('SnakeReflex#move', event.which)
    event.preventDefault()
  }
  busy () {
    if (this.element.dataset.busy) this.stimulate('SnakeReflex#stop')
  }
  enableStart () {
    this.connectingTarget.hidden = true
    this.startTarget.hidden = false
  }
}