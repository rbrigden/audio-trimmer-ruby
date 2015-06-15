# author: Ryan Brigden
# date: June 13, 2015

class AudioTrimmer

	attr_accessor :input

	def initialize(params = {})
		input = params.fetch(:input, "")
		input_length = 0		
		if input.empty? 
			raise "please specify input filepath"
		else
			@input = File.expand_path(input)
		end	
	end

	def trim(start: 0, finish: get_length(@input), output: "")
		unless File.exists?(@input) or File.exists?(output) then raise "bad filepath" end
		if output.empty? or File.expand_path(output)  == @input
			out_arr = @input.split('.')
			out_arr[out_arr.length-2] += "_out" 
			output = out_arr.join(".")
			`sox #{@input} #{output} trim #{start} =#{finish}`
			`mv #{output} #{@input}`
		else
			output = File.expand_path(output)
			`sox #{@input} #{output} trim #{start} =#{finish}`
		end
		return "trim success"
	end

	def get_length file_path
		return `soxi -D #{File.expand_path(file_path)}`.to_f
	end

end

