import { debounce } from 'lodash-es'
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['query', 'activity', 'count', 'list']

  connect () {
    super.connect()
    this.perform = debounce(this._perform, 350).bind(this)
    this.queryTarget.value = 'reflex'
    this._perform()
  }

  beforePerform (element, reflex) {
    this.activityTarget.hidden = false
    this.countTarget.hidden = true
  }

  _perform (event) {
    if (event) event.preventDefault()
    if (!this.connectionOpen) return setTimeout(() => this._perform(), 1)
    this.stimulate('BookSearchReflex#perform', this.queryTarget.value)
  }

  get connectionOpen () {
    return this.StimulusReflex.subscription.consumer.connection.isOpen()
  }
}
