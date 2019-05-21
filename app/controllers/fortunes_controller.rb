require 'json'
class FortunesController < ActionController::API

    BASE_URL = "http://4b207419.ngrok.io"
    POSSIBLE_RESPONSES = ["It is certain.", "It is decidedly so.", "Without a doubt.", "Yes, definitely.", "You may rely on it.", "As I see it, yes.", "Most likely.", "Outlook good.", "Yes.", "Signs point to yes.", "My reply is no.", " Don't count on it.", "My sources say no.", "Very doubtful."]

    def answer
        render json:
        [
            {
                :action => 'talk',
                :text => 'Welcome to the Fortune Teller hotline. Ask your question and then press 1.',
                :bargeIn => true
            },
            {
                :action => 'input',
                :eventUrl => ["#{BASE_URL}/caller_input"],
                :timeOut => '10'
            }
        ].to_json
    end

    def caller_input
        dtmf = params['dtmf'] || parsed_body['dtmf']

        if dtmf == '1'
            render json:
            [
                {
                    :action => 'talk',
                    :text => "My answer is: #{POSSIBLE_RESPONSES.sample}. I hope that helps. Goodbye.",
                }
            ].to_json
        else
            render json:
            [{:action => 'talk', :text => 'I did not recognize your selection. Please call back and try again.'}].to_json
        end
    end

    def event
        puts params
    end
end
