import ApplicationController from "./application_controller";

/* This is the custom StimulusReflex controller for QueryStringReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  filter() {
    this.stimulate("QueryStringReflex#filter");
  }

  afterReflex(element, reflex, error) {
    history.pushState(
      {},
      "",
      `${window.location.pathname}?category=${element.value}`
    );
  }
}
