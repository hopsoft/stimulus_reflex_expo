import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'
export default class extends Controller {
  connect () {
    StimulusReflex.register(this)
  }
  move (event) {
    this.stimulate('SnakeReflex#move', event.which)
    event.preventDefault()
  }
  busy () {
    if (this.element.dataset.busy) this.stimulate('SnakeReflex#start_stop')
  }
}
