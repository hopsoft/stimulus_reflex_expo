import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'
import hotkeys from 'hotkeys-js'
import Velocity from 'velocity-animate'
import LocalTime from 'local-time'

export default class extends Controller {
  static targets = ['list', 'current', 'version']

  connect () {
    StimulusReflex.register(this)

    hotkeys('ctrl+z, command+z', () => {
      this.stimulate('BucketListsReflex#undo')
    })
    hotkeys('ctrl+y, command+y', () => {
      this.stimulate('BucketListsReflex#redo')
    })

    LocalTime.run()

    if (this.hasCurrentTarget) this.currentTarget.scrollIntoViewIfNeeded()
  }

  beforeReflex () {
    this.versionTargets.forEach(version => {
      version.firstChild.removeAttribute('data-localized')
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

    if (this.hasCurrentTarget) this.currentTarget.scrollIntoViewIfNeeded()

    this.listTargets.reverse().forEach(element => {
      if (element.classList.contains('highlight')) {
        element.scrollIntoViewIfNeeded()
        this.highlight(element)
      }
    })

    LocalTime.run()
  }

  cancelEdit (event) {
    if (event.type === 'keyup' && !['Escape', 'Esc'].includes(event.key)) return
    this.stimulate('BucketListsReflex#cancel_edit')
  }

  highlight (element) {
    Velocity(element, { scale: 1.01, backgroundColor: '#ff9' }, 200).then(
      Velocity(element, { scale: 1, backgroundColor: '#fff' }, 600)
    )
  }
}
