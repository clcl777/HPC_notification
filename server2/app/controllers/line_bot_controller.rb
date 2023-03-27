class LineBotController < ApplicationController
  protect_from_forgery except: [:sample]
  def callback
    body = request.body.read
    events = client.parse_events_from(body)
    events.each do |event|
      case event
        #   when Line::Bot::Event::Follow
        # 友達追加時
        # reply_keyid(event['source']['userId'])
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          # ユーザーからのメッセージを取得時
          add_database(event)
          id = get_id(event)
          message_text = "登録完了しました。あなたのIDは「#{id}」です。"
          message = {
            type: 'text',
            text: message_text
          }
          client.reply_message(event['replyToken'], message)
        end
      end
    end
  end

  def notification
    id = params[:id]
    line_id = get_line_id(id)
    message = {
      type: 'text',
      text: 'タスクが完了しました!'
    }
    client.push_message(line_id, message)
    json_test = {
      "send_message": 'done'
    }
    render json: json_test
  end

  private

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end

  # def reply_keyid(user_id)
  #     message = {
  #       type: 'text',
  #       text: 'Hello!'
  #     }
  #     client.push_message(user_id, message)
  # end

  def add_database(event)
    line_id = event['source']['userId']
    profile = get_profile(line_id)
    display_name = profile['displayName']
    picture_url = profile['pictureUrl']
    status_message = profile['statusMessage']
    users_profile = UsersProfile.new(line_id:, display_name:, picture_url:, status_message:)
    users_profile.save
  end

  def get_profile(user_id)
    response = client.get_profile(user_id)
    case response
    when Net::HTTPSuccess
      JSON.parse(response.body)
    else
      puts "Failed to get profile: #{response.code} #{response.body}"
      nil
    end
  end

  def get_id(event)
    line_id = event['source']['userId']
    users_profile = UsersProfile.find_by(line_id:)
    users_profile.id
  end

  def get_line_id(id)
    users_profile = UsersProfile.find(id)
    users_profile.line_id
  end
end
