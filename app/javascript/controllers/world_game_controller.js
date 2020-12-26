import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = [ 'input', 'message' ]

  afterCheck() {
    this.inputTarget.value = ''
    this.resetMessage()
  }

  checkHalted() {
    this.messageTarget.className = 'text-info'
    this.messageTarget.innerHTML = 'Please enter a country'
    this.resetMessage()
  }

  resetMessage() {
    clearTimeout(this.clear)

    this.clear = setTimeout(() => {
      this.messageTarget.innerHTML = '&nbsp;'
    }, 2000)
  }
}
