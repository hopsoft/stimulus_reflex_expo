import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'

export class ApplicationController extends Controller {
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
    if (this.permalink) history.pushState({}, '', this.permalink)
  }

  get permalink () {
    const element = document.querySelector('[data-permalink]')
    const url = (element ? element.dataset.permalink : '').trim()
    return url.length ? url : null
  }
}

export default ApplicationController
