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

app.get '/-:link', (req,res,next) ->
  await
    db.Links
      .findOne({_id:req.params?.link})
      .exec defer e,link

  if e then return next e
  if !link then return next new Error 'Link not found'

  num_days = (req.query.days ? 15)

  await trk.query_days num_days, defer e,r
  if e then return next e

  result = r.find({type:'add',key:'event~link'})

  report = {}

  for day,obj of result
    cur = report[day] ?= {}
    for k,v of obj
      [event,link] = k.split('~')
      if link isnt req.params.link then continue
      cur[event] ?= 0
      cur[event] += (+v)

  return res.respond(report)

##
app.AUTO_EXPOSE = {
  route: '/'
  public: true
}


