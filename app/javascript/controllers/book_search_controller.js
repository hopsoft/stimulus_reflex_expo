import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['query', 'activity', 'count', 'list']

  beforePerform (element, reflex) {
    this.activityTarget.hidden = false
    this.countTarget.hidden = true
  }

  perform (event) {
    event.preventDefault()
    this.stimulate('BookSearchReflex#perform', this.queryTarget.value)
  }
}
