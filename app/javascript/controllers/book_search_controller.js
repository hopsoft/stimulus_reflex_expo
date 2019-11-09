import { debounce } from 'lodash-es'
import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for BookSearchReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  static targets = ['query', 'activity', 'count', 'list']

  connect () {
    super.connect()
    this.perform = debounce(this._perform, 350).bind(this)
  }

  beforePerform (element, reflex) {
    this.activityTarget.hidden = false
    this.countTarget.hidden = true
  }

  _perform (event) {
    event.preventDefault()
    this.stimulate('BookSearchReflex#perform', this.queryTarget.value)
  }
}
