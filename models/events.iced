_ = require('wegweg')({
  globals: off
})

if !module.parent
  process.env.MONGOOSE_MODEL_DEVEL = module.filename
  process.env.SILENCE = 1
  require './../core/globals'

Schema = mongoose.Schema
models = require './../core/models'

EventsSchema = new Schema {

  event: {
    type: String
    trim: yes
    required: yes
  }

}, {collection:'events',strict:off}

EventsSchema.plugin models.base

EventsSchema.pre 'save', (next) ->
  trk.record @toJSON(), -> 1
  return next()

##
model = mongoose.model 'Events', EventsSchema

model.AUTO_EXPOSE = {
  route: '/events'
  methods: []
}

module.exports = model


