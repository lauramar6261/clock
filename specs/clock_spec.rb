# clock_spec.rb
# tests
# clock_spec.rb

require 'minitest/autorun' # run spec file and produce test results: pass or fail
require 'minitest/reporters'# color
require_relative '../lib/clock'

Minitest::Reporters.use!

# 'clock' location can use any name, and it will still work
# each block tests one thing
describe 'Clock' do
  it 'will return a string' do # what we are going to test, string can have anything, but description of test is useful
    # arrange
    hours = 9
    minutes = 25
    seconds = 46

    # act
    time = clock(hours, minutes, seconds)

    # assert
    expect(time).must_be_instance_of String # instance are called expectations, more can be found in minitest matchers table, matchers column
  end                              # no parenthesis around String (it's a style in Ruby)

  it 'will return a string formatted in hh:mm:ss format when hours is a single digit' do
    # arrange
    hours = 9
    minutes = 25
    seconds = 46

    # act
    time = clock(hours, minutes, seconds)

    # assert
    expect(time).must_equal '09:25:46'
  end

  it 'will return a string formatted in hh:mm:ss format when minutes is a single digit' do
    # arrange
    hours = 9
    minutes = 5
    seconds = 46

    # act
    time = clock(hours, minutes, seconds)

    # assert
    expect(time).must_equal '09:05:46'
  end

  it 'will return a string formatted in hh:mm:ss format when seconds is a single digit' do
    # arrange
    hours = 9
    minutes = 25
    seconds = 6

    # act
    time = clock(hours, minutes, seconds)

    # assert
    expect(time).must_equal '09:25:06'
  end

  it 'will return a string formatted in hh:mm:ss format all double digits' do
    # arrange
    hours = 15
    minutes = 25
    seconds = 17

    # act
    time = clock(hours, minutes, seconds)

    # assert
    expect(time).must_equal '15:25:17'
  end

  it 'will raise an error for invalid hours/min.sec' do
    # arrange
    hours = 23
    min = 0
    sec = 0

    # act
    time = clock(hours, min, sec)

    expect(time).must_equal '23:00:00'

    # re - Arrange
    hour = 24

    # Act - Assert
    expect {
      time = clock(hour, min, sec) # this method call generates error
    }.must_raise ArgumentError
  end

  it 'will raise an error for invalid min' do
    # arrange
    hours = 0
    min = 59
    sec = 0

    # act
    time = clock(hours, min, sec)

    expect(time).must_equal '00:59:00'

    # re - Arrange
    min = 61

    # Act - Assert
    expect {
      time = clock(hours, min, sec) # this method call generates error
    }.must_raise ArgumentError
  end

  it 'will raise an error for invalid sec' do
    # arrange
    hours = 0
    min = 0
    sec = 59

    # act
    time = clock(hours, min, sec)

    expect(time).must_equal '00:00:59'

    # re - Arrange
    sec = 61

    # Act - Assert
    expect {
      time = clock(hours, min, sec) # this method call generates error
    }.must_raise ArgumentError
  end



end

# results:
# error is syntax errors
# skips, you can tell if you want to skip a test
