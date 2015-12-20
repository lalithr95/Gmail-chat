var ready = function() {
	$('.start-conversation').click(function (e) {
		e.preventDefault();

		var sender_id = $(this).data('sid');
		var recipient_id = $(this).data('rid');
		var data = {
			sender_id: sender_id,
			recipient_id: recipient_id
		};
		$.post('/conversations', data, function (data) {
			chatBox.chatWith(data.conversation_id);
		});
	});


	// Minimize chat 
	$(document).on('click', '.toggleChatBox', function (e) {
		e.preventDefault();

		var id = $(this).data('cid');
		chatBox.toggleChatBoxGrowth(id);
	});

	// close chat box
	$(document).on('click', '.closeChat', function (e) {
		e.preventDefault();

		var id = $(this).data('cid');
		chatBox.close(id);
	});
};

