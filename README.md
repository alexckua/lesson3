- Implement forgot password
  - New controller new/create/edit/update
  - New mailer for reset pass(letter_opener)
  - Send emails with link to edit password, link should have token(MessageVerifier)
  - Find user by token and set new passwords
  - Make messager look(text filed is fixed at the bottom)
    do not use table. Make infinite scroll to load new messages
