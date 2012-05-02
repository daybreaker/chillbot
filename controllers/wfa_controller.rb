class WfaController < Rubot::Controller
	command :wfa do
		reply Wfa.search(:input => message.text, :appid => 'JTV9YQ-9LLTPQXVHL')
	end
end