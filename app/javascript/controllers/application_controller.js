import Turbolinks from 'turbolinks'
import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'

export default class extends Controller {
  connect () {
    StimulusReflex.register(this)
  }

  beforeReflex (element, reflex) {
    document
      .querySelectorAll('[data-activity-indicator]')
      .forEach(el => (el.hidden = false))
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

  reload () {
    Turbolinks.visit(location.href)
  }

  noop (event) {
    event.preventDefault()
    event.stopPropagation()
  }
}
