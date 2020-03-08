import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for QueryStringReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  filter () {
    this.stimulate('QueryStringReflex#filter')
  }

  afterReflex (element, reflex, error) {
    if (!error) {
      const params = new URLSearchParams(window.location.search.slice(1))
      params.set('category', element.value)

      history.pushState(
        {},
        '',
        `${window.location.pathname}?${params.toString()}`
      )
    }
  }
}
