# frozen_string_literal: true

class ApplicationReflex < StimulusReflex::Reflex
  # Put application wide Reflex behavior in this file.
  #
  # Example:
  #
  #   # If your ActionCable connection is: `identified_by :current_user`
  #   delegate :current_user, to: :channel
  #
  # Learn more at: https://docs.stimulusreflex.com

  def noop
  end
end
