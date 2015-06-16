# audio-trimmer-ruby
Audio trimmer for ruby powered by sox. Get the gem at [audio-trimmer] (https://rubygems.org/gems/audio-trimmer).

## Installation

First ensure that you have sox installed. Sox is a sound processing library and toolkit.

For fedora/centos:

```bash
$ dnf install sox
```

For Ubuntu/Debian

```bash
$ apt-get install sox
```

For MacOSX

```bash
 $ brew install sox
```
 
 
Next, get the gem

```bash
 $ gem install audio-trimmer
 ```
 
## General Usage ##
 
 Simple example:
 ```ruby
 require 'audio_trimmer'
 
 trimmer = AudioTrimmer.new '/path/to/input_file'

 # if not specified, output file set to the input file
 trimmer.trim start:0, finish:35, output:'/path/to/output_file'
 
```
You can also just trim from a position to the end of the file. Just omit the finish field. e.g.
```ruby
require 'audio_trimmer'

trimmer = AudioTrimmer.new '/path/to/input_file'

# trim from 35 second mark to end of file
trimmer.trim start:35, output:'/path/to/output_file

```

## Command Line Usage ##

You can also use audio-trimmer from your shell.

```bash
$ audio_trimmer [input file] -s=[start trim] -f=[finish trim] -o=[output file]
```



Enjoy!
