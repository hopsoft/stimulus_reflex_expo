import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import debounce from 'lodash.debounce'
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['firstName', 'lastName', 'email', 'submit']

  connect () {
    super.connect()
    this.perform = debounce(this._perform, 250)
    this.firstNameTarget.focus()
  }

  _perform (event) {
    this.stimulate('ValidationsReflex#perform', this.userParams)
  }

  validate (event) {
    if (!this.shouldValidate(event)) return
    this.focusElement = event.target
    this.perform()
  }

  submit (event) {
    Rails.stopEverything(event)
    this.submitTarget.value = 'Great Job! Form will reset shortly...'
    setTimeout(() => {
      Turbolinks.visit(window.location.href)
    }, 2500)
  }

  shouldValidate (event) {
    return !(
      (event.type !== 'keyup' && event.altKey) ||
      event.ctrlKey ||
      event.metaKey ||
      event.shiftKey ||
      event.isComposing ||
      this.ignoreKeys.includes(event.key)
    )
  }

  get ignoreKeys () {
    return [
      'Alt',
      'ArrowLeft',
      'ArrowRight',
      'Control',
      'Escape',
      'Meta',
      'Shift',
      'Tab'
    ]
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
