import Turbolinks from 'turbolinks'
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  reset (event) {
    event.preventDefault()
    Turbolinks.visit(location.href)
  }
}
