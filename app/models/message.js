/**
 * /app/models/message.js
 *
 * Represents a generic message, regardless of transport.
 */

var Message = function() {
  this.sender = "";
  this.recipients = [];
  this.subject = "";
  this.body = "";
}

module.exports = Message;
