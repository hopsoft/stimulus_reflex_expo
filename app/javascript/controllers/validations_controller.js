import debounce from 'lodash.debounce'
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['firstName', 'lastName', 'email']

  connect () {
    super.connect()
    this.perform = debounce(this._perform.bind(this), 250)
  }

  _perform () {
    this.stimulate('ValidationsReflex#perform', this.params)
  }

  get params () {
    return {
      first_name: this.firstNameTarget.value,
      last_name: this.lastNameTarget.value,
      email: this.emailTarget.value
    }
  }
}
