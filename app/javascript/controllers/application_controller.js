import hljs from 'highlight.js'
import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'

let lastFocusedElement

/* This is your application's ApplicationController.
 * All StimulusReflex controllers should inherit from this class.
 *
 * Example:
 *
 *   import ApplicationController from './application_controller'
 *
 *   export default class extends ApplicationController { ... }
 *
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends Controller {
  connect () {
    StimulusReflex.register(this)
    document.addEventListener('focusin', this.focused)
  }

  disconnect () {
    document.removeEventListener('focusin', this.focused)
  }

  focused (event) {
    const focusTags = ['INPUT', 'TEXTAREA', 'SELECT']
    if (!focusTags.includes(event.target.tagName)) return
    lastFocusedElement = event.target
  }

  setFocus () {
    if (!lastFocusedElement) return
    if (lastFocusedElement === document.activeElement) return

    lastFocusedElement.focus()

    // shenanigans to ensure that the cursor is placed at the end of the existing value
    const value = lastFocusedElement.value
    lastFocusedElement.value = ''
    lastFocusedElement.value = value
  }

  /* Application wide lifecycle methods.
   * Use these methods to handle lifecycle concerns for the entire application.
   * Using the lifecycle is optional, so feel free to delete these stubs if you don't need them.
   *
   * Arguments:
   *
   *   element - the element that triggered the reflex
   *             may be different than the Stimulus controller's this.element
   *
   *   reflex - the name of the reflex e.g. "ExampleReflex#demo"
   *
   *   error - error message from the server
   */

  beforeReflex (element, reflex) {
    this.benchmark = performance.now()
  }

  reflexSuccess (element, reflex, error) {
    // show success message etc...
  }

  reflexError (element, reflex, error) {
    alert(`Error invoking a Reflex! ${error}`)
  }

  afterReflex (element, reflex) {
    this.setFocus()

    document.querySelectorAll('pre code').forEach(block => {
      hljs.highlightBlock(block)
    })

    console.debug(
      reflex,
      `${(performance.now() - this.benchmark).toFixed(0)}ms`
    )
  }
}
