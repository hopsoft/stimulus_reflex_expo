import Turbolinks from 'turbolinks'
import { debounce } from 'lodash-es'
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  connect () {
    super.connect()
    this.perform = debounce(this._perform, 250)
  }

  _perform (event) {
    this.stimulate('ValidationsReflex#perform')
  }

  reset (event) {
    event.preventDefault()
    Turbolinks.visit(location.href)
  }

  validate (event) {
    this.perform()
  }
}
