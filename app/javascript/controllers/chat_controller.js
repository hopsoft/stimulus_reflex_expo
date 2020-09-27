import Rails from '@rails/ujs'
import { debounce } from 'debounced'
import ApplicationController from './application_controller'

let lastMessageId
const reload = controller => {
  controller.stimulate('ChatReflex#default_reflex')
}
const debouncedReload = debounce(reload, { wait: 100 })

export default class extends ApplicationController {
  static targets = ['list', 'input']

  connect () {
    super.connect()
    this.scroll(100)
  }

  post (event) {
    if (this.inputTarget.value === '') { return }

    Rails.stopEverything(event)
    lastMessageId = Math.random()
    this.stimulate(
      'ChatReflex#post',
      this.element.dataset.color,
      this.inputTarget.value,
      lastMessageId
    )
  }

  postOnEnterKeydown(event) {
    if (event.code === 'Enter') {
      event.preventDefault();
      this.post(event);
      this.clearMessages();
    }
  }

  afterPost () {
    this.clearMessages();
  }

  clearMessages() {
    this.inputTarget.value = ''
    this.inputTarget.focus()
    this.scroll(1)
  }

  scroll (delay = 10) {
    const lists = document.querySelectorAll('[data-target="chat.list"]')
    setTimeout(() => {
      lists.forEach(e => (e.scrollTop = e.scrollHeight))
    }, delay)
  }

  reload (event) {
    const { messageId } = event.detail
    if (messageId === lastMessageId) return
    debouncedReload(this)
  }
}
