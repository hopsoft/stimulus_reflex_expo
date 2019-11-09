import Velocity from 'velocity-animate'
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['input', 'list']

  cancelEdit (event) {
    if (event.type === 'keyup' && !['Escape', 'Esc'].includes(event.key)) return
    this.stimulate('TodosReflex#cancel_edit')
  }

  afterCreate () {
    this.highlight(this.lastListItem)
    this.inputTarget.value = ''
  }

  afterToggle (checkbox) {
    this.highlight(checkbox.closest('li'))
  }

  afterUpdate (element) {
    this.highlight(this.listItem(element.dataset.id))
  }

  afterToggleAll () {
    this.listItems.forEach(li => this.highlight(li))
  }

  highlight (element) {
    Velocity(element, { scale: 1.01, backgroundColor: '#ff9' }, 200).then(
      Velocity(element, { scale: 1, backgroundColor: '#fff' }, 600)
    )
  }

  listItem (id) {
    return this.listTarget.querySelector(`li[data-id="${id}"]`)
  }

  get listItems () {
    return this.listTarget.querySelectorAll('li')
  }
}
