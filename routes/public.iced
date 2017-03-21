_ = require('wegweg')({
  globals: off
})

append_qs = require 'append-querystring'

app = module.exports = new (require 'express').Router

app.get '/', (req,res,next) ->
  res.respond {ping:_.uuid()}

app.get '/~:link', (req,res,next) ->
  await
    db.Links
      .findOne({_id:req.params?.link})
      .exec defer e,link

  if e then return next e
  if !link then return next new Error 'Link not found'

  destination = append_qs(link.url,req.query)

  db.Events.create {
    event: 'impression'
    link: link._id
    ip: req.real_id
    agent: req.headers['user-agent']
    refer: req.headers['referer']
  }, -> 1

  return res.redirect(destination)

##
app.AUTO_EXPOSE = {
  route: '/'
  public: true
}


