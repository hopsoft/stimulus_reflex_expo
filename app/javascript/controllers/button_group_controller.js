import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['input']

  select (event) {
    this.buttons.forEach(el => el.classList.remove('active'))
    event.target.classList.add('active')
    this.inputTarget.value = event.target.innerText
  }

  get buttons () {
    return this.element.querySelectorAll('.btn')
  }
}
