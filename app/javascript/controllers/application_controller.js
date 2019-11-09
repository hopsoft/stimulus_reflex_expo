import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'

export default class extends Controller {
  connect () {
    StimulusReflex.register(this)
  }

  beforeReflex (element, reflex) {
    this.benchmark = performance.now()
  }

  reflexError (element, reflex, error) {
    alert(`Error invoking a Reflex! ${error}`)
  }

  afterReflex (element, reflex) {
    console.debug(
      reflex,
      `${(performance.now() - this.benchmark).toFixed(0)}ms`
    )
  }
}
