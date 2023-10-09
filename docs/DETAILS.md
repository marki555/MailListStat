### How it is all computed or What is quoting? Why I have it 95%?

  OK, so let's start from beginning - the format of MBOX file. It's plain text
  file containing some email messages delimited with one empty line. Each
  message starts with line like this "From abc@a.sk  Thu Aug 16 15:48:58 2001".
  After this line, there are few headers, one empty line and message text.
  Storing emails in this format is quite common - your incoming mail is usually
  saved in MBOX format and also your folders in mail-readers like elm, pine,
  mutt...

  Who is author of an email message? It's taken from "From:" header field and
  everything except the actual email address (like your full name) is stripped
  off using quite simple regular expression (regexp).

  Subject is taken from "Subject:" header field. If it contains some "Re:",
  those will be stripped off. There can be up to 5 of them. Also counted format
  ("Re[5]:") is supported. For example The Bat! email client uses it.
  MIME-decoding is applied to subject lines (see below).
  
  Date is just everything in the "Date:" header. This header is generated by
  the email client, so it's date of message creation and it doesn't have to
  be present in each message. If it isn't, you are warned by message like
  "Warning: 1 message(s) not counted." in output. Some client doesn't put
  full date there and usually the day of week is missing and you are warned.
  No timezones are considered, the date is taken as-is.

  Message size is everything between end of message header and beginning of
  new email (or end of file). So only actual size of message text (body) is
  counted, not headers.

  Email clients are taken from "X-Mailer:" or "User-Agent:" or "X-Newsreader:"
  headers and some grouping is done to avoid different versions of the same
  mailer to take the whole TOP 10. There is also work-around for Pine mailer
  (MLS will search also "Message-ID:" header).

  What is quoting? When you reply to some message, you can insert part of the
  original message there, you quote the author of original message. Every line
  of original text is usually prepended with ">" or "MP>", where MP are
  initials of the original sender's name (for example The Bat! uses this
  second format).

  And what is "quote ratio"? It's size of quoted text divided by total size
  of message, specified in percent. It's included in stats, because many
  people reply to message, add one line of text and leaving there for
  example 10 pages of original text, which makes the quote ratio even
  higher than 90%! In times of FIDONET, there were conferences, where quote
  ratio higher than 50% was forbidden. Try to think about it when replying
  to message in mailing list where more than 300 people will download and
  read it.

  And now the stats! At first, there are TOP 10 tables (or TOP XX when using
  `-n XX` parameter). First table shows people who have written most
  messages, how much and how many percent of total message count it is. Last
  row shows the "other" - number of messages written by everyone not listed
  above and how many percent it is. Second and third tables are similar to this
  one - they also show best authors, but not by the number of messages written.
  Authors are sorted by total (or average) size of all their messages, but
  without quoting (size of message minus how much was quoted in that msg).
  Next table shows most successful subjects and how many messages with
  this subject have been posted. The other table shows most used email clients.
  The last table show people with maximal quote ratio. It's computed as sum of
  quoted text in all his/her messages divided by total size of those messages.
  Last row shows an average - sum of quoted text in all messages divided by
  total size of all messages.

  Next part of stats are some graphs. They show how much messages have been
  written during different hours of day, days of month and days of week. From
  these you can see for example when (and how much) people sleep :) or if they
  work during the working-hours or just write tons of messages...

  Next part contains info about messages which are BEST in something - message
  with max. quote ratio, longest message and some details about most successful
  subject.

  At the end, there is final summary - total number of messages, their total
  and average size and number of different authors and subjects.