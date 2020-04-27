import Turbolinks from 'turbolinks'
import { debounce } from 'lodash-es'
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['firstName', 'lastName', 'email', 'submit']

  connect () {
    super.connect()
    this.perform = debounce(this._perform, 250)
  }

  _perform (event) {
    this.stimulate('ValidationsReflex#perform', this.userParams)
  }

  reset (event) {
    event.preventDefault()
    Turbolinks.visit(location.href)
  }

  validate (event) {
    this.perform()
  }

  get userParams () {
    return {
      user: {
        first_name: this.firstNameTarget.value,
        last_name: this.lastNameTarget.value,
        email: this.emailTarget.value
      }
    }
  }
}
