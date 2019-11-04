import hljs from 'highlight.js'
import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'
import Velocity from 'velocity-animate'
import hotkeys from 'hotkeys-js'

export default class extends Controller {
  static targets = ['list']

  connect () {
    StimulusReflex.register(this)
    hotkeys('ctrl+z, command+z', () => {
      this.stimulate('BucketListsReflex#revert')
    })
  }

  afterReflex () {
    const focusElement = this.element.querySelector('[autofocus]')
    if (focusElement) {
      focusElement.focus()

      // shenanigans to ensure that the cursor is placed at the end of the existing value
      const value = focusElement.value
      focusElement.value = ''
      focusElement.value = value
    }

    document.querySelectorAll('pre code').forEach(block => {
      hljs.highlightBlock(block)
    })
  }

  cancelEdit (event) {
    if (event.type === 'keyup' && !['Escape', 'Esc'].includes(event.key)) return
    this.stimulate('BucketListsReflex#cancel_edit')
  }

  afterCreate () {
    ;[...this.listItems].forEach(element => {
      if (element.classList.contains('new')) this.highlight(element)
    })
  }

  afterToggle (checkbox) {
    this.highlight(checkbox.closest('li'))
  }

  afterUpdate (element) {
    this.highlight(this.listItem(element.dataset.id))
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
