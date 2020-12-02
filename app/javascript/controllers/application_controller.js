import Turbolinks from 'turbolinks'
import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'

export default class extends Controller {
  connect () {
    StimulusReflex.register(this)
  }

  beforeReflex () {
    document
      .querySelectorAll('[data-activity-indicator]')
      .forEach(el => (el.hidden = false))
  }

  finalizeReflex () {
    document
      .querySelectorAll('[data-activity-indicator]')
      .forEach(el => (el.hidden = true))
  }

  reload () {
    Turbolinks.visit(location.href)
  }
}
