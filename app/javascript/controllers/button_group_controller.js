import ApplicationController from './application_controller'

export default class extends ApplicationController {
  select (event) {
    this.buttons.forEach(el => el.classList.remove('active'))
    event.target.classList.add('active')
  }

  get buttons () {
    return this.element.querySelectorAll('.btn')
  }
}
