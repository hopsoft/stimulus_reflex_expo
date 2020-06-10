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
  }

  reflexError (element, reflex, error) {
    alert(`Error invoking a Reflex! ${error}`)
  }

  reload () {
    Turbolinks.visit(location.href)
  }
}
