require 'test_helper'

class TimerTest < ActiveSupport::TestCase
  test 'state machine' do
    timer = Timer.create(session_id: 'foo', name: 'bar')

    assert timer.started? == false
    assert timer.start! == true

    assert timer.started? == true
    assert timer.paused? == false
    assert timer.ended? == false

    assert timer.start! == false
    assert timer.pause! == true

    assert timer.started? == false
    assert timer.paused? == true
    assert timer.ended? == false

    assert timer.pause! == false
    assert timer.start! == true

    assert timer.started? == true

    assert timer.end! == true

    assert timer.started? == false
    assert timer.paused? == false
    assert timer.ended? == true
  end
end
