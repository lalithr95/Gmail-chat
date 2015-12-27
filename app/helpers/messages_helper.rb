module MessagesHelper
	def self_or_other message
		message.user == current_user ? "self" : "other"
	end

	def message_interlocutor message
		message.user == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
	end

	def current_user_sha
	  Digest::MD5.hexdigest(current_user.email)
	end
end
