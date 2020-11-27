import Rails from '@rails/ujs'
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['list', 'input']

  connect () {
    super.connect()
    this.scroll(100)
  }

  post (event) {
    Rails.stopEverything(event)
    this.stimulate(
      'ChatReflex#post',
      this.element.dataset.color,
      this.inputTarget.value
    )
  }

  scroll (delay = 10) {
    const lists = document.querySelectorAll('[data-target="chat.list"]')
    setTimeout(() => {
      lists.forEach(e => (e.scrollTop = e.scrollHeight))
    }, delay)
  }
}
