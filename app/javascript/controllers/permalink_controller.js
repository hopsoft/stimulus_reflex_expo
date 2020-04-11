import ApplicationController from "./application_controller";

/* This is the custom StimulusReflex controller for PermalinkReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */

const camelize = str => {
  return str
    .split(/[-_]/)
    .map(w => w.replace(/./, m => m.toUpperCase()))
    .join("")
    .replace(/^\w/, c => c.toLowerCase());
};

export default class extends ApplicationController {
  filter(e) {
    this.stimulate("PermalinkReflex#filter", e.target);
  }

  beforeReflex(element) {
    this.data.set(element.name, element.value);
  }

  afterReflex(element, reflex, error) {
    if (!error) {
      const camelizedIdentifier = camelize(this.identifier);
      const params = new URLSearchParams(window.location.search.slice(1));
      Object.keys(Object.assign({}, this.element.dataset))
        .filter(attr => attr.startsWith(camelizedIdentifier))
        .forEach(attr => {
          const paramName = attr
            .slice(camelizedIdentifier.length)
            .toLowerCase();
          params.set(paramName, this.data.get(paramName));
        });

      history.pushState(
        {},
        "",
        `${window.location.pathname}?${params.toString()}`
      );
    }
  }
}
