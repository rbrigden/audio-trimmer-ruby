require 'minitest/autorun'
require 'audio_trimmer'

class AudioTrimmerTest < Minitest::Test
  
  

  def test_create_trimmer
    result = AudioTrimmer == AudioTrimmer.new(input:File.expand_path('../test.wav', __FILE__)).class
  end

  def test_trim_from_start
    trimmer = AudioTrimmer.new input:File.expand_path('../test.wav', __FILE__)
    trimmer.trim start:0, finish:30, output:File.expand_path('../test_out.wav', __FILE__)
    result = `soxi -D #{File.expand_path('../test_out.wav', __FILE__)}`.to_i == 30
    assert result
  end

  def test_trim_between
    trimmer = AudioTrimmer.new input:File.expand_path('../test.wav', __FILE__)
    trimmer.trim start:30, finish:100, output:File.expand_path('../test_out.wav', __FILE__)
    result = `soxi -D #{File.expand_path('../test_out.wav', __FILE__)}`.to_i == 70
    assert result
  end

  def test_with_overwrite
    `cp #{File.expand_path('../test.wav', __FILE__)} #{File.expand_path('../test_out.wav', __FILE__)}`
    trimmer = AudioTrimmer.new input:File.expand_path('../test_out.wav', __FILE__)
    trimmer.trim start:0, finish:30
    result = `soxi -D #{File.expand_path('../test_out.wav', __FILE__)}`.to_i == 30
    assert result
  end

  def test_with_overwrite_output_specified
    `cp #{File.expand_path('../test.wav', __FILE__)} #{File.expand_path('../test_out.wav', __FILE__)}`
    trimmer = AudioTrimmer.new input:File.expand_path('../test_out.wav', __FILE__)
    trimmer.trim start:0, finish:30, output:File.expand_path('../test_out.wav', __FILE__)
    result = `soxi -D #{File.expand_path('../test_out.wav', __FILE__)}`.to_i == 30
    assert result
  end
end
