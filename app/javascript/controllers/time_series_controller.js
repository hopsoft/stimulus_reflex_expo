/* eslint-disable dot-notation */

import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for ExampleReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  afterReflex (element, reflex, error) {
    Chartkick.charts['chart'].updateData(
      JSON.parse(this.data.get('chart-data'))
    )
    Chartkick.charts['chart'].redraw()
  }
}
