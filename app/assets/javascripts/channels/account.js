$(function(){
    App.chat = App.cable.subscriptions.create({channel: "AccountChannel", account: ""}, {
        connected: function() {
            console.log('connected');
        },
        disconnected: function() {
            console.log('disconnected');
        },
        received: function(data) {
            render_message_to_view(data);
        },
        rejected: function () {
            console.log('rejected');
        }
    });
});

render_message_to_view= function(data){
    $('body ul.messages').append(data.body);
    $('.messageInput textarea').val('');
    $("body .messageList").animate({ scrollTop: $("body .messageList")[0].scrollHeight }, 1000);
};